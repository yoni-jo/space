
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<html>
<head>
<%@ include file="/WEB-INF/common/include-adminHeader.jspf" %>
<style type="text/css">
	div{
	padding : 1%;
	}
	.leftdiv{float : left;}
	.middlediv{float : left;} 
	.rightdiv{float : left;}  
#PAGE_NAVI{	float: right;
    margin-top: 40px;
    margin-right: 50%}
</style>
<meta charset="EUC-KR"> 
<title>예약관리</title>
   </head> 
<%@ include file="/WEB-INF/common/include-body.jspf" %>
	
<div>      
  
</div> 
<div>
<body>
<center><h2>예약 관리</h2></center>
<center>
<div class="main">
<script type="text/javascript"> 
$(document).ready(function(){
	
	fn_resList(1);
	 
}); 
 
/* 검색칸에서 엔터키 누르면 실행 */
function enterkey() { 
    if (window.event.keyCode == 13) {
    	fn_resList(1);
    }
}

function fn_resList(pageNo){
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/admin/selectAdminResList' />");
	comAjax.setCallback("fn_resListCallback");
	comAjax.addParam("PAGE_INDEX", pageNo);
	comAjax.addParam("PAGE_ROW", 10);
	comAjax.addParam("searchOption", $("#searchOption > option:selected").val());
	comAjax.addParam("keyword", $("input[name='keyword']").val());
	 
	comAjax.ajax();
}

function fn_resListCallback(data){
	var total = data.TOTAL;
	var body = $(".main");
	body.empty(); 
	if(total == 0){
		var str = "<tr><td colspan='4'>조회된 결과가 없습니다.</td></tr>"; 
		body.append(str);
	}else{
		var params = {
			divId : "PAGE_NAVI",
			pageIndex : "PAGE_INDEX",
			totalCount : total,
			eventName : "fn_resList",
			recordCount : 10
		}; 
		gfn_renderPaging(params);
		var str = "";
		$.each(data.list, function(key, value){
			console.log("check");
			str += "" +
				"<div style='width: 900px;'>" 
				+ "<div class='leftdiv'"+ "'style= width : 100px'>" + "<img src = " + value.SPACE_IMG + "style = 'width:200px; heigth:120px;'>" +"</div>"
				+ "<div class='middlediv' style='width:600px; display: inline-block;'>"
				+ "<a href = 'pensionDetail.do?idx='" + value.SPACE_TITLE + ">"
				+ "<b style='font-size:16px; color:black;'>" + value.SPACE_TITLE + "</b></a><br>"
				+ "<sapn class='space'>" + "<span></span>" + "공간 특징 : "
				+ value.SPACE_USE + "<br>"
				+ "<sapn class='address'>" + "<span></span>" + "주소 : "
				+ value.SPACE_POS + "<br>"
				+ "<sapn class='space'>" + "<span></span>" + "예약일시 : "
				+ value.RES_APPLY_DATE + "<br></span>" 
				+ "<sapn class='space'>" + "<span></span>" + "가격 : "
				+ value.SPACE_PRI + "원<br></span>" 
				+ "</div>"
				+ "<div class='rightdiv' style='width:200px;display: inline-block;'>"
				+ "예약자 : " + value.RES_NAME + "<br>"
				+ value.USER_ID + "/" + value.RES_NAME + "<br>"
				+ "이메일 : " + value.RES_EMAIL + "<br><br>"
				+ "<input type='button' name='commit' value='예약취소' style='width:50pt;height:20pt'>"
				+ "</div>" + "</div>" + "<p></p>" + "" +"<br><br>";
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
</div> <br>
<center> 
	<div id="PAGE_NAVI" style="bottom: 0"></div> 
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
</center>


</html>
