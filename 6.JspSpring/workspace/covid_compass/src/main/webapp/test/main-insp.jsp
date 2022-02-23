<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>

<title></title>


<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="50">
	<div class="card">

		<div class="#">
			<div class="row">
				<div class="card col-md-12"
					style="position: relative; left: 0px; top: 0px;">
					<div class="card-header ui-sortable-handle" style="cursor: move;">
						<h3 class="card-title">
							<i class="ion ion-clipboard mr-1"></i> 피검자 리스트
						</h3>

						<div class="card-tools">
							<ul class="pagination pagination-sm">
								<li class="page-item"><a href="#" class="page-link">«</a></li>
								<li class="page-item"><a href="#" class="page-link">1</a></li>
								<li class="page-item"><a href="#" class="page-link">2</a></li>
								<li class="page-item"><a href="#" class="page-link">3</a></li>
								<li class="page-item"><a href="#" class="page-link">»</a></li>
							</ul>
						</div>
					</div>
					<!-- /.card-header -->
					<div class="card-body" style="padding: 0px;">
						<div class="table-responsive">
							<table class="table table-hover text-nowrap"
								style="text-align: center;">
								<thead>
									<tr role="row">
										<th tabindex="0" aria-controls="example2" rowspan="1"
											style="text-align: center;" colspan="1" aria-label="">구분</th>
										<th tabindex="0" aria-controls="example2" rowspan="1"
											style="text-align: center;" colspan="1" aria-label="">성명</th>
										<th tabindex="0" aria-controls="example2" rowspan="1"
											style="text-align: center;" colspan="1" aria-sort="ascending"
											aria-label="">문진표 작성일</th>
										<th tabindex="0" aria-controls="example2" rowspan="1"
											style="text-align: center;" colspan="1" aria-label="">나이</th>
										<th tabindex="0" aria-controls="example2" rowspan="1"
											style="text-align: center;" colspan="1" aria-label="">생년월일</th>
										<th tabindex="0" aria-controls="example2" rowspan="1"
											style="text-align: center;" colspan="1" aria-label="">전화번호</th>
									</tr>
								</thead>
								<tbody>

									<tr data-psti-no="${pstiNo }"
										onclick="OpenWindow('psti-registform?pstiInnb=${pstiReadyListVO.pstiInnb}','','1200','750');"
										style="cursor: pointer;">
										<td><span class="badge badge-info">신규</span></td>
										<td>홍길동</td>
										<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
												value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-06</td>
										<td>34</td>
										<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
												value="${pstiReadyListVO.birYmd }" pattern="yyyy-MM-dd" />1989-01-06</td>
										<td>010-1234-5678</td>
									</tr>
									<tr data-psti-no="${pstiNo }"
										onclick="OpenWindow('psti-registform?pstiInnb=${pstiReadyListVO.pstiInnb}','','1200','750');"
										style="cursor: pointer;">
										<td><span class="badge badge-primary">재검</span></td>
										<td>김영희</td>
										<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
												value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-06</td>
										<td>34</td>
										<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
												value="${pstiReadyListVO.birYmd }" pattern="yyyy-MM-dd" />1989-01-06</td>
										<td>010-1234-5678</td>
									</tr>
									<tr data-psti-no="${pstiNo }"
										onclick="OpenWindow('psti-registform?pstiInnb=${pstiReadyListVO.pstiInnb}','','1200','750');"
										style="cursor: pointer;">
										<td><span class="badge badge-info">신규</span></td>
										<td>홍길동</td>
										<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
												value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-06</td>
										<td>34</td>
										<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
												value="${pstiReadyListVO.birYmd }" pattern="yyyy-MM-dd" />1989-01-06</td>
										<td>010-1234-5678</td>
									</tr>
									<tr data-psti-no="${pstiNo }"
										onclick="OpenWindow('psti-registform?pstiInnb=${pstiReadyListVO.pstiInnb}','','1200','750');"
										style="cursor: pointer;">
										<td><span class="badge badge-primary">재검</span></td>
										<td>김영희</td>
										<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
												value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-06</td>
										<td>34</td>
										<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
												value="${pstiReadyListVO.birYmd }" pattern="yyyy-MM-dd" />1989-01-06</td>
										<td>010-1234-5678</td>
									</tr>
									<tr data-psti-no="${pstiNo }"
										onclick="OpenWindow('psti-registform?pstiInnb=${pstiReadyListVO.pstiInnb}','','1200','750');"
										style="cursor: pointer;">
										<td><span class="badge badge-info">신규</span></td>
										<td>홍길동</td>
										<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
												value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-06</td>
										<td>34</td>
										<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
												value="${pstiReadyListVO.birYmd }" pattern="yyyy-MM-dd" />1989-01-06</td>
										<td>010-1234-5678</td>
									</tr>
								</tbody>
							</table>

						</div>

					</div>
					<!-- /.card-body -->
				</div>
			</div>

			<div class="row">
				<div class="card col-md-7"
					style="position: relative; left: 0px; top: 0px;">
					<div class="card-header ui-sortable-handle" style="cursor: move;">
						<h3 class="card-title">
							<i class="ion ion-clipboard mr-1"></i> 검사완료 리스트(시료 요청대기)
						</h3>

						<div class="card-tools">
							<ul class="pagination pagination-sm">
								<li class="page-item"><a href="#" class="page-link">«</a></li>
								<li class="page-item"><a href="#" class="page-link">1</a></li>
								<li class="page-item"><a href="#" class="page-link">2</a></li>
								<li class="page-item"><a href="#" class="page-link">3</a></li>
								<li class="page-item"><a href="#" class="page-link">»</a></li>
							</ul>
						</div>
					</div>
					<!-- /.card-header -->
					<div class="card-body" style="padding: 0px;">
						<div class="table-responsive">
							<table class="table table-hover text-nowrap"
								style="text-align: center;">
								<thead>
									<tr role="row">
										<th tabindex="0" aria-controls="example2" rowspan="1"
											colspan="1"
											aria-label="Browser: activate to sort column ascending"
											style="text-align: center;">
											<div class="form-group">
												<div class="form-check">
													<input type="checkbox" class="form-check-input"
														name="psti_check_all" id="psti_check_all"
														onclick="checkAll(this, 'psti_check');">
												</div>
											</div>
										</th>
										<th tabindex="0" aria-controls="example2" rowspan="1"
											style="text-align: center;" colspan="1" aria-label="">성명</th>
										<th tabindex="0" aria-controls="example2" rowspan="1"
											style="text-align: center;" colspan="1" aria-sort="ascending"
											aria-label="">문진표 작성일</th>
										<th tabindex="0" aria-controls="example2" rowspan="1"
											style="text-align: center;" colspan="1" aria-label="">나이</th>
										<th tabindex="0" aria-controls="example2" rowspan="1"
											style="text-align: center;" colspan="1" aria-label="">생년월일</th>
										<th tabindex="0" aria-controls="example2" rowspan="1"
											style="text-align: center;" colspan="1" aria-label="">전화번호</th>
									</tr>
								</thead>
								<tbody>

									<tr data-psti-no="${pstiNo }"
										onclick="OpenWindow('psti-registform?pstiInnb=${pstiReadyListVO.pstiInnb}','','1200','750');"
										style="cursor: pointer;">
										<td>
											<div class="form-check">
												<input type="checkbox" class="form-check-input"
													name="psti_check">
											</div>
										</td>
										<td>홍길동</td>
										<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
												value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-06</td>
										<td>34</td>
										<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
												value="${pstiReadyListVO.birYmd }" pattern="yyyy-MM-dd" />1989-01-06</td>
										<td>010-1234-5678</td>
									</tr>
									<tr data-psti-no="${pstiNo }"
										onclick="OpenWindow('psti-registform?pstiInnb=${pstiReadyListVO.pstiInnb}','','1200','750');"
										style="cursor: pointer;">
										<td>
											<div class="form-check">
												<input type="checkbox" class="form-check-input"
													name="psti_check">
											</div>
										</td>
										<td>홍길동</td>
										<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
												value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-06</td>
										<td>34</td>
										<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
												value="${pstiReadyListVO.birYmd }" pattern="yyyy-MM-dd" />1989-01-06</td>
										<td>010-1234-5678</td>
									</tr>
									<tr data-psti-no="${pstiNo }"
										onclick="OpenWindow('psti-registform?pstiInnb=${pstiReadyListVO.pstiInnb}','','1200','750');"
										style="cursor: pointer;">
										<td>
											<div class="form-check">
												<input type="checkbox" class="form-check-input"
													name="psti_check">
											</div>
										</td>
										<td>홍길동</td>
										<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
												value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-06</td>
										<td>34</td>
										<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
												value="${pstiReadyListVO.birYmd }" pattern="yyyy-MM-dd" />1989-01-06</td>
										<td>010-1234-5678</td>
									</tr>
									<tr data-psti-no="${pstiNo }"
										onclick="OpenWindow('psti-registform?pstiInnb=${pstiReadyListVO.pstiInnb}','','1200','750');"
										style="cursor: pointer;">
										<td>
											<div class="form-check">
												<input type="checkbox" class="form-check-input"
													name="psti_check">
											</div>
										</td>
										<td>홍길동</td>
										<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
												value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-06</td>
										<td>34</td>
										<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
												value="${pstiReadyListVO.birYmd }" pattern="yyyy-MM-dd" />1989-01-06</td>
										<td>010-1234-5678</td>
									</tr>
									<tr data-psti-no="${pstiNo }"
										onclick="OpenWindow('psti-registform?pstiInnb=${pstiReadyListVO.pstiInnb}','','1200','750');"
										style="cursor: pointer;">
										<td>
											<div class="form-check">
												<input type="checkbox" class="form-check-input"
													name="psti_check">
											</div>
										</td>
										<td>홍길동</td>
										<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
												value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-06</td>
										<td>34</td>
										<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
												value="${pstiReadyListVO.birYmd }" pattern="yyyy-MM-dd" />1989-01-06</td>
										<td>010-1234-5678</td>
									</tr>
								</tbody>
							</table>
						</div>

					</div>
					<!-- /.card-body -->
				</div>

				<div class="card col-md-5"
					style="position: relative; left: 0px; top: 0px;">
					<div class="card-header ui-sortable-handle" style="cursor: move;">
						<h3 class="card-title">
							<i class="ion ion-clipboard mr-1"></i> 검사결과
						</h3>

						<div class="card-tools">
							<ul class="pagination pagination-sm">
								<li class="page-item"><a href="#" class="page-link">«</a></li>
								<li class="page-item"><a href="#" class="page-link">1</a></li>
								<li class="page-item"><a href="#" class="page-link">2</a></li>
								<li class="page-item"><a href="#" class="page-link">3</a></li>
								<li class="page-item"><a href="#" class="page-link">»</a></li>
							</ul>
						</div>
					</div>
					<!-- /.card-header -->
					<div class="card-body" style="padding: 0px;">
						<div class="table-responsive">
							<table class="table m-0">
								<thead>
									<tr>
										<th>Order ID</th>
										<th>Item</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><a href="pages/examples/invoice.html">OR9842</a></td>
										<td>Call of Duty IV</td>
									</tr>
									<tr>
										<td><a href="pages/examples/invoice.html">OR9842</a></td>
										<td>Call of Duty IV</td>
									</tr>
									<tr>
										<td><a href="pages/examples/invoice.html">OR9842</a></td>
										<td>Call of Duty IV</td>
									</tr>
									<tr>
										<td><a href="pages/examples/invoice.html">OR9842</a></td>
										<td>Call of Duty IV</td>
									</tr>
									<tr>
										<td><a href="pages/examples/invoice.html">OR9842</a></td>
										<td>Call of Duty IV</td>
									</tr>
								</tbody>
							</table>
						</div>

					</div>
					<!-- /.card-body -->
				</div>

				<!-- /.card-header -->
				<!-- /.card-body -->
			</div>
		</div>

		<div class="row">
			<div class="card col-md-9">
				<div id="myCarousel" class="carousel slide" data-interval="false">
					<!-- Indicators -->

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">

							<canvas id="barChart"
								style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%; display: block; width: 644px;"
								width="644" height="250" class="chartjs-render-monitor"></canvas>
						</div>

						<div class="item">

							<canvas id="pieChart"
								style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%; display: block; width: 644px;"
								width="644" height="250" class="chartjs-render-monitor"></canvas>

						</div>

					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>

			<div class="card col-md-3"
				style="position: relative; left: 0px; top: 0px;">
				<div class="card-header ui-sortable-handle" style="cursor: move;">
					<tr role="row">
						<th tabindex="0" aria-controls="example2" rowspan="1"
							style="text-align: center;" colspan="1" aria-label="">
							<div class="col-md-5">PCR키트 500개</div>
							<div class="card-tools ">
								<button type="button" class="btn btn-tool"
									onclick="OpenWindow('pcrKitForm', '키트등록', 800,765)">
									<i class="fas fa-plus"></i>
								</button>

							</div>
						</th>
					</tr>

				</div>
				<!-- /.card-header -->
				<div class="card-body" style="padding: 0px;">
					<div class="table-responsive">
						<table class="table m-0" style="text-align: center;">
							<thead>
								<tr role="row">
									<th tabindex="0" aria-controls="example2" rowspan="1" style="text-align: center;"
										colspan="1" class="col-md-4"
										aria-label="Browser: activate to sort column ascending">등록일</th>
									<th tabindex="0" aria-controls="example2" rowspan="1" style="text-align: center;"
										colspan="1" class="col-md-4"
										aria-label="Browser: activate to sort column ascending">이름</th>
									<th tabindex="0" aria-controls="example2" rowspan="1" style="text-align: center;"
										colspan="1" class="col-md-4"
										aria-label="Platform(s): activate to sort column ascending">수량</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
											value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-01</td>
									<td>홍길동</td>
									<td>500</td>
								</tr>
								<tr>
									<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
											value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-01</td>
									<td>홍길동</td>
									<td>500</td>
								</tr>
								<tr>
									<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
											value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-01</td>
									<td>홍길동</td>
									<td>500</td>
								</tr>
								<tr>
									<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
											value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-01</td>
									<td>홍길동</td>
									<td>500</td>
								</tr>
								<tr>
									<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
											value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-01</td>
									<td>홍길동</td>
									<td>500</td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>
				<!-- /.card-body -->
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
	<script type="text/javascript">
		var context = document.getElementById('barChart').getContext('2d');
		var myChart = new Chart(context, {
			type : 'bar', // 차트의 형태
			data : { // 차트에 들어갈 데이터
				labels : [
				//x 축
				'1일', '2일', '3일', '4일', '5일', '6일', '7일' ],
				datasets : [
						{ //데이터
							label : 'test1', //차트 제목
							fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
							data : [ 21, 19, 25, 20, 51, 26, 25 //x축 label에 대응되는 데이터 값
							],
							backgroundColor : [
							//색상
							'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 159, 64, 0.2)' ],
							borderColor : [
							//경계선 색상
							'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(255, 159, 64, 1)' ],
							borderWidth : 1
						//경계선 굵기
						}, {
							label : 'test2',
							fill : false,
							data : [ 8, 34, 12, 24 ],
							backgroundColor : 'rgb(157, 109, 12)',
							borderColor : 'rgb(157, 109, 12)'
						} ]
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});

		const data = {
			labels : [ 'Red', 'Orange', 'Yellow', 'Green', 'Blue' ],
			datasets : [ {
				label : 'Dataset 1',
				data : [ 21, 19, 25, 20, 51 ], //x축 label에 대응되는 데이터 값

				backgroundColor : [
				//색상
				'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)' ],
				borderColor : [
				//경계선 색상
				'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)', ],
				borderWidth : 1
			} ]
		};

		var context1 = document.getElementById('pieChart').getContext('2d');
		var pieChart = new Chart(context1, {
			type : 'pie',
			data : data,
			options : {
				responsive : true,
				plugins : {
					legend : {
						position : 'right',
					},
					title : {
						display : true,
						text : 'Chart.js Pie Chart'
					}
				}
			},
		});
	</script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</body>


