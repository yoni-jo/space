<%@ page language="java" contentType="text/html; charset=euc-kr"
pageEncoding="euc-kr"%>
<div>
<div class="w3-border w3-center w3-padding">
<c:if test="${ id == null }">
추천 기능은 <button type="button" id="newLogin"><b class="w3-text-blue">로그인</b></button> 후 사용 가능합니다.</br />
<i class="fa fa-heart" style="font-size:16px;color:red"></i>
<span class="rec_count"></span>
</c:if>
<c:if test="${ id != null }">
<button class="w3-button w3-black w3-round" id="rec_update">
<i class="fa fa-heart" style="font-size:16px;color:red"></i>
&nbsp;<span class="rec_count"></span>
</button>
</c:if>
</div>
</div>