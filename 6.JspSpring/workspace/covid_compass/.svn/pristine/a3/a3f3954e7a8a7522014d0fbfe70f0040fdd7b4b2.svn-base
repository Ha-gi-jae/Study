<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<head></head>

<title></title>

<body> 
	<div class="card">
		<div class="card-header" style="background-color: #5b6f90;">
			<h3 class="card-title" style="color: white;">통계</h3>

			<div class="card-tools ">
				<button type="button" class="btn btn-tool" data-card-widget="collapse">
					<i class="fas fa-minus" style="color: white;"></i>
				</button>
				<button type="button" class="btn btn-tool" data-card-widget="remove">
					<i class="fas fa-times" style="color: white;"></i>
				</button>
			</div>
		</div>
		<div class="card-body " style="display: block;">
			<div class="row">
				<div class="col-md-6">
					<div class="chart">
						<div class="chartjs-size-monitor ">
							<div class="chartjs-size-monitor-expand">
								<div class=""></div>
							</div>
							<div class="chartjs-size-monitor-shrink">
								<div class=""></div>
							</div>
						</div>
						<canvas id="barChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%; display: block; width: 644px;" width="644" height="250" class="chartjs-render-monitor"></canvas>
					</div>
				</div>
				<div class="col-md-6">
					<div class="chart-responsive">
						<div class="chartjs-size-monitor">
							<div class="chartjs-size-monitor-expand">
								<div class=""></div>
							</div>
							<div class="chartjs-size-monitor-shrink">
								<div class=""></div>
							</div>
						</div>
						<canvas id="pieChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%; display: block; width: 644px;" width="644" height="250" class="chartjs-render-monitor"></canvas>
					</div>
					<!-- ./chart-responsive -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.card-body -->
		</div>


		<br>
		<div class="#">
			<div class="card-header border-transparent" style="background-color: #5b6f90;">
				<h3 class="card-title" style="color: white;">피검자 대기목록</h3>
			</div>
			<!-- /.card-header -->
			<div class="#">
				<div class="table-responsive">
					<table class="table m-0">
						<thead>
							<tr>
								<th>고유번호</th>
								<th>이름</th>
								<th>나이</th>
								<th>Status</th>
								<th>Popularity</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><a href="#">피검자1</a></td>
								<td>정보1</td>
								<td>정보2</td>
								<td>정보3</td>
								<td>정보4</td>
							</tr>
							<tr>
								<td><a href="#">피검자2</a></td>
								<td>정보1</td>
								<td>정보2</td>
								<td>정보3</td>
								<td>정보4</td>
							</tr>
							<tr>
								<td><a href="#">피검자3</a></td>
								<td>정보1</td>
								<td>정보2</td>
								<td>정보3</td>
								<td>정보4</td>
							</tr>
							<tr>
								<td><a href="#">피검자4</a></td>
								<td>정보1</td>
								<td>정보2</td>
								<td>정보3</td>
								<td>정보4</td>
							</tr>
							<tr>
								<td><a href="#">피검자5</a></td>
								<td>정보1</td>
								<td>정보2</td>
								<td>정보3</td>
								<td>정보4</td>
							</tr>

						</tbody>
					</table>
				</div>
				<!-- /.table-responsive -->
			</div>
			<!-- /.card-body -->
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
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


</body>


