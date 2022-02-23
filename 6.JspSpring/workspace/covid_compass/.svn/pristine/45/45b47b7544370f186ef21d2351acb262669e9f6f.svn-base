<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

		<form role="form" action="insp-list" method="get">
			<div class="row" style="justify-content: space-around; text-align: center;">
				<div class="form-group row">
					<input style="width: 500px;" type="text" placeholder="검색어를 입력하세요" name="keyword" />
					<div>
						<button style="margin-left: 5px;" type="submit" class="btn btn-block btn-primary">검색</button>
					</div>
				</div>
			</div>
		</form>
		<div class="row" style="justify-content: space-around; text-align: center;">
			<strong>시도 및 시군구, ~병원, 전화번호를 통합하여 검색합니다.</strong>
		</div>
		<div class="row" style="justify-content: space-around; text-align: center;">
			<p style="color: #5e7ff7;">
				검색어 예시: <strong>'서울'</strong> 또는 <strong>'중구'</strong> 또는 <strong>'~병원'</strong> 또는 <strong>'042'</strong>(전화번호 일부)
			</p>
		</div>

		<div class="card-body">
			<table class="table table-sm table-bordered" style="font-size: 15px;"> 
				<thead>
					<tr style="text-align: center;">
						<th>연번</th>
						<th>시도</th>
						<th>시군구</th>
						<th>검사소</th>
						<th>전화번호</th>
						<th>문진표</th>
						<th>지도</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${inspList}" var="insp" varStatus="status">
						<tr class="shittr" style="text-align: center;">
							<td>${status.index + 1}</td>
							<c:set var="addrDivision" value="${insp.instAdres} "/>
							<td>${fn:substring(addrDivision,0,2) }</td>
							<td>${insp.instAdres}</td>
							<td>${insp.instNm}</td>
							<td>${insp.instTelno}</td>
							<td>
								<button style="width: 70px; margin: 0 auto;" type="button" onclick="location.href='<%=request.getContextPath()%>/guest/question?inspNo=${insp.inspNo} '" class="btn btn-block btn-success btn-xs">문진표작성</button>
							</td>
							<td>
								<button addr="${insp.instAdres}" inspNm="${insp.instNm}" checkNum="0" style="width: 60px; margin: 0 auto;" type="button" class="btn btn-block btn-secondary btn-xs map">지도</button>
							</td>
						</tr>
					</c:forEach>
					<!-- <tr id="maptest">
                    	<td colspan="6"><div id="map" style="height: 400px;"></div></td>
                      </tr> -->
				</tbody>
			</table>
		</div>


	<nav aria-label="Navigation">
		<ul class="pagination justify-content-center m-0">
			<li class="page-item">
				<a class="page-link" href="javascript:list_go(1);">
					<i class="fas fa-angle-double-left"></i>
				</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="javascript:list_go('${pageMaker.prev ? pageMaker.startPage-1 : pageMaker.cri.page}');">
					<i class="fas fa-angle-left"></i>
				</a>
			</li>
			<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >
			
			<li class="page-item ${pageMaker.cri.page == pageNum?'active':''}">
				<a class="page-link" href="javascript:list_go('${pageNum}');" >${pageNum }</a>
			</li>
			
			</c:forEach>
			<li class="page-item">
				<a class="page-link" href="javascript:list_go('${pageMaker.next ? pageMaker.endPage+1 :pageMaker.cri.page}');">
					<i class="fas fa-angle-right" ></i>
				</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="javascript:list_go('${pageMaker.realEndPage}');">
					<i class="fas fa-angle-double-right"></i>
				</a>
			</li>	
		</ul>    					
	</nav>
	
	
<form id="jobForm">
	<input type='hidden' name="page" value="" />
	<input type='hidden' name="perPageNum" value=""/>
	<input type='hidden' name="keyword" value="" />
</form>
<script>

function list_go(page,url){
	if(!url) url="insp-list";
	
	var jobForm=$('#jobForm');
	
	
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	jobForm.find("[name='keyword']").val($('div.form-group>input[name="keyword"]').val());
	
	jobForm.attr({
		action:url,
		method:'get'
	}).submit();
}
</script>  
  
		
	</div>
	
	<script>
		var mapContainer;
		var inspNm;

		$('.map')
				.click(
						function() {
							$('#maptd').remove();

							var addr = $(this).attr('addr');
							  inspNm = $(this).attr('inspNm');

							var checkNum = $(this).attr('checkNum');

							if (checkNum == '0') {
								$('.map').attr('checkNum', '0');
								checkNum = 1;
								$(this).attr('checkNum', checkNum);
								var num = $(this).attr('checkNum');
								var html = "<td id='maptd' colspan='8'><div id='map' style='height: 400px;'></div></td>";

								$(this).parents('tr').after(html);

								mapContainer = document.getElementById('map');

							} else {
								checkNum = 0;
								$(this).attr('checkNum', checkNum);
								var num2 = $(this).attr('checkNum');
								//alert("num2:"+num2);
								$('#maptd').remove();

							}

							mapOpen(addr);
						})

		function mapOpen(addr) {

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
									var iwContent = '<div class="markerInfo" style="width:150px;text-align:center;padding:6px 0;display:block; ">'
											+ inspNm
											+ '<br> <button class="btn btn-block btn-secondary btn-xs" type="button" style="background:#1a4f72;">'
									        + '<a href="https://map.kakao.com/link/to/'+inspNm+','+result[0].y +','+ result[0].x+'" style="color:blue;color:white" target="_blank">길찾기</a>'
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
		
function markerInfoCheck(){
	
}		
	</script>



</body>
</html>