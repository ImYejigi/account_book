<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sorce.CAL_TYPE_DAO"%>
<%@ page import="java.io.PrintWriter"%>

<jsp:useBean id="AMOUNT" class="sorce.CAL_TYPE" scope="page">
	<jsp:setProperty name="AMOUNT" property="CAL_TYPE_ID" />
	<jsp:setProperty name="AMOUNT" property="CAL_TYPE_NAME" />
	<jsp:setProperty name="AMOUNT" property="CAL_AMOUNT" />

</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	CAL_TYPE_DAO CAL_TYPE_DAO = new CAL_TYPE_DAO();
	AMOUNT.setUSER_ID((String)session.getAttribute("id"));
	int result = CAL_TYPE_DAO.join(AMOUNT);
	String userid = request.getParameter("CAL_TYPE_ID");
	String userNAME = request.getParameter("CAL_TYPE_NAME");
	String userM = request.getParameter("CAL_AMOUNT");
	
	%>
	<p> 아이디 : <%=userid%><br>
		이름 : <%=userNAME%>
		돈 : <%=userM %>
</body>
</html>