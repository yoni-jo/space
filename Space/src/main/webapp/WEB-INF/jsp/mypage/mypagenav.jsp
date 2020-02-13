<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
<script type="text/javascript">
	$(document).ready(function() {
/* 메뉴에 마우스 올렸을 시 색깔변하게   */
		$('#mypagemenu>ul>li').hover(function() {

			$(this).toggleClass('myhover');

		}, function() {
			$(this).removeClass('myhover');

		});

		
		
	});
	/* 내공간관리 클릭할시 숨겨진 메뉴 보이게 하기 */
	 $(document).on('click','.mypagebar',function(){
		
		$('.mypagehide>li').slideToggle('hover',function(){
			
			$(this).css({"color":"purple"})
		});

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
.myhover>a {background:#41dfd0;transition:all 0.2s ease-in;color:white}
.myhover{background:#41dfd0; color:white;transition:all 0.2s ease-in;}

</style>
			
				<nav id="mypagemenu">
					<ul>
						<li><a href="/two/res/resInfo">내가 예약한 공간</a></li>

						<li><a href="/two/mypage/myFavList">내가 찜한 공간</a></li>
						<li><a href="/two/myInfo/QNAList">1:1문의</a></li>
						<li><a href="/two/member/MemberModifyForm">개인정보 변경</a></li>
						
						<li class="mypagebar">내 공간 관리
			<ul class="mypagehide">
				<li><a href="/two/mySpace/spaceForm">내 공간 등록하기</a></li>
				<li><a href="/two/mySpace/SpaceControl">내 공간 관리하기</a></li>
				<li><a href="/two/mySpace/ResPage">내 공간 예약상황</a></li>
			</ul>
		</li>
					</ul>

				</nav>
			
