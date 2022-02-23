<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback">
 <!-- Font Awesome -->
 <link rel="stylesheet" href="../resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
 <!-- Theme style -->
 <link rel="stylesheet" href="../resources/bootstrap/dist/css/adminlte.min.css">
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=553e55e7a953a05a2adfe2bfc2932452&libraries=services"></script>
 <script type="text/javascript" src="../resources/bootstrap/plugins/jquery/jquery.min.js"></script>
</head>
<body>
	<div class="wrapper" style="max-width: 1280px; margin: 0 auto;">
		<div class="invoice p-3 mb-3 col-12">
			<strong>로고자리</strong>
		</div>
				
		<form role="form" action="search" method="get">
			<div style="position: relative; left:25%; ">
				<div style="float: left;">		
					<input style="height: 39px; width: 500px;" type="text" placeholder="검색어를 입력하세요" name="search"/>
				</div>
				
				<div style="float: left">
					<button style="margin-left: 5px;"  type="submit"  class="btn btn-block btn-primary">검색</button>
				</div>
			</div>
		</form>
		<br><br>
		<div style="clear:left; position: relative; left:27%; ">
			<strong>시도 및 시군구, 생활치료센터, 전화번호를 통합하여 검색합니다.</strong>
		</div>
		<div style="position: relative; left:24%;">
			<p style="color: #5e7ff7;">검색어 예시: <strong>'서울'</strong> 또는 <strong>'중구'</strong> 또는 <strong>'생활치료센터'</strong> 또는 <strong>'042'</strong>(전화번호 일부)</p>
		</div>
		
		<div class="card-body">
                <table class="table table-bordered">
                  <thead>
                    <tr style="text-align: center;">
                      <th>연번</th>
                      <th>시도</th>
                      <th>시군구</th>
                      <th>생활치료센터</th>
                      <th>전화번호</th>
                      <th>지도</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr id="asd" style="text-align: center;">
                      <td>1</td>
                      <td>서울</td>
                      <td>서울특별시</td>
                      <td>생활치료센터이름</td>
                      <td>042-7777-777</td>
                      <td><button style="width: 60px; margin: 0 auto;" type="button" onclick="aass('서울 도봉구 창동 330')" class="btn btn-block btn-secondary btn-flat">지도</button></td>
                    </tr>
                    
                    <!-- <tr id="maptest" style="display:none;">
                    	<td colspan="6"><div id="map" style="height: 400px;"></div></td>
                    </tr> -->
                    <tr style="text-align: center;">
                      <td>2</td>
                      <td>서울</td>
                      <td>서울특별시</td>
                      <td>생활치료센터이름</td>
                      <td>042-7777-777</td>
                      <td><button style="width: 60px; margin: 0 auto;"  type="button" onclick="mapOpen('서울 송파구 잠실동 10')" class="btn btn-block btn-secondary btn-flat">지도</button></td>
                    </tr>
                    <tr style="text-align: center;">
                      <td>3</td>
                      <td>서울</td>
                      <td>서울특별시</td>
                      <td>생활치료센터이름</td>
                      <td>042-7777-777</td>
                      <td><button style="width: 60px; margin: 0 auto;"  type="button" class="btn btn-block btn-secondary btn-flat">지도</button></td>
                    </tr>
                    <tr style="text-align: center;">
                      <td>4</td>
                      <td>서울</td>
                      <td>서울특별시</td>
                      <td>생활치료센터이름</td>
                      <td>042-7777-777</td>
                      <td><button style="width: 60px; margin: 0 auto;"  type="button" class="btn btn-block btn-secondary btn-flat">지도</button></td>
                    </tr>
                    <tr style="text-align: center;">
                      <td>5</td>
                      <td>서울</td>
                      <td>서울특별시</td>
                      <td>생활치료센터이름</td>
                      <td>042-7777-777</td>
                      <td><button style="width: 60px; margin: 0 auto;"  type="button" class="btn btn-block btn-secondary btn-flat">지도</button></td>
                    </tr>
                    <tr style="text-align: center;">
                      <td>6</td>
                      <td>서울</td>
                      <td>서울특별시</td>
                      <td>생활치료센터이름</td>
                      <td>042-7777-777</td>
                      <td><button style="width: 60px; margin: 0 auto;"  type="button" class="btn btn-block btn-secondary btn-flat">지도</button></td>
                    </tr>
                    <tr style="text-align: center;">
                      <td>7</td>
                      <td>서울</td>
                      <td>서울특별시</td>
                      <td>생활치료센터이름</td>
                      <td>042-7777-777</td>
                      <td><button style="width: 60px; margin: 0 auto;"  type="button" class="btn btn-block btn-secondary btn-flat">지도</button></td>
                    </tr>
                    <tr style="text-align: center;">
                      <td>8</td>
                      <td>서울</td>
                      <td>서울특별시</td>
                      <td>생활치료센터이름</td>
                      <td>042-7777-777</td>
                      <td><button style="width: 60px; margin: 0 auto;"  type="button" class="btn btn-block btn-secondary btn-flat">지도</button></td>
                    </tr>
                    <tr style="text-align: center;">
                      <td>9</td>
                      <td>서울</td>
                      <td>서울특별시</td>
                      <td>생활치료센터이름</td>
                      <td>042-7777-777</td>
                      <td><button style="width: 60px; margin: 0 auto;"  type="button" class="btn btn-block btn-secondary btn-flat">지도</button></td>
                    </tr>
                    <tr style="text-align: center;">
                      <td>10</td>
                      <td>서울</td>
                      <td>서울특별시</td>
                      <td>생활치료센터이름</td>
                      <td>042-7777-777</td>
                      <td><button style="width: 60px; margin: 0 auto;"  type="button" class="btn btn-block btn-secondary btn-flat">지도</button></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              
           <!--    <div id="map" style="width:100%; height: 400px;">
              </div>  -->
		
	</div>
		<script>
		function aass(addr){
			
		var ctr = document.createElement('tr');
		ctr.setAttribute('id', 'maptest');
		
		var ctr2=document.createElement('td');
		ctr2.setAttribute('colspan', '6');
		
		ctr.appendChild(ctr2);
		
		var cdiv=document.createElement('div');
		cdiv.setAttribute('id', 'map');
		
		ctr2.appendChild(cdiv);
		
		document.getElementById('asd').after(ctr);
		
			var addr = addr;
			
			mapOpen(addr);
		}
		
		
		
		function mapOpen(addr){
			
			//document.getElementsByClassName('maptest').style.display="block";
			var mapContainer = document.getElementById('map'); // 지도를 표시할 div
			
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
												+ "생활치료센터(이름)" +'<br>병상수:'
												+ '<br><a href="https://map.kakao.com/link/to/33.450701,126.570667" style="color:blue" target="_blank">길찾기</a>'+ '</div>'; 

										// 인포윈도우를 생성합니다
										var infowindow = new kakao.maps.InfoWindow(
												{
													content : iwContent
												});

										// 마커에 마우스오버 이벤트를 등록합니다
										/* kakao.maps.event.addListener(marker,
												'mouseover', function() {
													// 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
													infowindow
															.open(map, marker);
												});

										// 마커에 마우스아웃 이벤트를 등록합니다
										kakao.maps.event.addListener(marker,
												'mouseout', function() {
													// 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
													infowindow.close();
												}); */
									infowindow.open(map,marker);
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
</html>