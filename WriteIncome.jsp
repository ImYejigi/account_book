<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수입 입력페이지</title>
</head>
<body>
	<link rel="stylesheet" href="WriteIncome.css">
	<div id="writeamount">
		<form name="income" method="post">
			<p>
				날짜 입력 : <input type="date" name="date" id="date">
			<p>
				수입 분류 : <select name="income_pattern">
					<option value="salary">월급</option>
					<option value="allowance">용돈</option>
					<option value="etc">기타</option>
				</select>
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