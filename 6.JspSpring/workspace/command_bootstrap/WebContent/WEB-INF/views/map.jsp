<script>
var mapContainer = document.getElementById('map'); // 지도를 표시할 div
var mapOption = {
   center : new kakao.maps.LatLng(36.35043075681321, 127.3848294267714), // 지도의 중심좌표
   level : 14
// 지도의 확대 레벨
};

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption);
 						
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();



$.each(mapArr, function(idx, obj){
	addToMarker(obj);
})
 
function addToMarker(obj) {
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(obj.add, function(result, status) {
		// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {

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
			var iwContent = '<div class="markerInfo" style="width:150px;text-align:center;padding:6px 0;">'+obj.name+'</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

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

var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

// 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'zoom_changed', function() {        
    
    // 지도의 현재 레벨을 얻어옵니다
    var level = map.getLevel();
    
    var message = '현재 지도 레벨은 ' + level + ' 입니다';
    var resultDiv = document.getElementById('result');  
    
});
 
				</script>