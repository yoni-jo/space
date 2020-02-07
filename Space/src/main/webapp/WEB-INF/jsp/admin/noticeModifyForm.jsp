<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-adminHeader.jspf" %>
</head>
<body>
		
	<form id="frm">
		<table class="notice_ModifyForm" align="center" width="800">
			<colgroup>
				<col width="20%"/>
				<col width="30%"/>
				<col width="20%"/>
				<col width="30%"/>
			</colgroup>
			<caption>게시글 상세</caption>
			<tbody>
				<tr>
					<th scope="row">글 번호</th>
					<td>
						${map.NTC_NUM }
						<input type="hidden" id="NTC_NUM" name="NTC_NUM" value="${map.NTC_NUM }">
					</td>
					<th scope="row">조회수</th>
					<td>${map.NTC_HIT }</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${map.CREA_ID }</td>
					<th scope="row">작성시간</th>
					<td>${map.NTC_DATE }</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3">
						<input type="text" id="NTC_TITLE" name="NTC_TITLE" class="wdp_90" size="70" value="${map.NTC_TITLE }"/>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="NTC_CONTENT" name="NTC_CONTENT">${map.NTC_CONTENT }</textarea>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	
	<center>
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="modify">수정하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>
	</center>
	
	<%@ include file="/WEB-INF/include/include-adminBody.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ 
				e.preventDefault();
				fn_noticeList();
			});
			
			$("#modify").on("click", function(e){
				e.preventDefault();
				fn_modifyNotice();
			});
			
			$("#delete").on("click", function(e){
				e.preventDefault();
				fn_deleteNotice();
			});
		});
		
		function fn_noticeList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/noticeList' />");
			comSubmit.submit();
		}
		
		function fn_modifyNotice(obj){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/admin/modifyNotice' />");
			comSubmit.submit();
		}
		
		function fn_deleteNotice(){
			if(confirm("삭제하시겠습니까?") == true){
				alert("삭제되었습니다.");
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/deleteNotice' />");
			comSubmit.addParam("NTC_NUM", $("#NTC_NUM").val());
			comSubmit.submit();
			}else{
				return;
			}
		}

	</script>
</body>
</html>