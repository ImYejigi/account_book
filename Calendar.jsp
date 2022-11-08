<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>calendar</title>
<script type="text/javascript">
	function income_popup() {
		window.open("WriteIncome.jsp", "income",
				"width=400, height=300, top=150, left=200");
	}

	function spend_popup() {
		window.open("WriteSpend.jsp", "spend",
				"width=400, height=300, top=150, left=200");
	}
</script>
</head>
<body>
	<link = rel="stylesheet" href="Calendar.css">
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
	} else { //��Ÿ������ �ϴ� ��¥�� ���ڷ� ��ȯ
		year = Integer.parseInt(Year);
		month = Integer.parseInt(Month);
		if (month < 0) {
			month = 11;
			year = year - 1;
		} //1������ 12������ ���� ����.
		if (month > 11) {
			month = 0;
			year = year + 1;
		}
	}
	%>
	<center>
		<table border=0>
			<!-- �޷� ��� �κ�, �� ���� ����� ������? -->
			<tr class="datepreview">
				<td align=left width=200>
					<!-- �� ��--> <a
					href="Calendar.jsp?year=<%out.print(year - 1);%>&month=<%out.print(month);%>">��</a>
					<%
					out.print(year);
					%>�� <a
					href="Calendar.jsp?year=<%out.print(year + 1);%>&month=<%out.print(month);%>">��</a>
				</td>
				<td align=center width=300>
					<!-- �� --> <a
					href="Calendar.jsp?year=<%out.print(year);%>&month=<%out.print(month - 1);%>">��</a>
					<%
					out.print(month + 1);
					%>�� <a
					href="Calendar.jsp?year=<%out.print(year);%>&month=<%out.print(month + 1);%>">��</a>
				</td>
				<td align=right width=200><input onclick="income_popup()"
					type="button" value="����"> <input onclick="spend_popup()"
					type="button" value="����"></td>
			</tr>

		</table>
		<table border=1 cellspacing=0>
			<!-- �޷� �κ� -->
			<tr>
				<td style="color:red" width=100>��</td>
				<!-- ��=1 -->
				<td width=100>��</td>
				<!-- ��=2 -->
				<td width=100>ȭ</td>
				<!-- ȭ=3 -->
				<td width=100>��</td>
				<!-- ��=4 -->
				<td width=100>��</td>
				<!-- ��=5 -->
				<td width=100>��</td>
				<!-- ��=6 -->
				<td style="color:blue" width=100>��</td>
				<!-- ��=7 -->
			</tr>
			<tr height=70>
				<%
				cal.set(year, month, 1); //���� ��¥�� ���� ���� 1�Ϸ� ����
				int startDay = cal.get(java.util.Calendar.DAY_OF_WEEK); //���糯¥(1��)�� ����
				int end = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH); //�� ���� ������ ��
				int br = 0; //7�ϸ��� �� �ٲٱ�
				for (int i = 0; i < (startDay - 1); i++) { //��ĭ���
					out.println("<td>&nbsp;</td>");
					br++;
					if ((br % 7) == 0) {
						out.println("<br>");
					}
				}
				for (int i = 1; i <= end; i++) { //��¥���
					if(br%7==0){
						out.println("<td style=color:red;>" + i + "</td>");
					}else if (br%7==6) {
						out.println("<td style=color:blue>" + i + "</td>");
					}else {
						out.println("<td>" + i + "</td>");
					}
					br++;
					if ((br % 7) == 0 && i != end) {
						out.println("</tr><tr height=70>");
					}
				}
				while ((br++) % 7 != 0) //���� ���� ��ĭ���
					out.println("<td>&nbsp;</td>");
				%>
			</tr>
		</table>
	</center>
</body>
</html>