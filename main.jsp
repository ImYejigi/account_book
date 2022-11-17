<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">

    <!-- CSS -->
	<link href="../css/Main.css" rel="stylesheet" type="text/css">
	<!-- 아이콘 -->
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	

    <title>융합프로젝트</title>
    <style>
        body {
          overflow:hidden
        }
        #main_div{
            position: relative; /* absolute는 부모가 relative일 때 부모를 따라간다. */
            width: 100%;
            padding-bottom: 56.25%; /* 16:9 비율 */
        }
        #main_if {
            position: absolute;
            width: 100%; /* 부모에 맞게 꽉 채운다. */
            height: 100%;
        }
    </style>
</head>
<body id="body-pd">
    <div class="l-navbar" id="navbar">
        <nav class="nav">
            <div>
                <div class="nav__brand">
                    <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                    <a href="#" class="nav__logo">AccountBook</a>
                </div>
                <div class="nav__list">
                    <a href="Calender.jsp" class="nav__link active" target="body_frame">
                        <ion-icon name="home-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">홈</span>
                    </a>
                    <a href="#" class="nav__link">
                        <ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">소비내역통계</span>
                    </a>
                    <a href="Goal.jsp" class="nav__link" target="body_frame">
                    	<ion-icon name="calculator-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">목표소비치설정</span>
                    </a>
                </div>
                <a href="loginAction.jsp" class="nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav_name">로그아웃</span>
                </a>
            </div>
        </nav>
    </div>
    <div id = "main_div" style="background-color:white;">
        <iframe id = "main_if" src="Calendar.jsp" name = "body_frame" frameborder="0px" ></iframe>   
    </div>
    	<!-- 반응형 JS -->
	<script src="../js/main.js"></script>
</body>
</html>