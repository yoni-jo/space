<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<style>

#loginform{width:648px; margin:0 auto;text-align:center;margin-bottom:100px}
.logintable{padding-top: 50px;padding-left: 0;}
.logintable>li{list-style: none;text-align: center;}
.logintable>li>a{float:right;}
.logintable>li>p{padding-right: 0;}
 .logintable>li>input{width: 100%;height: 50px; border:1px solid #e0e0e0;margin-bottom:20px} 
 
 p>a{color:blue}
 
 button{width:100%; height: 50px;background-color:#ffd014; display: block; border:none;margin-top: 10px;font-size: 20px;}



</style>
<script>


</script>
	<form action="#">
		<div id="loginform">
			<h1>�α���</h1>
			<ul class="logintable">
				<li><input type="text" name="id" id="id" placeholder="���̵�">
				</li>
				<li><input type="password" name="pw" id="pw" placeholder="��й�ȣ">
				</li>
				<li><a href="/two/login/findIdPwd">���̵�/��й�ȣã��</a><br></li>
				<li>
					<button type="submit" id="submit">�α���</button>

				</li>


			</ul>
			<p>
				���� ȸ���� �ƴϽŰ���? <a href="/two/join/joinForm">ȸ�������ϱ�</a>

			</p>
		</div>
	</form>