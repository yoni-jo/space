<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/common/defualt-header.jspf" %>
<meta charset="utf-8">
<title>공간 입력 폼</title>
<style>
.filetype {
  position: relative;
  display: inline-block;
  vertical-align: top;
  margin-right: 4px;
}

.filetype * {
  vertical-align: middle;
}

.filetype .file-text {
  position: relative;
  width: 350px;
  text-overflow: ellipsis;
  white-space: nowrap;
  overflow: hidden;
  display: inline-block;
  height: 20px;
  background-color: #ecefef;
  margin: 0;
  border: 1px solid #cdd3d4;
  line-height: 20px;
  z-index: 0;
}

.filetype .file-select {
  position: absolute;
  top: 0;
  right: 54px;
  width: 80px;
  overflow: hidden;
}

.filetype .file-select .input-file {
  width: 60px;
  filter: alpha(opacity=0);
  opacity: 0;
  height: 20px;
}
p .filetype .file-btn{margin-left: 8px}
.filetype .file-btn {
  display: inline-block;
  background-color: #cdd3d4;
  height: 22px;
  line-height: 22px;
  padding: 0 15px;
  color: #fff !important;
  cursor: pointer;
  margin-left: 4px;
}
</style>

<style>
.line{margin-bottom: 30px}
.view {
	display: inline-block;
	border: 2px solid #000000;
	padding: 5px;
	width: 500px;
}
.subView {width: 750px; display: inline-block; font-size: 12px; margin-bottom: 0.5em;}
.inputTitle {width: 20%; float: left;}
.inputContent {width: 80%; float: left; text-align: left;}
input[type=number] {text-align: right;}
.detailPriWindow {display: none;}
.detailPriBtn:checked ~ .detailPriWindow {display: inline-block;}
.priTypeBtn {
	cursor: pointer;
	background: #ffbf00;
	display: inline-block;
	padding: 0.5em 3em;
}
.dateList > input{width: 7em}
.deleteBtn{margin-left: 1em}

.priTypeBtn.select {background: #ffda4c;}
.priTypeBtn:hover, .priTypeBtn:focus {background: #ffda4c;}

.tagTextView > label + label:before{content: ','}
.tagTextView{font-size: 13px; font-weight: bold;}
.btn {
	cursor: pointer;
	padding: 0.3em 0.9em;
	border-radius: 3px;
	background: #FE9A2E;
}
.btn:hover {background: #ffbf00;}
</style>
</head>
<body>
	<input type="hidden" id="SPACE_ID" value="${list.SPACE_ID}">
	<input type="hidden" id="RES_TYPE" value="${list.SPACE_RES_TYPE}">
	<div style="width: 100%; text-align: center;">
		<form action="<c:url value='/mySpace/modifySpaceForm'/>">
		<div id="formTitle" class="view"
			style="width: 700px; background: #FE9A2E; font-weight: bold;">
			<label>내 공간 등록</label>
		</div>
		<p></p>
		<div class="subView" style="text-align: right">
			<font color=red>*</font>는 필수 입력사항입니다
		</div>
		<p></p>
		<div class="subView">
			<div class="inputTitle">
				<b>공간의 용도·목적<font color=red>*</font></b>
			</div>
			<div class="inputContent">
				<input type="hidden" id="import_use" value="${list.SPACE_USE}">
				<label><input type="checkbox" name="USE"/>스튜디오</label>
				<label><input type="checkbox" name="USE"/>세미나실</label>
				<label><input type="checkbox" name="USE"/>스터디룸</label>
				<label><input type="checkbox" name="USE"/>전시회</label>
				<label><input type="checkbox" name="USE"/>파티홀</label>
				<label for="otherInput"><input type="checkbox" name="OTHER_USE"/>기타</label>
				<input id="otherInput" type="text" placeholder="직접 입력해주세요.">
			</div>
		</div>
		<br>
		<div class="subView">
			<div class="inputTitle">
				<b>보유 시설·설비<font color=red>*</font></b>
			</div>
			<div class="inputContent">
				<input type="hidden" id="import_opt" value="${list.SPACE_OPT}">
				<label><input type="checkbox" name="OPT"/>빔프로젝터</label>
				<label><input type="checkbox" name="OPT"/>TV</label>
				<label><input type="checkbox" name="OPT"/>PC</label>
				<label><input type="checkbox" name="OPT"/>Wi-Fi</label>
				<label><input type="checkbox" name="OPT"/>유선마이크</label>
				<label><input type="checkbox" name="OPT"/>무선마이크</label>
				<label><input type="checkbox" name="OPT"/>조명</label>
				<label><input type="checkbox" name="OPT"/>로비</label>
				<label><input type="checkbox" name="OPT"/>무대</label>
				<label><input type="checkbox" name="OPT"/>대기실</label><br>
				<label><input type="checkbox" name="OPT"/>테이블</label>
				<label><input type="checkbox" name="OPT"/>책걸상</label>
				<label><input type="checkbox" name="OPT"/>교탁</label>
				<label><input type="checkbox" name="OPT"/>주차공간</label>
				<label><input type="checkbox" name="OPT"/>승강기</label>
			</div>
		</div>
		<p></p>
		<div class="subView">
			<div class="inputTitle">
				<b>공간 명<font color=red>*</font></b>
			</div>
			<div class="inputContent">
				<input id="TITLE" name="TITLE" type="text" value="${list.SPACE_TITLE}" style="width: 90%;">
			</div>
		</div>
		<br>
		<div class="subView">
			<div class="inputTitle">
				<b>면적<font color=red>*</font></b>
			</div>
			<div class="inputContent">
				<label style="width: 5em"><input type="number" name="SIZE" style="width: 5em" onkeyup="changeAcreage(this)" value="${list.SPACE_SIZE}">㎡&nbsp;&nbsp;</label>
				<label style="width: 5em"><input type="number" id="pyung" style="width: 5em" readonly="readonly" >평</label>
			</div>
		</div>
		<br>
		<div class="subView">
			<div class="inputTitle">
				<b>수용인원<font color=red>*</font></b>
			</div>
			<div class="inputContent">
				<label style="width: 5em"><input type="number" name="PERSON" value="${list.SPACE_PERSON}" style="width: 5em">명</label>
			</div>
		</div>
		<br>
		<div class="subView">
			<div class="inputTitle">
				<b>크기</b>
			</div>
			<div class="inputContent">
				<label style="width: 5em;margin-right: 1em;">가로
					<input type="number" name="HORIZON" value="${list.SPACE_HORIZON}" style="width: 5em">m</label>
				<label style="width: 5em;margin-right: 1em;">세로
					<input type="number" name="VERTICAL" value="${list.SPACE_VERTICAL}" style="width: 5em">m</label>
				<label style="width: 5em;margin-right: 1em;">높이
					<input type="number" name="HEIGHT" value="${list.SPACE_HEIGHT}" style="width: 5em">m</label>
			</div>
		</div>
		<br>
		<div class="subView">
			<div class="inputTitle">
				<b>좌석<font color=red>*</font></b>
			</div>
			<div class="inputContent">
				<label style="width: 4em;margin-right: 4em;"><input type="number" name="SEAT" value="${list.SPACE_SEAT}" style="width: 4em">석</label>
				<label style="width: 4em;margin-right: 3em;"><b>주차<font color=red>*</font></b></label>
				<label style="width: 4em;margin-right: 1em;"><input type="number" name="PARKING" value="${list.SPACE_PARKING}" style="width: 4em">대</label>
			</div>
		</div>
		<br>
		<div class="subView">
			<div class="inputTitle">
				<b>냉난방<font color=red>*</font></b>
			</div>
			<div class="inputContent">
				<label><input type="radio" name="AIRCON" value="possible">가능</label>
				<label><input type="radio" name="AIRCON" value="impossible" checked>불가능</label>
			</div>
		</div>
		<br>
		<div class="subView">
			<div class="inputTitle">
				<b>가격<font color=red>*</font></b>
			</div>
			<div class="inputContent">
				<label style="margin-right: 1em">월~금 1일<input type="number" name="WEEK_PRI" value="0">원</label>
				<label>토~일 1일<input type="number" name="END_PRI" value="0">원</label>
			</div>
		</div>
		<br>
		<div class="subView">
			<div class="inputTitle">&nbsp;</div>
			<div class="inputContent">
				<input type="checkbox" id="priBtn" class="detailPriBtn" name="windowBtn"><label for="priBtn">상세설정시 체크해주세요</label><br>
				<div class="detailPriWindow">
					<fieldset>
						<legend>
							<label class="priTypeBtn select">요일별</label>
							<label class="priTypeBtn">날짜별</label>
						</legend>
						
						<div id="dayListView">
							<p></p>
								<label class="dayValue btn">월<input type="hidden" name="MON" value="0"></label>
								<label class="dayValue btn">화<input type="hidden" name="TUE" value="0"></label>
								<label class="dayValue btn">수<input type="hidden" name="WED" value="0"></label>
								<label class="dayValue btn">목<input type="hidden" name="THU" value="0"></label>
								<label class="dayValue btn">금<input type="hidden" name="FRI" value="0"></label>
								<label class="dayValue btn">토<input type="hidden" name="SAT" value="0"></label>
								<label class="dayValue btn">일<input type="hidden" name="SUN" value="0"></label>
								<font size="1">금액을 입력해주세요</font>
						</div>
						<div id="dateListView" style="display: none;">
							<p></p>
							<div class="dateList">
								<label style="display:inline-block;float: right;" class="addDate btn">날짜 추가</label>
							</div>
							<!-- <input type="text" class="dateValue">
							<input type="number" class="datePri">원
							<label class="addDate btn">날짜 추가</label> -->
						</div>
					</fieldset>
				</div>
			</div>
		</div>
		<p class="line"></p>
		<div class="subView">
			<div class="inputTitle"><b>주소<font color=red>*</font></b></div>
			<div class="inputContent">
				<input type="text" id="sample4_postcode" placeholder="우편번호"> 
				<label class="btn" onclick='sample4_execDaumPostcode()'>우편번호 찾기</label><br>
				<input type="text" id="sample4_roadAddress" name="ROAD_ADDR" placeholder="도로명주소"> 
				<input type="text" id="sample4_jibunAddress" name="JIBUN_ADDR" placeholder="지번주소"> 
				<span id="guide" style="color: #999; display: none"></span> 
				<input type="text" id="sample4_detailAddress" name="DETAIL_ADDR" placeholder="상세주소">
			</div>
		</div>
		<p class="line"></p>
		<div class="subView">
			<div class="inputTitle"><b>이미지 등록<font color=red>*</font></b></div>
			<div class="inputContent">
				<div class="fileUploadView">
  				<span class="filetype">
            		<span class="file-text"></span>
  					<span class="file-btn">찾아보기</span>
  					<span class="file-select"><input type="file" class="input-file" size="3" accept="image/*" onchange="uploadChange(this);"></span>
  					<span class="file-btn" onclick="onAddFile()">추가</span>
  				</span>
  				</div>
			</div>
		</div>
		
		<p class="line"></p>
		<div class="subView">
			<div class="inputTitle"><b>해쉬 태그</b></div>
			<div class="inputContent">
				<div class="tagInputView"><input type="text" id="tagInput" maxlength="8"><label class="btn" onclick="addTag()" style="margin-left: 1em">추가</label></div>
			</div>
		</div>
		<br>
		<div class="subView">
			<div class="inputTitle"><b>등록 태그<br>(클릭시 삭제)</b></div>
			<div class="inputContent">
				<div class="tagTextView"></div>
			</div>
		</div>
		<p class="line"></p>
		
		
		<div class="subView">
			<div class="inputTitle"><b>공간 설명</b></div>
			<div class="inputContent">
				<textarea class="iePFTd hunnDM" name="DETAIL" id="DETAIL" cols="82" rows="10"
					placeholder="별도의 연락 수단 (홈페이지 주소, 블로그, SNS, 메신저ID, 전화번호, 이메일 등)에 관한 언급은 하실 수 없습니다."></textarea>
			</div>
		</div>
		
		<p class="line"></p>
		<div class="subView">
			<div class="inputTitle"><b>이용 약관<font color=red>*</font></b></div>
			<div class="inputContent">
				<div style="height: 170px; padding: 0 20px 20px 20px; overflow-y: auto; box-sizing: border-box; border: 1px solid #ccc; line-height: 20px;"
						tabindex="0">
						<br>제1장 총칙<br> <br>제1조 (목적)<br>
						<br> <br>본 약관은 공간(이하 “회사”라 함)이 운영하는 공간 서비스(이하 “서비스”라 함)의
						이용과 관련하여 회사와 이용자 및 이용자간의 권리, 의무 및 책임사항, 서비스의 이용조건 및 절차, 기타 필요한 사항을
						규정함을 목적으로 합니다. 공간 서비스라 함은 회사가 제공하는 "공간” 브랜드를 사용하는 서비스를 말합니다. 공간
						서비스를 이용하시거나 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영정책을 확인하거나 동의하게 되므로, 조금만
						시간을 내서 주의 깊게 살펴봐 주시기 바랍니다.<br> <br>제2조 (정의)<br>
				</div>
			</div>
		</div>
		<p class="join-agreement">
			<input type="checkbox" name="agree" id="agree1" value="1" title="이용약관동의 체크" />위의 
			<span class="blue-txt">이용약관</span>에 동의합니다.
		</p>
		<p class="line"></p>
		<div class="subView">
			<label class="btn" style="margin-right: 4em; padding: 1em 3em">미리보기</label>
			<label class="btn" style="margin-right: 4em; padding: 1em 3em">임시저장</label>
			<label class="btn" style="padding: 1em 3em">등록하기</label>
		</div>
		<p class="line"></p>
	</form>
</div>
<%@ include file="/WEB-INF/common/include-body.jspf" %>
<script>
	$(document).ready(function(){
		setDatepicker($(".dateValue"));
		setting();
		
		
		$(".priTypeBtn").click(function(){
			$(".priTypeBtn").removeClass("select");
			$(this).addClass("select");
			if($(this).text()=='요일별'){
				$("#dayListView").css("display","");
				$("#dateListView").css("display","none");
			}else if($(this).text()=='날짜별'){
				$("#dayListView").css("display","none");
				$("#dateListView").css("display","");
			}
			
		});
		$(".dayValue").click(function(){
			var val = $(this).find("input[type]").val();
			var pri = prompt($(this).text()+"요일에 금액을 정해주세요",val+"");
			if(isNaN(pri)==false){
				$(this).find("input[type]").val(Number(pri));
			}else{
				alert("숫자만 입력 가능합니다");
			}
		});
		$(".addDate").click(function(){
			var str="<div class='dateList'><p></p>"+
			"<input type='text' class='dateValue'>"+
			"<input type='number' class='datePri'>원"+
			"<label class='deleteBtn btn'>X</label></div>";
			
			$("#dateListView").append(str);
			
			$(".deleteBtn").click(function(){
				$(this).parent().remove();
			});
			setDatepicker($(".dateValue"));
		});
		
	});
	function setDatepicker(view){
		$(view).datepicker({
			showOn:"both",
			buttonImage:"<c:url value='/image/calBtn.png'/>",
			buttonImageOnly:true,
	         changeMonth: true,
	         dateFormat:"yy-mm-dd",
	         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	         minDate:"1D"
	  });
	}
	function onAddFile(){
		var str="<p><span class='filetype'>"+
		"<span class='file-text'></span>"+
			"<span class='file-btn'>찾아보기</span>"+
			"<span class='file-select'><input type='file' class='input-file' name='IMAGE_FILE'"+
			"accept='image/*' size='3' onchange='uploadChange(this);''></span>"+
			"<span class='file-btn' onclick='deleteFile(this)'>삭제</span>"+
		"</span></p>";
		
		$(".fileUploadView").append(str);
	}
	function addTag(){
		var tagVal=$.trim($("#tagInput").val());
		
		if($(".tagTextView").find("label").length<5){
			if(tagVal!=""){
				$(".tagTextView").append("<label onclick='delTag(this)'>"+tagVal+"</label>");
			}
			
			$(".tagTextView").find("label").each(function(index,item){
				console.log("label"+index+" : "+$(item).text());
			});
			$("#tagInput").focus();
			$("#tagInput").val("");
		}else{
			alert("태그는 최대 5개입니다");
		}
	}
	function delTag(view){
		$(view).remove();
	}
	function deleteFile(view){
		var parent = $(view).parents("p");
		$(parent).remove();
	}
	function changeAcreage(obj){
		var num = $(obj).val();
		num=num*0.3025;
		num=Math.round(num*100)/100;
		$("#pyung").val(num);
	}
	function setting(){
		setUse();
		setOpt();
		setResPri();
		changeAcreage($("input[name=SIZE]"));
	}
	function setUse(){
		var useStr = $("#import_use").val();
		var str = useStr.split('/');
		str.forEach(function(item,index,arr){
			$("label:contains("+item+") > input[type=checkbox]").attr("checked",true);
		});
	}
	function setResPri(){
		var com = new ComAjax();
		com.setUrl("<c:url value='/mySpace/getResData'/>");
		com.addParam("TYPE",$("#RES_TYPE").val());
		com.addParam("SPACE_ID",$("#SPACE_ID").val());
		com.setCallback("ResDataCallback");
		com.ajax();
	}
	function setOpt(){
		var optStr = $("#import_opt").val();
		var str = optStr.split('/');
		var temp;
		str.forEach(function(item,index,arr){
			if(item.indexOf("기타")==0){
				temp = item.substr(2);
				$("#otherInput").val(temp);
				$("input[name=OTHER_USE]").attr("checked",true);
			}
			if(item.indexOf("냉난방기")==0){
				$("input[name=AIRCON][value=possible]").attr("checked",true);
			}
			$("label:contains("+item+") > input[type=checkbox]").attr("checked",true);
		});
	}
	
	
	function ResDataCallback(data){
		var type=$("#RES_TYPE").val();
		
		if(type == "DAY"){
			if(isResDayCheck(data.resData)){
				$("input[name=WEEK_PRI]").val(data.resData.MON);
				$("input[name=END_PRI]").val(data.resData.SAT);
			}else{
				$.each(data.resData,function(index,item){
					$("input[name="+index+"]").val(item);
				});
				$("#priBtn").attr("checked",true);
			}
		}else if(type == "DATE"){
			
		}else{
			console.log("ResDataCallback ERROR");
		}
	}
	function isResDayCheck(data){
		var temp;
		var isResult=true;
		if(data.SAT != data.SUN){
			console.log("토 일 다름");
			return false;
		}
		temp = data.MON;
		$.each(data,function(index,item){
			if(index != "SAT" && index != "SUN"){
				if(item != temp){
					console.log("temp : "+temp+" vs "+index+" : "+item);
					isResult= false;
				}
			}
		});
		
		return isResult;
		
	}
	function uploadChange(file) {
		  var el = file.parentNode.parentNode.getElementsByTagName("*");
		  for (var i = 0; i < el.length; i++) {
		    var node = el[i];
		    if (node.className == "file-text") {
		      node.innerHTML = file.value;
		      break;
		    }
		  }
		}
</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    
</script>


</body>
</html>