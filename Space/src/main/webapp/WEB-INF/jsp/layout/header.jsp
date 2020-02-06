<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%

String id="";
String log;

if(session.getAttribute("USER_ID")!=null){
	id=(String)session.getAttribute("USER_ID");
	request.setAttribute("USER_ID", id);
	log="로그아웃";
	
}else{
	log="로그인";
}
%>

   <style type="text/css">

    /* header */
    
#top{border-bottom:1px solid;width: 100%;height: 100%;height: 80px;margin-top:15px}
#menu{width: 70%;margin-left: 15%;}
.logo{width: 10%;float:left;font-size: 20px;}
.nav{margin:0px;float: right;margin-left: auto; position: relative;}
.nav>li{float:left;margin-left:10px} 
.hide{position:absolute;   margin-top: 36px; right: 0; display: none;}
i{border: 1px solid;}


   </style>
<script>
function logout() {
	if(confirm("로그아웃하시겠습니까?")==true){
		alert("로그아웃되었습니다.");
	}else{
		return false;
	}
}

</script>
 <div id="top" >
        <div id="menu">
            <div class="logo"><a href="/two/main">공간</a></div>
            <ul class="nav">
                <li><a href="#">예약확인</a></li>
                
                <!-- 로그인했을때 마이페이지버튼 나타나게하기 -->
               <%if(id != ""){%> 
               		<li>
                		<a href="/two/member/MemberModifyForm">마이페이지</a>
               		 </li>
               <%} %>
                <li class="log" >
                
                <!--로그인안했을경우  로그인버튼 -->
                <%if(id == ""){%>
                	<a href="/two/login/loginForm"><%=log%></a></li>
                	
                	
                <!-- 로그인했을경우 로그아웃버튼으로 변경-->
                <%}else{%>
                	<li><a href="/two/login/logout" onclick="return logout();"><%=log%></a></li>
                	
                <%} %>
                	
                <li class="bar">
                
                <div>메뉴</div>
                   
                </li>
                <li class="hide">
                    <div>
                        <ul>
                            <li>${USER_ID}님 </li>
                                          <%if(id != ""){%> <li><a href="/two/member/MemberModifyForm">개인정보변경</a></li> <%} %>
                            <li><a href="#">전체 공간 리스트 보기</a></li>
                            <li><a href="#">예약공간보기</a></li>
                            <li><a href="#">찜한공간보기</a></li>
                            <li><a href="#">내가등록한 공간보기</a></li>
                            <li><a href="#">공지사항</a></li>
                           
                        </ul> 
                    </div>
                </li>
            </ul>
            
        </div>

    </div>
