<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<title>1:1문의 상세</title>
<form id="frm">
<table class="qna_view">
<body>
<tr>
<th>글번호</th>
<td>
${map.ADQNA_NUM }
<input type="hidden" id="ADQNA_NUM" name="ADQNA_NUM" value="${map.ADQNA_NUM }">
</td>
<tr>
<th>답변여부</th>
<td>${map.ADQNA_ANS }</td>
<th>작성일자</th>
<td>${map.ADQNA_DATE }</td>
</tr>
<tr>
<th>제목</th>
<td colspan="3"><input type="text" id="ADQNA_TITLE" name="ADQNA_TITLE" class="wdp_90" value="${map.ADQNA_TITLE }"/>
</td>
</tr>
<tr>
<td colspan="4" class="qna_text">
<textarea row="20" cols="100" title="내용" id="ADQNA_CNT" name="ADQNA_CNT">${map.ADQNA_CNT }</textarea>
</td>
</tr>
</table>
</form>

<a href="#this" class="btn" id="update">수정</a>
<a href="#this" class="btn" id="list">목록</a>
<a href="#this" class="btn" id="delete">삭제</a>

<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
$(document).ready(function(){
	$("#list").on("click", function(e){
		e.preventDefault();
		fn_Myqnalist();
	});
	
	$("#update").on("click", function(e){
		e.preventDefault();
		fn_MyqnaUpdate();
	});
	
	$("#delete").on("click", function(e){
		e.preventDefault();
		fn_Myqnadelete();
	});
});

function fn_Myqnalist(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='Myqnalist'/>");
	comSubmit.submit();
}

function fn_MyqnaUpdate(){
	var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/mypage/MyqnaUpdate'/>");
	var adqna_num = "${map.ADQNA_NUM}";
	comSubmit.submit();
}

function fn_Myqnadelete(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/mypage/Myqnadelete'/>");
	comSubmit.addParam("ADQNA_NUM", $("#ADQNA_NUM").val());
	comSUbmit.submit();
}
</script>

</body>
</html>