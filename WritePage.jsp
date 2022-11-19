<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
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
<script type="text/javascript">
	function spend_check() {
		const spend = document.getElementById('write');
		spend.innerHTML = '소비 분류 : <select name="pattern"><option value="food">식비</option><option value="transport">교통비</option><option value="hobby">여가 활동</option><option value="fassion">패션/미용</option><option value="etc">기타</option></select>';
	}
	
	function income_check() {
		const income = document.getElementById('write');
		income.innerHTML = '수입 분류 : <select name="income_pattern"><option value="salary">월급</option><option value="allowance">용돈</option><option value="etc">기타</option></select>';
	}
</script>
</head>
<body>
	<link rel="stylesheet" href="WritePage.css">
	<div id="writeamount">
		<form name="income" method="post">
			<input type='radio' id="income" name='write' value="in" checked 
				onclick="income_check();"/>수입
			<input type='radio' id="spend" name='write' value="out"
				onclick="spend_check();" />지출
			<p>
				날짜 :
				<%=date%>
			<div>
				<p id="write">
					수입 분류 : <select name="income_pattern">
						<option value="salary">월급</option>
						<option value="allowance">용돈</option>
						<option value="etc">기타</option>
					</select>
				</p>
			</div>
			<p>
				금액 : <input type="text" name="amount" id="amount">
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