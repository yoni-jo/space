<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
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
<form action="/two/main" name="joinform" method="POST">
      <div id="member">
        <h1>회원가입</h1>

       <ul>
         <li><input class="size" type="text" name="id" id="id" placeholder="아이디"><button type="submit">중복체크</button></li>
         <li><input type="pwd" name="pwd" id="pwd"placeholder="비밀번호"></li>
         <li><input type="pwdcheck" name="pwdcheck" id="pwdcheck"placeholder="비밀번호확인"></li>
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
          <button type="submit" value="가입" onclick="">회원가입</button>
         </p>
         </li>
       
       </ul>

       </div>
    </form>