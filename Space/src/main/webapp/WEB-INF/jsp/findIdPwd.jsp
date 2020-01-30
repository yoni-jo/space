<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style>

#loginform{width:648px; margin:0 auto;text-align:center;margin-bottom:100px}
.logintable{padding-top: 50px;padding-left: 0;}
.logintable>li{list-style: none;text-align: center;}
.logintable>li>a{float:right;}
.logintable>li>p{padding-right: 0;}
 .logintable>li>input{width: 100%;height: 50px; border:1px solid #e0e0e0;margin-bottom:20px} 
 h6{font-color:#65656;}
 p>a{color:blue}
 
 button{cursor:pointer; width:100%; height: 50px;background-color:#ffd014; display: block; border:none;margin-top: 10px;font-size: 20px;}



</style>
<script>


</script>
	<form action="#">
		<div id="loginform">
			<h1>아이디/비밀번호찾기</h1>
			<ul class="logintable">
				<li><input type="text" name="id" id="id" placeholder="아이디">
				</li>
				<li><input type="email" name="email" id="email" placeholder="이메일주소">
				</li>
				
			<h6>가입시 사용한 이메일 주소를 입력해주세요</h6>
				<li>
				
					<button type="submit" id="submit">찾기</button>

				</li>


			</ul>
			
			<p>
			
			
				아직 회원이 아니신가요? <a href="/join/joinForm">회원가입하기</a>

			</p>
		</div>
	</form>