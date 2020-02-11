<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<html lang="ko">
<head>
<%@ include file="/WEB-INF/common/include-adminHeader.jspf" %>
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<style type="text/css">
	a:link { color: #414958; }
	a:visited { color: #4E5869; }
	a:hover, a:active, a:focus { text-decoration: none; }
	
	.box1 {float:left;width:200px;}
	.box2 {float:left;width:500px;} 
	.box3 {display:inline-block;width:192px;border-left:2px groove #0615C0;border-radius: 10px 10px 10px 10px / 10px 10px 10px 10px;}
	  
</style>
<meta charset="EUC-KR">
<title>등록된 공간 게시판</title>
</head>

<body>
<center><h2>등록된 공간 관리게시판</h2></center>
<center>
<div style="width:900px;" >
<div class="space-list"style="width:900px;">
	
		<div class="tbody">
			
			
		</div>
	</div>
   <br/>
   </div>
   </center>
   <div>
		<center>
			<div id="PAGE_NAVI"></div>
			<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
		</center>
  <div>
   		


	<%@ include file="/WEB-INF/common/include-adminBody.jspf" %>

	<script type="text/javascript">
		
	$(document).ready(function(){
			
  			fn_spaceList(1);
			
		});
	
	function fn_spaceList(pageNo){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/admin/selectspaceList' />");
		comAjax.setCallback("fn_spaceListCallback");
		comAjax.addParam("PAGE_INDEX", pageNo);
		comAjax.addParam("PAGE_ROW", 10);
		
		comAjax.ajax();
	}
	
	function fn_spaceListCallback(data){
		var total = data.TOTAL; 
		var body = $(".space-list > .tbody");
		body.empty();
		if(total == 0){
			var str = "등록된 공간이 없습니다."; 
			body.append(str);
		}else{
			var params = {
				divId : "PAGE_NAVI",
				pageIndex : "PAGE_INDEX",
				totalCount : total,
				eventName : "fn_spaceList",
				recordCount : 10
			};
			gfn_renderPaging(params);
			var str = "";
			$.each(data.list, function(key, value){
				str += "<div class='spacebox'><div class='box1' style='height:120px;'>"
					+ "<img src=" + value.SPACE_IMG + "style = 'height:120px;'>" 
					+ "</div>" 
					+ "<div class='box2' align='left' style='height:120px;' >" 
					+ "<a href = 'pensionDetail.do?idx=" + value.SPACE_TITLE + "><b style = 'font-size:16px; color:black;'>"  
					+ value.SPACE_TITLE + "/"  
					+ "</b></a>"  
					+ "<sapn class ='user' >"  
					+ value.SPACE_HOST + "/" + value.USER_NAME + "/" + value.USER_PHONE + "/" + value.USER_EMAIL 
					+ "<br/><br/>"  
					+	"공간특징 : " + value.SPACE_USE +"<br>" 
					+	"주소 : " + value.SPACE_POS + "<br>"  
					+	"가격 : " + value.SPACE_PRI 
					+ "</span>"   
					+ "<br/><br/>"  
					+ "</div>"  
					+ "<div class='box3' style='height:120px;'>" + "<br/>"  
					+ "<input type='button' name='delete' value='삭제' style='width:70px;height25px'>" 
					+ "<br><br>" 
					+ "<input type='button' name='wait' value='보류' style='width:70px;height:25px'>" 
					+ "</div>" 
					+ "</div><span style='line-height:20%;'><br/></span>"
					
			});
			body.append(str);
			
		}
		
	}

</script>

</body>
</html>