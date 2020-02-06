<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


<style type="text/css">

#memberchange{width:400px;margin:0 auto;text-align:center; margin-bottom:100px;}
#memberchange>ul{padding-top:50;width:auto;padding:0}
#memberchange>ul>li{padding-top:20px;cursor:auto;font-size:20px; color:#9c27b0}

#memberchange>ul>li>input{width:100%;height:50px;margin-right:5px}
.size{width:80%}
#memberchange>li>p{text-align:left}
#memberchange>li button{border:none;height:55px;vertical-align:middle}
.button{width: 100%;left:0;padding: 0;float:left}
.button>li{display:inline-block;width: calc(90%/2);height: 50px}
.button>li>button{width:100%;background-color:#ffd014; border: none;height:100%}
::placeholder{color:black; font-size:20px}


.out{margin-top:10px}
.out:hover {
	color: red;
}
</style>

<script>
//비밀번호 확인
function check(){
	
	if($("#USER_PASSWORD").val()=='${MemberInfo.USER_PASSWORD}'){
		 
		 alert("현재 비밀번호가 같습니다. 다른 비밀번호를 입력해주세요");
		 $("USER_PASSWORD").focus();
		 return false;
	 }
	else if($('#USER_PASSWORD').val()!=$('#pwdcheck').val()){
		
		alert("비밀번호가 일치하지않습니다.");
		$("pwdcheck").focus();
		return false;
	}
	else{
		alert("수정되었습니다.");
		return true;
	}
	
}
 
function outcheck() {
	if(confirm("탈퇴하시겠습니까?")==true){
		
		alert("탈퇴성공");
	}else{
		alert("탈퇴취소");
		return false;
		
	}
	
}	


</script>
<form action="/two/member/memberModify" method="POST" onsubmit="return check();">
	<div id="memberchange">
		<h1>회원정보변경</h1>

		<ul>
			<li>아이디 : ${USER_ID}</li>
			<li><input type="password" name="USER_PASSWORD" id="USER_PASSWORD" placeholder="변경할 비밀번호를 입력해주세요" ></li>
			<li><input type="password" name="pwdcheck" id="pwdcheck"placeholder="비밀번호확인"></li>
			<li>이름: ${MemberInfo.USER_NAME}</li>
			<li><input type="tel" name="USER_PHONE" id="USER_PHONE" value="${MemberInfo.USER_PHONE}"></li>
			<li><input class="size" type="email" name="USER_EMAIL" id="USER_EMAIL" value="${MemberInfo.USER_EMAIL}">
			<button type="submit">인증메일받기</button></li>
			<li>
				<ul class="button">
					<li><button type="submit">수정</button></li>
					<li><button type="reset">취소</button></li>
				</ul>

			</li>

		</ul>
			<a class="out" href="/two/main" onclick="return outcheck();" id="delect">탈퇴하기</a>
	</div>
</form>