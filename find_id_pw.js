 function id_search(){
			frm = document.id;
			if(frm.userName.value.length < 1 ){
				alert('이름을 입력해주세요');
				return;
			}
			
			if(frm.userPhone.value.length != 13 ){
				alert('전화번호를 정확하게 입력해주세요');
				return;
			}
		frm.action = "findidResult.jsp"; 
		}