<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-adminHeader.jspf" %>
<meta charset="EUC-KR">
<title>관리자 공지사항 상세보기</title>
</head>
<body>
<br/> 
	<form id="frm">
	<table class="QNA_detail" align="center" width="800" >
		<colgroup>
			<col width="7%" />
			<col width="65%" />
			<col width="8%" />
			<col width="15%" />
			<col width="5%" />
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
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list}" var="row" begin="0" end="0">
			<tr>
				<td align="center">${row.ADQNA_NUM}</td>
				<input type="hidden" id="ADQNA_NUM" name="ADQNA_NUM" value="${row.ADQNA_NUM}">
				<td align="center">${row.ADQNA_TITLE}</td>
				<td align="center">${row.USER_ID}</td>
				<td align="center">${row.ADQNA_DATE}</td>
				<td align="center">${row.QA_ANS}</td>
			</tr>
			<tr>
				<td colspan="5" height="200" style="padding-left:50px;">${fn:replace(row.ADQNA_CNT, cn, br)}</td>
			</tr>
			</c:forEach>
			</c:when>
			<c:otherwise>
			</c:otherwise>
			</c:choose>				
		</tbody>
	</table>
	
	
	<div class="container">
    
    <br><br>
        <div>
            <form id="frm">
            	<table class="QNA_commentsWrite" align="center" width="800">
            	<tr><td>
                <strong>Comments</strong>
                </td></tr>
                </table>
            </div>
            <div>
                <table class="table" align="center">                    
                    <tr>
                        <td>
                            <textarea style="width: 800px" rows="3" cols="30" id="CMT_CMT" name="CMT_CMT" placeholder="답변글을 입력해 주세요"></textarea>
                        </td>
                    </tr>
                    <tr>
                    	<td align="right" style="padding-right:20px;">
                    		<div>
                                <a href='#this' class="btn" id="inComment">등록</a>
                            </div>
                        </td>
                   	</tr>
                </table>
                <br/>                	
        </div>
        
 
 	<!-- 댓글리스트 -->
	<table class="QNA_CommentList" align="center" width="800" >
		<colgroup>
			<col width="15%" />
			<col width="70%" />
			<col width="15%" />
		</colgroup>
		<thead>
				<tr>
					<th scope="col">작성자</th>
					<th scope="col">답  변</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
		<tbody>
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list}" var="row" >
				<c:if test = "${empty row.ADMIN_ID}">
						<tr>
							<td colspan="3">답변이 없습니다</td>
						</tr>
				</c:if>
				<c:if test = "${!empty row.ADMIN_ID}">
					<tr>
						<td align="center">${row.ADMIN_ID}</td>
						<td align="center">${fn:replace(row.CMT_CMT, cn, br)}</td>
						<td align="center">${row.CMT_DATE}
						<br/><br/>
						<%-- <input type="hidden" id="CMT_NUM${status.index}" value="${row.CMT_NUM}"> --%>
						<!-- 위 구문을 반복하여 히든안의 id가 2개 이상이되면 id=CMT_NUM 많아져서 function으로 찾을때 똑같은 id가 많아서,
						삭제가 제대로 이루어지지 않음, 해서 id를 함수로 증가시켜서 그값을 아이디처럼 사용해서  받음  -->
						<a href="#this" class="btn" id="deleteComment" onClick="fn_deleteComment(${row.CMT_NUM})">삭제하기</a>
						</td>
					</tr>
				</c:if>
				</c:forEach>
			</c:when>
			<c:otherwise>
			</c:otherwise>
			</c:choose>
		</tbody>
	</table>
        
    </form>
</div>
	<br/>
	<center>
	<a href="#this" class="btn" id="delete" align="left">삭제하기</a>
	<a href="#this" class="btn" id="list">목록으로</a>
	</center>
	
	<%@ include file="/WEB-INF/include/include-adminBody.jspf" %>		
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ 
				e.preventDefault();
				fn_QNAList();
			});
			
			$("#delete").on("click", function(e){
				e.preventDefault();
				fn_deleteQNA();
			});
			/* $("#deleteComment").on("click", function(e){
				e.preventDefault();
				fn_deleteComment();
			}); */
			
			$("#inComment").on("click", function(e){ 
				e.preventDefault();
				fn_insertComment();
			});
		});
		
		
		
		function fn_QNAList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/QNAList' />");
			comSubmit.submit();
		}
		
		function fn_deleteQNA(){
			if(confirm("1:1질문을 삭제하시겠습니까?") == true){
				alert("1:1질문이 삭제되었습니다.");
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/deleteQNA' />");
			comSubmit.addParam("ADQNA_NUM", $("#ADQNA_NUM").val());
			comSubmit.submit();
			}else{
				return;
			}
		}
		
		
		function fn_deleteComment(count){
			var comSubmit = new ComSubmit();
			var count = count;
			comSubmit.setUrl("<c:url value='/admin/deleteComment' />");
			comSubmit.addParam("CMT_NUM", count);
			comSubmit.addParam("ADQNA_NUM", $("#ADQNA_NUM").val());
			comSubmit.submit();
		}
		
		function fn_insertComment(){
			if($("#CMT_CMT").val() == ""){
				alert("내용을 입력해 주세요");
			}else{			
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/admin/insertComment' />");
			comSubmit.submit();
			}
		}
		
	</script>
		

</body>
</html>