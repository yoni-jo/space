<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관리자 로그인 기능수행</title>
<script>
$(document).ready(function(){
	$("#login_btn").unbind("click").click(function(e){
		e.preventDefault();
		admin_login();
	});
});

function admin_login(){
	if($("#USER_ID").val().length < 1){
		alert("아이디를 입력해 주세요.");
	}else if($("#USER_PASSWORD").val().length <1 ){
		alert("비밀번호를 입력해 주세요.");
	}else {
		var comSubmit = new ComSubmit("adminLogin");
		comSubmit.setUrl("<c:url value='/admin/LoginCheck' />");
		comSubmit.submit();
	}
}
</script>
</head>
</html>