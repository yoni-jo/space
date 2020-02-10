<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<style>
.add-table{margin-left: calc((100%/2) - 400px);border:1px solid; width:800px}
.title{width:800px;}

</style>


<body>
<div class="title" style="text-align:right">
<font color=red>*</font>는 필수 입력사항입니다<br/><br/>
</div>
<br /><br />
  <table class="add-table"><!-- <table border="1"> -->
                <tr>
                    <th><b>공간의 용도·목적<font color=red>*</font></b></th>
                    <td class="options" colspan="5">
                        <label><input type="checkbox" name="space_for" value="01" /> 스튜디오</label>
                        <label><input type="checkbox" name="space_for" value="02" /> 세미나실</label>
                        <label><input type="checkbox" name="space_for" value="03" /> 전시장</label>
                        <label><input type="checkbox" name="space_for" value="04" /> 파티홀</label>
                        <label><input type="checkbox" name="space_for" value="05" /> 스터디룸</label>
                        <label><input type="checkbox" name="space_for" value="06" /> 기타</label>
                        <label><input type="text" name="space_for" placeholder="직접 입력해주세요.">                        
                                              
                    </td>
                </tr>
                <tr>
                    <th><b>보유 시설·설비<font color=red>*</font></b></th>
                    <td class="options" colspan="5">
                        <label><input type="checkbox" name="space_options" value="01" /> 빔프로젝터</label>
                        <label><input type="checkbox" name="space_options" value="02" /> TV</label>
                        <label><input type="checkbox" name="space_options" value="03" /> PC</label>
                        <label><input type="checkbox" name="space_options" value="04" /> Wi_Fi</label>
                        <label><input type="checkbox" name="space_options" value="05" /> 스피커</label>
                        <label><input type="checkbox" name="space_options" value="06" /> 유선마이크</label>
                        <label><input type="checkbox" name="space_options" value="07" /> 무선마이크</label>
                        <label><input type="checkbox" name="space_options" value="08" /> 냉난방기</label>
                        <label><input type="checkbox" name="space_options" value="09" /> 조명</label>
                        <label><input type="checkbox" name="space_options" value="10" /> 로비</label>
                        <label><input type="checkbox" name="space_options" value="11" /> 무대</label>
                        <label><input type="checkbox" name="space_options" value="12" /> 대기실</label>
                        <label><input type="checkbox" name="space_options" value="13" /> 테이블</label>
                        <label><input type="checkbox" name="space_options" value="14" /> 책걸상</label>
                        <label><input type="checkbox" name="space_options" value="15" /> 교탁</label>
                        <label><input type="checkbox" name="space_options" value="16" /> 주차공간</label>
                        <label><input type="checkbox" name="space_options" value="17" /> 승강기</label>
                   </td>
                </tr>
                
                <tr>
					<th><b>공간명<font color=red>*</font></b></th>
					<td class="title" colspan="5"><input type="text" name="title"></td>
				</tr>

                <tr>
                    <th><b>면적<font color=red>*</font></b></th>
                    <td colspan="5"><input type="text" class="area" name="area"> m<sup>2</sup>  = <input type="text" class="area" name="area" /> 평                     
                        <button class="btn" type="button">변환하기</button>
                    </td>
                </tr>
                
                <tr>
					<th><b>크기</b></th>
					<td class="meter" colspan="5">가로<input type="text" name="meter1">m 세로<input type="text" name="meter1">m 높이<input type="text" name="meter1">m  </td>
				</tr>
                
                <tr>
					<th><b>수용 인원<font color=red>*</font></b></th>
					<td class="accommodate" colspan="5"><input type="text" name="accommodate">명</td>
				</tr>
				<tr>
					<th><b>좌석<font color=red>*</font></b></th>
					<td class="seat" col width="300px"><input type="text" name="seat">석</td>
					<th><b>주차<font color=red>*</font></b></th>
					<td class="parking"><input type="text" name="parking">대</td>
				</tr>
				<tr>
					<th><b>가격<font color=red>*</font></b></th>
					<td class="price" colspan="5">월~금 (1일)<input type="text" name="seat">원, 토~일 (1일)<input type="text" name="seat">원</td>
				</tr>
				
				<tr>
					<th><b>주소<font color=red>*</font></b></th>
					<td class="address" colspan="5"><input type="text" id="sample4_postcode" placeholder="우편번호">
<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
<span id="guide" style="color:#999;display:none"></span>
<input type="text" id="sample4_detailAddress" placeholder="상세주소">
<input type="text" id="sample4_extraAddress" placeholder="참고항목">

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
			 	</tr>
			 	
			 	<tr>
			    	<th><b>사진등록<font color=red>*</font></b></th>
					<td colspan="5"><input type="file" id="file" name="file_0"><a href="#" class="btn" id="delete" name="delete">삭제</a>
						<button type="button" class="kkaIZb" onclick="addFile();" style="position: relative; z-index: 1;">파일 추가</button>
					</td>
				
			 	</tr>	
			 	
				<tr>
					
					<colgroup><col width="150px"><col></colgroup>
					
						<th><b>공간설명</b></th>
							<td class="iXeisV" colspan="5">
								<textarea class="iePFTd hunnDM" name="DESC_DETAIL" id="DESC_DETAIL" height="170px" width="50%"
									placeholder="별도의 연락 수단 (홈페이지 주소, 블로그, SNS, 메신저ID, 전화번호, 이메일 등)에 관한 언급은 하실 수 없습니다."></textarea>
							</td>
				</tr>				
				
				<tr>
				<th><b>약관<font color=red>*</font></b></th><td class="ddd" colspan="5">
					<div style="height: 170px; padding:0 20px 20px 20px; overflow-y : auto; width: 50%;box-sizing: border-box;border: 1px solid #ccc;margin: 10px; line-height: 20px;" tabindex="0">
						<br>제1장 총칙<br>
						<br>제1조 (목적)<br><br>
						<br>본 약관은 공간(이하 “회사”라 함)이 운영하는 공간 서비스(이하 “서비스”라 함)의 이용과 관련하여 회사와 이용자 및 이용자간의 권리, 의무 및 책임사항, 서비스의 이용조건 및 절차, 기타 필요한 사항을 규정함을 목적으로 합니다. 공간 서비스라 함은 회사가 제공하는 "공간” 브랜드를 사용하는 서비스를 말합니다. 공간 서비스를 이용하시거나 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영정책을 확인하거나 동의하게 되므로, 조금만 시간을 내서 주의 깊게 살펴봐 주시기 바랍니다.<br>
						<br>제2조 (정의)<br>
					</div>	
					<p class="join-agreement">
					<input type="checkbox" name="agree" id="agree1" value="1" title="이용약관동의 체크"/>위의 <span class="blue-txt">이용약관</span>에 동의합니다.
					</p>			
				</tr>
				
				<tr>
					<div class="list_btn_c" style="text-align:center">
					<td class="fff" colspan="5" >	
					<a class="icon_btn_write2" href="#" tabindex="0">미리보기</a>
					<a class="icon_btn_write2" href="#" tabindex="0">임시저장</a>
					<a class="icon_btn_write" id="submit_b" href="#" tabindex="0">등록</a>
					</div>			
				</tr>				
				
	</table>
