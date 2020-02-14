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
<input id="nextView" type="hidden" value="${NEXT_VIEW}">
 
<script>
$(document).ready(function(){
	alert($("#msg").val());
	if($("#nextView").val()!=""){
		var view = $('#nextView').val();
		console.log("nextView : "+view);
		location.href="<c:url value='"+view+"'/>";
	}else{
		history.go(-1);
	}
	
	
})
</script>
</body>
</html>