<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script type = "text/javascript">
function tableCreate(){
	var tc = new Array();
	var html = '';
				
	var exp = $("#inexp").val();
	var cost = $("#incost").val();
	
	html += '<tr>';
	html += '<td style="padding-left: 270px;">'+exp+'</td>';
	html += '<td style="padding-left: 88px;">'+cost+'원</td>';
	html += '</tr>';
	html += '<hr>';
				
	$("#dynamicTable").append(html);
				
	$("#inexp").val('지출유형');
	$("#incost").val('');
	}
function tableDelete(){
	$('#dynamicTable tbody tr:last').remove();
	}
</script>
<style type="text/css">
body{
    position: absolute;
    left: 50%;
    transform: translate(-50%);
}
#form{
    border-radius: 20px;
    margin-top: 18px;
    background-color: rgba(232, 243, 238, 0.5);
}
button{
	border : 1px;
}
</style>
</head>
<body>
<img src="../CSS/Group 3.jpg">
<div id = "form" class= "shadow p-3 mb-5 bg-body rounded">

<table style="border: 1px;">
<thead>
	<tr>
		<th style="padding-left: 260px;">지출유형</th>
		<th style="padding-left: 70px;">목표금액(원)</th>
	</tr>
</thead>
</table>
<hr>
<table id = "dynamicTable">
<tbody id="dynamicTbody">
	
</tbody>
</table>
<div style="padding-left: 250px;">
<select id="inexp" > 
	<option value="지출유형" selected>지출유형</option> 
	<option value="식비">식비</option> 
	<option value="교통비">교통비</option>
	<option value="여가활동">여가활동</option>
	<option value="패션/미용">패션/미용</option>
	<option value="기타">기타</option>
</select> 
<input type="text" placeholder = "목표 금액 입력"  id="incost">
<button onclick="tableCreate()">+</button>
<button onclick="tableDelete()">-</button>
</div>
</div>
</body>
</html>
