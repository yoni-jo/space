<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/common/calendar-header.jspf" %>
<style>
  #frm{margin-left: calc(50% - 400px);width: 800px;text-align: center} 
	#backbutton{text-align: center;margin-top:10%}
	.notice_detail{border-bottom:1px solid black ;border-collapse: collapse;}
	.notice_detail th{border-bottom:1px solid black;}
	.notice_detail tr{height: 50px}
	.notice_detail tr td{border-bottom:1px solid black;}
	
	#backbutton>button{width: 100px; height: 30px;border: 0;background-color:#d8d1d1; }
	#backbutton>button:hover {
	color:white;border:1px solid gray;
}
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
				<p><td colspan="4" height="200">${fn:replace(map.NTC_CONTENT, cn, br)}</td></p>
			</tr>
		</tbody>
	</table>
	
	<br/>
	<div id="backbutton">
	<button href="#this" class="btn" id="list">목록으로</button>
</div>
	</form>
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