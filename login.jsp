<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="login_design.css"/>
</head>
<body>
	<img class = "logo_image" src = "Group 3.jpg"> <br><br>
    <div class = "login_page">
        <div class = "user_id">
            <p> <input type = "text" name = "ID" placeholder="로그인"> </p>
        </div>
        <div class = "user_pw">
            <p> <input type = "password" name = "PW" placeholder="비밀번호"> </p>
        </div>
        <div class = "hyperlink_page">
            <a href = "sign_up.html">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href = "find_id_pw.html">ID/PW 찾기</a>
        </div>
        <div class = "last_line">
            <a href = "login_for_kakao.html">카카오 계정으로</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button type = "button" class = "btn1" onclick = "location.href='Calendar.html'">로그인</button>
        </div>
    </div>
</body>
</html>