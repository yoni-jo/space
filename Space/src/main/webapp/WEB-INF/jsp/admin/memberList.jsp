<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>

    

<body>
<script type="text/javascript">
function memberList(){
	location.href="memberList"
}
function reqList(){
	location.href="reqList"
}
function spaceList(){
	location.href="spaceList"
}
function memberResList(){
	location.href="memberResList"
}
function QNAList(){
	location.href="QNAList"
}
function noticeList(){
	location.href="noticeList"
}
</script>

<h1 align="center">관리자 화면</h1>
<table class="adminMain" border="1" align="center" width="900" height="40" bgcolor="#999999">
<tr>
<td align="center"><a href="javascript:memberList()">회원 목록</td>
<td align="center"><a href="javascript:reqList()">공간 신청 관리</td>
<td align="center"><a href="javascript:spaceList()">등록된 공간 게시판</td>
<td align="center"><a href="javascript:memberResList()">예약 관리</td>
<td align="center"><a href="javascript:QNAList()">1:1문의 게시판</td>
<td align="center"><a href="javascript:noticeList()">공지사항 관리</td>
</tr>
</table>
<br/>
<br/>
<br/>
<br/>
    <h2>회원 목록</h2>
    <table class="user_list">
        <colgroup>
            <col width="10%"/>
            <col width="10%"/>
            <col width="15%"/>
            <col width="20%"/>
            <col width="20%"/>
        </colgroup>
      
        <thead>
            <tr>
                <th scope="col">아이디</th>
                <th scope="col">이름</th>
                <th scope="col">전화번호</th>
                <th scope="col">이메일</th>
                <th scope="col">가입일</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list }" var="row">
					<tr>
                            <td>${row.USER_ID }</td>
                            <td>${row.USER_NAME }</td>
                            <td>${row.USER_PHONE }</td>
                            <td>${row.USER_EMAIL }</td>
                            <td>${row.USER_DATE }</td>
                        </tr>
                    </c:forEach>
                </c:when>
               <c:otherwise>
                    <tr>
                        <td colspan="5">조회된 결과가 없습니다.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>

</body>
</html>