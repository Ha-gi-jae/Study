<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=553e55e7a953a05a2adfe2bfc2932452&libraries=services"></script>
</head>
<title></title>

<body style="overflow: hidden;">

	<div class="row">
				<div>
			<!-- search bar -->
		
			<div class="card" style="margin-left: 50px;  margin-top: 15px;">
			  <div class="card-header" style="background-color: #1a4f72">
				<h3 class="card-title"><span style="color: white">병상 신청</span></h3>
				</div>
				<div class="card-body">
				<table class="table table-bordered">
				  <tr style="text-align: center;">
					<th>확진자 성명</th>
					<td>홍길동</td>
				  </tr>
				</table>
				</div>
			  <div class="card-header d-flex p-0">
			  				<h3 class="card-title p-3">생활치료센터 목록</h3>
							<ul class="nav nav-pills ml-auto p-2" role="tablist">
								<li class="nav-item">
								  <a class="nav-link active" id="psti-detail-tab" data-toggle="pill" href="#custom-psti-detail" role="tab" aria-controls="custom-tabs-three-home" aria-selected="true">연계기관</a>
								</li>
								<li class="nav-item">
								  <a class="nav-link" id="psti-htsc-regist-tab" data-toggle="pill" href="#custom-psti-htsc-regist" role="tab" aria-controls="custom-tabs-three-profile" aria-selected="false">전체보기</a>
								</li>
							</ul>
			  </div>
				<div class="card-body">
				<table class="table table-bordered">
                  <thead>
                    <tr style="text-align: center;">
                      <th>시군구</th>
                      <th>생활치료센터</th>
                      <th>전화번호</th>
                      <th>병상수</th>
                      <th>가동률</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr onclick="mapOpen('서울 도봉구 창동 330')" class="shittr fuckmap" style="text-align: center;" addr="서울 도봉구 창동 330">
                      <td>서울시 도봉구</td>
                      <td>센터이름</td>
                      <td>042-7777-777</td>
                      <td>10</td>
                      <td>90%</td>
                    </tr>
                    <tr onclick="mapOpen('서울 도봉구 창동 330')" class="shittr fuckmap" style="text-align: center;" addr="서울 도봉구 창동 330">
                      <td>서울시 도봉구</td>
                      <td>센터이름</td>
                      <td>042-7777-777</td>
                      <td>10</td>
                      <td>90%</td>
                    </tr>
                    <tr onclick="mapOpen('서울 도봉구 창동 330')" class="shittr fuckmap" style="text-align: center;" addr="서울 도봉구 창동 330">
                      <td>서울시 도봉구</td>
                      <td>센터이름</td>
                      <td>042-7777-777</td>
                      <td>10</td>
                      <td>90%</td>
                    </tr>
                    <tr onclick="mapOpen('서울 도봉구 창동 330')" class="shittr fuckmap" style="text-align: center;" addr="서울 도봉구 창동 330">
                      <td>서울시 도봉구</td>
                      <td>센터이름</td>
                      <td>042-7777-777</td>
                      <td>10</td>
                      <td>90%</td>
                    </tr>
                    <tr onclick="mapOpen('서울 도봉구 창동 330')" class="shittr fuckmap" style="text-align: center;" addr="서울 도봉구 창동 330">
                      <td>서울시 도봉구</td>
                      <td>센터이름</td>
                      <td>042-7777-777</td>
                      <td>10</td>
                      <td>90%</td>
                    </tr>
                    <tr onclick="mapOpen('서울 도봉구 창동 330')" class="shittr fuckmap" style="text-align: center;" addr="서울 도봉구 창동 330">
                      <td>서울시 도봉구</td>
                      <td>센터이름</td>
                      <td>042-7777-777</td>
                      <td>10</td>
                      <td>90%</td>
                    </tr>
                    <tr onclick="mapOpen('서울 도봉구 창동 330')" class="shittr fuckmap" style="text-align: center;" addr="서울 도봉구 창동 330">
                      <td>서울시 도봉구</td>
                      <td>센터이름</td>
                      <td>042-7777-777</td>
                      <td>10</td>
                      <td>90%</td>
                    </tr>
                    <tr onclick="mapOpen('서울 도봉구 창동 330')" class="shittr fuckmap" style="text-align: center;" addr="서울 도봉구 창동 330">
                      <td>서울시 도봉구</td>
                      <td>센터이름</td>
                      <td>042-7777-777</td>
                      <td>10</td>
                      <td>90%</td>
                    </tr>
                  </tbody>
                </table>
              </div>  
				<div class="card-footer clearfix" style="background: white; margin-left: 28px;">
							<%@ include file="../template/list-footer.jsp"%>
				</div>
			</div>
		</div>
		<div>
			<div class="card" style="margin-left: 20px; margin-top: 15px; width: 600px;">
				<div class="card-header" style="background-color: #1a4f72">
					<h3 class="card-title">
						<span style="color: white">생활치료센터 정보</span>
					</h3>
				</div>
				<div id="mapLocation" class="card-body">
					<table class="table table-bordered">
						<tr style="text-align: center;">
							<th>생활치료센터명</th>
							<td>을지치료센터</td>
							<td><button type="button"
									style="width: 70%; background: #1a4f72; border: #1a4f72;"
									class="btn btn-success btn-xs">병상 신청</button></td>
						</tr>
					</table>
				</div>
				<!-- <div id="map"
					style="width: 651px; height: 600px; margin-left: 19px;">
			    </div> -->
			</div>
		</div>
	</div>
	
	<!-- /.card-body -->
	 <script>
	 	window.onload=function(){
	 		mapOpen("서울 도봉구 창동 330");
	 	}
          	function mapOpen(addr){
          	  $('#map').remove();
          	  var html="<div id='map' style='width: 560px; height: 590px; margin-left: 20px; margin-bottom: 12px;'></div>";
          	  $('#mapLocation').after(html);
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
          									
          									// 결과값으로 받은 위치를 마커로 표시합니다
          									var marker = new kakao.maps.Marker({
          										map : map,
          										position : coords
          									});
											
          									/* // 인포윈도우로 장소에 대한 설명을 표시합니다
          									var infowindow = new kakao.maps.InfoWindow({
          										content : '<div style="width:150px;text-align:center;padding:6px 0;">'+obj.name+'</div>'
          									});
          									
          									infowindow.open(map, marker); */

          									// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
          									var iwContent = '<div class="markerInfo" style="width:150px;text-align:center;padding:6px 0;">'
          											+ "병원(이름)" +'<br>병상수:10'
          											+ '<br><a href="https://map.kakao.com/link/to/33.450701,126.570667" style="color:blue" target="_blank">길찾기</a>'+ '</div>'; 

          									// 인포윈도우를 생성합니다
          									var infowindow = new kakao.maps.InfoWindow(
          											{
          												content : iwContent
          											});

          									// 마커에 마우스오버 이벤트를 등록합니다
          									/*  kakao.maps.event.addListener(marker,
          											'mouseover', function() {
          												// 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
          												infowindow
          														.open(map, marker);
          											}); */

          									// 마커에 마우스아웃 이벤트를 등록합니다
          									/* kakao.maps.event.addListener(marker,
          											'mouseout', function() {
          												// 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
          												infowindow.close();
          											}); */
          									infowindow.open(map, marker); 
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
</body>

