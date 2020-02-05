<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head><title>회원가입</title>    
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
    <style type="text/css">
    #member{width:510px;margin:0 auto ;text-align: center;margin-bottom:100px;}
    #member>ul{padding-top: 50;width: auto;padding: 0;}
    #member>ul>li{padding-top: 20px;cursor: auto;}
    
    ul>li>input{width:100%;height:50px;margin-right: 5px;}
    .size{width: 80%;}
	li>p{text-align: left;}
    button{border:none;height:55px; vertical-align: middle;}
    li>button{width: auto;}
	textarea{width:100%; height:80px;resize: none;}
    p>button{width: 100%;background-color: #ffd014;}
    </style>
    
 </head>
 <body> 
<form action="first/join/joinForm" name="joinform" method="POST" id="frm">
<!-- 메인 아직 없어서 임시로 제자리 <form action="/two/main" name="joinform" method="POST" id="frm"> -->
      <div id="member">
        <h1>회원가입</h1>

       <ul>
         <li><input class="size" type="text" name="id" id="id" placeholder="아이디">
         <a href="#" id="user_id_checkBtn" class="btn">중복확인</a>
         <button type="button" onclick="location.href='#'" id="user_id_checkBtn" class="btn">중복체크</button></li>
         <li><input type="pwd" name="pwd" id="pwd"placeholder="비밀번호"></li>
         <li><input type="pwdcheck" name="pwdcheck" id="pwdcheck" placeholder="비밀번호확인"></li>       
         <li><input type="text" name="name" id="name" placeholder="이름"></li>
         <li><input type="tel" name="tel" id="tel" placeholder="휴대폰번호"></li>
         <li><input class="size" type="email" name="email" id="number"placeholder="이메일"><button type="submit">인증번호받기</button></li>
         <li><input class="size" type="number" name="number" id="number"placeholder="인증번호입력"><button type="submit">인증번호전송</button></li>
         <li>
         <p>이용약관 동의<input type="checkbox"></p>
         <textarea rows="100" cols="10"  readonly="readonly" >
         블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라
         </textarea>   
         <li>
         <p>
          <button type="submit" value="가입" id="signUpBtm">회원가입</button>
         </p>
         </li>
       
       </ul>

       </div>
    </form>
 
 
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>   
<script type="text/javascript">
function checkfield() {
if(document.joinform.id.value==""){
	
	alert("아이디를 입력하세요");
	document.joinform.id.focus();
	exit;
}
else if(document.joinform.pwd.value==""){
	
	alert("패스워드를 입력하세요");
	document.joinform.pwd.focus();
}
else if(document.joinform.pwdcheck.value==""){
	
	alert("패스워드확인을 입력하세요");
	document.joinform.pwdcheck.focus();
}
else if(document.joinform.name.value==""){
	
	alert("이름을 입력하세요");
	document.joinform.name.focus();
}
else if(document.joinform.tel.value==""){
	
	alert("핸드폰번호를 입력하세요");
	document.joinform.tel.focus();

	exit;}

else if(document.joinform.email.value==""){
	
	alert("이메일주소를 입력하세요");
	document.joinform.email.focus();
	exit;
}
else if(document.joinform.number.value==""){
	
	alert("인증번호를 입력하세요");
	document.joinform.number.focus();
	exit;
}
}
    
    
</script>

<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script>
    $('#pwdcheck').focusout(function () {
        var pwd1 = $("#pwd").val();
        var pwd2 = $("#pwdcheck").val();
        if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
                $("#alert-success").css('display', 'inline-block');
                $("#alert-danger").css('display', 'none');
            } else {
                alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
                $("#alert-success").css('display', 'none');
                $("#alert-danger").css('display', 'inline-block');
            }
        }
    });
</script>


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
 	 $("#signUpBtn").unbind("click").click(function(e) {
 	  e.preventDefault();
 	  fn_signUp();
 	 });
 	});
</script>
<script type="text/javascript">
  $(document).ready(function() {
 $("#user_id_checkBtn").unbind("click").click(function(e) {
  e.preventDefault();
  fn_userIDCheck();
 });
});
 
function fn_userIDCheck() {
 var userId = $("#user_id").val();
 var userData = {"ID": userId}
 
 if (userId.length < 1)
 {
  alert("아이디를 입력해주시기 바랍니다.");
 }
 else
 {
  $.ajax({
   type : "POST", 
   url : "/join/idCheck", 
   data : userData,
   dataType : "json",
   error : function(error) {
    alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
   },
   success : function(result) {
    if (result == 0)
    {
     $("#user_id").attr("disabled", true);
     alert("사용이 가능한 아이디입니다.");
    }
    else if (result == 1)
    {
     alert("이미 존재하는 아이디입니다. \n다른 아이디를 사용해주세요.");
    }
    else
    {
     alert("에러가 발생하였습니다.");
    }
   }
  });
 }
}</script>
  
<script type="text/javascript">
$(document).ready(function() {
	 $("#signUpBtn").unbind("click").click(function(e) {
	  e.preventDefault();
	  fn_signUp();
	 });
	});
	 
	function fn_signUp() {
	 if ($("#agree_checkbox").prop("checked") == false)
	 {
	  alert("약관에 동의해주시기 바랍니다.");
	 }
	 else if ($("#user_name").val().length < 1)
	 {
	  alert("이름을 작성해주세요.");
	 }
	 else if ($("#user_phone").val().length < 1)
	 {
	  alert("전화번호를 작성해주세요.");
	 }
	 else if ($("#user_id").val().length < 1)
	 {
	  alert("사용하실 아이디를 작성해주세요.");
	 }
	 else if ($("#user_password").val().length < 1)
	 {
	  alert("사용하실 비밀번호를 작성해주세요.");
	 }
	 else if (!$("#user_id").attr("disabled"))
	 {
	  alert("아이디 중복체크를 해주세요.");
	 }
	 else
	 {
	  if (window.confirm("회원가입을 하시겠습니까?"))
	  {
	   var comSubmit = new ComSubmit("frm");
	   comSubmit.setUrl("<c:url value='/join/joinForm' />");
	   comSubmit.addParam("ID", $("#user_id").val());
	   comSubmit.submit();
	  }
	 }
	}
</script>


</body> 
</html>
    