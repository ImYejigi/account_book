<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수입,지출 입력페이지</title>
<script type="text/javascript">
	function income_check() {
		location = "WriteIncome.jsp";
	}
</script>
</head>
<body>
	<link rel="stylesheet" href="WriteSpend.css">
	<div id="writeamount">
		<form name="spend" method="post">
			<input type='radio' id="income" name='write' value="in" onclick="income_check();" />수입 
			<input type='radio' id="spend" name='write' value="out" checked/>지출
			<p>
				날짜 입력 : <input type="date" name="date" id="date">
			<div id="spend_write">
				<p>
					지출 분류 : <select name="pattern">
						<option value="food">식비</option>
						<option value="transport">교통비</option>
						<option value="hobby">여가 활동</option>
						<option value="fassion">패션/미용</option>
						<option value="etc">기타</option>
					</select>
				</p>
			</div>
			<p>
				금액 : <input type="text" name="amount" id="amout">
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