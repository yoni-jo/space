<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
<script type="text/javascript">
	$(document).ready(function() {

		$('#mypagemenu>ul>li').hover(function() {

			$(this).addClass('myhover');

		}, function() {
			$(this).removeClass('myhover');

		});

		
		
	});
	
	 $(document).on('click','.mypagebar',function(){
		
		$('.mypagehide>li').slideToggle();

	});

</script>
<style type="text/css">
/* 메뉴바 */
#mypagemenubar {position:fixed;	float: left;	margin-left: 5%;	margin-top:50px;width: 150px;}
#mypagemenu>ul>li>a {display: block;}
#mypagemenu>ul {padding-left: 0;height: 300px;}
#mypagemenu>ul>li {	border: 1px solid #ccc;	width: 150px;height: 50px;text-align: center;line-height: 50px;}


/*감춰진메뉴 마우스 오버이벤트  */
.mypagehide{padding:0}
.mypagehide>li{display: none;}
.mypagehide>li>a{text-align: center;}
.mypagehide>li>a span{height: 5px;width:0%;background: #e91e63;display:block; transition:all 0.4s ease-in;}
.mypagehide li a:hover span{font-weight: bold;width: 100%}

/* 마우스오버이벤트 */
.myhover {background:gray; opacity:50%;transition:all 0.2s ease-in;}


</style>
			
				<nav id="mypagemenu">
					<ul>
						<li><a href="">내가 예약한 공간</a></li>

						<li><a href="">내가 찜한 공간</a></li>
						<li><a href="">1:1문의</a></li>
						<li><a href="/two/member/MemberModifyForm">개인정보 변경</a></li>
						<li><a href="">아무것두 읍다아아아</a></li>
						<li class="mypagebar">내 공간 관리
			<ul class="mypagehide">
				<li><a href="/two/space/Form">내 공간 등록하기</a></li>
				<li><a href="/two/space/Myspace_list">내 공간 관리하기</a></li>
				<li><a href="/two/space/Myspace_list">내 공간 예약상황</a></li>
			</ul>
		</li>
					</ul>

				</nav>
			
