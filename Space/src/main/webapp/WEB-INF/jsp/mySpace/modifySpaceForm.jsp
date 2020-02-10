<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/common/defualt-header.jspf" %>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
.view {
	display: inline-block;
	border: 2px solid #000000;
	padding: 5px;
	width: 500px;
}
.subView{
	width: 750px;
	display:inline-block;
	font-size: 12px;
}
.inputTitle{
	width: 20%;
	float: left;
}
.inputContent{
	width: 80%;
	float: left;
	text-align: left;
}
input[type=number]{
	text-align: right;
}
.detailPriWindow{
	visibility: hidden;
}
.detailPriBtn:checked + .detailPriWindow{
  	visibility: visible;
}
</style>
</head>
<body>
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
				<label><input type="checkbox" name="USE" value="1" />스튜디오</label>
				<label><input type="checkbox" name="USE" value="2" />세미나실</label>
				<label><input type="checkbox" name="USE" value="3" />스터디룸</label>
				<label><input type="checkbox" name="USE" value="4" />전시장</label>
				<label><input type="checkbox" name="USE" value="5" />파티홀</label>
				<label for="otherInput"><input type="checkbox" name="SPACE_USE" value="6" />기타</label>
				<input id="otherInput" type="text" placeholder="직접 입력해주세요.">
			</div>
		</div>
		<br>
		<div class="subView">
			<div class="inputTitle">
				<b>보유 시설·설비<font color=red>*</font></b>
			</div>
			<div class="inputContent">
				<label><input type="checkbox" name="OPT" value="1" />빔프로젝터</label>
				<label><input type="checkbox" name="OPT" value="2" />TV</label>
				<label><input type="checkbox" name="OPT" value="3" />PC</label>
				<label><input type="checkbox" name="OPT" value="4" />Wi-Fi</label>
				<label><input type="checkbox" name="OPT" value="5" />유선마이크</label>
				<label><input type="checkbox" name="OPT" value="6" />무선마이크</label>
				<label><input type="checkbox" name="OPT" value="7" />조명</label>
				<label><input type="checkbox" name="OPT" value="8" />로비</label>
				<label><input type="checkbox" name="OPT" value="9" />무대</label>
				<label><input type="checkbox" name="OPT" value="10" />대기실</label><br>
				<label><input type="checkbox" name="OPT" value="11" />테이블</label>
				<label><input type="checkbox" name="OPT" value="12" />책걸상</label>
				<label><input type="checkbox" name="OPT" value="13" />교탁</label>
				<label><input type="checkbox" name="OPT" value="14" />주차공간</label>
				<label><input type="checkbox" name="OPT" value="15" />승강기</label>
			</div>
		</div>
		<p></p>
		<div class="subView">
			<div class="inputTitle">
				<b>공간 명<font color=red>*</font></b>
			</div>
			<div class="inputContent">
				<input id="TITLE" name="TITLE" type="text" style="width: 90%;">
			</div>
		</div>
		<div class="subView">
			<div class="inputTitle">
				<b>면적<font color=red>*</font></b>
			</div>
			<div class="inputContent">
				<label style="width: 5em"><input type="number" name="SIZE" style="width: 5em" onchange="changeAcreage(this)">㎡&nbsp;&nbsp;</label>
				<label style="width: 5em"><input type="number" id="pyung" style="width: 5em" readonly="readonly" >평</label>
			</div>
		</div>
		<div class="subView">
			<div class="inputTitle">
				<b>수용인원<font color=red>*</font></b>
			</div>
			<div class="inputContent">
				<label style="width: 5em"><input type="number" name="PERSON" style="width: 5em">명</label>
			</div>
		</div>
		<div class="subView">
			<div class="inputTitle">
				<b>크기</b>
			</div>
			<div class="inputContent">
				<label style="width: 5em;margin-right: 1em;">가로<input type="number" name="HORIZON" style="width: 5em">m</label>
				<label style="width: 5em;margin-right: 1em;">세로<input type="number" name="VERTICAL" style="width: 5em">m</label>
				<label style="width: 5em;margin-right: 1em;">높이<input type="number" name="HEIGHT" style="width: 5em">m</label>
			</div>
		</div>
		<div class="subView">
			<div class="inputTitle">
				<b>좌석<font color=red>*</font></b>
			</div>
			<div class="inputContent">
				<label style="width: 4em;margin-right: 4em;"><input type="number" name="SEAT" style="width: 4em">석</label>
				<label style="width: 4em;margin-right: 3em;"><b>주차<font color=red>*</font></b></label>
				<label style="width: 4em;margin-right: 1em;"><input type="number" name="PARKING" style="width: 4em">대</label>
			</div>
		</div>
		<div class="subView">
			<div class="inputTitle">
				<b>냉난방<font color=red>*</font></b>
			</div>
			<div class="inputContent">
				<label><input type="radio" name="AIRCON" value="1">가능</label>
				<label><input type="radio" name="AIRCON" value="2" checked>불가능</label>
			</div>
		</div>
		<div class="subView">
			<div class="inputTitle">
				<b>가격<font color=red>*</font></b>
			</div>
			<div class="inputContent">
				<label style="margin-right: 1em">월~금 1일<input type="number" name="PRI" value="0">원</label>
				<label>토~일 1일<input type="number" name="PRI" value="0">원</label>
			</div>
		</div>
		<div class="subView">
			<div class="inputTitle">&nbsp;</div>
			<div class="inputContent">
				<label><input type="checkbox" class="detailPriBtn"></label><br>
				<div class="detailPriWindow">
				</div>
			</div>
		</div>
		<p></p>
		<input type="submit" value="전송">
		</form>
			<tr>
				<th><b>공간명<font color=red>*</font></b></th>
				<td class="title" colspan="5"><input type="text"
					id="APPLY_TITLE" name="APPLY_TITLE"></td>
			</tr>

			<tr>
				<th><b>면적<font color=red>*</font></b></th>
				<td colspan="5"><input type="text" class="area" id="SIZE"
					name="SIZE"> m<sup>2</sup> = <input type="text"
					class="area" name="area" /> 평
					<button class="btn" type="button">변환하기</button></td>
			</tr>

			<tr>
				<th><b>크기</b></th>
				<td class="meter" colspan="5">가로<input type="text" id="HORIZON"
					name="HORIZON">m 세로<input type="text" id="VERTICAL"
					name="VERTICAL">m 높이<input type="text" id="HEIGHT"
					name="HEIGHT">m
				</td>
			</tr>

			<tr>
				<th><b>수용 인원<font color=red>*</font></b></th>
				<td class="accommodate" colspan="5"><input type="text"
					id="PERSON" name="PERSON">명</td>
			</tr>
			<tr>
				<th><b>층수<font color=red>*</font></b></th>
				<td class="floor" colspan="5"><input type="text" id="FlOOR"
					name="FlOOR">층</td>
			</tr>
			<tr>
				<th><b>좌석<font color=red>*</font></b></th>
				<td class="seat" col width="300px"><input type="text" id="SEAT"
					name="SEAT">석</td>
				<th><b>주차<font color=red>*</font></b></th>
				<td class="parking"><input type="text" id="PARKING"
					name="PARKING">대</td>
			</tr>

			<tr>
				<th><b>가격<font color=red>*</font></b></th>
				<td class="price" colspan="5">가격(1일)<input type="text" id="PRI"
					name="PRI">원, <!-- 토~일 (1일)<input type="text" name="seat">원</td> -->
			</tr>

			<tr>
				<th><b>주소<font color=red>*</font></b></th>
				<td class="address" colspan="5"><input type="text" id="POS"
					placeholder="우편번호"> <input type="button"
					onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="POS" placeholder="도로명주소"> <input
					type="text" id="sample4_jibunAddress" placeholder="지번주소"> <span
					id="guide" style="color: #999; display: none"></span> <input
					type="text" id="sample4_detailAddress" placeholder="상세주소">
					<input type="text" id="sample4_extraAddress" placeholder="참고항목">

<script>
	function changeAcreage(obj){
		var num = $(obj).val();
		num=num*0.3025;
		num=Math.round(num*100)/100;
		$("#pyung").val(num);
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
                document.getElementById("POS").value = roadAddr;
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
    
 /*    $(document).ready(function(){
       $("#submit").on("click", function(e){
          e.preventDefault();
          fn_insertBoard();
       });
    });
    
    function fn_insertspace(){
       var comSubmit = new ComSubmit("frm");
       comSubmit.setUrl("<c:url value='myspace/form'/>");
       comSubmit.submit();
    } */
    
</script>
<p></p>
			</tr>

			<tr>
				<th><b>사진등록<font color=red>*</font></b></th>
				<td colspan="5"><input type="file" id="IMAGE" name="IMAGE"><a
					href="#" class="btn" id="delete" name="delete">삭제</a>
					<button type="button" class="kkaIZb" onclick="addFile();"
						style="position: relative; z-index: 1;">파일 추가</button></td>

			</tr>

			<tr>

				<colgroup>
					<col width="150px">
					<col>
				</colgroup>

				<th><b>공간설명</b></th>
				<td class="iXeisV" colspan="5"><textarea class="iePFTd hunnDM"
						name="DETAIL" id="DETAIL" height="170px" width="50%"
						placeholder="별도의 연락 수단 (홈페이지 주소, 블로그, SNS, 메신저ID, 전화번호, 이메일 등)에 관한 언급은 하실 수 없습니다."></textarea>
				</td>
			</tr>
			<tr>
				<th><b>해쉬태그</b></th>
				<td class="tag" colspan="5"><input type="text" id="TAG"
					name="TAG"></td>
			</tr>
			
				<b>약관<font color=red>*</font></b>
					<div
						style="height: 170px; padding: 0 20px 20px 20px; overflow-y: auto; width: 50%; box-sizing: border-box; border: 1px solid #ccc; margin: 10px; line-height: 20px;"
						tabindex="0">
						<br>제1장 총칙<br> <br>제1조 (목적)<br>
						<br> <br>본 약관은 공간(이하 “회사”라 함)이 운영하는 공간 서비스(이하 “서비스”라 함)의
						이용과 관련하여 회사와 이용자 및 이용자간의 권리, 의무 및 책임사항, 서비스의 이용조건 및 절차, 기타 필요한 사항을
						규정함을 목적으로 합니다. 공간 서비스라 함은 회사가 제공하는 "공간” 브랜드를 사용하는 서비스를 말합니다. 공간
						서비스를 이용하시거나 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영정책을 확인하거나 동의하게 되므로, 조금만
						시간을 내서 주의 깊게 살펴봐 주시기 바랍니다.<br> <br>제2조 (정의)<br>
					</div>
					<p class="join-agreement">
						<input type="checkbox" name="agree" id="agree1" value="1"
							title="이용약관동의 체크" />위의 <span class="blue-txt">이용약관</span>에 동의합니다.
					</p>

				<div class="list_btn_c" style="text-align: center">
					<td class="fff" colspan="5"><a class="icon_btn_write2"
						href="#" tabindex="0">미리보기</a> <a class="icon_btn_write2" href="#"
						tabindex="0">임시저장</a> <a class="icon_btn_write" id="submit"
						href="#this">등록</a>
				</div>


	</div>
</body>
</html>