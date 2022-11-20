<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sorce.UserDAO"%>
<!DOCTYPE html>

<html>
<title>언제모여</title>
<head>
<script>
	function check_pw2(){
		var pw = document.getElementById('pw').value;
		if(pw.length < 6 || pw.length>16){
               window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
               document.getElementById('pw').value='';
           }
	}
       function check_pw(){

           var pw = document.getElementById('pw').value;

           if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
               if(document.getElementById('pw').value==document.getElementById('pw2').value){
                   document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                   document.getElementById('check').style.color='blue';
               }
               else{
                   document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                   document.getElementById('check').style.color='red';
               }
           }
     }
    </script>
<style>
.wrapper{
        position: absolute;
        height: 500px;
        top:50%;
        left:50%;
        margin-top : -220px;
        margin-left : -250px;
        border-radius: 50px;
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: white;
        border: 3px solid #E4F0DA;



    }
    .join_form{
    	width : 400px;
        padding-left: 180px;
    }
    input {
            border-top: none;
            border-left: none;
            border-right: none;
            border-bottom: 2px rgb(75, 89, 96) solid;
            background-color: transparent;
    }
    button{
        border-style: solid;
        border-radius: 50px;
        height: 30px;
        width: 70px;
        border: 0;
        outline: 1;
    }
</style>
</head>

<body>
	<form action="user_sign_up_process.jsp" method="post">
		<div class="main_img" style="text-align: center;">
			<img src="../img/Group 3.jpg" width="300px">
		</div>

		<div class="wrapper">
			<div class="join_form">
				<h1 style="padding-left: 30px; padding-bottom: 15px;">회원가입</h1>

				<div class="text_center">
					<input type="text" id="new_id" name="USER_ID" size="20"
						placeholder="아이디" required>
					<br> <br>
				</div>

				<div class="text_center">
					<input type="password" onchange = "check_pw2()" onkeyup="check_pw()" id="pw" name="USER_PW" size="20"
						placeholder="비밀번호" required><br> <br>
				</div>

				<div class="text_center">
					<input type="password" onchange = "check_pw2()" onkeyup="check_pw()" id="pw2" name="USER_PW" size="20"
						placeholder="비밀번호 확인" required>&nbsp;<span id="check" style = "font-size: 10px;"></span><br><br>
				</div>
				
				<div class="text_center">
					<input type="text" id="USER_NAME" name="USER_NAME" size="20"
						placeholder="이름" required>
					<p></p>
				</div>

				<div class="text_center">
					<input type="email" id="user_mail" name="USER_EMAIL" size="20"
						placeholder="이메일">
					<button type="button" class="mail_button" onclick="mail_check()">인증
						요청</button>
				</div>
				<p></p>

				<div class="text_center">
					<input type="number" id="user_mail_check" name="user_mail_check"
						size="20" placeholder="인증번호">
				</div>
				<p></p>

				<button type="submit" value="회원가입">회원가입</button>
				<button type="reset" onClick="history.go(-1)" value="취소">취소</button>
			</div>
		</div>
	</form>
</body>
</html>
