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

	
<div>      
  
</div> 
<div>
<body>
<%@ include file="/WEB-INF/common/include-body.jspf" %>
<center><h2>공간 신청 관리</h2></center>
<center>
<div class=main style="width: 900px;">
 
	</center> 
	
			
 
<script type="text/javascript"> 
$(document).ready(function(){
	
	fn_reqList(1);
}); 

function fn_deletereqList(){
	if(confirm("보류하시겠습니까?") == true){
		alert("보류되었습니다.");
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/admin/deletereqList' />");
	comSubmit.submit();
	}else{
		return;
	}
}

/* 검색칸에서 엔터키 누르면 실행 */
function enterkey() { 
    if (window.event.keyCode == 13) {
    	fn_reqList(1);
    }
}

function fn_reqList(pageNo){
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/admin/selectreqList' />");
	comAjax.setCallback("fn_reqListCallback");
	comAjax.addParam("PAGE_INDEX", pageNo);
	comAjax.addParam("PAGE_ROW", 10);
	comAjax.addParam("searchOption", $("#searchOption > option:selected").val());
	comAjax.addParam("keyword", $("input[name='keyword']").val());
	 
	comAjax.ajax();
}

function fn_reqListCallback(data){
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
			eventName : "fn_reqList",
			recordCount : 10
		};
		gfn_renderPaging(params);
		var str = "";
		$.each(data.list, function(key, value){
			console.log("check");
			str += ""
			+ "<div style='width: 900px;'>" 
			+ "<div class='leftdiv'"+ "'style= width : 100px'>" + "<img src = " + value.APPLY_IMG + "style = 'width:200px; heigth:120px;'>" +"</div>"
			+ "<div class='middlediv' style='width:600px; display: inline-block;'>"
			+ "<a href = 'pensionDetail.do?idx='" + value.APPLY_TITLE + ">"
			+ "<b style='font-size:16px; color:black;'>" + value.APPLY_TITLE + "&nbsp;&nbsp;</b></a>";
			if(value.APPLY_MODIFY == "N"){
				str+="<span style='color:red'><strong>(신규)</strong></span>";
			}else{
				str+="<span style='color:blue'><strong>(수정)</strong></span>";
			}
			str += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class = 'user'>" + "<span></span>" 
			+ value.USER_ID + "/" + value.USER_NAME + "/" + value.USER_PHONE + "/" + value.USER_EMAIL + "<br/>"
			+ "<sapn class='space'>" + "<span></span>" + "공간 특징 : "
			+ value.APPLY_USE + "<br>"
			+ "<sapn class='address'>" + "<span></span>" + "주소 : "
			+ value.APPLY_POS + "<br>"
			+ "<sapn class='space'>" + "<span></span>" + "가격 : "
			+ value.APPLY_PRI + "원<br></span>" 
			+ "</div>"
			+ "<div class='rightdiv' style='width:200px;display: inline-block;'><input type='hidden' name='spaceID' value='"+value.APPLY_NUM+"'>"
			+ "<input type='button' class='commit' name='commit' value='승인' style='width:50pt;height:20pt'>" + "<br><br>"
			+ "<input type='button' class='delete' name='delete' value='삭제' style='width:50pt;height:20pt'>" + "<br><br><br><br><br>"
			+ "</div>" + "</div>" + "<p></p>" + "";
		}); 
		body.append(str);
		$("a[name='title']").on("click", function(e){
			e.preventDefault();
			fn_noticeDetail($(this));
			
		});
		$(".commit").on("click", function(e){ 
			e.preventDefault();
			if(confirm("승인하시겠습니까?") == true){
				alert("승인되었습니다.");
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/admin/insertreqList'/>");
				comSubmit.addParam("SPACE_ID",$(this).parent().find("input[name='spaceID']").val());
				comSubmit.submit();
			}else{
				alert("취소되었습니다.");
			}
		});
		
		$(".delete").on("click", function(e){ 
			e.preventDefault();
			fn_deletereqList();
		});
	}  
} 
</script>
 </div>
 
 </div>
 

</body>
</div> <br>
<center> 
	<div id="PAGE_NAVI" style="bottom: 0"></div> 
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
</center>


</html>
