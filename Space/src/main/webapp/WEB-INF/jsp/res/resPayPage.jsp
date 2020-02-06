<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/common/defualt-header.jspf" %>

<style>
<%@ include file="/css/cardPopUpStyle.css"%>
</style>

<style>
	.line{margin-bottom: 40px}
	.subline{margin-bottom: 20px}
	.view{display: inline-block; border: 2px solid #000000 ;padding: 5px }
	.subView{height: inherit;float: left;}
	.textView.active{display: inherit;}
	.textView{display:none;}
	.price:after{content: " 원"}
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
		<label >예약 정보</label>
	</div>
	
	<p class="line"></p>
	
	<div id="resInfoView" class="view" style="width: 700px">
		<div id="resNumber" style="font-size: 8px;text-align: left; margin-bottom: 5px;">예약번호 : <label id="resNum">${RES_NUM}</label></div>
		<div id="resInfo" style="height: 150px">
			<c:set var="image" value="${fn:split(SPACE_INFO.SPACE_IMG,',')[0]}"/>
			<div id="infoImage" class="subView">
				<img src="<c:url value='/image/${image}'/>" style="height: inherit;"/>
			</div>
			<div id="infoText" class="subView" style="margin-left:20px; display: table;  vertical-align: middle;">
				<div style="text-align: left; vertical-align: middle; display: table-cell;">
				<c:set var="time" value="${fn:split(RES_TIME,'-')}"/>
				<label>${SPACE_INFO.SPACE_TITLE}(${SPACE_INFO.SPACE_POS})</label>
				<p></p>
				<label id="resDate">${time[0]}년 ${time[1]}월 ${time[2]}일</label>
				<p></p>
				<label>${SPACE_INFO.SPACE_SIZE }㎡ / ${SPACE_INFO.SPACE_PERSON }명</label>
				</div>
			</div>
			<div id="userText" class="subView" style="padding-left:20px; width : 25%; float: right; 
			border-left: 1px solid #999999; height: 150px">
				<div class="subView" style="width:100%; display: table;  vertical-align: middle;">
					<div style="text-align: left; vertical-align: middle; display: table-cell; font-size: 11px; height: inherit;">
						<label>예약자 정보</label>
						<p></p>
						<label style="margin-bottom: 2px">이름 :</label><label class="inText" for="inputName">${USER_INFO.USER_NAME}</label><input id="inputName" class="textView" type="text" size="8"/><br>
						<label style="margin-bottom: 2px">연락처 :</label><label class="inText" for="inputTel">${USER_INFO.USER_PHONE}</label><input id="inputTel" class="textView" type="text" size="12"/><br>
						<label style="margin-bottom: 2px">이메일 :</label><label class="inText" for="inputEmail">${USER_INFO.USER_EMAIL}</label><input id="inputEmail" class="textView" type="text" size="12"/><br>
						<p></p>
						<button id="modify_Btn" name="modify" style="bottom: 2em; right: 2em;float: right;">예약자 정보 수정</button>
					</div>
				</div>
				<div>
				</div>
			</div>
		</div>
	</div>
	<p class="subline"></p>
	<div id="priView" class="view" style="width: 700px;">
		<div style="width: 10%;text-align: center; border-right: 1px solid #999999;float: left;">
			<label>가격</label>
		</div>
		<div style="width: 70%; text-align: right; float: right; padding-right: 20px">
			<label class="price"><fmt:formatNumber value="${RES_PRI}" pattern="#,###"/></label>
		</div>
		<div></div>
	</div>
	<p></p>
	<div id="otherView" style="width: 700px; display: inline-block; font-size: 12px">
		<div><input id="confirm" type="checkbox"><label for="confirm">위 공간의 예약정보 확인 및 결제진행 동의</label></div>
		
		<p class="line"></p>
		
		<div style="text-align: left">
			<label>결제 정보</label><br>
			<p></p>
			<form>
				<input id="0001"type="radio" name="PAY_TYPE" value="card" checked="checked"><label for="0001" style="margin-right: 10px">신용카드</label>
				<input id="0002"type="radio" name="PAY_TYPE" value="none"><label for="0002">무통장입금</label><br>
			</form>
			<p></p>
			<div id="cardView" style="display: inline-block;">
				<label class="writeBtn" for="open-pop">카드 정보 입력</label>
			</div>
			<div id="cashView" style="display: none; ">
				<label>무통장 입금은 기한내에 이뤄지지 않으면 취소됩니다</label>
			</div>
		</div>
		<p class="line"></p>
		<div><button id="result" style="width: 200px; bottom: 0em">결제하기</button></div>
	</div>
	
	
	<input class="modal-state" id="open-pop" type="checkbox" />
	<div class="modal">
		<label class="modal_bg" for="open-pop"></label>
		<div class="modal_inner">
			<label class="modal_close" for="open-pop"></label>
			<div id="payTitle" style="text-align: center;">
				<label style="font-size: 30px; font-weight: bold;">카드 정보</label>
			</div>
			<div class="cardView" style="text-align: left;">
				<div style="background: #aaa; padding-bottom: 1em">
					<label class="price" style="font-weight: bold; font-size: 20px">
						<fmt:formatNumber value="${RES_PRI}" pattern="#,###"/>
					</label>
				</div>
				
				<div>
				<select id="selCard" style="width: 160px;">
						<option value="1">현대카드</option>
						<option value="2">삼성카드</option>
						<option value="3">롯데카드</option>
						<option value="4">신한카드</option>
						<option value="5">국민카드</option>
						<option value="6">하나카드</option>
						<option value="7">우리카드</option>
						<option value="8">농협카드</option>
				</select>
				</div>
				
				<div style="text-align: left; max-width: initial;">
					<label style="font-size: 12px; font-weight: bold;">카드 번호</label><br>
					<input type="text" class="cardNumber" onkeyup="inputNum(this);"maxlength="4"> 
					<input type="password" class="cardNumber" onkeyup="inputNum(this);" maxlength="4"> 
					<input type="password" class="cardNumber" onkeyup="inputNum(this);" maxlength="4"> 
					<input type="text" class="cardNumber" maxlength="4">
				</div>

				
			</div>
			<div class="btnView">
				<label class="ok" style="margin-right: 2em">확인</label>
				<label class="cancel" for="open-pop">취소</label>
			</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/common/include-body.jspf" %>
</div>

<script>
$(document).ready(function(){
	$("#modify_Btn").click(function(){
		buttonName = $(this).attr("name");
		$("input.textView").each(function(){
			if(buttonName == "modify"){
				$(this).addClass("active");
				id=$(this).attr("id");
				text = $("label[for='"+id+"']").text();
				$("label[for='"+id+"']").css("display","none");
				$(this).attr("value",text);
			}
			else if(buttonName == "submit"){
				$(this).removeClass("active");
				id=$(this).attr("id");
				text = $(this).attr("value");
				$("label[for='"+id+"']").css("display","");
				$("label[for='"+id+"']").text(text);
			}
		});
		if(buttonName == "modify"){
			$(this).attr("name","submit");
			$(this).text("확인");
		}
		else if(buttonName == "submit"){
			$(this).attr("name","modify");
			$(this).text("예약자 정보 수정");
		}
	});
	$("#result").click(function(){
		if($("#confirm:checked").length==0){
			alert("동의 체크 후 다시 시도 하세요");
			return;
		}
		if(!isTextCheck($(".inText"))){
			return;
		}
		else if(!sendCheckNumber() && $("#0001").is(":checked")){ 
			alert("카드정보가 올바르지 않습니다");
			return;
		}
		var payType;
		if($("#0001").is(":checked")){
			payType = $("#selCard option:selected").text()+"/"+createCardNumber();
		}else{
			payType = "none";
		}
		
	 	var com = new ComSubmit();
		com.setUrl("<c:url value='/res/insertresInfo'/>");
		com.addParam("PHONE",$("label[for='inputTel']").text());
		com.addParam("EMAIL",$("label[for='inputEmail']").text());
		com.addParam("NAME",$("label[for='inputName']").text());
		com.addParam("SPACE_ID",$("#spaceId").val());
		com.addParam("RES_NUM",$("#resNum").text());
		com.addParam("RES_APPLY_DATE",$("#resDate").text());
		com.addParam("RES_REQ",payType);
		com.addParam("RES_PRI",'${RES_PRI}');
		
		com.submit();
	});
	$("#0001").click(function(){
		$("#cardView").css("display","");
		$("#cashView").css("display","none");
	});
	$("#0002").click(function(){
		$("#cashView").css("display","");
		$("#cardView").css("display","none");
	});
	$(".ok").click(function(){
		if(sendCheckNumber()){
			$("#open-pop").attr("checked",false);
		}else{
			alert("카드정보가 올바르지 않습니다");
		}
	});
});
function isTextCheck(obj){
	var is = true;
	obj.each(function(){
		if($.trim($(this).text())==""){
			alert("입력되지 않은 정보가 있습니다");
			is= false;
			return;
		}
	});
	return is;
}
function inputNum(obj){
	if(isFinite(obj.value)==false){
		alert("숫자만 입력하세요");
		obj.value="";
		return false;
	}
	var max = $(obj).attr("maxlength");
	if(obj.value.length >= max){
		obj.nextElementSibling.focus();
	}
}
function sendCheckNumber(){
	var is = true;
	$(".cardNumber").each(function(){
		if($(this).val().length!=4){
			is = false;
		}
	});
	return is;
}
function createCardNumber(){
	var number="";
	$(".cardNumber").each(function(){
		console.log($(this).val());
		number+=$(this).val();
	});
	return number;
}
</script>
</body>
</html>