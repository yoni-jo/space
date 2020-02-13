<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ include file="/WEB-INF/include/include-header.jspf" %>

<title>1:1문의</title>
<style>
table{border: 2px solid #000000;  font-family: serif }
th{
border-bottom:2px solid #000000;
border-right: 2px solid #000000;
 }
 td{
 border-right: 2px solid #000000;
 }
table{ border-collapse: collapse;}
tbody tr:nth-child(2n) { background-color: #dcdcdc;}

#table{margin-left:calc(50% - 325px);width:auto}
#write{border:0;background-color: gray;margin-left:calc(650px - 150px);width: 150px;}	
</style>


<div id="table">
<table border="2px" width="650px" height="30px" align="center" style="border-collapse: collapse; background-color: #E0ffff;">
<th>1:1문의</th>
</table>

<table width="650px" height="250px" align="center" id="title">

<thead>
<tr>
<th>글번호</th>
<th>제목</th>
<th>답변여부</th>
<th>작성일</th>
</tr>
</thead>
<tbody>

</tbody>
</table>

<div id="PAGE_NAVI"></div>
<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>

<br/>

<button href="#this" class="btn" id="write">작성하기</button>
</div>
<%@ include file="/WEB-INF/include/include-body.jspf" %>

<script type="text/javascript">
$(document).ready(function(){
	fn_selectqnalist(1);
	
	$("#write").on("click", function(e){ // 글쓰기
		e.preventDefault();
		fn_Myqnawrite();
	});
	
	$("a[name='title']").on("click", function(e){ // 제목
		e.preventDefault();
		fn_Myqnadetail($(this));
	});
});

function fn_Myqnawrite(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/mypage/Myqnawrite' />");
	comSubmit.submit();
}

function fn_Myqnadetail(obj){
    var comSubmit = new ComSubmit();
    comSubmit.setUrl("<c:url value='/mypage/Myqnadetail' />");
    comSubmit.addParam("ADQNA_NUM", obj.parent().find("#ADQNA_NUM").val());
    comSubmit.submit();
}

function fn_selectqnalist(pageNo){
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/mypage/selectqnalist' />");
	comAjax.setCallback("fn_selectqnalistCallback");
	comAjax.addParam("PAGE_INDEX", pageNo);
	comAjax.addParam("PAGE_ROW", 15);
	comAjax.ajax();
}
	
function fn_selectqnalistCallback(data){
	var total = data.TOTAL;
	var body = $("#title>tbody");
	body.empty();
	if(total == 0){
		var str = "<tr>" + "<td colspan='4'>조회된 결과가 없습니다.</td>" + "</tr>";
		body.append(str);
	}
	
	else{
		var params = {
				divId : "PAGE_NAVI",
				pageIndex : "PAGE_INDEX",
				totalCount : total,
				eventName : "fn_selectqnalist"
		};
		
		gfn_renderPaging(params);
		
		var str = "";
		$.each(data.list, function(key, value){
			str += "<tr>" + "<td>" + value.ADQNA_NUM + "</td>" + "<td class='title'>" + "<a href='#this' name='title'>" + value.ADQNA_TITLE + "</a>" + "<input type='hidden' id='ADQNA_NUM' value=" + value.ADQNA_NUM + ">" + "</td>" +  "<td>" + value.ADQNA_ANS + "</td>" + "<td>" + value.ADQNA_DATE + "</td>"+ "</tr>";
		});
		body.append(str);
		
	
	}
}	

</script>
