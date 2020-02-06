<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%session.setAttribute("joinCode", ""); %>
<!DOCTYPE html>
<html>
<head><title>아이디 비밀번호 찾기</title>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<style>
#findMemform{width:648px; margin:0 auto;text-align:center;margin-bottom:100px}
.findidtable{padding-top: 50px;padding-left: 0;}
.findidtable>li{list-style: none;text-align: center;}
.findidtable>li>a{float:right;}
.findidtable>li>p{padding-right: 0;}
 .findidtable>li>input{width: 100%;height: 50px; border:1px solid #e0e0e0;margin-bottom:20px} 
 h6{font-color:#65656;}
 p>a{color:blue} 
 button{cursor:pointer; width:100%; height: 50px;background-color:#ffd014; display: block; border:none;margin-top: 10px;font-size: 20px;}
</style>
</head>
<body>
<script>
</script>
<input type="hidden" name="alert" value="${resultMsg}"/>
		<div id="findMemform">
		
			<h1>아이디 찾기</h1>
			<form action="/first/login/findId" method="post">
			<dl class="findpwd">
				<dd><input type="email" name="user_email" placeholder="이메일주소">	</dd>
				<dd><button type="submit" id="findIdBtn">찾기</button></dd>
			</dl>		
			</form>
			
			<h1>비밀번호 찾기</h1>
			<form action="/first/login/findPwd" method="post">
			<dl class="findpwd">
				<dd><input type="text" name="user_id" placeholder="아이디"></dd>
				<dd><input type="email" name="user_email" placeholder="이메일주소">	</dd>				
			<h6>가입시 사용한 이메일 주소를 입력해주세요</h6>
				<dd><button type="submit" id="findPwdBtn">찾기</button></dd>
			</dl>	
			</form>
			
			<p>아직 회원이 아니신가요? <a href="/two/join/joinForm">회원가입하기</a></p>
			
		</div>



	
<script>	
$(document).ready(function(){
	if($("input[name='alert']").val() != null){
		alert($("input[name='alert']").val());
	}
});

//이메일로 아이디 발송

$(function(){
	//	이메일 인증 버튼 클릭시 발생하는 이벤트
	$(document).on("click", "#findIdBtn", function(){
		
		// 이메일 중복 체크 후 메일 발송 비동기 처리 
		$.ajax({
			
			type:"POST",
			url : "/first/login/findId",
			data : "user_email=" + $("#user_email").val(),
			
			success : function(data){
					alert("아이디가 발송되었습니다. 이메일을 확인해주세요.");
				
			},
			error : function(data){
				alert("에러가 발생했습니다.");
				return false;
			}
			});
		});		
});




//이메일로 임시비밀번호 발송

$(function(){
	//	이메일 인증 버튼 클릭시 발생하는 이벤트
	$(document).on("click", "#findPwdBtn", function(){
		
		// 이메일 중복 체크 후 메일 발송 비동기 처리 
		$.ajax({
			
			type:"POST",
			url : "/first/login/findPwd",
			data : "user_email=" + $("#user_email").val(),
			
			success : function(data){
					alert("아이디가 발송되었습니다. 이메일을 확인해주세요.");
				
			},
			error : function(data){
				alert("에러가 발생했습니다.");
				return false;
			}
			});
		});		
});

</script>	
	
	
</body>
</html>