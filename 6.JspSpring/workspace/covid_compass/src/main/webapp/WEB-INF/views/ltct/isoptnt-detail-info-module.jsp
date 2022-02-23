<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=553e55e7a953a05a2adfe2bfc2932452&libraries=services"></script>
 <script type="text/javascript" src="../resources/bootstrap/plugins/jquery/jquery.min.js"></script>
		<div>
			<table class="table table-bordered">
                  <thead>
                    <tr style="text-align: center;">
                      <th>연번</th>
                      <th>시도</th>
                      <th>시군구</th>
                      <th>병원</th>
                      <th>전화번호</th>
                      <th>병상수</th>
                      <th>신청</th>
                      <th>지도</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr class="shittr"  style="text-align: center;">
                      <td>1</td>
                      <td>서울</td>
                      <td>서울시 도봉구</td>
                      <td>병원이름</td>
                      <td>042-7777-777</td>
                      <td>10</td>
                      <td><button style="width: 60px; margin: 0 auto;" type="button"  class="btn btn-block btn-success btn-flat">신청</button></td>
                      <td><button addr="서울 도봉구 창동 330" checkNum="0" style="width: 60px; margin: 0 auto;" type="button"  class="btn btn-block btn-secondary btn-flat fuckmap">지도</button></td>
                    </tr>
                    <tr class="shittr" style="text-align: center;">
                      <td>2</td>
                      <td>서울</td>
                      <td>서울시 송파구</td>
                      <td>병원이름</td>
                      <td>042-7777-777</td>
                      <td>10</td>
                      <td><button style="width: 60px; margin: 0 auto;" type="button"  class="btn btn-block btn-success btn-flat">신청</button></td>
                      <td><button addr="서울 송파구 잠실동 10" checkNum="0" style="width: 60px; margin: 0 auto;"  type="button"  class="btn btn-block btn-secondary btn-flat fuckmap">지도</button></td>
                    </tr>
                    <tr  style="text-align: center;">
                      <td>3</td>
                      <td>서울</td>
                      <td>서울시 마포구</td>
                      <td>병원이름</td>
                      <td>042-7777-777</td>
                      <td>10</td>
                      <td><button style="width: 60px; margin: 0 auto;" type="button"  class="btn btn-block btn-success btn-flat">신청</button></td>
                      <td><button addr="서울 마포구 성산동 390-1" checkNum="0" style="width: 60px; margin: 0 auto;"  type="button" class="btn btn-block btn-secondary btn-flat fuckmap">지도</button></td>
                    </tr>
                    <tr  style="text-align: center;">
                      <td>4</td>
                      <td>서울</td>
                      <td>서울특별시</td>
                      <td>병원이름</td>
                      <td>042-7777-777</td>
                      <td>10</td>
                      <td><button style="width: 60px; margin: 0 auto;" type="button"  class="btn btn-block btn-success btn-flat">신청</button></td>
                      <td><button addr="서울 양천구 안양천로 939" checkNum="0" style="width: 60px; margin: 0 auto;"  type="button" class="btn btn-block btn-secondary btn-flat fuckmap">지도</button></td>
                    </tr>
                    <tr  style="text-align: center;">
                      <td>5</td>
                      <td>서울</td>
                      <td>서울특별시</td>
                      <td>병원이름</td>
                      <td>042-7777-777</td>
                      <td>10</td>
                      <td><button style="width: 60px; margin: 0 auto;" type="button"  class="btn btn-block btn-success btn-flat">신청</button></td>
                      <td><button addr="서울 강남구 삼성동 111-8" checkNum="0" style="width: 60px; margin: 0 auto;"  type="button" class="btn btn-block btn-secondary btn-flat fuckmap">지도</button></td>
                    </tr>
                    
                    <tr  style="text-align: center;">
                      <td>6</td>
                      <td>서울</td>
                      <td>서울특별시</td>
                      <td>병원이름</td>
                      <td>042-7777-777</td>
                      <td>10</td>
                      <td><button style="width: 60px; margin: 0 auto;" type="button"  class="btn btn-block btn-success btn-flat">신청</button></td>
                      <td><button addr="서울 강남구 삼성동 111-8" checkNum="0" style="width: 60px; margin: 0 auto;"  type="button" class="btn btn-block btn-secondary btn-flat fuckmap">지도</button></td>
                    </tr>
                    
                    <tr  style="text-align: center;">
                      <td>7</td>
                      <td>서울</td>
                      <td>서울특별시</td>
                      <td>병원이름</td>
                      <td>042-7777-777</td>
                      <td>10</td>
                      <td><button style="width: 60px; margin: 0 auto;" type="button"  class="btn btn-block btn-success btn-flat">신청</button></td>
                      <td><button addr="서울 강남구 삼성동 111-8" checkNum="0" style="width: 60px; margin: 0 auto;"  type="button" class="btn btn-block btn-secondary btn-flat fuckmap">지도</button></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              
            <script>
          	var mapContainer;
          	
          	$('.fuckmap').click(function(){
          		$('#maptd').remove();
          		
          		
          		
          		var addr=$(this).attr('addr');
          		
          		var checkNum=$(this).attr('checkNum');
          		
          		if(checkNum=='0'){
          			$('.fuckmap').attr('checkNum', '0');
          			checkNum=1;
          			$(this).attr('checkNum',checkNum);
          			var num=$(this).attr('checkNum');
          			var html="<td id='maptd' colspan='8'><div id='map' style='height: 400px;'></div></td>";
          			
          			$(this).parents('tr').after(html);
          			
          			mapContainer=document.getElementById('map');
          			
          		}else{
          			checkNum=0;
          			$(this).attr('checkNum',checkNum);
          			var num2=$(this).attr('checkNum');
          			//alert("num2:"+num2);
          			$('#maptd').remove();
          			
          		}
          		
          		mapOpen(addr);
          	})
          	
          	
          	function mapOpen(addr){
          					
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
          									 kakao.maps.event.addListener(marker,
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
          											});
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
              
