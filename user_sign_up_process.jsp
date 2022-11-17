<%@page import="sorce.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sorce.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>

<jsp:useBean id="signUp" class="sorce.ACC_USER" scope="page">
	<jsp:setProperty name="signUp" property="USER_ID" />
	<jsp:setProperty name="signUp" property="USER_PW" />
	<jsp:setProperty name="signUp" property="USER_NAME" />
	<jsp:setProperty name="signUp" property="USER_EMAIL" />

</jsp:useBean>
<!DOCTYPE html>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
if (signUp.getUSER_ID() == null|| signUp.getUSER_PW() == null ||signUp.getUSER_NAME() == null|| signUp.getUSER_EMAIL() == null){
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('입력이 안 된 사항이 있습니다.')");
    script.println("history.back()");
    script.println("</script>");
 } else{
    UserDAO userDAO = new UserDAO();
    int result = userDAO.join(signUp);
    
    if(result == -1){
       PrintWriter script = response.getWriter();
       script.println("<script>");
       script.println("alert('이미 존재하는 아이디 입니다.')");
       script.println("history.back()");
       script.println("</script>");
    }
    
    //가입성공
    else{
       session.setAttribute("userID", user.getUserID()); //로그아웃을 하기위한 세션 추가
       PrintWriter script = response.getWriter();
       script.println("<script>");
       script.println("location.href='login.jsp'");
       script.println("</script>");
    }
 }


%>
</body>
</html>
