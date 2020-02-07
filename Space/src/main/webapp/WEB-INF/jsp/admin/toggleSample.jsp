<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-adminHeader.jspf" %>
<meta charset="EUC-KR">
<script>
	$(document).ready(function(){
		$('h1').click(function(){
			$(this).next().toggle('slow', function(){
			});
		});
	});
</script>

<title>1:1 문의 리스트</title>
</head>
<body>
	<h1>1:1 문의 셈플open&close</h1>
	<div>
		<h1>이곳이  질문자리</h1>
		<p>이곳이 답변자리</p>
	</div>
	<h1>2번째 라고용</h1>
	<div>
		<h1>질문질문  질문자리</h1>
		<p>답변답변 답변자리</p>
	</div>
</body>
</html>