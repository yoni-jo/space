<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

</head>


<body>


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
    <table name = "memberList" class="user_list">
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
           
        </tbody>
        
        <tbody>
        
        
        </tbody>
    </table>
    
    <center>
				<div id="PAGE_NAVI"></div>
				<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
			</center>
			
	<br/>
    <%@ include file="/WEB-INF/common/include-body.jspf" %>
    
    
    
    <script type="text/javascript">
$(document).ready(function(){
	fn_memberPageList(1);
});

function fn_memberPageList(pageNo){
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/admin/memberPageList' />");
	comAjax.setCallback("fn_memberPageListCallback");
	comAjax.addParam("PAGE_INDEX", pageNo);
	comAjax.addParam("PAGE_ROW", 10);
	/* comAjax.addParam("keyField", $("#keyField > option:selected").val());
	comAjax.addParam("keyword", $("input[name='keyword']").val());
	 */
	comAjax.ajax();
}

function fn_memberPageListCallback(data){
	var total = data.TOTAL;
	var body = $("table[name='memberList'] > tbody");
	body.empty();
	if(total == 0){
		var str = "<tr><td colspan='4'>조회된 결과가 없습니다.</td></tr>"; 
		body.append(str);
	}else{
		var params = {
			divId : "PAGE_NAVI",
			pageIndex : "PAGE_INDEX",
			totalCount : total,
			eventName : "fn_memberPageList",
			recordCount : 10
		};
		gfn_renderPaging(params);
		var str = "";
		$.each(data.list, function(key, value){
			str += "<tr>" + "<td>" + value.USER_ID + "</td>" + "<td>" 
		    + value.USER_NAME + "</td>" + "<td>"
			+ "<input type='hidden' name='title' value=" + value.USER_PHONE + ">" 
			+ "</td>" + "<td>" + value.USER_EMAIL + "</td>" + "<td>" 
			+ value.USER_DATE + "</td>" + "</tr>";
		}); 
		body.append(str);
		/*  $("a[name='title']").on("click", function(e){
			e.preventDefault();
			fn_noticeDetail($(this));
		});  */
	}
} 
</script>
    

</body>
</html>