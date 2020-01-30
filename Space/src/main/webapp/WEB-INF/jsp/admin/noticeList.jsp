<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-adminHeader.jspf" %>
<title>공지 사항 뷰</title>
</head>
<body>
	<center><h2>공지사항 관리</h2></center>
		<table class="notice_list" border="1" align="center" width="800">
			<colgroup>
				<col width="8%"/>
				<col width="57%"/>
				<col width="27%"/>
				<col width="8%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">제  목</th>
					<th scope="col">작성일</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list) > 0}">
						<c:forEach items="${list}" var="row">
							<tr>
								<td align="center">${row.NTC_NUM}</td>
								<td class="title">
									<a href="#this" name="title">${row.NTC_TITLE }</a>
                                	<input type="hidden" id="NTC_NUM" value="${row.NTC_NUM }">
								</td>
								<td align="center">${row.NTC_DATE}</td>
								<td align="center">${row.NTC_HIT}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<br/>
		<center><a href="#this" class="btn" id="write" >글쓰기</a></center>

		<%@ include file="/WEB-INF/include/include-adminBody.jspf" %>		
		<script type="text/javascript">
       		$(document).ready(function(){
       			$("#write").on("click", function(e){ 
                    e.preventDefault();
                    fn_noticeWrite();
                }); 
       			
				$("a[name='title']").on("click", function(e){  
	                e.preventDefault();
	                fn_noticeDetail($(this));
	            });
			});
			
       		function fn_noticeWrite(){
                var comSubmit = new ComSubmit();
                comSubmit.setUrl("<c:url value='/admin/noticeWriteForm'/>");
                comSubmit.submit();
            }
       		
			function fn_noticeDetail(obj){
	            var comSubmit = new ComSubmit();
	            comSubmit.setUrl("<c:url value='/admin/noticeDetail' />");
	            comSubmit.addParam("NTC_NUM", obj.parent().find("#NTC_NUM").val());
	            comSubmit.submit();
	        }
		</script>

</body>
</html>
