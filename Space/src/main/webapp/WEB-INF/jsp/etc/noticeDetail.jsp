<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/common/calendar-header.jspf" %>
<style>
	.optitle{font-size: 20px}
	.opt>a{font-size: 15px; color: black; margin-right: 10px; margin-left: 10px; text-decoration: none;}
	.option{text-align: left;}
	.opt>a:hover{font-weight: bold;}
	.infoImage:hover{cursor: pointer; outline: black;}
	.favBtn:hover{cursor: pointer; outline: black;}
</style>
<meta charset="UTF-8">
<title>관리자 공지사항 상세보기</title>
</head>
<body>
<br/> 
	<form id="frm">
	<table class="notice_detail" align="center" width="800" >
		<colgroup>
			<col width="7%" />
			<col width="70%" />
			<col width="8%" />
			<col width="15%" />
		</colgroup>
		<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">제  목</th>
					<th scope="col">조회수</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
		<tbody>
			<tr>
				<td align="center">${map.NTC_NUM}</td>
				<td align="center">${map.NTC_TITLE}</td>
				<td align="center">${map.NTC_HIT}</td>
				<td align="center">${map.NTC_DATE}</td>
			</tr>
		</tbody>
		<tbody>
			<tr>
				<p><td colspan="4" height="200" style="padding-left:50px;">${fn:replace(map.NTC_CONTENT, cn, br)}</td></p>
			</tr>
		</tbody>
	</table>
	</form>
	<br/>
	<center>
	<a href="#this" class="btn" id="list">목록으로</a>
	</center>
	
	<%@ include file="/WEB-INF/common/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ 
				e.preventDefault();
				fn_noticeList();
			});
			
	});
		
		function fn_noticeList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/etc/noticeList' />");
			comSubmit.submit();
		}
	
	</script>
		

</body>
</html>