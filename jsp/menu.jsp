<%@ page language="java" contentType="text/html; charset=euc-kr"
pageEncoding="euc-kr"%>
<script>
var loadMenu = function(u, callback){
	$.ajax({
		url: u,
		method: 'GET',
		success: function(data){
			callback(data);
		}
	});
};

var loadLogin = function(data){
	$("section").empty();
	$("section").html(data);
};
var loadJoin = function(data){
	$("section").empty();
	$("section").html(data);
};

$(function(){
	var $menuArr = $("#coreTopMenu>span>a");
	$menuArr.click(function(event){
		var url = $(this).attr('href');
		switch(url){
		case '${contextPath}/user/login.jsp':
			loadMenu(url, loadLogin);
		break;
		case '${contextPath}/user/join.jsp':
			loadMenu(url, loadJoin);
		break;
		};
		return false;
	});
});
</script>

<div>
<ul id="coreTopMenu">
<span><a href='${contextPath}/user/reserveCheck.jsp'><font color="black">예약확인</font></a></span>&nbsp;&nbsp;
<span><a href='${contextpath}/user/myPage.jsp'><font color="black">마이페이지</font></a></span>&nbsp;&nbsp;
<span><a href='${contextpath}/user/login.jsp'><font color="black">로그인</font></a></span>
</ul>

<ul id="coreBottomMenu">
<span><a href='${contextPath}/user/lower.jsp'><font color="black">이용약관</font></a></span>&nbsp;&nbsp;
<span><a href='${contextPath}/user/privacy.jsp'><font color="black">개인정보처리방침</font></a></span>&nbsp;&nbsp;
<span><a href='${contextPath}/user/operation.jsp'><font color="black">운영정책</font></a></span>&nbsp;&nbsp;
<span><a href='${contextPath}/user/help.jsp'><font color="black">고객센터</font></a></span>
</ul>
</div>


<select id="purpose" name="purpose" multiple size="3" required autofocus>
<option value="전시장">전시장</option>
<option value="스튜디오">스튜디오</option>
<option value="세미나실">세미나실</option>
<option value="스터디룸">스터디룸</option>
<option value="파티홀">파티홀</option>
<option value="기타">기타</option>
</select>

<select id="area" name="area" multiple size="3" required autofocus>
<option value="서울">서울</option>
<option value="경기도">경기도</option>
</select>

<!-- 기간 -->

<select id="land" name="land" multiple size="3" required autofocus>
<option value="~50m²">~50m²</option>
<option value="~100m²">~100m²</option>
<option value="~150m²">~150m²</option>
<option value="~200m²">~200m²</option>
<option value="~250m²">~250m²</option>
<option value="~300m²">~300m²</option>
</select>

<!-- include file -->