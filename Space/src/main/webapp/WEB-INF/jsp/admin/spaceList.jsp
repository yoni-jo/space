<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<html>
<head>
<style type="text/css">
	a:link { color: #414958; }
	a:visited { color: #4E5869; }
	a:hover, a:active, a:focus { text-decoration: none; }
	
	.content{position:absolute; left:50%; top:50%;}
	.box1 {float:left;width:250px;}
	.box2 {float:left;width:45%;} 
	.box3 {float:left;width:35%;}
	  
</style>
<meta charset="EUC-KR">
<title>예약관리</title>


<script type="text/javascript"> 
function memberList(){
	location.href="memberList"
}
function reqList(){
	location.href="reqList"
}46260204194303
function spaceList(){
	location.href="spaceList"
}
function memberResList(){
	location.href="memberResList"
}
function QNAList(){
	location.href="QNAList"
}
function noticeList(){
	location.href="noticeList"
}

</script>

   </head>

<body>


<div class="main">
	<h1 align="center">관리자 화면</h1>
<table class="adminMain" border="1" align="center" width="900" height="40" bgcolor="#999999">
<tr>
<td align="center"><a href="javascript:memberList()">회원 목록</td>
<td align="center"><a href="javascript:reqList()">공간 신청 관리</td>
<td align="center"><a href="javascript:spaceList()">등록된 공간 관리게시판</td>
<td align="center"><a href="javascript:memberResList()">예약 관리</td>
<td align="center"><a href="javascript:QNAList()">1:1문의 게시판</td>
<td align="center"><a href="javascript:noticeList()">공지사항 관리</td>
</tr>
</table>
<br/>
<br/><br/>

<div class="container">
		<div class = "col-md-3"></div>
	
		<div class="page-header">
			<h2><b>등록된 공간 관리게시판</b><br/></h2><hr/><br/>
		</div>
			<c:choose>  
				<c:when test = "${fn:length(list) > 0}"> 
					<c:forEach var = "row" items = "${list}"> 
						<div class="box1">  
							<img src = "${row.SPACE_IMG}" style = "width:200px; height:120px;" onerror = "this.src='http://placehold.it/200x120';">
						</div>
						<div class="box2" style = "line-height:140%; "> 
							<a href = "pensionDetail.do?idx=${row.SPACE_TITLE}"><b style = "font-size:16px; color:black;">${row.SPACE_TITLE}</b></a>
							<sapn class ="user">
								<span></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${row.SPACE_HOST} / ${row.USER_NAME} / ${row.USER_PHONE} / ${row.USER_EMAIL}
							<br><br/>
							<span class = "space"> 
								<span></span>공간특징 : ${row.SPACE_USE}<br>
							<span class = "address">
								<span></span>주소 : ${row.SPACE_POS}<br>
							<span class = "price"> 
								<span></span> 가격 : ${row.SPACE_PRI}
							</span> 
								<br/><br/> 
							</div>
							<div class="box3" style = "line-height:140%; ">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							<input type="button" name="delete" value="삭제" style="width:50pt;height:20pt">
							<br><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" name="wait" value="보류" style="width:50pt;height:20pt">
							<br><br/><br/><br> 
							</div>
							<br/><br/><br>
						</div>
						 
					</c:forEach> 
				</c:when> 
				<c:otherwise>
					예약된 공간이 존재하지 않습니다.
				</c:otherwise>
			</c:choose>
	</div>
	<br/>
   <br/>
   <br/>
</body>
</html>
