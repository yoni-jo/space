<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


<style type="text/css">

#memberchange{width:400px;margin:0 auto;text-align:center; margin-bottom:100px;}
#memberchange>ul{padding-top:50;width:auto;padding:0}
#memberchange>ul>li{padding-top:20px;cursor:auto;font-size:20px; color:#9c27b0}
#memberchange>ul>li>input{width:100%;height:50px;margin-right:5px}
.size{width:80%}
#memberchange>li>p{text-align:left}
#memberchange>li>button{border:none;height:55px;vertical-align:middle}
.button>li{display:inline-block}
.button>li>button{width:100%;background-color:#ffd014;}
::placeholder{color:black; font-size:20px}

</style>
<form action="" method="POST">
	<div id="memberchange">
		<h1>회원정보변경</h1>

		<ul>
			<li>아이디 : ${USER_ID}</li>
			<li><input type="password" name="pw" id="" placeholder="변경할 비밀번호를 입력해주세요"></li>
			<li><input type="password" name="pwcheck" id=""
				placeholder="비밀번호확인"></li>
			<li>이름: ${MemberInfo.USER_NAME}</li>
			<li><input type="tel" name="" id="" placeholder=${MemberInfo.USER_PHONE}></li>
			<li><input class="size" type="email" name="" id=""placeholder=${MemberInfo.USER_EMAIL}>
			<button type="submit">인증메일받기</button></li>
			<li>
				<ul class="button">
					<li><button type="submit">수정</button></li>
					<li><button type="reset">취소</button></li>
				</ul>




			</li>

		</ul>

	</div>
</form>