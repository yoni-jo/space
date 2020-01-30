<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>관리자 로그인 페이지</title>

<head>
</head>

<script >
function fsubmit(){
	var id = $("#USER_ID")[0].value;
	var pw = $("#USER_PW")[0].value;
	if(id == null || id == ''){
		alert("아이디를 입력하세요.");
	}
	if(pw == null || pw == ''){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	LoginForm.submit();
}
$(document).ready(function(){
	if("${USER_ID}" != null && "${USER_ID}" != ''){
		$("USER_ID")[0].value = "${USER_ID}";
	}
});

</script>
<br/>

<body>
<br><br>
<div class="loginForm">
	<div>
		<h1>관리자 로그인</h1>
		<form id="loginForm" name="loginForm" action="admin/LoginForm" method="POST">
			<input type="text" id="USER_ID" name="USER_ID" placeholder="아이디 입력"><br/>
			<input type="password" id="USER_PW" name="USER_PW" placeholder="비밀번호 입력" onkeypress="if( event.keyCode == 13 ){fsubmit();}" class="kTQnUD bLigTE">
		</form>
		<br>
		<button type="button" onclick="fsubmit();">로그인</button>
	</div>
</div>
</body>
</html>
