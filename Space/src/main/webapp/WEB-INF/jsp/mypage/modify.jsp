<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


<style type="text/css">

#memberchange{width:400px;margin:0 auto;text-align:center; margin-bottom:100px;}
#memberchange>ul{padding-top:50;width:auto;padding:0}
#memberchange>ul>li{padding-top:20px;cursor:auto}
#memberchange>ul>li>input{width:100%;height:50px;margin-right:5px}
.size{width:80%}
#memberchange>li>p{text-align:left}
#memberchange>li>button{border:none;height:55px;vertical-align:middle}
.button>li{display:inline-block}
.button>li>button{width:100%;background-color:#ffd014;}

</style>
<form action="" method="POST">
	<div id="memberchange">
		<h1>회원정보변경</h1>

		<ul>
			<li><input class="size" type="text" name="id" id=""placeholder="아이디"></li>
			<li><input type="password" name="pw" id="" placeholder="비밀번호"></li>
			<li><input type="password" name="pwcheck" id=""
				placeholder="비밀번호확인"></li>
			<li><input type="text" name="name" id="name" placeholder="이름"></li>
			<li><input type="text" name="" id="" placeholder="휴대폰번호"></li>
			<li><input class="size" type="email" name="" id=""placeholder="이메일">
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