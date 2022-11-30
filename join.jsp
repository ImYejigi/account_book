<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="find_id_pw.css" />
  <title>아이디 비밀번호 찾기</title>
</head>

<body>
  <div class="main-header">
    <a href="login.jsp">
      <img src="../img/Group 3.jpg" alt="">
    </a>
  </div>
  <div class="main-items">
    <div class="main-boder">
      <div class="find-id">
        <form name="id" class="form-id" action = "findidResult.jsp" method="post">
          <div class="main-id-find">
            <h1>아이디 찾기</h1>
          </div>
          <div class="main-input">
            <p>이름</p>
            <input type="text" id="userName" name="userName" placeholder="이름">
          </div>

          <div class="main-input">
            <p>전화번호</p>
            <input type="text" id = "userPhone" name = "userPhone" placeholder="전화번호">
          </div> 
          <div class="main-id-btnSave">
            <button type="submit" id="find-id-save" onClick="id_search()" >확인</button>
          </div>
        </form>
      </div>
      <div class="find-pw">
        <form name="pw">
          <div class="main-pw-find">
            <h1>비밀번호 찾기</h1>
          </div>
          <div class="main-input">
            <p>아이디</p>
            <input type="text" id="find-pw-id" size="25" placeholder="아이디">
          </div>
          <div class="main-input">
            <p>전화번호</p>
            <input type="text" oninput="changePhone1(this)" maxlength="13" placeholder="전화번호를 입력해보세요!" autofocus>
          </div>
          <div class="main-pw-btnSave">
            <button type="button" id="find-pw-save" size="15" value="">확인</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  <script src="find_id_pw.js"></script>
</body>

</html>