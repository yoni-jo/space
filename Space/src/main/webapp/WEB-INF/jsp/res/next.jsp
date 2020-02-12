<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/common/defualt-header.jspf" %>
<meta charset="EUC-KR">
</head>
<body>
<form action="<c:url value='/res/resPayInfo'/>" method="post">
	<input type="hidden" name="TYPE" value="${TYPE}">
	<input type="hidden" name="PRI" value="${PRI}">
	<input type="hidden" name="PAY_DATE" value='
		<fmt:formatDate value="${PAY_DATE}" pattern="yyyy-MM-dd HH:mm"/>'>
</form>


<script>
$(document).ready(function(){
	$("form").submit();
});
</script>
</body>
</html>