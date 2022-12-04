<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sorce.CAL_TYPE_DAO"%>
<%@ page import="java.io.PrintWriter, java.util.Map"%>
<%
request.setCharacterEncoding("UTF-8");
%>


<jsp:useBean id="AMOUNT" class="sorce.CAL_TYPE" scope="page">
	<jsp:setProperty name="AMOUNT" property="CAL_TYPE_ID" />
	<jsp:setProperty name="AMOUNT" property="CAL_TYPE_NAME" />
	<jsp:setProperty name="AMOUNT" property="CAL_AMOUNT" />
	<jsp:setProperty name="AMOUNT" property="CAL_DATE" />
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	CAL_TYPE_DAO CAL_TYPE_DAO = new CAL_TYPE_DAO();
	AMOUNT.setUSER_ID((String) session.getAttribute("id"));
	Map<String, Object> result = CAL_TYPE_DAO.join(AMOUNT);
	%>
	<%--
	String userid = request.getParameter("CAL_TYPE_ID");
	String userNAME = request.getParameter("CAL_TYPE_NAME");
	String userM = request.getParameter("CAL_AMOUNT");
	String selectDate = request.getParameter("CAL_DATE");
	<p>
		<%=result%>
		아이디 : <%=userid%><br>
		날짜 : <%=selectDate%><br>
		이름 : <%=userNAME%><br>
		돈 : <%=userM%>
	--%>
	<script>
	const msg = "<%=(result == null)?"실패하였습니다.":"등록되었습니다."%>";
	alert(msg);
	opener.location.reload();
	self.close();
	</script>
	
</body>
</html>