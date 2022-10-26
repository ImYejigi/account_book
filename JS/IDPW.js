const regemail = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/;

// 전화번호 유효성 검사
    const changePhone1 = (target) => {
        target.value = target.value.replace(/[^0-9]/g, '')
        .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
        .replace(/(\-{1,2})$/g, "");
       }

function chkemail(){
    const regemail = document.getElementById("find-mail").value;
    if(!regemail.test(regemail.value)){
        alert("메일 양식에 맞춰 써주세요.")
    }
}