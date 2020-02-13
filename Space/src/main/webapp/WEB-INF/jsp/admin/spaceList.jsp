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
</style>
<title>등록된 공간 게시판</title>
</head>

<body>
<center><h2>등록된 공간 관리게시판</h2></center>
	<div style="padding-left:20%; width: 700px;text-align: left; font-size: 11px;display: inline-block;">
		<form>
			<input id="SPACE" type="radio" name="TYPE" value="SPACE" checked><label for="SPACE">등록 완료 공간 보기</label>
			<input id="WAIT" type="radio" name="TYPE" value="WAIT" ><label for="WAIT">보류 상태 공간 보기</label>
		</form>
	</div>
	
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
			
  		$("#SPACE").click(function(){
  			$("#PAGE_INDEX").val(1);
  			fn_spaceList(1);
  		});
  		$("#WAIT").click(function(){
  			$("#PAGE_INDEX").val(1);
  			fn_waitspaceList(1);
  		});
  		
	});
	
	function fn_deleteSpace(count){
		if(confirm("등록된 공간을 정말 삭제하시겠습니까?") == true){
			alert("등록된 공간이 삭제되었습니다.");
		var comSubmit = new ComSubmit();
		var count = count;
		comSubmit.setUrl("<c:url value='/admin/deleteSpace' />");
		comSubmit.addParam("SPACE_ID", count);
		comSubmit.submit();
		}else{
			return;
		}
	}
	
	function enterkey() {
        if (window.event.keyCode == 13) {
        	fn_spaceList(1);
        }
	}
	function waitenterkey() {
        if (window.event.keyCode == 13) {
        	fn_waitspaceList(1);
        }
	}
	function fn_returnSpace(count){
		var comSubmit = new ComSubmit();
		var count = count;
		if(confirm("해당 글을 등록된 공간 페이지로 이동 시키겠습니까?") == true){
			alert("등록된 공간 페이지로 이동 되었습니다.");
			comSubmit.setUrl("<c:url value='/admin/returnSpace' />");
			comSubmit.addParam("SPACE_ID", count);
			comSubmit.submit();
		}else{
			return;
		}
	}
	function fn_waitSpace(count){
		var comSubmit = new ComSubmit();
		var count = count;
		if(confirm("해당글을 보류 페이지로 이동 시키겠습니까?") == true){
			alert("보류 페이지로 이동 되었습니다.");
			comSubmit.setUrl("<c:url value='/admin/waitSpace' />");
			comSubmit.addParam("SPACE_ID", count);
			comSubmit.submit();
		}else{
			return;
		}
	}
	
	function fn_spaceList(pageNo){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/admin/selectspaceList' />");
		comAjax.setCallback("fn_spaceListCallback");
		comAjax.addParam("PAGE_INDEX", pageNo);
		comAjax.addParam("PAGE_ROW", 10);
		comAjax.addParam("searchOption", $("#searchOption > option:selected").val());
		comAjax.addParam("keyword", $("input[name='keyword']").val());
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
			var str = "<div style=' text-align:right;'>"
					+ "<form  id='search'  method='post' >" 
           			+ "<select id='searchOption' size='1'>"
                	+ "<option id='SPACE_TITLE' value='SPACE_TITLE' selected='selected'>타이틀</option>"
                	+ "<option id='SPACE_HOST' value='SPACE_HOST' >아이디</option>"
                	+ "<option id='USER_NAME' value='USER_NAME' >이  름</option>"
                	+ "<option id='ALL' value='ALL' >타이틀+아이디+이름</option>"
            		+ "</select> "
                 	+ "<input type='text' size='16' name='keyword' value='${keyword}' placeholder='검색어 입력' onkeyup='enterkey();'>"
                 	+ "<input type='text' style='display: none;' />"
                 	+ "<input type='button' value='검 색' onClick='fn_spaceList(1)'>"
			   		+ "</form></div><p>";
			$.each(data.list, function(key, value){
				str += "<div class='spacebox'><div class='box1' style='height:120px;'>"
					+ "<img src=" + value.SPACE_IMG + "style = 'height:120px;'>" 
					+ "</div>" 
					+ "<div class='box2' align='left' style='height:120px;' >" 
					+ "<a href = 'pensionDetail.do?idx=" + value.SPACE_TITLE + "><b style = 'font-size:16px; color:black;'>"  
					+ "&nbsp;&nbsp;&nbsp;&nbsp;" + value.SPACE_TITLE + "/"  
					+ "</b></a>"  
					+ "<sapn class ='user' ><input type='hidden' id='SPACE_ID' value='value.SPACE_ID'>"  
					+ value.SPACE_HOST + "/" + value.USER_NAME + "/" + value.USER_PHONE + "/" + value.USER_EMAIL 
					+ "<br/><br/>"  
					+	"&nbsp;&nbsp;&nbsp;&nbsp;공간특징 : " + value.SPACE_USE +"<br>" 
					+	"&nbsp;&nbsp;&nbsp;&nbsp;주소 : " + value.SPACE_POS + "<br>"  
					+	"&nbsp;&nbsp;&nbsp;&nbsp;가격 : " + value.SPACE_PRI 
					+ "</span>"   
					+ "<br/><br/>"  
					+ "</div>"  
					+ "<div class='box3' style='height:120px;'>" + "<br/>"  
					+ "<input type='button' name='delete' onClick='fn_deleteSpace(" + value.SPACE_ID + ")' value='삭제' style='width:70px;height25px'>" 
					+ "<br><br>" 
					+ "<input type='button' name='wait' onClick='fn_waitSpace(" + value.SPACE_ID + ")' value='보류' style='width:70px;height:25px'>" 
					+ "</div>" 
					+ "</div><span style='line-height:20%;'><br/></span>"
					
			});
			body.append(str);
			
		}
	};
	
	/* ==================================보류공간 function================================	 */
	
	
	function fn_waitspaceList(pageNo){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/admin/selectwaitspaceList' />");
		comAjax.setCallback("fn_waitspaceListCallback");
		comAjax.addParam("PAGE_INDEX", pageNo);
		comAjax.addParam("PAGE_ROW", 10);
		comAjax.addParam("searchOption", $("#searchOption > option:selected").val());
		comAjax.addParam("keyword", $("input[name='keyword']").val());
		comAjax.ajax();
	}
	
	function fn_waitspaceListCallback(data){
		var total = data.TOTAL; 
		var body = $(".space-list > .tbody");
		body.empty();
		if(total == 0){
			var str = "등록된 보류공간이 없습니다."; 
			body.append(str);
		}else{
			var params = {
				divId : "PAGE_NAVI",
				pageIndex : "PAGE_INDEX",
				totalCount : total,
				eventName : "fn_waitspaceList",
				recordCount : 10
				
		};
			gfn_renderPaging(params);
			var str = "<div style='text-align:right;'>"
				+ "<form  id='search'  method='post' >" 
       			+ "<select id='searchOption' size='1'>"
            	+ "<option id='SPACE_TITLE' value='SPACE_TITLE' selected='selected'>타이틀</option>"
            	+ "<option id='SPACE_HOST' value='SPACE_HOST' >아이디</option>"
            	+ "<option id='USER_NAME' value='USER_NAME' >이  름</option>"
            	+ "<option id='ALL' value='ALL' >타이틀+아이디+이름</option>"
        		+ "</select> "
             	+ "<input type='text' size='16' name='keyword' value='${keyword}' placeholder='검색어 입력' onkeyup='waitenterkey();'>"
             	+ "<input type='text' style='display: none;' />"
             	+ "<input type='button' value='검 색' onClick='fn_waitspaceList(1)'>"
		   		+ "</form></div><p>";
			$.each(data.list, function(key, value){
				str += "<div class='spacebox'><div class='box1' style='height:120px;'>"
					+ "<img src=" + value.SPACE_IMG + "style = 'height:120px;'>" 
					+ "</div>" 
					+ "<div class='box2' align='left' style='height:120px;' >" 
					+ "<a href = 'pensionDetail.do?idx=" + value.SPACE_TITLE + "><b style = 'font-size:16px; color:black;'>"  
					+ "&nbsp;&nbsp;&nbsp;&nbsp;" + value.SPACE_TITLE + "/"  
					+ "</b></a>"  
					+ "<sapn class ='user' >"  
					+ value.SPACE_HOST + "/" + value.USER_NAME + "/" + value.USER_PHONE + "/" + value.USER_EMAIL 
					+ "<br/><br/>"  
					+	"&nbsp;&nbsp;&nbsp;&nbsp;공간특징 : " + value.SPACE_USE +"<br>" 
					+	"&nbsp;&nbsp;&nbsp;&nbsp;주소 : " + value.SPACE_POS + "<br>"  
					+	"&nbsp;&nbsp;&nbsp;&nbsp;가격 : " + value.SPACE_PRI 
					+ "</span>"   
					+ "<br/><br/>"  
					+ "</div>"  
					+ "<div class='box3' style='height:120px;'>" + "<br/>"  
					+ "<input type='button' name='delete' onClick='fn_deleteSpace(" + value.SPACE_ID + ")' value='삭제' style='width:70px;height25px'>" 
					+ "<br><br>" 
					+ "<input type='button' name='return' onClick='fn_returnSpace(" + value.SPACE_ID + ")' value='등록공간 이동' style='height:25px'>" 
					+ "</div>" 
					+ "</div><span style='line-height:20%;'><br/></span>"
					
			});
			body.append(str);
		}
		
	};

</script>

</body>
</html>