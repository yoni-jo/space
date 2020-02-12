<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/common/defualt-header.jspf" %>

<style>
<%@ include file="/css/replyPopUpStyle.css"%>
</style>

<style>
	.line{margin-bottom: 40px}
	.subline{margin-bottom: 20px}
	.view{display: inline-block; border: 2px solid #000000 ;padding: 5px }
	.subView{height: inherit;float: left;}
	.textView.active{display: inherit;}
	.textView{display:none;}
	.price:after{content: " 원"}
	.cellView{text-align: left; vertical-align: middle; display: table-cell;}
	.btn{
		cursor: pointer;
 		background: #ED891D;
  		display: inline-block;
  		padding: .3em 0.5em;
  		color: #fff;
  		border-radius: 3px;
	}
	.btn:hover,
	.btn:focus {
 	 	background: #FE9A2E;
	}
	input{font-size: 11px; height: 1em}
	
</style>

<meta charset="EUC-KR">
<title>결제 하기</title>
</head>
<body>
<input type="hidden" id="spaceId" value="${SPACE_INFO.SPACE_ID}">
<div style="width: 100%; text-align: center;">
	<p class="line"></p>

	<div id="resTitle" class="view" style="width: 700px; background: #FE9A2E; font-weight: bold;">
		<label id="resTitle">예약 정보</label>
	</div>
	
	<p></p>
	<div style="width: 700px;text-align: right; font-size: 11px;display: inline-block;">
		<form>
			<input id="1" type="radio" name="TYPE" value="NOW"><label for="1">현재 예약</label>
			<input id="2" type="radio" name="TYPE" value="OLD"><label for="2">지난 예약</label>
		</form>
	</div>
	<p></p>
	
	
	<c:if test="${TOTAL != 0 }">
	<c:forEach var="map" items="${RES_LIST}" varStatus="s">
	
	<div id="resInfoView" class="view" style="width: 700px">
	
		<div id="resNumber" style="font-size: 8px;text-align: left; margin-bottom: 5px;">
		예약번호 : <label class="resNum">${map.RES_NUM}</label><label class="resType" style="float: right;">예약 완료</label>
		</div>
		<input type="hidden" name="SPACE_ID" value="${map.SPACE_ID}">
		<div name="resInfo" style="height: 150px">
			<fmt:formatDate var="date" value="${map.RES_APPLY_DATE}" pattern="yyyy-MM-dd"/>
			<c:set var="image" value="${fn:split(map.SPACE_IMG,',')[0]}"/>
			<div name="infoImage" class="subView">
				<img src="<c:url value='/image/${image}'/>" style="height: inherit;"/>
			</div>
			<div name="infoText" class="subView" style="margin-left:20px; display: table;  vertical-align: middle;">
				<div class="cellView">
				<c:set var="time" value="${fn:split(date,'-')}"/>
				<label class="tag">${map.SPACE_TITLE}</label><label>(${map.SPACE_POS})</label>
				<p></p>
				<label id="resDate">${time[0]}년 ${time[1]}월 ${time[2]}일</label>
				<p></p>
				<label>${map.SPACE_SIZE }㎡ / ${map.SPACE_PERSON }명</label>
				<p></p>
				<div style="text-align: right;">
				<label class="price"><fmt:formatNumber value="${map.RES_PRI}" pattern="#,###"/></label>
				</div>
				
				</div>
			</div>
			<div name="userText" class="subView" style="padding-left:20px; width : 25%; float: right; 
			border-left: 1px solid #999999; height: 150px">
				
				<div class="subView" style="width:100%; display: table;  vertical-align: middle;">
					<div class="cellView" style="font-size: 11px; height: inherit;">
						<input type="hidden" name="count" value="${s.count}">
						<c:if test="${TYPE ne 'OLD' }">
						<label>예약자 정보</label>
						<p></p>
						<label for="inputName${s.count}" style="margin-bottom: 2px">이름 :</label><label class="inText">${map.RES_NAME}</label>
							<input id="inputName${s.count}" class="textView" type="text" size="8"/><br>
						<label for="inputTel${s.count}" style="margin-bottom: 2px">연락처 :</label><label class="inText">${map.USER_PHONE}</label>
							<input id="inputTel${s.count}" class="textView" type="text" size="12"/><br>
						<label for="inputEmail${s.count}" style="margin-bottom: 2px">이메일 :</label><label class="inText">${map.RES_EMAIL}</label>
							<input id="inputEmail${s.count}" class="textView" type="text" size="12"/><br>
						<p></p>
						<label class="btn cancel" style="display: none;">취소</label>
						<label class="btn modify_Btn" name="modify" style="bottom: 2em; right: 2em;float: right;">예약자 정보 수정</label>
						</c:if>
						<c:if test="${TYPE eq 'OLD' }">
							<div style="text-align: right;">
							<label class="btn addReply" for="open-pop">후기 남기기</label>
							</div>
						</c:if>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<p class="subline"></p>
	
	</c:forEach>
	</c:if>
	<c:if test="${TOTAL == 0}">
		확인되는 내역이 없습니다
	</c:if>
	<div id="PAGING">test</div>
	<input type="hidden" id="INDEX" value="${PAGE_INDEX}">
	
	
	<%@ include file="/WEB-INF/common/include-body.jspf" %>
</div>

<input class="modal-state" id="open-pop" type="checkbox" />

<div class="modal">
	<label class="modal_bg" for="open-pop"></label>
	<div class="modal_inner">
		<label class="modal_close" for="open-pop"></label>
		<h2 id="write" class="popup_title">후기</h2>
		<p class="popup_content" style="text-align: left;"></p>
		<form id="replyForm" action="<c:url value="/res/addReply"/>" method="post" enctype="multipart/form-data">
		<div id="divPopTitle"><label>제목 </label><br>
		<input type="text" id="popTitle" name="TITLE" class="title txt"></div>
		<input type="hidden" id="targetId" name="SPACE_ID">				
		<p class="subline"></p>
							
		<div id="divPopCnt">
			<label>내용 </label><br>
			<textarea id="popCnt" name="CONTENT" rows="2" cols="10" class="content txt"></textarea>
		</div>
							
		<p class="subline"></p>
						
		<div id="divFile" >
			
		</div>
		</form>
		<p class="subline"></p>
							
		<div id="divPopBtn">
			<label id="addBtn" class="sendBtn" style="right:8em; bottom: 2em; position: absolute;">추가</label>
			<label id="sendBtn" class="sendBtn" style="right:2em; bottom: 2em; position: absolute;">확인</label>
		</div>
	</div>
</div>



<script>
var fileCount = 1;
$(document).ready(function(){
	setRadioCheck();
	setPaging();
	$("input[name='TYPE']").click(function(){
		com = new ComSubmit();
		com.setUrl("<c:url value='/res/resInfo'/>");
		com.addParam("TYPE",$(this).val());
		com.submit();
	});
	$(".modify_Btn").click(function(){
		if($(this).attr("name") == 'modify'){
			$(this).attr("name","send");
			$(this).text("변경");
			$(this).parent().find(".textView").addClass("active");
			$(this).parent().find(".inText").css("display","none");
			$(this).parent().find(".cancel").css("display","");
		}else if($(this).attr("name") == "send"){
			var com = new ComSubmit();
			var count = $(this).parent().find("input[name='count']").val();
			
			if(!isNullCheck(count)){
				alert("입력되지 않은 정보가 있습니다.");
			}else{
				alert("수정이 완료되었습니다");
				com.setUrl("<c:url value='/res/resModify'/>");
				com.addParam("NAME",$("#inputName"+count).val());
				com.addParam("TEL",$("#inputTel"+count).val());
				com.addParam("EMAIL",$("#inputEmail"+count).val());
				com.addParam("RES_NUM",$(this).parents(".view").find(".resNum").text());
				com.submit(); 
			}
		}	
	});
	$(".cancel").click(function(){
		$(this).css("display","none");
		$(this).parent().find(".textView").removeClass("active");
		$(this).parent().find(".inText").css("display","");
		$(this).parent().find(".modify_Btn").attr("name","modify");
		$(this).parent().find(".modify_Btn").text("예약자 정보 수정");
	});
	$("#popCnt").keyup(function(){
		if($(this).val().length > 1000){
			$(this).val($(this).val().substring(0,1000));
		}
	});
	$("#addBtn").click(function(){
		if($("#divFile").find("input[type='file']").length<3){
			$("#divFile").append("<p><input type='file' name='imageUpload"+(fileCount)+"' accept='image/gif,image/jpeg,image/png'>"+
					"&nbsp;&nbsp;<label onclick='inputDelete(this)'>X</label></p>");
			fileCount++;
		}else{
			alert("더 이상 추가할 수 없습니다");
		}
		
	});
	$(".addReply").click(function(){
		var title = $(this).parents(".view").find(".tag").text();
		$("#write").text(title+"에 후기 달기");
		$("#popTitle").val("");
		$("#popCnt").val("");
		$("#divFile").empty();
		$("#targetId").val($(this).parents(".view").find("input[name='SPACE_ID']").val());
		console.log($(this).parents(".view").find("input[name=SPACE_ID]").val());
	});
	$("#sendBtn").click(function(){
		if(isReplyCheck()){
			$("#replyForm").submit();
		}else{
			alert("입력되지 않은 정보가 있습니다");
		}
	});
});
function setRadioCheck(){
	var type = "${TYPE}";
	if(type == "") type = "NOW";
	
	$("input[value='"+type+"']").attr("checked",true);
	
	if(type == "NOW"){
		$("#resTitle").text("예약 정보");
		$(".resType").text("예약 완료");
	}
	else {
		$("#resTitle").text("지난 예약 정보");
		$(".resType").text("이용 완료");
	}
}
function setPaging(){
	var params = {
			divId : "PAGING",
			pageIndex : "INDEX",
			totalCount : ${TOTAL},
			recordCount : 3,
			eventName : "fn_selectResList"
		};
	gfn_renderPaging(params);
}
function fn_selectResList(pageNo){
	var com = new ComSubmit();
	com.setUrl("<c:url value='/res/resInfo'/>");
	com.addParam("PAGE_INDEX",pageNo);
	com.addParam("TYPE",$("input[type='radio']:checked").val());
	com.submit();
}
function isNullCheck(count){
	name = $.trim($("#inputName"+count).val());
	tel = $.trim($("#inputTel"+count).val());
	email = $.trim($("#inputEmail"+count).val());
	if(name=="") return false;
	if(tel=="") return false;
	if(email=="") return false;
	
	return true;
}
function inputDelete(obj){
	$(obj).parent().remove();
	fileCount--;
}
function isReplyCheck(){
	if($("#popTitle").val()=="") return false;
	if($("#popCnt").val()=="")return false;
	return true;
}
</script>
</body>
</html>