<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
String userId;
session.setAttribute("USER_ID", "admin");
if(session.getAttribute("USER_ID") != null){
	userId = (String)session.getAttribute("USER_ID");
	request.setAttribute("USER_ID", userId);
}
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/common/fullcalendar-header.jspf" %>
<%@ include file="/WEB-INF/common/kakaomap-header.jspf" %>

<style>
<%@ include file="/css/detailStyle.css" %>
<%@ include file="/css/layerPopUpStyle.css"%>
</style>
<style>
	.item{width: 20%; display: inline-block;}
	.line{margin-bottom: 50px}
	.subline{margin-bottom: 20px}
	.subTitle{font-weight: bold; }
	.caption{text-align: left;}
	
	#option > label > input{margin-left: 20px}
	.fc-sat > .fc-day-number { color:#0000FF; }     /* 토요일 */
	.fc-sun > .fc-day-number { color:#FF0000; }
	.fc-title { font-size: 10px; text-align: center;}
	.fc-title:after {content: "원";}
	.fc-allow-mouse-resize{cursor: pointer;}
	#resultPri:before{content: "결재 금액 : "}
	#resultPri:after {content: "원"}
</style>
<meta charset="EUC-KR">
<title>${DETAIL.SPACE_TITLE}</title>
</head>
<body>
<%@ include file="/WEB-INF/common/include-body.jspf" %>
<c:if test="${!empty USER_ID}">
	<input id="userId" type="hidden" value="${USER_ID}">
</c:if>
<input id="spaceId" type="hidden" value="${DETAIL.SPACE_ID}">
<input id="res_type" type="hidden" value="${DETAIL.SPACE_RES_TYPE}">
<c:if test="${!empty RES_LIST}">
	<c:if test="${DETAIL.SPACE_RES_TYPE.equals('DATE')}">
		<c:forEach var="list" items="${RES_LIST}">
			<div class="resDiv">			
			<input class="res_date" type="hidden" value="${list.SDATE}">
			<input class="res_pri" type="hidden" value="${list.PRI}">
			</div>
		</c:forEach>
	</c:if>
	<c:if test="${DETAIL.SPACE_RES_TYPE.equals('DAY') }">
	<c:set var="map" value="${RES_LIST.get(0)}"></c:set>
	<c:forEach var="key" items="${map.keySet()}">
		<div class="resDiv">
		<input class="res_date" type="hidden" value="${key}">
		<input class="res_pri" type="hidden" value="${map.get(key)}">
		</div>
	</c:forEach>
	</c:if>
</c:if>

<form id="activeRes" method="post"></form>

<div style="width:100%; height: 100%; display: inline-block; text-align: center">
<div style="width:800px; height: 100%; display: inline-block;">
	<div id="mainTitle" style="text-align: left"><h1>${DETAIL.SPACE_TITLE}</h1></div>	
	<div id="posTitle" style="margin-bottom: 50px;text-align: left"><span id="pos">${DETAIL.SPACE_POS}</span></div>
	<div id="topView" style="width: inherit;">
	
		<div id="spaceInfo" style="width: 50%;height: 100%; float: left;text-align: left">
			<c:set var="image" value="${fn:split(DETAIL.SPACE_IMG,',')[0]}"/>
			<div id="spaceImageView" style="max-width: inherit; max-height:300px;text-align: center">
				<img src="<c:url value='/image/${image}'/>" style="max-height: inherit;"/>
			</div>
			
			<p class="line"></p>
			
			<div id="topInfoView">
				<br><label>${DETAIL.SPACE_TITLE}</label><br>
				<label>평균가 ${DETAIL.SPACE_PRI}</label><br>
				<p></p>
				<label>임대인 정보</label><br>
				<label>ID : ${DETAIL.SPACE_HOST}</label><br>
				<c:set var="tagList" value="${fn:split(DETAIL.SPACE_TAG,'#')}"/>
				<c:forEach var="tag" items="${tagList}" >
					<label class="tag">#${tag} </label>
				</c:forEach>
			</div>
		</div>
		
		<div id="resInfo" style="width: 50%; height: 100%;float: right; text-align: center;">
			<div id="calendar" style="width: 100%; height: 100%;">
				<%-- <img src="<c:url value='/image/calendar.png'/>" 
				style="max-width: 200px; max-height:300px;"/> --%>
			</div>
			<p class="line"></p>
			<div id="resCalendarBtn" style="width: 100%; height: 100%;">
				<label id="resultPri">0</label>
				<label id="calBtn" style="width : inherit; display:inline-block; background: blue;">버튼</label> 
			</div>
		</div>
		
	</div>

			<div id="middleView" style="width: 90%; display: inline-block;">
				<div id="defaultOptView"
					style="height: 100%; background-color: silver; padding: 10px; margin-top: 50px">
					<div class="item">
						<img src="<c:url value='/image/area.png'/>"
							style="max-width: 60%;" /> <br> <label style="">면적<br>${DETAIL.SPACE_SIZE}㎡</label>
					</div>
					<div class="item">
						<img src="<c:url value='/image/person.png'/>"
							style="max-width: 60%;" /> <br> <label style="">수용인원<br>${DETAIL.SPACE_PERSON}명</label>
					</div>
					<div class="item">
						<img src="<c:url value='/image/chair.png'/>"
							style="max-width: 60%;" /> <br> <label style="">좌석<br>${DETAIL.SPACE_SEAT}석</label>
					</div>
					<div class="item">
						<img src="<c:url value='/image/car.png'/>" style="max-width: 60%;" />
						<br> <label style="">주차공간<br>${DETAIL.SPACE_PARKING}대</label>
					</div>
				</div>

				<p class="line"></p>

				<div id="locationView" style="width: 100%; text-align: left">
					<div id="viewTitle" style="width: 100%;">
						<img src="<c:url value='/image/gps.png'/>"
							style="width: 40px; height: 40px" /> <label class="subTitle">위치</label>
					</div>
					<p></p>
					<div id="map" style="width: inherit; height: 400px; z-index: 0"></div>
					<div id="mapLocation">
						<label></label>
					</div>
				</div>

				<p class="line"></p>

				<div id="detailOpt" style="text-align: left">
					<c:forEach var="item" items="${OPT}">
						<input class="optItem" type="hidden" value="${item}">
					</c:forEach>
					<div id="optTitle">
						<label class="subTitle">세부옵션정보</label>
					</div>
					<p class="subline"></p>
					<div id="option">
						<label><input type="checkbox">무대</label> <label><input
							type="checkbox">로비</label> <label><input type="checkbox">대기실</label>
						<label><input type="checkbox">조명</label> <label><input
							type="checkbox">교탁</label> <label><input type="checkbox">테이블</label>
						<p class="subline"></p>
						<label><input type="checkbox">빔프로젝터</label> <label><input
							type="checkbox">유선마이크</label> <label><input
							type="checkbox">무선마이크</label> <label><input
							type="checkbox">스피커</label> <label><input type="checkbox">책걸상</label>
						<p class="subline"></p>
						<label><input type="checkbox">PC</label> <label><input
							type="checkbox">TV</label> <label><input type="checkbox">Wi-Fi</label>
						<label><input type="checkbox">냉난방기</label> <label><input
							type="checkbox">주차공간</label> <label><input
							type="checkbox">승강기</label>
					</div>
				</div>

				<p class="line"></p>

				<div id="postList">
					<div class="tapMenu">
						<ul class="tabs">
							<li class="tab-link current" data-tab="QNA_LIST">Q&A</li>
							<li class="tab-link" data-tab="REPLY_LIST">후기</li>
						</ul>
						<div id="listView" class="tabView">
							<div id="listTitle" class="listTitle">
								<ul>
									<li class="col_ans">답변</li>
									<li class="col_title">제목</li>
									<li class="col_writer">작성자</li>
									<li class="col_writeDate">작성일</li>
								</ul>
							</div>
							<div id="QNA_LIST" class="tab-content current"></div>
							<div id="REPLY_LIST" class="tab-content"></div>
							<div style="text-align: right;">
							<c:if test="${!empty USER_ID}">
								<label id="writeBtn" class="writeBtn" for="open-pop">질문 작성</label>
							</c:if>
							</div>
							<div id="pageNum"></div>
						</div>
					</div>

				</div>
				<input type="hidden" id="QNA_PAGE_INDEX" name="PAGE_INDEX" /> <input
					type="hidden" id="REPLY_PAGE_INDEX" name="PAGE_INDEX" />

				<p class="line"></p>
				<p class="line"></p>
				<p class="line"></p>

				<input class="modal-state" id="open-pop" type="checkbox" />
				<div class="modal">
					<label class="modal_bg" for="open-pop"></label>
					<div class="modal_inner">
						<label class="modal_close" for="open-pop"></label>
						<h2 id="write" class="popup_title">질문 작성</h2>
						<p class="popup_content" style="text-align: left;"></p>
							<div id="divPopTitle"><label>제목 </label><br>
							<input type="text" id="popTitle" class="title txt"></div>
							
							<p class="subline"></p>
							
							<div id="divPopCnt">
							<label>내용 </label><br>
							<textarea id="popCnt" rows="2" cols="10" class="content txt"></textarea>
							</div>
							
							<p class="subline"></p>
							
							<div id="divPopCmt">
							<label>답변 내용</label><br>
							<textarea id="popCmt" rows="2" cols="10" class="content txt"></textarea>
							</div>
							
							<p class="subline"></p>
							
							<div id="divPopBtn">
							<label id="sendBtn" class="writeBtn" style="bottom: 2em;">확인</label>
							<label id="tempBtn" style="bottom: 2em; right: 2em;float: right;">비밀글
							<input type="checkbox" name="hiddenPost"></label>
							</div>
					</div>
				</div>

			</div>



			<div id="guide_Caption" class="caption">
			<label>주의 사항</label>
			<ul>
				<li></li>
			</ul>
			<ul>
				<li></li>
			</ul>
			<ul>
				<li></li>
			</ul>
		</div>
		<div id="refund_Caption" class="caption">
			<label>환불 규정</label>
			<ul>
				<li></li>
			</ul>
			<ul>
				<li></li>
			</ul>
			<ul>
				<li></li>
			</ul>
		</div>
	</div>
	
</div>
<script>
	$(document).ready(function(){
		setDetailOpt();
		fn_selectPostList(1,"REPLY_LIST");
		fn_selectPostList(1,"QNA_LIST");
		
		$("#sendBtn").click(function(){
			var comSubmit = new ComSubmit();
			
			comSubmit.setUrl("<c:url value='/space/writeQnA'/>");
			comSubmit.addParam("SPACE_ID",$("#spaceId").val());
			comSubmit.addParam("TITLE",$("#popTitle").val());
			comSubmit.addParam("CNT",$("#popCnt").val());
			if($("input[name=hiddenPost]").prop("checked")){
				comSubmit.addParam("SCR",'Y');
			}else{
				comSubmit.addParam("SCR",'N');
			}
			comSubmit.submit();
		});
		$('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
			if(tab_id == 'QNA_LIST'){
				fn_selectPostList($("#QNA_PAGE_INDEX").val(),"QNA_LIST");
				$("#writeBtn").css("display","");
				$("#listTitle").css("display","");
				
			}else{
				fn_selectPostList($("#REPLY_PAGE_INDEX").val(),"REPLY_LIST");
				$("#writeBtn").css("display","none");
				$("#listTitle").css("display","none");
			}
		});
		$("#writeBtn").click(function(){
			
			$(".popup_title").text($(this).text());
			$("#divPopCmt").css("display","none");
			$("#divPopBtn").css("display","");
			$("input.title, textarea.content").attr("disabled",false);
			$(".txt").val("");
		});
	});
	function setDetailOpt(){
		$(".optItem").get().forEach(function(item,index,arr){
			$("label:contains('"+$(item).val()+"') > input:checkbox").attr("checked",true);
		});
		
		$("#option > label > input:checkbox").each(function(){
			$(this).attr("disabled",true);
		});
		
	}
	function fn_selectPostList(pageNo,type){
		var comAjax = new ComAjax();
		if(type == null){
			type = $("div.current").attr('id');
		}
		comAjax.setUrl("<c:url value='/space/SpacePostList'/>");
		comAjax.setCallback("fn_selectListCallback");
		comAjax.addParam("PAGE_INDEX",pageNo);
		comAjax.addParam("SPACE_ID",$("#spaceId").val());
		comAjax.addParam("START",1);
		comAjax.addParam("END",5);
		comAjax.addParam("TYPE",type);
		comAjax.addParam("PAGE_ROW",5);
		comAjax.ajax();
	}
	function fn_selectListCallback(data){
		var total = data.TOTAL;
		var record = 5;
		var body = $("#"+data.TYPE);
		body.empty();
		if(total == 0){
			var str ="<ul>"+
						"<li colspan = '4'>조회된 결과가 없습니다</td>"+
					"</ul>";
			$("#pageNum").empty();
			body.append(str);
		}else{
			var params;
			
			if(data.TYPE == 'QNA_LIST'){
				params = {
					divId : "pageNum",
					pageIndex : "QNA_PAGE_INDEX",
					totalCount : total,
					recordCount : record,
					eventName : "fn_selectPostList"
				};
			}else{
				params = {
						divId : "pageNum",
						pageIndex : "REPLY_PAGE_INDEX",
						totalCount : total,
						recordCount : record,
						eventName : "fn_selectPostList"
				}
			}
			gfn_renderPaging(params);
			
			var str = "";
			var date;
			var imageStr = "";
			$.each(data.list, function(key,value){
				if(data.TYPE == 'QNA_LIST'){
				str += "<ul>"+
							"<li class='col_ans'>"+value.QNA_ANS+"</li>"+
							"<li class='col_title'>";
							if(value.QNA_SCR == 'Y'){
								str+="<label>"+value.QNA_TITLE+"[비밀글]</label>"
								str+="<input type='hidden' name='QNA_CNT' value=''>"+
								
								"<input type='hidden' name='QNA_ANS' value=''>"+
								"<input type='hidden' name='QNA_CMT' value=''>";
							}else{
								str+="<a href='#this' name='title'>"+value.QNA_TITLE+"</a>"+
								"<input type='hidden' name='QNA_CNT' value='"+value.QNA_CNT+"'>"+
								"<input type='hidden' name='QNA_ANS' value="+value.QNA_ANS+">"+
								"<input type='hidden' name='QNA_CMT' value="+value.QNA_CMT+">";
							}
							str+="</li>"+
							"<li class='col_writer'>"+value.USER_ID+"</li>"+
							"<li class='col_writeDate'>"+getFormatDate(value.QNA_DATE)+"</li>"+
						"</ul>";
				}else{
					date=$.datepicker.formatDate('yy-mm-dd', new Date(value.REPLY_DATE));
					imageStr = (value.REPLY_IMG+"").split(",");
					str += "<div class='reply_list'><ul>"+
						"<li><label class='label_bold'>"+value.REPLY_TITLE+"</label><label>["+value.USER_ID+"]</label></li>"+
						"</ul>"+
						"<ul>"+
							"<li><label>"+value.REPLY_CNT+"</label></li>"+
						"</ul>"+
						"<ul><li>";
						if(!gfn_isNull(imageStr)){
							for(var s in imageStr){
								str+="<img class='imgView' src='<c:url value='/image/"+imageStr[s]+"'/>'/>";
							}
						}
						str+="</li></ul>"+
						"<ul><li>작성일 : "+date+"</li></ul></div>"+
						"<div class='last_child'></div>";
				}
			});
			body.append(str);
			
			$("a[name='title']").on("click",function(e){
				readPostOpen();
				
				var obj = $(this).parent();
				var title = $("#divPopTitle > input");
				var cnt=$("#divPopCnt > textarea");
				var cmt = $("#divPopCmt > textarea");
				
				$("#divPopCmt").css("display","");
				$(".popup_title").text("질문");
				
				title.val($(this).text());
				cnt.val(obj.find("input[name=QNA_CNT]").val());
				if(obj.find("input[name=QNA_ANS]").val() == 'N'){
					cmt.val("답변되지 않은 글입니다");
				}else{
					cmt.val(obj.find("input[name=QNA_CMT]").val());
				}
		    });
			$(".imgView").click(function(){
				var img=new Image();
				var url=$(this).attr("src");
				img.src=url;
				var img_width=img.width;
				var win_width=img.width+25;
				var img_height=img.height;
				var win=img.height+30;
				var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+img_height+', menubars=no, scrollbars=auto');
				OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");
			});
		}
	}
	function readPostOpen(){
		$("input.modal-state").attr("checked",true);
		$("input.title, textarea.content").attr("disabled",true);
		$("#divPopBtn").css("display","none");
	}
	function getFormatDate(time){
		var date = new Date(time);
	    var year = date.getFullYear();              //yyyy
	    var month = (1 + date.getMonth());          //M
	    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	    var day = date.getDate();                   //d
	    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	    return  year + '-' + month + '-' + day;
	}
	</script>
	<script>
		var places = new kakao.maps.services.Places();
		var container = document.getElementById('map');

		var options = {
				center : new kakao.maps.LatLng(33.450701, 126.570667),
				level : 3
			};

		var map = new kakao.maps.Map(container, options);
		
		var posX;
		var posY;
		var posTitle;
		
		var callback = function(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        console.log(result);
		        $("#mapLocation > label").html(result[0].road_address_name);
		        posTitle = $("#mapLocation > label").html();
		        posX = result[0].x;
		        posY = result[0].y;
		        map.setCenter(new kakao.maps.LatLng(posY,posX));
		        
		        var markers = new kakao.maps.Marker({
				    position: new kakao.maps.LatLng(posY,posX)
				});
		        
		        markers.setMap(map);
		        
		        var iwContent = '<div style="padding:5px;">'+posTitle+'</div>'
		        var infowindow = new kakao.maps.InfoWindow({
		            content : iwContent
		        });
		        kakao.maps.event.addListener(markers,'mouseover',function(){
		        	infowindow.open(map,markers);
		        });
		        kakao.maps.event.addListener(markers,'mouseout',function(){
		        	infowindow.close();
		        });
		        kakao.maps.event.addListener(markers,'click',function(){
		        	var url="https://map.kakao.com/link/to/"+posTitle+","+posY+","+posX;
		        	window.open(url, "_blank");
		        });
		    }
		};
		places.keywordSearch($("#pos").html(), callback);
	</script>
	
	<!-- ===================================fullCalendar -->
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
			var event = new Array();
			setCalEvent(event);
			var calendar = new FullCalendar.Calendar(calendarEl, {
				plugins: ['interaction','dayGrid' ],
				header: {
				left: 'today',
				center: 'title',
				right: 'prev,next'
				},
				events: event,
				columnHeaderText: function(date) {
						switch (date.getDay()){
						case 0: return '일';
						case 1: return '월';
						case 2: return '화';
						case 3: return '수';
						case 4: return '목';
						case 5: return '금';
						case 6: return '토';
						}
				},
				eventRender: function(info) {
					var date = new Date(info.event.start);
					var time = getFormatDate(info.event.start);
					if(!comparisonDate(date)||!compResCheck(time)){
						info.el.style.backgroundColor= '#aaaaaa';
					    info.el.style.borderColor = '#999999';
					    $(info.el).css("color","#ffffff");
					}
					if($("#RES_TIME").val()==time){
						info.el.style.backgroundColor= '#f89b00';
					    info.el.style.borderColor = '#e78a00';
					    $(info.el).css("color","#c56a00");
				    	$(info.el).removeClass('INACTIVE');
				    	$(info.el).addClass('ACTIVE');
					}
			    },
				eventClick: function(info) {
					var className = info.el.className;
					
					var date = new Date(info.event.start);
					if(comparisonDate(date)&&compResCheck(date)){
					    var result = parseInt($("#resultPri").text());
						var pri = info.event.title;
						var time = getFormatDate(info.event.start);
					    
					    if(className.indexOf('INACTIVE') != -1){
					    	$("#activeRes").empty();
					    	unCheck($(".ACTIVE")); 
					    	
					    	$("#activeRes").append($("<input type='hidden' "+
					    		"id='RES_TIME' name='RES_TIME' value='"+time+"'>"));
					    	$("#activeRes").append($("<input type='hidden' "+
						    		"id='RES_PRI' name='RES_PRI' value='"+pri+"'>"));
					    	result=parseInt(pri);
					    	check(info.el);
					    }else if(className.indexOf('ACTIVE') != -1){
					    	unCheck(info.el);
					    	result-=parseInt(pri);
					    	$("#activeRes").empty();
					    }
					    $("#resultPri").text(""+result);
					}
				},
				locale : 'ko',
				titleFormat: {month: 'short', year: 'numeric'},
				monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] ,
				monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				buttonText: {today: '오늘', month: '월', week: '주', day: '일' , prev : '이전', next:'다음'}
			});

			calendar.render();
			$("#calBtn").click(function(){
				if($("#RES_TIME").length >0){
					var events = calendar.getEvents();
					var form = $("#activeRes")[0];
					$(form).append($("<input type='hidden' name = 'SPACE_ID' value='"+$('#spaceId').val()+"'>"));
					form.action = "<c:url value='/res/resPay'/>";
					form.submit();
				}else{
					alert("예약 확인 후 클릭해주세요");
				}
			});
		});
	function setCalEvent(event){
		var title;
		var time;
		$(".resDiv").each(function(index, item){
			titles = $(item).find(".res_date").val();
			pri = $(item).find(".res_pri").val();
			if($("#res_type").val()=='DATE'){
				event.push({
					title: pri,
					start: titles,
					end:titles,
					className : 'INACTIVE',
					backgroundColor: '#f7e600',
				    borderColor:'#e6d500',
				    textColor:'#c56a00',
					allDay:true
				});
			}else if($("#res_type").val()=='DAY' && pri!='0'){
				event.push({ 
				      title: pri,
				      daysOfWeek:[getDayOfWeek(titles)],
				      backgroundColor: '#f7e600',
				      borderColor:'#e6d500',
				      textColor:'#c56a00',
					  className : 'INACTIVE'
				});
			}
		});
		
	}
	function getDayOfWeek(data){
		if(data == 'SUN') return '0';
		if(data == 'MON') return '1';
		if(data == 'TUE') return '2';
		if(data == 'WED') return '3';
		if(data == 'THU') return '4';
		if(data == 'FRI') return '5';
		if(data == 'SAT') return '6';
	}
	function comparisonDate(date){
		var now = new Date();
		if(date.getFullYear() < now.getFullYear()){
			return false;
		}else if(date.getFullYear() > now.getFullYear()){return true;}
		if(date.getMonth() < now.getMonth()){
			return false;
		}else if(date.getMonth() >now.getMonth()){return true;}
		if(date.getDate() > now.getDate()){
			return true;
		}
		return false;
	}
	function compResCheck(time){
		if($("input[value*='"+time+"'][name='compRes']").length>0){
			return false;
		}
		return true;
	}
	function check(info){
		$(info).css("backgroundColor", '#f89b00');
	    $(info).css("borderColor",'#e78a00');
	    $(info).css("color","#f7e600");
    	$(info).removeClass('INACTIVE');
    	$(info).addClass('ACTIVE');
	}
	function unCheck(info){
		$(info).css("backgroundColor", '#f7e600');
		$(info).css("borderColor", '#e6d500');
	    $(info).css("color","#c56a00");
    	$(info).removeClass('ACTIVE');
    	$(info).addClass('INACTIVE');
    	/* info.el.style.borderColor = '#e6d500'; */
	}
	</script>
</body>
</html>