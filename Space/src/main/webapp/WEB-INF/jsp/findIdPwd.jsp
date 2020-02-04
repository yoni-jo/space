<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<script>


</script>
	<form action="#">
		<div id="findMemform">
			<h1>아이디/비밀번호찾기</h1>
			<ul class="findidtable">
				<li><input type="text" name="USER_ID" id="USER_ID" placeholder="아이디">
				</li>
				<li><input type="email" name="USER" id="email" placeholder="이메일주소">
				</li>
				
			<h6>가입시 사용한 이메일 주소를 입력해주세요</h6>
				<li>
				
					<button type="submit" id="submit">찾기</button>

				</li>


			</ul>
			
			<p>
			
			
				아직 회원이 아니신가요? <a href="/two/join/joinForm">회원가입하기</a>

			</p>
		</div>
	</form>