<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="myPageList_top">
	<h1 style="width:400px;">		
		<p>내 공간 관리</p>
	</h1>
	<div style="text-align:right"> 
	<form>
        <input type = "radio" name = "check" value = "all" checked="checked"> 전체 보기 
        <input type = "radio" name = "check" value = "done"> 등록 완료 공간만 보기 
        <input type = "radio" name = "check" value = "ing"> 등록 대기 공간만 보기 
     </form>
	</div>
</div>

  
<table cellpadding="10" cellspacing="0" class="myPageList_table" style="width:964px;">
<col width="100" />
<col width="300" />
<col width="100" />
<col width="100" />
<col width="100" />
<col width="100" />
	<tr>
		<th>공간명</th>
		<th colspan="3">등록내역</th>
		<th>진행상황</th>
		<th>공간 관리</th>
	</tr>
<c:forEach var="ldata" items="${list}">
	<tr>
		<td><a href="view.o?no=${ldata.no}"><img src="./upload/${ldata.file1}" alt="${ldata.name}" width="100px" height="100px" /></a></td>
		<td style="text-align:left;"><a href="view.o?no=${ldata.no}">${ldata.name}</a></td>
		<td>${ldata.moneys}</td>
		<td>면적: ${ldata.discount_moneys}, 가격: ${ldata.discount_moneys} ${ldata.discount_moneys} </td>
		<td><span style="font-weight:bold;color:#ea0000;">${ldata.rmoneys}원</span></td>
		<td>
			<c:if test="${ldata.ship_money eq 0}">
        	등록대기중
	        </c:if>
	        <c:if test="${ldata.ship_money ne 0}">
	                  등록완료
	        </c:if>
	        <br />
		</td>
		<td>
			<input type="button" value="수정" onclick="location.href='edit.o?no=${ldata.no}'" class="basket_order" />
			<input type="button" value="보류" onclick="location.href='del.o?no=${ldata.no}'" class="basket_delete" />
			<input type="button" value="삭제" onclick="location.href='del.o?no=${ldata.no}'" class="basket_delete" />
		</td>
	</tr>
</c:forEach>
</table>

<div class="list_page">
	<a href="mypage_list.o?pages=1&amp;searchs=${searchs}&amp;searchs_value=${searchs_value}" class="list_page_a">◀</a>
	<c:forEach begin="${paging.pstarts}" end="${paging.pends}" step="1" var="i">
		<a href="mypage_list.o?pages=${i}&amp;searchs=${searchs}&amp;searchs_value=${searchs_value}" <c:if test="${i ne pages_int}"> class="list_page_a"</c:if> <c:if test="${i eq pages_int}"> class="list_page_a_hover"</c:if>>${i}</a>
	</c:forEach>
	<a href="mypage_list.o?pages=${paging.board_paging}&amp;searchs=${searchs}&amp;searchs_value=${searchs_value}" class="list_page_a">▶</a>
</div>

<div class="basket_b" style="display:none;">
	<a href="write.o">등록하기</a>
</div>