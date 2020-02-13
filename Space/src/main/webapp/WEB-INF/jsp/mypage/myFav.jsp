<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session = "true" %>
<% 
String userId;
if(session.getAttribute("USER_ID") != null){
	userId = (String)session.getAttribute("USER_ID");
	request.setAttribute("USER_ID", userId);
	//request.setAttribute("USER_ID", "admin");	
	//session.setAttribute("USER_ID", "admin");
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	
<html>
<head><title>내가 찜한 공간</title>
<%@ include file="/WEB-INF/common/calendar-header.jspf" %>
<style>
	.optitle{font-size: 20px}
	.opt>a{font-size: 15px; color: black; margin-right: 10px; margin-left: 10px; text-decoration: none;}
	.option{text-align: left;}
	.opt>a:hover{font-weight: bold;}
	.infoImage:hover{cursor: pointer; outline: black;}
	.favBtn:hover{cursor: pointer; outline: black;}
</style>
</head>
<body>
	<div style="text-align:center; width: 100%">
		<c:if test="${!empty USER_ID}">
			<input id="userId" type="hidden" value="admin">
		</c:if>	
		<!-- <input id="userId" type="hidden" value="${USER_ID}"> -->
	
		<p>
		<div style="width: 800px; display: inline-block;">
			<table style="width: 800px;">
			<colgroup>
				<col width="35%">
				<col width="35%">
				<col width="35%">
			</colgroup>
				<c:if test="${empty LIKE_LIST}">			
				 <%-- <%session.setAttribute("USER_ID", "admin"); %>  --%>
					내가 찜한 리스트가 없습니다.
				</c:if>
				<c:forEach var="mySpace" items="${LIKE_LIST}" varStatus="st">
					<c:set var="thumbnail" value="${fn:split(mySpace.SPACE_IMG,',')[0]}"></c:set>
					<c:if test="${st.index % 3 == 0 }">
						<tr valign="top" style="width: inherit">
					</c:if>
					<td>
						<div id="info" class="spaceInfo" style="width: inherit;">
							<dl>
								<img class="infoImage" src="<c:url value='/image/${thumbnail}'/>" style="width: 270px; height: 180px">
								<input type="hidden" name="SPACE_ID" value="${mySpace.SPACE_ID}">
							</dl>
							<dl>
								<div style="float:left; width: 80%; text-align:left;">
									<font color=gray size="2"> ${mySpace.SPACE_ID}</font><br>
									<b>${mySpace.SPACE_TITLE}</b>(${mySpace.SPACE_POS })<br>
									${mySpace.SPACE_USE} <br>	
									${mySpace.SPACE_PRI}원
								</div>
								<div class="favBtn" style="float:left; width: 20%">
								<c:set var="favImage" value="★"/>
								${favImage}
								</div>
							</dl>
						</div>
					</td>
					<c:if test="${st.index % 3 eq 2 or st.last}">
						<c:if test="${st.last}">
							<c:forEach var="i" begin="1" end="${3-(st.count mod 3 )}" step="1">
								<td></td>
							</c:forEach>
						</c:if>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</div>
	<%@ include file="/WEB-INF/common/include-body.jspf" %>
	<script type="text/javascript">
	
	
	$(document).ready(function(){
		$(".infoImage").on("click",function(e){
			e.preventDefault();			
			fn_openSpaceDetail($(this));
		});
		$(".opt > a").on("click",function(e){
			e.preventDefault();
			if($(this).attr("name")==null){
				$(this).parent().find(".opt_val").val($(this).html());
			}else{
				$(this).parent().find(".opt_val").val('');
			}
			
			fn_searchSpaceList();
		});
		$("#delete").on("click", function(e){ //삭제하기 버튼 
			e.preventDefault(); 
			fn_deleteBoard(); 
		}); 	

		$(".favBtn").on("click",function(e){
			e.preventDefault();
			var spaceId=$(this).parents(".spaceInfo").find("input[name='SPACE_ID']").val();
			var comSubmit = new ComSubmit(); 
			comSubmit.setUrl("<c:url value='/mypage/deleteFav'/>"); 
			comSubmit.addParam("SPACE_ID", spaceId); 
			comSubmit.submit();
		});
		
		function fn_delFav(data){ 
			var comSubmit = new ComSubmit(); 
			comSubmit.setUrl("<c:url value='/mypage/deleteFav'/>"); 
			comSubmit.addParam("SPACE_ID", $("#SPACE_ID").val()); 
			comSubmit.submit(); 
		} 		
	
		function fn_setOptButton(){
			$(".opt").each(function(){
				var opt = $(this);
				$(".opt_val").get().forEach(function(item,index,arr){
					if(!gfn_isNull($(item).val())){
					var temp = opt.find("a:contains('"+$(item).val()+"')");
					if( temp != null){
						temp.css('font-weight', 'bold');
					}
					}
				});
			});
		}		
		function fn_openSpaceDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/space/detailSpace'/>");
			comSubmit.addParam("SPACE_ID", obj.parent().find("input[name=SPACE_ID]").val());
			comSubmit.submit(); 
		}
		});
						
	</script>
</body>
</html>