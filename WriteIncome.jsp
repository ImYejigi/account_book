<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수입,지출 입력페이지</title>
<script type="text/javascript">
	function income_check() {
		document.getElementById('submit').onclick = function() {
			var val = document.querySelector('input[type=radio][name=write]:checked');
			if (val.value === 'in') {
				
			}			
		}
	}
</script>
</head>
<body>
	<link rel="stylesheet" href="WriteIncome.css">
	<div id="writeamount">
		<form name="income" method="post">
		<input type='radio' id="income" name='write' value="in" onclick="income_check()" checked/>수입
		<input type='radio' id="spend" name='write' value="out" />지출
			<p>
				날짜 입력 : <input type="date" name="date" id="date">
			<div id="write">
				<p>
					분류 : <select name="income_pattern">
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