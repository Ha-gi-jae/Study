<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<head>
<style>
.redcircle {
	color: red;
	font-size: 2.0rem;
}

.orangecircle {
	color: orange;
	font-size: 2.0rem;
}

.bluecircle {
	color: blue;
	font-size: 2.0rem;
}
</style>
</head>
<title></title>

<body>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
	<script type="text/x-handlebars-template"
		id="cnfrm-dgnss-list-template">
{{#each .}}
          <tr style="cursor: pointer;"
			onclick="showDetail_marker('{{cnfmNo}}', '{{manageNo}}', '{{pstiAdres}}', '{{areaNo}}')"
			data-inst-no="{{pbhtNo}}" data-manage-no="{{manageNo}}" data-cnfmNo-no="{{cnfmNo}}"
            class="each-cnfm-element">
            <td>{{pstiNm}}</td>
            <td>{{prettifyDate inYmd}}</td>
            <td>{{sttusCode}}</td>
          </tr>
{{/each}}

</script>

<script type="text/x-handlebars-template" id="inptnt-pagination-template">
    <li class="page-item each-inptnt-pagination-element"><a class="page-link" href="1"> <i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
    </a></li>
    <li class="page-item each-inptnt-pagination-element"><a class="page-link" href="{{#if prev}}{{prevPageNum}}{{/if}}"> <i class="fas fa-angle-left" style="color:#1a4f72;"></i>
    </a></li>

{{#each pageNum}}
    <li class="page-item each-inptnt-pagination-element {{signActive this}}" ><a class="page-link" href="{{this}}" >{{this}}</a></li>
{{/each}}

    <li class="page-item each-inptnt-pagination-element"><a class="page-link" href="{{#if next}}{{nextPageNum}}{{/if}}"> <i class="fas fa-angle-right" style="color:#1a4f72;"></i>
    </a></li>
    <li class="page-item each-inptnt-pagination-element"><a class="page-link" href="{{realEndPage}}"> <i class="fas fa-angle-double-right" style="color:#1a4f72;"></i>
</a></li>
</script>
		<!-- onclick="" map 세팅   -->
	<script type="text/x-handlebars-template" id="hspt-list-template">
{{#each .}}
          <tr style="cursor: pointer;"
			onclick = "hspt_set_detail('{{instAdres}}', '{{instNm}}', '{{sckbdCnt}}', '{{opRate}}', '{{hsptNo}}','{{rmndSckbdCnt}}');"
			data-inst-no="{{pbhtNo}}" data-manage-no="{{manageNo}}" data-hspt-no="{{hsptNo}}"
            class="each-hspt-result-element">
            <td style="text-align: left;">{{instNm}}</td>
            <td>{{rmndSckbdCnt}}/{{sckbdCnt}}</td>
            <td><span class="badge badge-{{fnBadge opRate}}" style="width: 35px;">{{opRate}}%</span></td>
          </tr>
{{/each}}
</script>
<script type="text/x-handlebars-template" id="hspt-pagination-template">
    <li class="page-item each-hspt-pagination-element"><a class="page-link" href="1"> <i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
    </a></li>
    <li class="page-item each-hspt-pagination-elementt"><a class="page-link" href="{{#if prev}}{{prevPageNum}}{{/if}}"> <i class="fas fa-angle-left" style="color:#1a4f72;"></i>
    </a></li>

{{#each pageNum}}
    <li class="page-item each-hspt-pagination-element {{signHsptActive this}}" ><a class="page-link" href="{{this}}" >{{this}}</a></li>
{{/each}}
    <li class="page-item each-hspt-pagination-element"><a class="page-link" href="{{#if next}}{{nextPageNum}}{{/if}}"> <i class="fas fa-angle-right" style="color:#1a4f72;"></i>
    </a></li>
    <li class="page-item each-hspt-pagination-element"><a class="page-link" href="{{realEndPage}}"> <i class="fas fa-angle-double-right" style="color:#1a4f72;"></i>
</a></li>
</script>


<script type="text/javascript">

Handlebars.registerHelper({
"prettifyDate" : function(timeValue){
  var dateObj = new Date(timeValue);
  var year = dateObj.getFullYear();
  var month = dateObj.getMonth() + 1;
  var date = dateObj.getDate();
  return year + "-" + month + "-" + date;
},
"signActive" : function(pageNum){
  if(pageNum == cnfmPage) return 'active';
},
"signHsptActive" : function(pageNum){
  if(pageNum == hsptPage) return 'active';
},
"fnBadge" : function(opRate){
	if(opRate > 79){
		return "danger";
	}
	if(opRate < 71){
		return "primary";
	}
	else{
		return "warning";
	}
}

});

</script>
<script>

var cnfmPage = 1;
var hsptPage = 1;
var cnfrmUrl = '<%=request.getContextPath()%>/rest-pbht/cnfrm-list';
var hsptUrl = '<%=request.getContextPath() %>/rest-pbht/main-hspt-list';

window.onload = function(){
	
    
	list_go(cnfrmUrl, cnfmPage);
	hspt_list_go(hsptUrl, hsptPage);
		
	$('ul.cnfm-pagination').on('click','li a',function(event){
		if($(this).attr("href")) {
		cnfmPage=$(this).attr("href");
		getPage(cnfrmUrl, make_form(cnfmPage));
//			list_go(url, pageParam, targetId, pagenationId);
		return false;
	}
	});
		
	$('ul.hspt-pagination').on('click','li a',function(event){
		
		var adres = $('#psti_adres').html();
		if($(this).attr("href")) {
		hsptPage=$(this).attr("href");
		getHsptList(hsptUrl, hspt_make_form(hsptPage), adres);
//			list_go(url, pageParam, targetId, pagenationId);
		}
		
		return false;

	});
	
}

function make_form(pageParam){
  
  var jobForm=$('#jobForm');
  if(!pageParam) cnfmPage = 1;
  
  cnfmPage = pageParam;
  
  jobForm.find("[name='page']").val(cnfmPage);
  jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
//  jobForm.find("[name='perPageNum']").val(2);
  
  return jobForm;
}
function hspt_make_form(pageParam){
  
  var hspt_jobForm=$('#hspt-jobForm');
  if(!pageParam) hsptPage = 1;
  
  hsptPage = pageParam;
  
  hspt_jobForm.find("[name='page']").val(hsptPage);
  hspt_jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
 
//  jobForm.find("[name='perPageNum']").val(2);
  
  return hspt_jobForm;
}

function list_go(cnfrmUrl, pageParam){
	
  getPage(cnfrmUrl, make_form(pageParam));
}

function hspt_list_go(hsptUrl, pageParam, adres){
	getHsptList(hsptUrl, hspt_make_form(pageParam), adres);
}

function getPage(handelbarsProcessingURL, form){
	form.find('input[name="perPageNum"]').val(10);
	console.log(form.find('input[name="perPageNum"]')[0]);
	$.ajax({
    url : handelbarsProcessingURL,
    type : 'get',
    dataType : 'json',
    data : form.serialize(),
    success : function(dataMap){
    	
    	if(dataMap.cfdList.length == 0){
    		$('#cnfmList').html("데이터가 없습니다.");
    		$('#dgnssButton').attr("disabled", true);
			dataMap.pageMaker.endPage = 1;	        
    		printPagination(dataMap.pageMaker, $('#inptnt-list-pagination-ul'), $('#inptnt-pagination-template'), '.each-inptnt-pagination-element');
    	}else{
    		printData(dataMap.cfdList, $('#cnfrm-dgnss-list-table-tbody'), $('#cnfrm-dgnss-list-template'), '.each-cnfm-element');
    	    printPagination(dataMap.pageMaker, $('#inptnt-list-pagination-ul'), $('#inptnt-pagination-template'), '.each-inptnt-pagination-element');
    	    showDetail_marker(dataMap.cfdList[0].cnfmNo, dataMap.cfdList[0].manageNo, dataMap.cfdList[0].pstiAdres, dataMap.cfdList[0].areaNo)
    	}
    },
    error : function(error){
      alert('error' + error.status);
    }
  })
 }
 
function getHsptList(handelbarsProcessingURL, form, adres){

	$.ajax({
    url : handelbarsProcessingURL,
    type : 'get',
    dataType : 'json',
    data : form.serialize(),
    success : function(dataMap){
    	
    	if(dataMap.dhbList.length == 0){
    		$('#hsptList').html("데이터가 없습니다.");
    		$('#dgnssButton').attr("disabled", true);
    		dataMap.pageMaker.endPage = 1;
    		printPagination(dataMap.pageMaker, $('#hspt-list-pagination-ul'), $('#hspt-pagination-template'), '.each-hspt-pagination-element');
    	}else{
    		printData(dataMap.dhbList, $('#hspt-list-table-tbody'), $('#hspt-list-template'), '.each-hspt-result-element');
    	    printPagination(dataMap.pageMaker, $('#hspt-list-pagination-ul'), $('#hspt-pagination-template'), '.each-hspt-pagination-element');
    	    initKakaoMap(dataMap.dhbList, adres);
    	}
    },
    error : function(error){
      alert('error' + error.status);
    }
  })
 }
 
function printData(jsonArray, target, templateObject, removeClass){

	// templateObject를 json data를 받으면 마크업을 return하는 function template로 반환한다.
	var template = Handlebars.compile(templateObject.html());
	
	// 함수 template에 파라미터 jsonArray를 넣어서 실행하여 html을 생성한다.
	var html = template(jsonArray);
	
	// 해당 html요소를 append하기 전에 기존에 있던 내용을 지운다. (안그러면 리스트 목록이 10개씩만 보이는 게 아니라 10개, 20개, 30개 등 페이지 클릭할 때마다 10개씩 추가되므로)
	$(removeClass).remove();
	
	// html요소를 append한다.
	target.append(html);
}

function printPagination(pageMaker, target, templateObject, removeClass){
	
	
	var pageNum = new Array(pageMaker.endPage-pageMaker.startPage+1);
	
	for(var i=0;i<pageMaker.endPage-pageMaker.startPage+1;i++){
		pageNum[i]=pageMaker.startPage+i;
	}	
	pageMaker.pageNum=pageNum;  
	pageMaker.prevPageNum=pageMaker.startPage-1;
	pageMaker.nextPageNum=pageMaker.endPage+1;
	
	var template=Handlebars.compile(templateObject.html());	
	var html = template(pageMaker);	
	target.html("").html(html);
}

</script>

<script>

function showDetail_marker(cnfmNo, manageNo, pstiAdres, areaNo){
	
	var trs = $('tr.each-cnfm-element');
	 
	trs.removeClass('on');
	 
	var target = $('tr[data-cnfmNo-no="'+cnfmNo+'"]');
	 
	target.addClass('on');
	
	
	$('#hspt-jobForm').find("[name='areaNo']").val(areaNo);
	$('#inst_nm').html("");
	$('#dgnssGo').find("[name='manageNo']").val(manageNo);
	$.ajax({
		url : '<%=request.getContextPath()%>/rest-pbht/cnfrm-wait-datail',
		type : 'get',
		dataType : 'json',
		data : {'cnfmNo' : cnfmNo, 'manageNo' : manageNo},
		success : function(dataMap) {
			console.log(dataMap);
			$('#psti_nm').html(dataMap.pstiNm);
			$('#gender').html(dataMap.gender);
			$('#bir').html(dataMap.bir);
			$('#psti_adres').html(dataMap.pstiAdres);
			$('#psti_telno').html(dataMap.pstiTelno);
			$('#symptms').html(dataMap.symptms);
			
			$('#openButton').attr('data-manage-no',dataMap.manageNo);
			$('#openButton').attr('data-name', dataMap.pstiNm);
			var page = 1
			hspt_list_go(hsptUrl, page, dataMap.pstiAdres);
		},
		error : function(error) {
			alert('error' + error.status);
		}
	})
	
					
		}

function prettifyDate(timeValue) {
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth() + 1;
	var date = dateObj.getDate();
	return year + "-" + month + "-" + date;
}


function hspt_set_detail(addr, instNm, sckbdCnt, opRate, hsptNo, rmndSckbdCnt){
	
	if(!$('#dgnssGo').find('[name=manageNo]').val()){
		alert("진료신청 대기환자가 없습니다.");
		$('#dgnssButton').attr("disabled", true);
		return;
	}
		
	
	var trs = $('tr.each-hspt-result-element');
	 
	trs.removeClass('on');
	 
	var target = $('tr[data-hspt-no="'+hsptNo+'"]');
	 
	target.addClass('on');
	
	$('#inst_nm').html(instNm);
	$('#dgnssGo').find("[name='hsptNo']").val(hsptNo);
	$('#dgnssGo').find("[name='rmndSckbdCnt']").val(rmndSckbdCnt);
	
	if(rmndSckbdCnt <= 0){
   		$('#dgnssButton').attr("disabled", true);
   	}else{
   		$('#dgnssButton').attr("disabled", false);
   	}
  	
	
	mapOpen(addr, instNm, rmndSckbdCnt, opRate);
}

function marker_check(opRate){
	
	var markerImage = "";
	
	if(opRate >= 80){
	    markerImage = new kakao.maps.MarkerImage(
   	    '<%=request.getContextPath() %>/resources/image/markerRed.png',
   	    new kakao.maps.Size(35, 35), new kakao.maps.Point(13, 34));
   }
   
   if(opRate >= 70 && opRate < 80){
  	    markerImage = new kakao.maps.MarkerImage(
	    '<%=request.getContextPath() %>/resources/image/markerYellow.png',
	    new kakao.maps.Size(35, 35), new kakao.maps.Point(13, 34));
   }
   if(opRate < 70){
   		markerImage = new kakao.maps.MarkerImage(
		'<%=request.getContextPath() %>/resources/image/markerBlue.png',
		new kakao.maps.Size(35, 35), new kakao.maps.Point(13, 34));
   }
   
   return markerImage;
}

function dgnssGo(){
	
	
	
	if(!$('#dgnssGo').find('[name=manageNo]').val()){
		alert("진료신청 대기환자가 없습니다.");
		return;
	}
	
	if(!$('#dgnssGo').find("[name=hsptNo]").val()){
		alert("병원을 선택해 주세요.");
		return;
	}
	
	if($('#dgnssGo').find("[name=rmndSckbdCnt]").val() == 0){
		alert("잔여병상이 없습니다.");
		return;
	}
	
	var hsptNo = $('#dgnssGo').find("[name=hsptNo]").val()	
	
	// alert(hsptNo);
	$.ajax({
	    url : '<%=request.getContextPath() %>/rest-pbht/rmndSckbdCnt-check',
	    type : 'post',
	    dataType : 'json',
	    data : {'hsptNo':hsptNo},
	    success : function(result){
	
	    	if(result <= 0){
	    		alert("잔여병상이 부족합니다.");
	    	}else{
	    		var check = confirm("진료신청을 하시겠습니까?");
	    		if(check) $('#dgnssGo').submit();
	    	}
	    },
	    error : function(error){
	      alert('error' + error.status);
	    }
	  })
	
}
function showMore(type){
	  
//  alert(type);
  if(type == "A"){
    parent.goPage('<%=request.getContextPath()%>/pbhlth/cnfrm-list','M030200');
  }
}

</script>


	<input type="hidden" value="대전광역시 서구 만년동 340" id="loginCode">
	<div class="row" style="box-sizing: content-box; padding: 1px;">
		<div class="col-lg-3" style="margin-top: 10px;">
			<div class="card">
				<div class="card-body pb-0" style="margin-bottom: 11px;">
					<table class="table table-bordered text-center">
						<thead>
							<tr>
								<th colspan="2" style="font-size: 17px;text-align: left;background: white;border-bottom: 1px solid #dee2e6;">범례</th>
							</tr>
							<tr>
								<th>마커</th>
								<th>병상가동률</th>
							</tr>
						</thead>
						<tbody>
							
							<tr>
								<td class="pt-0 pb-0"><span class="redcircle">●</span></td>
								<td>80% 이상</td>
							</tr>
							<tr>
								<td class="pt-0 pb-0"><span class="orangecircle">●</span></td>
								<td >71 ~ 79%</td>
							</tr>
							<tr>
								<td class="pt-0 pb-0"><span class="bluecircle">●</span></td>
								<td>70% 이하</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="card-body pt-0 pb-0">
					<div class="ddoing" style="height: 489px;">
						<table class="table table-bordered table-hover text-nowrap" style="text-align: center;font-size: 15px;table-layout: fixed;">
							<thead>
								<tr>
									<th colspan="2" style="text-align: left;vertical-align: middle;background: white;border-bottom: 1px solid #dee2e6;border-right: none;">
									<span style="font-size: 17px;text-align: left;">진료신청 대기환자 목록</span></th>
									<th colspan="1" style="background: white;text-align:right;
														   border-bottom: 1px solid #dee2e6;border-left: none;padding-top: 0px;
   														   padding-bottom: 15px;">
										<button type="button" class="btn btn-tool" onclick="showMore('A');">
											<i class="fas fa-bars" style="color: black"></i>
										</button>
									</th>
								</tr>
								<tr>
									<th style="text-align: center;width: 33%;">이름</th>
									<th style="text-align: center;width: 33%;">확진일</th>
									<th style="text-align: center;width: 33%;">결과</th>
								</tr>
							</thead>
							<tbody id="cnfrm-dgnss-list-table-tbody">
								<tr class="each-cnfm-element">
									<td colspan="3" id="cnfmList">데이터 로딩중 입니다.</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="card-footer clearfix" style="background-color: white;">
						<ul class="cnfm-pagination pagination justify-content-center m-0"
							id="inptnt-list-pagination-ul">
						</ul>
					</div>
					<form id="jobForm">
						<input type='hidden' name="page" value="" /> 
						<input type='hidden' name="perPageNum" value="" /> 
						<input type='hidden' name="displayPageNum" value="5" /> 
					</form>
				</div>
			</div>
		</div>

		<div class="col-lg-9" style="margin-top: 10px;">
			<div class="card">
				<div class="card-body pb-0">
					<div class="row">
						<div class="col-md-6">
							<div class="ddoing" style="height: 221px;">
							<table
								class="table table-sm table-bordered table-hover text-nowrap"
								style="text-align: center; margin-bottom: 5px;">
								<thead>
									<tr>
										<th colspan="2"
											style="padding: 9.75px; text-align: left; height: 46px;background: white;border-bottom: 1px solid #dee2e6;border-right:none;">
											<span style="font-size: 17px;">병원리스트</span>
										</th>
									</tr>
									<tr>
										<th class="col-md-6">병원명</th>
										<th class="col-md-3">잔여병상 수</th>
										<th class="col-md-3">병상가동률</th>
									</tr>
								</thead>
								<tbody id="hspt-list-table-tbody">
									<tr class="each-hspt-result-element">
										<td colspan="3" id="hsptList">데이터 로딩중 입니다.</td>
									</tr>
								</tbody>
							</table>
							</div>
							<div class="card-footer pt-0 pb-0 pr-0" 
								style="background: white;text-align: center;">
								<ul id="hspt-list-pagination-ul"
									class="hspt-pagination pagination pagination-sm justify-content-center m-0 float-right">
								</ul>
							</div>
					<form id="hspt-jobForm">
						<input type='hidden' name="page" value="" /> 
						<input type='hidden' name="perPageNum" value="" /> 
						<input type='hidden' name="areaNo" value="" />
					</form>


						</div>
						<div class="col-md-6">
							<table class="table table-bordered text-nowrap">
								<thead>
									<tr>
										<th colspan="4"
											style="text-align: left; vertical-align: middle; margin-bottom: 4px;background: white;border-bottom: 1px solid #dee2e6;">
											<span style="margin-top: 7px; font-size: 17px;">진료신청</span>
											<button id="dgnssButton" type="submit" class="btn btn-success btn-sm" onclick="dgnssGo();"
												style="background-color: #1a4f72; width: 22%;border-color: #1a4f72; float: right;">진료신청</button>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th class="col-md-3"><strong>성명</strong></th>
										<td class="col-md-3" id="psti_nm"></td>

										<th class="col-md-3"><strong>생년월일</strong></th>
										<td class="col-md-3" id="bir"></td>
									</tr>

									<tr>
										<th><strong>성별</strong></th>
										<td id="gender"></td>

										<th><strong>연락처</strong></th>
										<td id="psti_telno"></td>
									</tr>

									<tr>
										<th><strong>주소</strong></th>
										<td id="psti_adres" colspan="3"></td>
									</tr>

									<tr>
										<th><strong>증상</strong></th>
										<td id="symptms" colspan="3"></td>
									</tr>

									<tr>
										<th><strong>병원명</strong></th>
										<td id="inst_nm" colspan="3"></td>
									</tr>
								</tbody>
							</table>
							<form id="dgnssGo" action="cnfrm-dgnss-registgo">
								<input type='hidden' name="manageNo" value="" /> 
								<input type='hidden' name="hsptNo" value="" /> 
								<input type='hidden' name="rmndSckbdCnt" value="" /> 
							</form>
						</div>
					</div>
				</div>
				<div class="card-body pt-0">
					<div class="row">
						<div id="mapLocation" class="col-md-12">
							<div id="map" style="width: 100%; height: 481px;"></div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=553e55e7a953a05a2adfe2bfc2932452&libraries=services"></script>
	<script>

	function mapOpen(addr, instNm, rmndSckbdCnt, opRate){
		  $('#map').remove();
      	  var html="<div id='map' style='width: 100%; height: 481px;'></div>";
      	  $('#mapLocation').append(html);   
        var mapContainer=document.getElementById('map');		
    		var mapOption = {
    			center : new kakao.maps.LatLng(36.35043075681321,
    					127.3848294267714), // 지도의 중심좌표
    			level : 3
    		// 지도의 확대 레벨
    		};

    		// 지도를 생성합니다    
    		var map = new kakao.maps.Map(mapContainer, mapOption); 

    		// 주소-좌표 변환 객체를 생성합니다
    		var geocoder = new kakao.maps.services.Geocoder();
    			
    			// 주소로 좌표를 검색합니다
    			geocoder.addressSearch(addr,function(result, status) {
    								// 정상적으로 검색이 완료됐으면 
    								if (status === kakao.maps.services.Status.OK) {
    									
    									// 이동할 위도 경도 위치를 생성합니다 
    								    var moveLatLon = new kakao.maps.LatLng(result[0].y, result[0].x);
    								    
    								    // 지도 중심을 이동 시킵니다
    								    map.setCenter(moveLatLon);
									
    									var coords = new kakao.maps.LatLng(
    											result[0].y, result[0].x);
    									
    									
    									var markerImage = marker_check(opRate);
    									
    									// 결과값으로 받은 위치를 마커로 표시합니다
    									var marker = new kakao.maps.Marker({
    										map : map,
    										position : coords,
    										image: markerImage
    									});

    									// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
    									/* var iwContent = '<div class="markerInfo" style="width:150px;text-align:center;padding:6px 0;">'
    											+ target.attr('data-inst-nm') + '<br>병상수:' + target.attr('data-rmnd-sckbd-cnt')
    											+ '<br><a href="https://map.kakao.com/link/to/33.450701,126.570667" style="color:blue" target="_blank">길찾기</a>'+ '</div>';  */
							var iwContent = '<div class="markerInfo" style="width:170px;text-align:left;padding-bottom: 0;padding-top: 3px;display:block; ">'
										+ "<span style='margin-left:3px;'>" + "<b>" +instNm+"</b>" + "</span>" 
										+ "<br><span style='margin-left:3px;'>잔여병상수 :" + rmndSckbdCnt +", " + "가동률:" +opRate	+"%</span>"	
										+ '<br> <button class="btn btn-block btn-secondary btn-xs" type="button" style="width: 100%;background:#1a4f72;border-color:#1a4f72;">'
								        + '<a href="https://map.kakao.com/link/to/'+instNm+','+result[0].y +','+ result[0].x+'" style="color:blue;color:white" target="_blank">길찾기</a>'
										+ '</buttom></div>';
    									// 인포윈도우를 생성합니다
    									var infowindow = new kakao.maps.InfoWindow(
    											{
    												content : iwContent
    											});

    									infowindow.open(map, marker);  
  									// 마커에 클릭이벤트를 등록합니다
  									kakao.maps.event.addListener(marker, 'click', function() {
  										  
  										var markerDisplay = $('.markerInfo').css('display');
  										if(markerDisplay =='block') {
  											infowindow.close();
  										}else{
  									      // 마커 위에 인포윈도우를 표시합니다
  									      infowindow.open(map, marker);  
  										}
  										
  									});
    								}
    							});
    		

    		var zoomControl = new kakao.maps.ZoomControl();
    		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

    			
    		// 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
    		kakao.maps.event.addListener(map, 'zoom_changed', function() {

    			// 지도의 현재 레벨을 얻어옵니다
    			var level = map.getLevel();

    			var message = '현재 지도 레벨은 ' + level + ' 입니다';
    			var resultDiv = document.getElementById('result');

    		});
    	}
</script>

<script>
                 
                 function addToMarker(addrs, geocoder, map, instNm, rmndSckbdCnt, opRate) {
                     // 주소로 좌표를 검색합니다
                     geocoder.addressSearch(addrs, function(result, status) {
                        // 정상적으로 검색이 완료됐으면 
                        if (status === kakao.maps.services.Status.OK) {

                           var coords = new kakao.maps.LatLng(
                              result[0].y, result[0].x);
							
                           
                           var markerImage = marker_check(opRate);
                           
                           // 결과값으로 받은 위치를 마커로 표시합니다
                           var marker = new kakao.maps.Marker({
                              map : map,
                              position : coords,
                              image: markerImage
                           });
         
                           /* // 인포윈도우로 장소에 대한 설명을 표시합니다
                           var infowindow = new kakao.maps.InfoWindow({
                              content : '<div style="width:150px;text-align:center;padding:6px 0;">'+obj.name+'</div>'
                           });
                           
                                infowindow.open(map, marker); */
                           
                           // 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
                           var iwContent = '<div class="markerInfo" style="width:170px;text-align:left;padding-bottom: 0;padding-top: 3px;display:block; ">'
									+ "<span style='margin-left:3px;'>" +"<b>" +instNm +"</b>"+ "</span>" 
									+ "<br><span style='margin-left:3px;'>잔여병상수 :" + rmndSckbdCnt +", " + "가동률:" +opRate	+"%</span>"	;
                        // 인포윈도우를 생성합니다
                           var infowindow = new kakao.maps.InfoWindow({
                               content : iwContent
                           });

                           // 마커에 마우스오버 이벤트를 등록합니다
                           kakao.maps.event.addListener(marker, 'mouseover', function() {
                             // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
                               infowindow.open(map, marker);
                           });

                           // 마커에 마우스아웃 이벤트를 등록합니다
                           kakao.maps.event.addListener(marker, 'mouseout', function() {
                           // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
                           infowindow.close();
                           });
                        }
                     });
                  }        
                 
                 function initKakaoMap(dhbList, adres){
                	  $('#map').remove();
                  	  var html="<div id='map' style='width: 100%; height: 481px;'></div>";
                  	  $('#mapLocation').append(html);  
                	 
                  	  var mapContainer = document.getElementById('map'); // 지도를 표시할 div
       
                      var mapOption = {
                         center : new kakao.maps.LatLng(36.35043075681321, 127.3848294267714), // 지도의 중심좌표
                         level : 9
                      // 지도의 확대 레벨
                      };
					
                      // 지도를 생성합니다    
                      var map = new kakao.maps.Map(mapContainer, mapOption);
                         
                      // 주소-좌표 변환 객체를 생성합니다
                      var geocoder = new kakao.maps.services.Geocoder();
                     
                      geocoder.addressSearch(adres,function(result, status) {
							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {
								
								// 이동할 위도 경도 위치를 생성합니다 
							    var moveLatLon = new kakao.maps.LatLng(result[0].y, result[0].x);
								
							    // 지도 중심을 이동 시킵니다
							    map.setCenter(moveLatLon);
							    
							    var circle = new kakao.maps.Circle({
							        center : new kakao.maps.LatLng(result[0].y, result[0].x),  // 원의 중심좌표 입니다 
							        radius: 10000, // 미터 단위의 원의 반지름입니다 
							        strokeWeight: 5, // 선의 두께입니다 
							        strokeColor: '#75B8FA', // 선의 색깔입니다
							        strokeOpacity: 0.6, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
							        strokeStyle: 'solid', // 선의 스타일 입니다
							        fillColor: '#CFE7FF', // 채우기 색깔입니다
							        fillOpacity: 0.4  // 채우기 불투명도 입니다   
							    }); 

							    // 지도에 원을 표시합니다 
							    circle.setMap(map); 
							    
							    var coords = new kakao.maps.LatLng(
			                              result[0].y, result[0].x);
							    
							    var userImage = new kakao.maps.MarkerImage(
										'<%=request.getContextPath() %>/resources/image/streetview_user_person_5384.png',
								   	    new kakao.maps.Size(40, 35), new kakao.maps.Point(13, 34));
								
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords,
									image: userImage
								});

							}
                      });
                      
                      $.each(dhbList, function(idx, dhb){
                         addToMarker(dhb.instAdres, geocoder, map, dhb.instNm, dhb.rmndSckbdCnt, dhb.opRate);
                      })
   
                  var zoomControl = new kakao.maps.ZoomControl();
                  map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

                  // 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
                  kakao.maps.event.addListener(map, 'zoom_changed', function() {        
                      
                      // 지도의 현재 레벨을 얻어옵니다
                      var level = map.getLevel();
                      
                      var message = '현재 지도 레벨은 ' + level + ' 입니다';
                      var resultDiv = document.getElementById('result');  
                      
                  });
   
                 }
                  </script>
</body>