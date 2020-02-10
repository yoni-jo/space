<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/common/include-adminHeader.jspf" %>
</head>


<body>
	<center><h2>회원 관리</h2></center>
	
    <table name = "memberList" class="user_list" align="center">
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
    </table>
    
  		  <center>
				<div id="PAGE_NAVI"></div>
				<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
			</center>
			
			<form  id="search" align="right" style="padding-right:23%" method="post" >
            <select id="searchOption" size="1">
                <option id="USER_ID" value="USER_ID" selected="selected">아이디</option>
                <option id="USER_NAME" value="USER_NAME" >이  름</option>
                <option id="USER_EMAIL" value="USER_EMAIL" >E-mail</option>
                <option id="ALL" value="ALL" >아이디+이름+E-mail</option>
            </select>
                 <input type="text" size="16" name="keyword" value="${keyword}" placeholder="검색어 입력" onkeyup="enterkey();">
                 <input type="text" style="display: none;" />
                 <input type="button" value="검 색" onClick="fn_memberList(1)">
                
   		</form> 		
			
	<br/>
    <%@ include file="/WEB-INF/common/include-body.jspf" %>
    
    
    
    <script type="text/javascript">
$(document).ready(function(){
	
	fn_memberList(1);
	
});

/* 검색칸에서 엔터키 누르면 실행 */
function enterkey() {
    if (window.event.keyCode == 13) {
    	fn_memberList(1);
    }
}

function fn_memberList(pageNo){
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/admin/selectmemberList' />");
	comAjax.setCallback("fn_memberListCallback");
	comAjax.addParam("PAGE_INDEX", pageNo);
	comAjax.addParam("PAGE_ROW", 10);
	comAjax.addParam("searchOption", $("#searchOption > option:selected").val());
	comAjax.addParam("keyword", $("input[name='keyword']").val());
	 
	comAjax.ajax();
}

function fn_memberListCallback(data){
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
			eventName : "fn_memberList",
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
		$("a[name='title']").on("click", function(e){
			e.preventDefault();
			fn_noticeDetail($(this));
		});
	}
} 
</script>
    

</body>
</html>