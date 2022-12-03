<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../CSS/login.css"/>
</head>
<body>
	
    <form method="post" action = "loginAction.jsp" method ="post">
	<img class = "logo_image" src = "Group 3.jpg"> <br><br>
    <div class = "login_page">
        <div class = "user_id">
            <p> <input type = "text" name = "ID" placeholder="아이디"> </p>
        </div>
        <div class = "user_pw">
            <p> <input type = "password" name = "PW" placeholder="비밀번호"> </p>
        </div>
        <div class = "hyperlink_page">
            <a href = "user_sign_up.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href = "find_id_pw.jsp">ID/PW 찾기</a>
        </div>
        <div class = "last_line">
            <button type = "submit" value = "로그인" >로그인</button>
        </div>
    </div>
    </form>
</body>
</html>
