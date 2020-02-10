<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/common/defualt-header.jspf" %>
<meta charset="EUC-KR">
</head>
<body>
<input id="msg" type="hidden" value="${MESSAGE}">

<script>
$(document).ready(function(){
	alert($("#msg").val());
	history.go(-1);
})
</script>
</body>
</html>