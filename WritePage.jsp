<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sorce.CAL_TYPE_DAO"%>

<%
int year = Integer.parseInt(request.getParameter("year"));
int month = Integer.parseInt(request.getParameter("month")) + 1;
int day = Integer.parseInt(request.getParameter("day"));

//Calendar cal = Calendar.getInstance();
//cal.set(year, month, day);

String _month = month < 10 ? "0" + month : "" + month;
String date = year + "-" + _month + "-" + day;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수입,지출 입력페이지</title>
<link rel="stylesheet" href="../css/WritePage.css">
<script type="text/javascript">
	function spend_check() {
		const spend = document.getElementById('write');
		spend.innerHTML = '소비 분류 : <select name="CAL_TYPE_NAME" id="CAL_TYPE_NAME"><option value="식비" selected>식비</option><option value="교통비">교통비</option><option value="여가 활동">여가 활동</option><option value="패션/미용">패션/미용</option><option value="기타">기타</option></select>';
	}
	
	function income_check() {
		const income = document.getElementById('write');
		income.innerHTML = '수입 분류 : <select name="CAL_TYPE_NAME" id="CAL_TYPE_NAME"><option value="월급" selected>월급</option><option value="용돈">용돈</option><option value="기타">기타</option></select>';
	}
</script>
</head>
<body>
	
	<div id="writeamount">
		<form name="income" method="post" action="WritePage_Process.jsp" accept-charset="utf-8">
			<input type='hidden' name='CAL_DATE' value="<%=date%>">
			<input type='radio' id="CAL_TYPE_ID" name="CAL_TYPE_ID" value="수입" checked 
				onclick="income_check();"/>수입
			<input type='radio' id="CAL_TYPE_ID" name='CAL_TYPE_ID' value="지출"
				onclick="spend_check();" />지출
			<p>
				날짜 :
				<%=date%>
			<div class ="income_type">
				<p id="write">
					수입 분류 : <select name="CAL_TYPE_NAME" id="CAL_TYPE_NAME">
						<option value="월급">월급</option>
						<option value="용돈">용돈</option>
						<option value="기타">기타</option>
					</select>
				</p>
			</div>
			<p>
				금액 : <input type="text" name="CAL_AMOUNT" id="CAL_AMOUNT">
			<p>
				<textarea name="detail" rows="3" cols="30"
					placeholder="세부 사항을 입력하세요."></textarea>
			<div id="save">
				<input type="submit" value="저장">
			</div>
		</form>
	</div>
</body>
</html>