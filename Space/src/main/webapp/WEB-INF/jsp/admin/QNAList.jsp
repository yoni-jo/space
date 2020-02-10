<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/common/include-adminHeader.jspf" %>
<title>공지 사항 뷰</title>
</head>
<body>
	<center><h2>관리자 1:1문의 관리</h2></center>
		<table class="QNA_list" name="QNAList" align="center" width="800">
			<colgroup>
				<col width="8%"/>
				<col width="50%"/>
				<col width="10%"/>
				<col width="25%"/>
				<col width="7%"/>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제  목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
					<th scope="col">답변</th>
				</tr>
			</thead>
			<tbody>
			
			
			</tbody>
		</table>
		
		<center>
			<div id="PAGE_NAVI"></div>
			<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
		</center>
		
		<form id="search" align="right" style="padding-right:23%" method="post" >
            <select id="searchOption" size="1">
                <option id="ADQNA_TITLE" value="ADQNA_TITLE" selected="selected">제  목</option>
                <option id="USER_ID" value="USER_ID" >작성자</option>
                <option id="ADQNA_CNT" value="ADQNA_CNT" >내  용</option>
                <option id="ALL" value="ALL" >제목+작성자+내용</option>
            </select>
                 <input type="text" size="16" name="keyword" value="${keyword}" placeholder="검색어 입력" onkeyup="enterkey();">
                 <!--검색어를 쓰고 엔터키를 누르면 먹지를 않기때문에 onkeyup="enterkey();를 주는 고 밑이 function으로 연결-->
                 <input type="text" style="display: none;" >
                 <!-- type="text"가 하나일때는 오류인지 서브밋처럼 액션 주소를 따라감, 그래서 꼼수로 보이지않는 텍스트를 하나 더 넣어줌 -->
                 <!-- HTML 2.0 표준 스펙에 명시되어 있습니다. (:
			 	 http://www.w3.org/MarkUp/html-spec/html-spec_8.html#SEC8.2
			 	 When there is only one single-line text input field in a form, 
				 the user agent should accept Enter in that field as a request to submit the form. -->
                 <input type="button" value="검 색" onClick="fn_QNAList(1)">
   		</form>
		
		<br/>

		<%@ include file="/WEB-INF/common/include-adminBody.jspf" %>		
		<script type="text/javascript">
       		$(document).ready(function(){
       			/* 페이징 관련 */
       			fn_QNAList(1);
			});
       		
			function fn_QNADetail(obj){
	            var comSubmit = new ComSubmit();
	            comSubmit.setUrl("<c:url value='/admin/QNADetail' />");
	            comSubmit.addParam("ADQNA_NUM", obj.parent().find("#ADQNA_NUM").val());
	            comSubmit.submit();
	        }
			
			/* 검색칸에서 엔터키 누르면 실행 */
			function enterkey() {
		        if (window.event.keyCode == 13) {
		        	fn_QNAList(1);
		        }
			}

			/* 페이징 관련 */
			 function fn_QNAList(pageNo){
				var comAjax = new ComAjax();
				comAjax.setUrl("<c:url value='/admin/selectQNAList' />");
				comAjax.setCallback("fn_QNAListCallback");
				comAjax.addParam("PAGE_INDEX", pageNo);
				comAjax.addParam("PAGE_ROW", 10);
				comAjax.addParam("searchOption", $("#searchOption > option:selected").val());
				comAjax.addParam("keyword", $("input[name='keyword']").val());
				/* id로 줬을때는 '#'이용 name으로 줬을때는 'input[name='keyword']' 방식 class로 줬을때는'.'(마침표) 방식으로 연결 */
				comAjax.ajax();
			}
			
			function fn_QNAListCallback(data){
				var total = data.TOTAL; 
				var body = $("table[name='QNAList'] > tbody");
				body.empty();
				if(total == 0){
					var str = "<tr><td colspan='4'>조회된 결과가 없습니다.</td></tr>"; 
					body.append(str);
				}else{
					var params = {
						divId : "PAGE_NAVI",
						pageIndex : "PAGE_INDEX",
						totalCount : total,
						eventName : "fn_QNAList",
						recordCount : 10
					};
					gfn_renderPaging(params);
					var str = "";
					$.each(data.list, function(key, value){
						str += "<tr>" + "<td>" + value.ADQNA_NUM + "</td>" + "<td class='title'>" 
						+ "<a href='#this' name='title' style='color:indigo;'>" + value.ADQNA_TITLE + "</a>" 
						+ "<input type='hidden' id='ADQNA_NUM' value=" + value.ADQNA_NUM + ">" 
						+ "</td>" + "<td>" + value.USER_ID + "</td>" + "<td>" 
						+ value.ADQNA_DATE + "</td>" + "<td>" + value.QA_ANS + "</td> " + "</tr>";
						
					}); 
					body.append(str);
					$("a[name='title']").on("click", function(e){
						e.preventDefault();
						fn_QNADetail($(this));
					});
				}
			} 
		</script>
</body>
</html>
