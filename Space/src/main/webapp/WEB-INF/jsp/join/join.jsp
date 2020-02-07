<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%session.setAttribute("joinCode", ""); %>
<!DOCTYPE html>

<head><title>회원가입</title>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<style>
.board_list,th,td { margin: 0 auto;border:1px solid ;}
.board_list,tr{height:50px}
.board_list tfoot {text-align: center;}
.signUp_agree {text-align: center;}
.signUp_agree_textarea {text-align: center;}
.signUp_agree_textarea textarea {resize: none;}

</style>  
</head>

<form id="frm">
 <table class="board_list">
  <caption>회원가입</caption>
  <tbody>
   <tr>
       <th scope="row">아이디</th>
          <td><input type="text" id="user_id" name="user_id" class="wdp_90">
             <a href="#" id="user_id_checkBtn" class="btn">중복확인</a></td>
   </tr>
   <tr>
      <th>비밀번호</th>
      <td><input type="password" name="user_password" id="pwd1" class="wdp_90" required /></td>
   </tr>
   <tr>
      <th>비밀번호 확인</th>
      <td><input type="password" name="user_password2" id="pwd2" class="wdp_90" required />
      <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
      <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div></td>
   </tr>   
   <tr>
       <th scope="row">이름</th>
       <td><input type="text" id="user_name" name="user_name" class="wdp_90"></td>
   </tr>
   <tr>
    <th scope="row">휴대폰 번호</th>
    <td><input type="text" id="user_phone" name="user_phone" class="wdp_90"></td>
   </tr>
   
      <th scope="row">이메일</th>
      <td><input type="text" id="user_email" name="user_email" placeholder="이메일을  입력하세요" class="form-control" />
         <button type="button" class="btn btn-info" id="emailBtn">이메일 발송</button></td>
   </tr>
   <tr><th scope="row">이메일 인증</th>   
      <td><input type="text" id="emailAuth" name="emailAuth" placeholder="인증번호를  입력하세요" class="form-control" />
         <button type="button" class="btn btn-info" id="emailAuthBtn">이메일 인증</button></td>
   </tr>
   

   <tr><th scope="row">이용약관</th>
   
    <td colspan="3" class="signUp_agree_textarea"><textarea cols="70" rows="10" readonly="readonly">
제1장 총칙
   
제1조 (목적)
본 약관은 공간(이하 “회사”라 함)이 운영하는 공간 서비스(이하 “서비스”라 함)의 이용과 관련하여 회사와 이용자 및 이용자간의 권리, 의무 및 책임사항, 서비스의 이용조건 및 절차, 기타 필요한 사항을 규정함을 목적으로 합니다. 공간 서비스라 함은 회사가 제공하는 "공간” 브랜드를 사용하는 서비스를 말합니다. 공간 서비스를 이용하시거나 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영정책을 확인하거나 동의하게 되므로, 조금만 시간을 내서 주의 깊게 살펴봐 주시기 바랍니다.
   
제2조 (정의)
이하생략
   </textarea></td>
   </tr>
   <tr>
    <td colspan="3" class="signUp_agree_checkbox"><input type="checkbox" id="agree_checkbox">약관에 동의</td>
   </tr>
  </tbody>
  <tfoot>
   <tr>
    <td colspan="3">
     <a href="#" class="btn" id="signUpBtn">회원가입</a>
    </td>
   </tr>
  </tfoot>
 </table>
</form>
 

   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>  
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

//중복체크
  $(document).ready(function() {
     $("#signUpBtn").unbind("click").click(function(e) {
      e.preventDefault();
      fn_signUp();
     });
    });  
  
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
   url : "/two/join/idCheck", 
   data : userData,
   dataType : "json",
   error : function(error) {
    alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
   },
   success : function(result) {
    if (result == 0)
    {
      $("#user_id").attr("readonly", true);
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
}

//비번일치
$(function(){
    $("#alert-success").hide();
    $("#alert-danger").hide();
    $("input").keyup(function(){
        var pwd1=$("#pwd1").val();
        var pwd2=$("#pwd2").val();
        if(pwd1 != "" || pwd2 != ""){
            if(pwd1 == pwd2){
                $("#alert-success").show();
                $("#alert-danger").hide();
                $("#submit").removeAttr("disabled");
            }else{
                $("#alert-success").hide();
                $("#alert-danger").show();
                $("#submit").attr("disabled", "disabled");
            }    
        }
    });
});


//공란 확인
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
     alert("아이디를 작성해주세요.");
    }
   /* else if ($("#user_password").val().length < 1)
    {
     alert("사용하실 비밀번호를 작성해주세요.");
    }*/    
     else if ( !$("#user_id").attr("readonly") )
    {
     alert("아이디 중복체크를 해주세요.");
    }
    else
    { 
     if (window.confirm("회원가입을 하시겠습니까?"))
     {
      var comSubmit = new ComSubmit("frm");
      comSubmit.setUrl("<c:url value='/join/signUp' />");
      /* comSubmit.addParam("user_id", $("#user_id").val());
      comSubmit.addParam("user_password", $("#pwd1").val());
      comSubmit.addParam("user_name", $("#user_name").val());
      comSubmit.addParam("user_email", $("#user_email").val());
      comSubmit.addParam("user_phone", $("#user_phone").val());
       */
      comSubmit.submit();
     }
    }
   }
   
   
//이메일 인증 

$(function(){
   //   이메일 인증 버튼 클릭시 발생하는 이벤트
   $(document).on("click", "#emailBtn", function(){
      
      // 이메일 중복 체크 후 메일 발송 비동기 처리 
      $.ajax({
         
         type:"POST",
         url : "/two/join/auth",
         data : "user_email=" + $("#user_email").val(),
         success : function(data){
               alert("인증번호가 발송되었습니다. 이메일을 확인해주세요.");
            
         },
         error : function(data){
            alert("에러가 발생했습니다.");
            return false;
         }
         });
      });   
   
   // 이메일 인증번호 입력 후 인증 버튼 클릭 이벤트
   $(document).on("click", "#emailAuthBtn", function(){
      
      $.ajax({
         
         type:"POST",
         url:"/two/join/authCheck",
         data:"joinCode=" + $('#emailAuth').val() + "&ran=" + $("#ran").val(),
         success:function(data){
            console.log(data.result);
            if(data.result == "complete"){
               alert("인증이 완료되었습니다.");
            }else if(data.result == "fail"){
               alert("인증번호를 잘못 입력하셨습니다.")
            }
         },
         
         error:function(data){
            alert("에러가 발생했습니다.");
         }
      });
   });
});
   
</script>
