<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sorce.CAL_TYPE_DAO, java.util.*, java.util.stream.*"%>
<%@ include file="dbconn.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>calendar</title>
<script type="text/javascript">
	function popup(el) {
		
		
	// ?year=2022&month=11
		const qs = location.search.replace("?", "").split("&")
						.reduce((acc, v) => {
							// v  - year=2022
							v = v.split("=");
							acc[v[0]] = v[1];
							return acc;
						}, {});
	
		const date = new Date();
		let select_year = qs.year || date.getFullYear();
		let select_month = qs.month || date.getMonth();
	
		const DAY = el.innerHTML;
		let DATE = DAY.split("<");
		const day = DATE[0];
		
		
		console.log(day);
		console.log(location.search);
		var newPage = window.open("WritePage.jsp?day=" + day + "&month=" + select_month + "&year=" + select_year, "income",
				"width=400, height=300, top=150, left=200");
	}
</script>
</head>
<body>
	<link = rel="stylesheet" href="../css/Calendar.css">
	<%
	java.util.Calendar cal = java.util.Calendar.getInstance();
	int currentYear = cal.get(java.util.Calendar.YEAR);
	int currentMonth = cal.get(java.util.Calendar.MONTH);
	int currentDate = cal.get(java.util.Calendar.DATE);
	String Year = request.getParameter("year");
	String Month = request.getParameter("month");
	int year, month;
	if (Year == null && Month == null) {
		year = currentYear;
		month = currentMonth;
	} else { //나타내고자 하는 날짜를 숫자로 변환
		year = Integer.parseInt(Year);
		month = Integer.parseInt(Month);
		if (month < 0) {
			month = 11;
			year = year - 1;
		} //1월부터 12월까지 범위 지정.
		if (month > 11) {
			month = 0;
			year = year + 1;
		}
	}
	%>
	<center>
		<table border=0>
			<tr class="datepreview">
				<td align=left width=200>
					<!-- 년 도--> <a
					href="Calendar.jsp?year=<%out.print(year - 1);%>&month=<%out.print(month);%>">◀</a>
					<%
					out.print(year);
					%>년 <a
					href="Calendar.jsp?year=<%out.print(year + 1);%>&month=<%out.print(month);%>">▶</a>
				</td>
				<td align=center width=300>
					<!-- 월 --> <a
					href="Calendar.jsp?year=<%out.print(year);%>&month=<%out.print(month - 1);%>">◀</a>
					<%
					out.print(month + 1);
					%>월 <a
					href="Calendar.jsp?year=<%out.print(year);%>&month=<%out.print(month + 1);%>">▶</a>
				</td>
				<td align=right width=200>
					<%
					out.print(currentYear + "-" + (currentMonth + 1) + "-" + currentDate);
					%>
				</td>
			</tr>

		</table>
		<table border=1 cellspacing=0>
			<!-- 달력 부분 -->
			<tr>
				<td style="color: red" width=150>일</td>
				<!-- 일=1 -->
				<td width=150>월</td>
				<!-- 월=2 -->
				<td width=150>화</td>
				<!-- 화=3 -->
				<td width=150>수</td>
				<!-- 수=4 -->
				<td width=150>목</td>
				<!-- 목=5 -->
				<td width=150>금</td>
				<!-- 금=6 -->
				<td style="color: blue" width=150>토</td>
				<!-- 토=7 -->
			</tr>
			<tr height=100>

				<%
				Map<Integer, List<String[]>> data = new HashMap<>();
				ResultSet re = null;
				PreparedStatement pstmt = null;
				int savedYear = 0;
				int savedMonth = 0;
				int savedDay = 0;
				String DATE = "";
				String tag = "";
				String amount = "";
				try {
					String sql = "select * from CAL_TYPE";
					pstmt = conn.prepareStatement(sql);
					re = pstmt.executeQuery();

					while (re.next()) {
						DATE = re.getString("CAL_DATE");
						tag = re.getString("CAL_TYPE_NAME");
						amount = re.getString("CAL_AMOUNT");
						String[] dateArray = DATE.split("-");
						savedYear = Integer.parseInt(dateArray[0]);
						savedMonth = Integer.parseInt(dateArray[1]);
						savedDay = Integer.parseInt(dateArray[2]);
						List<String[]> savedData = null;
						if (data.containsKey(savedDay)) {
					savedData = data.get(savedDay);
						} else {
					savedData = new ArrayList<String[]>();
						}
						savedData.add(new String[] { tag, "" + amount });
						data.put(savedDay, savedData);

					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					if (re != null)
						re.close();
				}
				//현재 날짜를 현재 월의 1일로 설정
				cal.set(year, month, 1);
				int startDay = cal.get(java.util.Calendar.DAY_OF_WEEK); //현재날짜(1일)의 요일
				int end = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH); //이 달의 끝나는 날
				int br = 0; //7일마다 줄 바꾸기
				for (int i = 0; i < (startDay - 1); i++) { //빈칸출력

					out.println("<td>&nbsp;</td>");
					br++;
					if ((br % 7) == 0) {
						out.println("<br>");
					}
				}
				for (int i = 1; i <= end; i++) { //날짜출력
					String str = "";
					if (data.containsKey(i)) {
						List<String[]> calData = data.get(i);
						str = calData.stream().map(s -> s[0] + " : " + s[1]).collect(Collectors.joining("<br>"));
					}
					if (br % 7 == 0) {
						if (i == currentDate) {
					out.println(
							"<td onClick=\"popup(this)\"style=color:red; \"font-weight:bold;\">" + i + "<br>" + str + "</td>");
					

						} else {
					out.println("<td onClick=\"popup(this)\"style=color:red;>" + i + "<br>" + str + "</td>");
						}

					} else if (br % 7 == 6) {
						if (i == currentDate) {
					out.println(
							"<td onClick=\"popup(this)\"style=color:blue; \"font-weight:bold;\">" + i + "<br>" + str + "</td>");
						} else {
					out.println("<td onClick=\"popup(this)\"style=color:blue;>" + i + "<br>" + str + "</td>");
						}

					} else {
						if (i == currentDate) {
					out.println("<td onClick=\"popup(this)\"style=\"font-weight:bold;\">" + i + "<br>" + str + "</td>");
						} else {
					out.println("<td onClick=\"popup(this)\">" + i + "<br>" + str + "</td>");
						}

					}
					br++;
					if ((br % 7) == 0 && i != end) {
						out.println("</tr><tr height=100>");
					}

				}
				while ((br++) % 7 != 0) //말일 이후 빈칸출력
					out.println("<td>&nbsp;</td>");
				%>
			</tr>
		</table>
	</center>
</body>
</html>