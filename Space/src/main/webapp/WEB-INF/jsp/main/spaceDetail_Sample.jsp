<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div style="width: 100%">
	<div id="bigTitle">${DETAIL.SPACE_TITLE}</div>	


</div>


	<table class="test">
		<tr>
		<td>태그1 : </td>
		<c:forEach var="row" items="${TAG}">
		<td>${row}</td>
		</c:forEach>
		</tr>
	</table>
	<table class="test">
		<tr>
		<td>옵션 : </td>
		<c:forEach var="row" items="${OPT}">
		<td>${row}</td>
		</c:forEach>
		</tr>
	</table>
	<table class="test">
		<tr>
		<td>사용목적 : </td>
		<c:forEach var="row" items="${USE}">
		<td>${row}</td>
		</c:forEach>
		</tr>
	</table>
	<table class="test">
		<tr>
		<td>이미지1 : </td>
		<c:forEach var="row" items="${IMG}">
		<td><img src="<spring:url value='/image/${row}'/>" width="50px" height="50px"/></td>
		</c:forEach>
		</tr>
	</table>
	<table class="test">
		<tr>
		<td>QNA_LIST : </td>
		<c:forEach var="row" items="${QNA_LIST}">
		<td>[${row.QNA_ANS} ${row.QNA_TITLE} ${row.USER_ID} ${row.QNA_DATE} ${row.QNA_SCR}]</td>
		</c:forEach>
		</tr>
	</table>
	<table class="test">
		<tr>
		<td>REPLY_LIST : </td>
		<c:forEach var="row" items="${REPLY_LIST}">
		<td>[${row.USER_ID} ${row.REPLY_NUM} ${row.REPLY_CNT} ${row.REPLY_CMT} ${row.REPLY_IMG} ${row.REPLY_DATE}]</td>
		</c:forEach>
		</tr>
	</table>
	${DETAIL.SPACE_RES_TYPE}
	<table class="test">
		<tr>
		<td>RES_LIST : </td>
		<c:forEach var="row" items="${RES_LIST}">
		<c:if test="${DETAIL.SPACE_RES_TYPE=='DATE'}">
			<td>[<fmt:formatDate pattern="YYYY-MM-dd" value="${row.SDATE}"/> ${row.PRI}]</td>
		</c:if>
		<c:if test="${DETAIL.SPACE_RES_TYPE=='DAY'}">
			<td>[${row.MON} ${row.TUE} ${row.WED} ${row.THU} ${row.FRI} ${row.SAT} ${row.SUN}]</td>
		</c:if>
		</c:forEach>
		</tr>
	</table>
	
	DETAIL_INFO :
	<table class="test">
		<c:forEach var="row" items="${DETAIL}">
		<tr>
			<td>${row}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>