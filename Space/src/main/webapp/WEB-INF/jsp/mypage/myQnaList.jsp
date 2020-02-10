<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
table{border: 2px solid #000000 }
th{
border-bottom:2px solid #000000;
border-right: 2px solid #000000;
 }
 td{
 border-right: 2px solid #000000;
 }
</style>
<table border="2px" width="700px" height="30px" align="center" style="border-collapse: collapse;">
<th>1:1문의</th>
</table>

<title>1:1문의</title>
</head>
<body>

<table width="650px" height="250px" align="center"
style = "border-collapse: collapse;">
<tr>
<th>글번호</th>
<th>제목</th>
<th>답변여부</th>
<th>작성일</th>
</tr>

<c:choose>
<c:when test="${fn: length(list) > 0}">
<c:forEach items="${list }" var="row">
<tr>
<td>${row.ADQNA_NUM }</td>
<td class="title"><a href="#this" name="title">${row.ADQNA_TITLE }</a>
<input type="hidden" id="ADQNA_NUM" value="${row.ADQNA_NUM }">
</td>
<td>${row.ADQNA_ANS }</td>
<td>${row.ADQNA_DATE }</td>
</tr>
</c:forEach>
</c:when>
<c:otherwise>
<tr>
<td>조회된 결과가 없습니다.</td>
</tr>
</c:otherwise>
</c:choose>

</table>

<input type="button" value="작성하기" onclick="location.href('Myqnawrite')">

<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
$(document).ready(function(){
	$("#write").on("click", function(e){
		e.preventDefault();
		fn_Myqnawrite();
	});
	
	$("a[name='title']").on("click", function(e){
		e.preventDefault();
		fn_Myqnadetail($(this));
	});
});

function fn_Myqnawrite(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/mypage/Myqnawrite' />");
	comSubmit.submit();
}

function fn_Myqnadetail(obj){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/mypage/Myqnadetail' />");
	comSubmit.addParam("ADQNA_NUM", obj.parent().find("#ADQNA_NUM").val());
	comSubmit.submit();
}
</script>
</body>
</html>