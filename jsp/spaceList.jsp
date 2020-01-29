<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<html>
<head>
<title>공간 리스트</title>
</head>
<body>
<div id="navbar-top">
<div class="w-70 m-15 h-100">
<div class="w-30 h-100">
</div>

<div class="w-10 m-20 navbar-menu">예약확인</div>
<div class="w-10 navbar-menu">마이페이지</div>
<div class="w-10 navbar-menu">로그아웃</div>
</div>
</div>

<div>
<input type="text" placeholder="검색어 입력">
<button>검색</button> <!-- css 필요 -->
</div>

<table border="1" table width="100" height="50" align="center">
<tr>
<td>목적</td>
<td>전체보기</td>
<td>스튜디오</td>
<td>전시회</td>
<td>콘서트</td>
<td>파티룸</td>
<td>세미나실</td>
</tr>

<tr>
<td>지역</td>
<td>전체보기</td>
<td>서울</td>
<td>경기도</td>
<td>인천</td>
<td>충청도</td>
<td>경상도</td>
</tr>

<tr>
<td>기간</td>
<!-- 달력 -->
</tr>

<tr>
<td>면적</td>
<td>전체보기</td>
<td>30</td>
<td>100</td>
<td>200</td>
<td>500</td>
</tr>
</table>

<form>
<input type="radio" name="hot" value="인기순" />
<input type="radio" name="fast" value="최신순" />
<input type="radio" name="lowprice" value="낮은 가격순" />
</form>

</body>
</html>