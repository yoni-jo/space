<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-adminHeader.jspf" %>
<title>공지 사항 작성</title>
</head>
<body>
	<form id="frm">
		<table class="notice_write" border="1" align="center" width="800">
			<colgroup>
				<col width="15%"/>
				<col width="85%"/>
			</colgroup>
			<caption>게시글 작성</caption>
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td><input type="text" id="NTC_TITLE" name="NTC_TITLE" class="wdp_90" size="70"></input></td>
				</tr>
				<tr>
					<td colspan="2" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="NTC_CONTENT" name="NTC_CONTENT"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		
		<center><a href="#this" class="btn" id="write">작성하기</a>
		<a href="#this" class="btn" id="list">목록으로</a></center>
	</form>
	
	<%@ include file="/WEB-INF/include/include-adminBody.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ 
				e.preventDefault();
				fn_noticeList();
			});
			
			$("#write").on("click", function(e){ 
				e.preventDefault();
				fn_insertNotice();
			});
		});
		
		function fn_noticeList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/noticeList' />");
			comSubmit.submit();
		}
		
		function fn_insertNotice(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/admin/noticeWrite' />");
			comSubmit.submit();
		}
	</script>
</body>
</html>