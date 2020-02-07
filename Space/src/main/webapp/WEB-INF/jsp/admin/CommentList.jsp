<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>1:1문의 댓글</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% 
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>
</head>
<body>
<br/> 
	<!-- 댓글리스트 -->
<table class="QNA_CommentList" border="1" align="center" width="800" >
		<colgroup>
			<col width="15%" />
			<col width="70%" />
			<col width="15%" />
		</colgroup>
		<thead>
				<tr>
					<th scope="col">작성자</th>
					<th scope="col">답  변</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
		<tbody>
			<tr>
				<td align="center">${map.USER_ID}</td>
				<td align="center" height="200">${fn:replace(map.CMT_CMT, cn, br)}</td>
				<td align="center">${map.CMT_DATE}</td>
			</tr>
		</tbody>
	</table>

</body>
</html>