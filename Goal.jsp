<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<script language="javascript">
//줄 추가
function addRows(){ 
	var table = document.getElementById('emptbl');
	var rowCount = table.rows.length;
	var cellCount = table.rows[0].cells.length; 
	var row = table.insertRow(rowCount);
	for(var i =0; i <= cellCount; i++){
		var cell = 'cell'+i;
		cell = row.insertCell(i);
		var copycel = document.getElementById('col'+i).innerHTML;
		cell.innerHTML=copycel;
	}
}
//줄 삭제
function deleteRows(){
	var table = document.getElementById('emptbl');
	var rowCount = table.rows.length;
	if(rowCount > '1'){
		var row = table.deleteRow(rowCount-1);
		rowCount--;
	}
	else{
		alert('모두 삭제는 불가능합니다');
	}
}
</script>

</head>
<body>
<form name="form" method="post">
<table id = "emptbl" width="400" border="0" cellspacing="0" cellpadding="0">
    <tr> 
        
        <td id="col0"><input type="text" name="empname[]" value="" /></td> 
        <td id="col1"> 
        <select name="department[]" id="dept"> 
            <option value="0">뭘</option> 
            <option value="1">넣</option>
            <option value="2">을</option>
            <option value="3">까</option>
           </select> 
        </td> 
    </tr>  
    <table> 
    <tr>
        <td colspan="5" bgcolor="#FFFFFF" height="25" style="padding-left: 150px;">
        <input name="addButton" type="button" style="cursor:hand" onClick="addRows()" value="추가">
        <input name="deleteButton"type="button" value="삭제" onClick="deleteRows()" style="cursor:hand">
    </tr>
    </table>
    
 </table>

 <tr>
    <td align="center">
    <input type="button" name="button" value="확인" onClick="frmCheck();">
    </td>
  </tr>
</form>
</body>
</html>