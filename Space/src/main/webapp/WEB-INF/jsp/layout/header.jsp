<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

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

 <div id="top">
        <div id="menu">
            <div class="logo"><a href="/testmain">공간</a></div>
            <ul class="nav">
                <li><a href="#">예약확인</a></li>
                <li><a href="/member/MemberPwdCheck">마이페이지</a></li>
                <li><a href="/login/loginForm">로그인</a></li>
                <li class="bar">
                
                <div>메뉴</div>
                   
                </li>
                <li class="hide">
                    <div>
                        <ul>
                            <li>ID: 최사과님 </li>
                            <li><a href="/member/MemberPwdCheck">개인정보변경</a></li>
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
