<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=553e55e7a953a05a2adfe2bfc2932452&libraries=services"></script>
</head>
<title>진료신청</title>

<body>
	<section class="content">
		<div class="row" style="margin: 1px;">
			<div class="col-lg-6 pl-0">
				<div class="card" style="margin-left: 10px; margin-top: 1px;">
					<div class="card-header" style="background-color: #1a4f72">
						<h3 class="card-title">
							<span style="color: white; font-size: 20px;">진료 신청</span>
						</h3>
					</div>
					<div class="card-body">
						<table class="table table-bordered">
							<tr style="text-align: center;">
								<th>입소자 성명</th>
								<td id="psti-nm">${pstiNm}</td>
							</tr>
						</table>
					</div>
					<div id="" class="card-header pt-0">
						<div class="row">
							<div class="card-tools col-md-4">
								<ul class="nav nav-pills ml-auto p-0 float-left" role="tablist">
									<li class="nav-item">
										<a onclick="deleteSearch()" class="nav-link active" id="custom-hspt-bookmark-list-tab" data-toggle="pill" href="#custom-hspt-bookmark-list" role="tab" aria-controls="custom-tabs-three-home" aria-selected="true">연계기관</a>
									</li>
									<li class="nav-item">
										<a onclick="makeSearch()" class="nav-link" id="custom-hspt-all-list-tab" data-toggle="pill" href="#custom-hspt-all-list" role="tab" aria-controls="custom-tabs-three-profile" aria-selected="false">전체보기</a>
									</li>
								</ul>
							</div>
							<div class="col-md-1"></div>
							<div id="placeSearch" class="col-md-7" style="visibility: hidden; height: 30px;">
								<div class="input-group float-right" style="width: 98%;">
									<!-- search bar -->
									<select class="form-control " name="searchType" id="searchType">
										<option value="" ${pageMaker.cri.searchType eq '' ? 'selected':''}>검색</option>
										<option value="adres" ${pageMaker.cri.searchType eq 'adres' ? 'selected':''}>주소</option>
										<option value="name" ${pageMaker.cri.searchType eq 'name' ? 'selected':''}>병원명</option>
										<option value="telno" ${pageMaker.cri.searchType eq 'telno' ? 'selected':''}>연락처</option>
									</select>
									<!-- keyword -->
									<input id="keywordId" class="form-control" type="text" name="keyword" value="${pageMaker.cri.keyword }" style="width: 18%; display: inline-block;" /> <span class="input-group-append">
										<button id="searchBtn" class="btn btn-primary" type="button" style="background: #1a4f72; color: #ffffff; border-color: #5b6f90; display: inline-block; margin-bottom: 4px; margin-left: -7px;" data-card-widget="search" onclick="list_go('<%=request.getContextPath()%>/rest-ltct/hspt-bookmark-list', 1, '#hspt-all-list-table-tbody', '#inptnt-all-pagination-template' );" data-url="<%=request.getContextPath()%>/rest-ltct/hspt-bookmark-list">
											<i class="fa fa-fw fa-search"></i>
										</button>
									</span>
									<!-- end : search bar -->
								</div>
							</div>
						</div>
					</div>
					<div class="card-body pt-3">
						<div class="row" style="justify-content: flex-end">
							<div class="col-md-8"></div>
							<div class="col-md-1 pl-0 pr-0" style="text-align: right;box-sizing: content-box;padding-top: 0.1%;">
								<input type="checkbox" id="rmndSckbdCntCheck" onclick="rmndSckbdCntCheckBox();" />
							</div>
							<div class="col-md-2 pr-0 pl-1" style="text-align: left">
								<span style="font-size: 13px;font-weight: bold;">잔여병상 보기</span>
							</div>
						</div>
						<div class="tab-content" id="custom-tabs-two-tabContent">
							<div class='tab-pane fade show active' id="custom-hspt-bookmark-list" role="tabpanel" aria-labelledby="custom-tabs-three-home-tab">
								<%@ include file="./hspt-bookmark-list.jsp"%>
							</div>
							<div class='tab-pane fade' id="custom-hspt-all-list" role="tabpanel" aria-labelledby="custom-tabs-three-profile-tab">
								<%@ include file="./hspt-all-list.jsp"%>
							</div>
						</div>
					</div>

				</div>
			</div>

			<div class="col-lg-6 pr-0">
				<div class="card" style="margin-top: 1px; width: 98%;">
					<div class="card-header" style="background-color: #1a4f72">
						<h3 class="card-title">
							<span style="color: white; font-size: 20px;">병원 정보</span>
						</h3>
					</div>
					<div class="card-body pb-0" id="mapLocation">
						<input id="setHsptNo" type="hidden" value=""/>
						<input id="setHsptAdres" type="hidden"  value="";/>
						<table class="table table-bordered" style="border-bottom-color: white;">
							<tr style="text-align: center;">
								<th class="col-md-3">병원명</th>
								<td id="inst_nm" class="col-md-7"></td>
							</tr>
						</table>
						<div class="ddoing" style="height: 15px;">
						</div>
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th style="width: 15%">
										<strong>가동률</strong>
									</th>
									<td style="width: 20%" id="op_rate"></td>
									<th style="width: 15%">
										<strong>연락처</strong>
									</th>
									<td style="width: 20%" id="inst_telno"></td>
									<th style="width: 15%">
										<strong>직원수</strong>
									</th>
									<td style="width: 15%" id="emp_cnt"></td>
								</tr>

								<tr>
									<th>
										<strong>주소</strong>
									</th>
									
									<td colspan="5" id="inst_adres"></td>
								</tr>

							</tbody>
						</table>
					</div>
				<div class="row" style="height: 38px;padding-right: 2.8%;">
					<div class="col-md-4"></div>
					<div class="col-md-4">
						<button id="dgnssBtn" type="button" style="background-color: #1a4f72; border-color: #1a4f72;" class="btn btn-block btn-primary " onclick="dgnssGo();">진료 신청</button>
					</div>
					<div class="col-md-4">
						<button type="button" onclick="Close();" class="btn btn-block btn-danger ">닫기</button>
					</div>
				</div>
				</div>
				
				<!-- <div id="map"
					style="width: 651px; height: 600px; margin-left: 19px;">
			    </div> -->
			</div>
		</div>
		<form id="jobForm">
			<input type='hidden' name="page" value="" /> 
			<input type='hidden' name="perPageNum" value="" /> 
			<input type='hidden' name="searchType" value="" /> 
			<input type='hidden' name="keyword" value="" />  
			<input type='hidden' name="typeCode" value="" /> 
			<input type='hidden' name="manageNo" value="${manageNo}" />
			<input type='hidden' name=rmndSckbdCntCheck value="" />
		</form>

		<form id="dgnssGo" action="cnfrm-dgnss-registgo">
			<input type='hidden' name="manageNo" value="${manageNo}" /> 
			<input type='hidden' name="hsptNo" value="" />
		</form>
		<input type="hidden" id="realRmndSckbdCnt" value="" />
	</section>

	<!-- /.card-body -->

	<script>
	function rmndSckbdCntCheckBox(){
		var check = $("#rmndSckbdCntCheck").is(':checked');
		
		if(check){
			$('#jobForm').find('[name="rmndSckbdCntCheck"]').val(check);
			
			var formCheck = $('#jobForm').find("[name='typeCode']").val();
			
			if(formCheck == "all"){
				targetId = "#hspt-all-list-table-tbody";
				pagenationId = "#inptnt-all-pagination-template";
				page = 1;
				list_go(url, page, targetId, pagenationId);
			}else{
				targetId = "#hspt-bookmark-list-table-tbody";
				pagenationId = "#inptnt-list-pagination-ul";
				page = 1;
				list_go(url, page, targetId, pagenationId);
			}
			
			
		}else{
			$('#jobForm').find('[name="rmndSckbdCntCheck"]').val(check);
			
			var formCheck = $('#jobForm').find("[name='typeCode']").val();
			
			if(formCheck == "all"){
				targetId = "#hspt-all-list-table-tbody";
				pagenationId = "#inptnt-all-pagination-template";
				page = 1;
				list_go(url, page, targetId, pagenationId);
			}else{
				targetId = "#hspt-bookmark-list-table-tbody";
				pagenationId = "#inptnt-list-pagination-ul";
				page = 1;
				list_go(url, page, targetId, pagenationId);
			}
		}
	}
	
	function Close(){
		var check = confirm("페이지를 닫으시겠습니까?");
		if(check){
			window.close();
		}else{
			return;
		}
	}
		function deleteSearch() {
			//alert("눌림");
			$('#placeSearch').css('visibility', 'hidden');
			$('#bookmark-btn').css('visibility', 'hidden');

		}
		function makeSearch() {
			//alert("눌림");
			$('#placeSearch').css('visibility', 'visible');
			$('#bookmark-btn').css('visibility', 'visible');
		}
		
		function marker_check(opRate){
			
			var markerImage = "";
			
			if(opRate >= 80){
			    markerImage = new kakao.maps.MarkerImage('<%=request.getContextPath()%>/resources/image/markerRed.png',
		   	    new kakao.maps.Size(35, 35), 
		   	    new kakao.maps.Point(13, 34));
		   }
		   
		   if(opRate >= 70 && opRate < 80){
		  	    markerImage = new kakao.maps.MarkerImage('<%=request.getContextPath()%>/resources/image/markerYellow.png',
			    new kakao.maps.Size(35, 35), 
			    new kakao.maps.Point(13, 34));
		   }
		   if(opRate < 70){
		   		markerImage = new kakao.maps.MarkerImage('<%=request.getContextPath()%>/resources/image/markerBlue.png',
				new kakao.maps.Size(35, 35), 
				new kakao.maps.Point(13,34));
			}

			return markerImage;
		}

		function mapOpen(addr, instNm, rmndSckbdCnt, opRate, checkResult) {
			$('#map').remove();
			var html = "<div id='map' style='width: 94.3%; height: 447px; margin-top: 7px; margin-left: 17px; margin-bottom: 7px;'></div>";
			$('#mapLocation').after(html);
			var mapContainer = document.getElementById('map');
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
			geocoder
					.addressSearch(
							addr,
							function(result, status) {
								// 정상적으로 검색이 완료됐으면 
								if (status === kakao.maps.services.Status.OK) {

									// 이동할 위도 경도 위치를 생성합니다 
									var moveLatLon = new kakao.maps.LatLng(
											result[0].y, result[0].x);

									// 지도 중심을 이동 시킵니다
									map.setCenter(moveLatLon);

									var coords = new kakao.maps.LatLng(
											result[0].y, result[0].x);

									var markerImage = marker_check(opRate);

									// 결과값으로 받은 위치를 마커로 표시합니다
									var marker = new kakao.maps.Marker({
										map : map,
										position : coords,
										image : markerImage
									});

									// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
									/* var iwContent = '<div class="markerInfo" style="width:150px;text-align:center;padding:6px 0;">'
											+ target.attr('data-inst-nm') + '<br>병상수:' + target.attr('data-rmnd-sckbd-cnt')
											+ '<br><a href="https://map.kakao.com/link/to/33.450701,126.570667" style="color:blue" target="_blank">길찾기</a>'+ '</div>';  */
									var iwContent = "";
									if(checkResult > 0){
										iwContent = '<div class="markerInfo" style="width:170px;text-align:left;padding-bottom: 0;padding-top: 3px;display:block; ">'
											+ "<span style='margin-left:3px;'>"
											+ "<b>"
											+ instNm
											+ "</b>"
											+ "</span>"
											+ "<br><span style='margin-left:3px;'>잔여병상수 :"
											+ rmndSckbdCnt
											+ ", "
											+ "가동률:"
											+ opRate
											+ "%</span>"
											+ '<br> <button class="btn btn-block btn-secondary btn-xs" onclick="bookmark_remove();" type="button" style="width: 100%;background:#1a4f72;border-color:#1a4f72;">연계기관해제'
											+ '</buttom></div>';
									}
									else{
										iwContent = '<div class="markerInfo" style="width:170px;text-align:left;padding-bottom: 0;padding-top: 3px;display:block; ">'
											+ "<span style='margin-left:3px;'>"
											+ "<b>"
											+ instNm
											+ "</b>"
											+ "</span>"
											+ "<br><span style='margin-left:3px;'>잔여병상수 :"
											+ rmndSckbdCnt
											+ ", "
											+ "가동률:"
											+ opRate
											+ "%</span>"
											+ '<br> <button class="btn btn-block btn-secondary btn-xs" onclick="bookmark_go();" type="button" style="width: 100%;background:#1a4f72;border-color:#1a4f72;">연계기관등록'
											+ '</buttom></div>';
									}
									// 인포윈도우를 생성합니다
									var infowindow = new kakao.maps.InfoWindow(
											{
												content : iwContent
											});

									infowindow.open(map, marker);
									// 마커에 클릭이벤트를 등록합니다
									kakao.maps.event.addListener(marker,
											'click', function() {

												var markerDisplay = $(
														'.markerInfo').css(
														'display');
												if (markerDisplay == 'block') {
													infowindow.close();
												} else {
													// 마커 위에 인포윈도우를 표시합니다
													infowindow
															.open(map, marker);
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
			geocoder
					.addressSearch(
							addrs,
							function(result, status) {
								// 정상적으로 검색이 완료됐으면 
								if (status === kakao.maps.services.Status.OK) {

									var coords = new kakao.maps.LatLng(
											result[0].y, result[0].x);

									var markerImage = marker_check(opRate);

									// 결과값으로 받은 위치를 마커로 표시합니다
									var marker = new kakao.maps.Marker({
										map : map,
										position : coords,
										image : markerImage
									});

									/* // 인포윈도우로 장소에 대한 설명을 표시합니다
									var infowindow = new kakao.maps.InfoWindow({
									   content : '<div style="width:150px;text-align:center;padding:6px 0;">'+obj.name+'</div>'
									});
									
									     infowindow.open(map, marker); */

									// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
									var iwContent = '<div class="markerInfo" style="width:170px;text-align:left;padding-bottom: 0;padding-top: 3px;display:block; ">'
											+ "<span style='margin-left:3px;'>"
											+ "<b>"
											+ instNm
											+ "</b>"
											+ "</span>"
											+ "<br><span style='margin-left:3px;'>잔여병상수 :"
											+ rmndSckbdCnt
											+ ", "
											+ "가동률:"
											+ opRate
											+ "%</span>";
									// 인포윈도우를 생성합니다
									var infowindow = new kakao.maps.InfoWindow(
											{
												content : iwContent
											});

									// 마커에 마우스오버 이벤트를 등록합니다
									kakao.maps.event.addListener(marker,
											'mouseover', function() {
												// 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
												infowindow.open(map, marker);
											});

									// 마커에 마우스아웃 이벤트를 등록합니다
									kakao.maps.event.addListener(marker,
											'mouseout', function() {
												// 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
												infowindow.close();
											});
								}
							});
		}

		function initKakaoMap(dhbList, adres) {
			$('#map').remove();
			var html = "<div id='map' style='width: 94.3%; height: 447px; margin-top: 7px; margin-left: 17px; margin-bottom: 7px;'></div>";
			$('#mapLocation').after(html);
			var mapContainer = document.getElementById('map'); // 지도를 표시할 div

			var mapOption = {
				center : new kakao.maps.LatLng(36.35043075681321,
						127.3848294267714), // 지도의 중심좌표
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
			
			
			$.each(dhbList, function(idx, dhb) {
				addToMarker(dhb.instAdres, geocoder, map, dhb.instNm,
						dhb.rmndSckbdCnt, dhb.opRate);
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

