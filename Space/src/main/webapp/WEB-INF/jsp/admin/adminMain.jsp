<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>
<script type="text/javascript">
function memberList(){
	location.href="memberList"
}
function reqList(){
	location.href="reqList"
}
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
<head>
<meta charset="EUC-KR">
<title>관리자 메인 헤더</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body >
<h1 align="center">관리자 화면</h1>
<table class="adminMain" border="1" align="center" width="900" height="40" bgcolor="#999999">
<tr>
<td align="center"><a href="javascript:memberList()">회원 목록</td>
<td align="center"><a href="javascript:reqList()">공간 신청 관리</td>
<td align="center"><a href="javascript:spaceList()">등록된 공간 게시판</td>
<td align="center"><a href="javascript:memberResList()">예약 관리</td>
<td align="center"><a href="javascript:QNAList()">1:1문의 게시판</td>
<td align="center"><a href="javascript:noticeList()">공지사항 관리</td>
</tr>
</table>

</body>
</html>