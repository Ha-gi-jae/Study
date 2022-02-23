<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">
  
  <script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
  
</head>

<body>


	<div class="wrapper" style="max-width: 1280px; margin: 0 auto;">
		<br> <span style="font-weight: bold; margin-left: 17px;">보건소 통계</span>

		<div class="card-body">
			<table class="table table-bordered">
				<thead>
					<tr style="text-align: center; font-weight: bold; background-color: #f5fafc">
						<th colspan="2" style="width: 120px">검사시료</th>
						<th colspan="2" style="width: 120px">양성</th>
						<th colspan="2" style="width: 120px">음성</th>
					</tr>
				</thead>
				<tbody>
					<tr style="text-align: center; font-weight: bold;">
						<td>일주일</td>
						<td>누적</td>

						<td>일주일</td>
						<td>누적</td>

						<td>일주일</td>
						<td>누적</td>

					</tr>
					<tr style="text-align: center">
						<td style="font-weight: bold;">${dataMap.pbhtOneWeekStats.inspSmpleCnt}</td>
						<td style="color: red; font-weight: bold;">${dataMap.pbhtAllStats.inspSmpleCnt}</td>

						<td style="font-weight: bold;">${dataMap.pbhtOneWeekStats.pstvCnt}</td>
						<td style="color: red; font-weight: bold;">${dataMap.pbhtAllStats.pstvCnt}</td>

						<td style="font-weight: bold;">${dataMap.pbhtOneWeekStats.ngtvCnt}</td>
						<td style="color: red; font-weight: bold;">${dataMap.pbhtAllStats.ngtvCnt}</td>

					</tr>

				</tbody>
			</table>
		</div>

		<span style="font-weight: bold; margin-left: 17px;">중증도 추이</span>
		<script>
 		function gogo(test){
			
		} 
		
		</script>
		<div class="card-body">
			<table class="table table-bordered">
				<thead>
					<tr style="text-align: center; font-weight: bold; background-color: #f5fafc">
						<th colspan="1" style="width: 120px">구분</th>
						<th colspan="1" style="width: 120px">${weekMap.statsDate.oneDay}</th>
						<th colspan="1" style="width: 120px">${weekMap.statsDate.twoDay}</th>
						<th colspan="1" style="width: 120px">${weekMap.statsDate.threeDay}</th>
						<th colspan="1" style="width: 120px">${weekMap.statsDate.fourDay}</th>
						<th colspan="1" style="width: 120px">${weekMap.statsDate.fiveDay}</th>
						<th colspan="1" style="width: 120px">${weekMap.statsDate.sixDay}</th>
						<th colspan="1" style="width: 120px">${weekMap.statsDate.sevenDay}</th>
						<th colspan="1" style="width: 120px">7일 평균</th>
					</tr>
				</thead>
				<tbody>
					<tr style="text-align: center; font-weight: bold;">
						<td>중증 및 중등증</td>
						<td>${oneDayMap.D101.cnt eq null ? '-' : oneDayMap.D101.cnt}</td>
						<td>${twoDayMap.D101.cnt eq null ? '-' : twoDayMap.D101.cnt}</td>
						<td>${threeDayMap.D101.cnt eq null ? '-' : threeDayMap.D101.cnt}</td>
						<td>${fourDayMap.D101.cnt eq null ? '-' : fourDayMap.D101.cnt}</td>
						<td>${fiveDayMap.D101.cnt eq null ? '-' : fiveDayMap.D101.cnt}</td>
						<td>${sixDayMap.D101.cnt eq null ? '-' : sixDayMap.D101.cnt}</td>
						<td>${sevenDayMap.D101.cnt eq null ? '-' : sevenDayMap.D101.cnt}</td>
						<td>
							<strong style="color: red;"><fmt:formatNumber value="${(oneDayMap.D101.cnt + twoDayMap.D101.cnt + threeDayMap.D101.cnt + fourDayMap.D101.cnt + fiveDayMap.D101.cnt +
                            sixDayMap.D101.cnt + sevenDayMap.D101.cnt) / 7}" pattern="0.00"></fmt:formatNumber></strong>
						</td>
					</tr>
					<tr style="text-align: center; font-weight: bold;">
						<td>미중증 및 경증</td>
						<td>${oneDayMap.D102.cnt eq null ? '-' : oneDayMap.D102.cnt}</td>
						<td>${twoDayMap.D102.cnt eq null ? '-' : twoDayMap.D102.cnt}</td>
						<td>${threeDayMap.D102.cnt eq null ? '-' : threeDayMap.D102.cnt}</td>
						<td>${fourDayMap.D102.cnt eq null ? '-' : fourDayMap.D102.cnt}</td>
						<td>${fiveDayMap.D102.cnt eq null ? '-' : fiveDayMap.D102.cnt}</td>
						<td>${sixDayMap.D102.cnt eq null ? '-' : sixDayMap.D102.cnt}</td>
						<td>${sevenDayMap.D102.cnt eq null ? '-' : sevenDayMap.D102.cnt}</td>
						<td>
							<strong style="color: red;"><fmt:formatNumber value="${(oneDayMap.D102.cnt + twoDayMap.D102.cnt + threeDayMap.D102.cnt + fourDayMap.D102.cnt + fiveDayMap.D102.cnt +
                            sixDayMap.D102.cnt + sevenDayMap.D102.cnt) / 7}" pattern="0.00"></fmt:formatNumber></strong>
						</td>
					</tr>
					<tr style="text-align: center; font-weight: bold;">
						<td>무증상</td>
						<td>${oneDayMap.D103.cnt eq null ? '-' : oneDayMap.D103.cnt}</td>
						<td>${twoDayMap.D103.cnt eq null ? '-' : twoDayMap.D103.cnt}</td>
						<td>${threeDayMap.D103.cnt eq null ? '-' : threeDayMap.D103.cnt}</td>
						<td>${fourDayMap.D103.cnt eq null ? '-' : fourDayMap.D103.cnt}</td>
						<td>${fiveDayMap.D103.cnt eq null ? '-' : fiveDayMap.D103.cnt}</td>
						<td>${sixDayMap.D103.cnt eq null ? '-' : sixDayMap.D103.cnt}</td>
						<td>${sevenDayMap.D103.cnt eq null ? '-' : sevenDayMap.D103.cnt}</td>
						<td>
							<strong style="color: red;"><fmt:formatNumber value="${(oneDayMap.D103.cnt + twoDayMap.D103.cnt + threeDayMap.D103.cnt + fourDayMap.D103.cnt + fiveDayMap.D103.cnt +
                            sixDayMap.D103.cnt + sevenDayMap.D103.cnt) / 7}" pattern="0.00"></fmt:formatNumber></strong>
						</td>
					</tr>
					<tr style="text-align: center; font-weight: bold;">
						<td>음성</td>
						<td>${oneDayMap.negativeData.cnt eq null ? '-' : oneDayMap.negativeData.cnt}</td>
						<td>${twoDayMap.negativeData.cnt eq null ? '-' : twoDayMap.negativeData.cnt}</td>
						<td>${threeDayMap.negativeData.cnt eq null ? '-' : threeDayMap.negativeData.cnt}</td>
						<td>${fourDayMap.negativeData.cnt eq null ? '-' : fourDayMap.negativeData.cnt}</td>
						<td>${fiveDayMap.negativeData.cnt eq null ? '-' : fiveDayMap.negativeData.cnt}</td>
						<td>${sixDayMap.negativeData.cnt eq null ? '-' : sixDayMap.negativeData.cnt}</td>
						<td>${sevenDayMap.negativeData.cnt eq null ? '-' : sevenDayMap.negativeData.cnt}</td>
						<td>
							<strong style="color: red;"><fmt:formatNumber value="${(oneDayMap.negativeData.cnt + twoDayMap.negativeData.cnt + 
                            threeDayMap.negativeData.cnt + fourDayMap.negativeData.cnt + fiveDayMap.negativeData.cnt +
                            sixDayMap.negativeData.cnt + sevenDayMap.negativeData.cnt) / 7}" pattern="0.00"></fmt:formatNumber></strong>
						</td>
					</tr>

				</tbody>
			</table>
		</div>
		<div style="text-align: center;">
			<h1 style="font-weight: bold;">코로나19 전국 현황</h1>
		</div>


		<div class="wrapper" style="max-width: 1280px; margin: 0 auto;">

			<span style="font-weight: bold; margin-left: 17px;">발생현황</span>

			<div class="card-body">
				<table class="table table-bordered">
					<thead>
						<tr style="text-align: center; font-weight: bold; background-color: #f5fafc">
							<th colspan="2" style="width: 120px">사망</th>
							<th colspan="2" style="width: 120px">확진</th>
						</tr>
					</thead>
					<tbody>
						<tr style="text-align: center; font-weight: bold;">
							<td>일일</td>
							<td>인구 10만명당</td>

							<td>일일</td>
							<td>인구 10만명당</td>
						</tr>

						<tr style="text-align: center; font-weight: bold;">
							<td style="color: red;">${dailyCovidMap.sevenDay.death}</td>
							<td>${wholeCovidVO.millionDeathPrsStr}</td>

							<td style="color: red;">${commaDailyCovidMap.commaSevendayConfirm}</td>
							<td>${wholeCovidVO.millionConfirmPrsStr}</td>
						</tr>

					</tbody>
				</table>
			</div>

			<span style="font-weight: bold; margin-left: 17px;">사망 현황</span>

			<div class="card-body">
				<table class="table table-bordered">
					<thead>
						<tr style="text-align: center; font-weight: bold; background-color: #f5fafc;">
							<th style="width: 90px">구분</th>
							<th style="width: 40px">${dailyCovidMap.oneDay.month}-${dailyCovidMap.oneDay.day}일</th>
							<th style="width: 40px">${dailyCovidMap.twoDay.month}-${dailyCovidMap.twoDay.day}일</th>
							<th style="width: 40px">${dailyCovidMap.threeDay.month}-${dailyCovidMap.threeDay.day}일</th>
							<th style="width: 40px">${dailyCovidMap.fourDay.month}-${dailyCovidMap.fourDay.day}일</th>
							<th style="width: 40px">${dailyCovidMap.fiveDay.month}-${dailyCovidMap.fiveDay.day}일</th>
							<th style="width: 40px">${dailyCovidMap.sixDay.month}-${dailyCovidMap.sixDay.day}일</th>
							<th style="width: 40px">${dailyCovidMap.sevenDay.month}-${dailyCovidMap.sevenDay.day}일</th>
							<th style="width: 70px">
								<strong>7일 평균</strong>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr style="text-align: center; font-weight: bold;">
							<td style="font-weight: bold">일일</td>
							<td>${dailyCovidMap.oneDay.death}</td>
							<td>${dailyCovidMap.twoDay.death}</td>
							<td>${dailyCovidMap.threeDay.death}</td>
							<td>${dailyCovidMap.fourDay.death}</td>
							<td>${dailyCovidMap.fiveDay.death}</td>
							<td>${dailyCovidMap.sixDay.death}</td>
							<td>${dailyCovidMap.sevenDay.death}</td>
							<td>
								<strong style="color: red;">${dailyCovidMap.oneDay.avgDeath}</strong>
							</td>
						</tr>

						<tr style="text-align: center; font-weight: bold;">
							<td style="font-weight: bold">인구 10만명 당</td>
							<td>${dailyCovidMap.oneDay.millionDeathStr}</td>
							<td>${dailyCovidMap.twoDay.millionDeathStr}</td>
							<td>${dailyCovidMap.threeDay.millionDeathStr}</td>
							<td>${dailyCovidMap.fourDay.millionDeathStr}</td>
							<td>${dailyCovidMap.fiveDay.millionDeathStr}</td>
							<td>${dailyCovidMap.sixDay.millionDeathStr}</td>
							<td>${dailyCovidMap.sevenDay.millionDeathStr}</td>
							<td>
								<strong style="color: red;">${dailyCovidMap.oneDay.avgMillionDeath}</strong>
							</td>
						</tr>

					</tbody>
				</table>
			</div>

			<span style="font-weight: bold; margin-left: 17px;">확진 현황</span>

			<div class="card-body">
				<table class="table table-bordered">
					<thead>
						<tr style="text-align: center; font-weight: bold; background-color: #f5fafc;">
							<th style="width: 90px">구분</th>
							<th style="width: 40px">${dailyCovidMap.oneDay.month}-${dailyCovidMap.oneDay.day}일</th>
							<th style="width: 40px">${dailyCovidMap.twoDay.month}-${dailyCovidMap.twoDay.day}일</th>
							<th style="width: 40px">${dailyCovidMap.threeDay.month}-${dailyCovidMap.threeDay.day}일</th>
							<th style="width: 40px">${dailyCovidMap.fourDay.month}-${dailyCovidMap.fourDay.day}일</th>
							<th style="width: 40px">${dailyCovidMap.fiveDay.month}-${dailyCovidMap.fiveDay.day}일</th>
							<th style="width: 40px">${dailyCovidMap.sixDay.month}-${dailyCovidMap.sixDay.day}일</th>
							<th style="width: 40px">${dailyCovidMap.sevenDay.month}-${dailyCovidMap.sevenDay.day}일</th>
							<th style="width: 70px">7일 평균</th>
						</tr>
					</thead>
					<tbody>
						<tr style="text-align: center; font-weight: bold;">
							<td style="font-weight: bold">일일</td>
							<td>${commaDailyCovidMap.commaOnedayConfirm}</td>
							<td>${commaDailyCovidMap.commaTwodayConfirm}</td>
							<td>${commaDailyCovidMap.commaThreedayConfirm}</td>
							<td>${commaDailyCovidMap.commaFourdayConfirm}</td>
							<td>${commaDailyCovidMap.commaFivedayConfirm}</td>
							<td>${commaDailyCovidMap.commaSixdayConfirm}</td>
							<td>${commaDailyCovidMap.commaSevendayConfirm}</td>
							<td>
								<strong style="color: red;">${commaDailyCovidMap.commaAvgConfirm}</strong>
							</td>
						</tr>

						<tr style="text-align: center; font-weight: bold;">
							<td style="font-weight: bold">인구 10만명 당</td>
							<td>${dailyCovidMap.oneDay.millionConfirmStr}</td>
							<td>${dailyCovidMap.twoDay.millionConfirmStr}</td>
							<td>${dailyCovidMap.threeDay.millionConfirmStr}</td>
							<td>${dailyCovidMap.fourDay.millionConfirmStr}</td>
							<td>${dailyCovidMap.fiveDay.millionConfirmStr}</td>
							<td>${dailyCovidMap.sixDay.millionConfirmStr}</td>
							<td>${dailyCovidMap.sevenDay.millionConfirmStr}</td>
							<td>
								<strong style="color: red;">${dailyCovidMap.oneDay.avgMillionConfirm}</strong>
							</td>
						</tr>

					</tbody>
				</table>
			</div>


			<span style="font-weight: bold; margin-left: 17px;">일일 및 누적 확진환자 추세</span>

			<div class="card-body">
				<canvas id="myChart"></canvas>
			</div>

			<div class="col-6" style="float: left">
				<span style="font-weight: bold; margin-left: 17px;">성별 확진자 현황</span>
				<div class="card-body">
					<canvas id="pieChart"></canvas>
				</div>

			</div>
			<div class="col-6" style="float: right">
				<span style="font-weight: bold; margin-left: 20px;">연령별 확진자 현황</span>
				<div class="card-body">
					<canvas id="ageChart"></canvas>
				</div>

			</div>
		</div>
	</div>

	<script type="text/javascript">
            var context = document.getElementById('myChart').getContext('2d');
            
            var wholeConfirm =parseInt(${wholeCovidVO.confirm});
			var twodayConfirm =parseInt(${dailyCovidMap.twoDay.confirm});	
			var threedayConfirm =parseInt(${dailyCovidMap.threeDay.confirm});	
			var fourdayConfirm =parseInt(${dailyCovidMap.fourDay.confirm});	
			var fivedayConfirm =parseInt(${dailyCovidMap.fiveDay.confirm});	
			var sixdayConfirm =parseInt(${dailyCovidMap.sixDay.confirm});	
			var sevendayConfirm =parseInt(${dailyCovidMap.sevenDay.confirm});	
            
            var myChart = new Chart(context, 
            {
                type: 'line', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                	//x축
                    labels: ['${dailyCovidMap.oneDay.month}.${dailyCovidMap.oneDay.day}일'
                    		,'${dailyCovidMap.twoDay.month}.${dailyCovidMap.twoDay.day}일'
                    		,'${dailyCovidMap.threeDay.month}.${dailyCovidMap.threeDay.day}일'
                    		,'${dailyCovidMap.fourDay.month}.${dailyCovidMap.fourDay.day}일'
                    		,'${dailyCovidMap.fiveDay.month}.${dailyCovidMap.fiveDay.day}일'
                    		,'${dailyCovidMap.sixDay.month}.${dailyCovidMap.sixDay.day}일'
                    		,'${dailyCovidMap.sevenDay.month}.${dailyCovidMap.sevenDay.day}일'],
                    //데이터
                    //'rgb(247,12,12)'
                    datasets: [
				                    { 
				                            label: '일별 확진환자', //차트 제목
				                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
				                            backgroundColor:'rgb(247,12,12)',
				                            borderColor:'rgba(255, 99, 132, 1)',
				                            yAxisID: 'y_left',
				                            data: [${dailyCovidMap.oneDay.confirm},
				                            	   ${dailyCovidMap.twoDay.confirm},
				                            	   ${dailyCovidMap.threeDay.confirm},
				                            	   ${dailyCovidMap.fourDay.confirm},
				                            	   ${dailyCovidMap.fiveDay.confirm},
				                            	   ${dailyCovidMap.sixDay.confirm},
				                            	   ${dailyCovidMap.sevenDay.confirm}] //x축 label에 대응되는 데이터 값
				                    },
				                    
				                    {
				                    	label: '누적 확진환자',
				                    	fill: false,
				                        type : 'bar', // 'bar' type, 전체 타입과 같다면 생략가능
				                        backgroundColor: 'rgb(111, 121, 255)',
				                        borderColor: 'rgb(255, 204, 102)',
				                        barPercentage: 0.5,
				                        yAxisID: 'y_right',
				                        data: [wholeConfirm-(sevendayConfirm+sixdayConfirm+fivedayConfirm+fourdayConfirm+threedayConfirm+twodayConfirm),
				                        	   wholeConfirm-(sevendayConfirm+sixdayConfirm+fivedayConfirm+fourdayConfirm+threedayConfirm),
				                        	   wholeConfirm-(sevendayConfirm+sixdayConfirm+fivedayConfirm+fourdayConfirm),
				                        	   wholeConfirm-(sevendayConfirm+sixdayConfirm+fivedayConfirm),
				                        	   wholeConfirm-(sevendayConfirm+sixdayConfirm),
				                        	   wholeConfirm-sevendayConfirm,
				                        	   wholeConfirm],
				                    	
				                    }
                			  ]
                          
	                },
	                options: {
	                	responsive:true,
	                    scales: {
	                    	y_left:{
	        					ticks: {
	        						
	        						suggestedMin: 0,
	        						suggestedMax: 100000,
	        						stepSize : 2000
	        					},
	        					beginAtZero:true,
	        					position : 'left'
	        				},
	                    	y_right:{
								ticks: {
	        						suggestedMin: 0,
	        						suggestedMax: 1000000,
	        						stepSize : 100000
	        					},
	        					beginAtZero:true,
	                    		position: 'right'
	                    		
	                    		
	                    	},
	                    		                    	
	                    },
	                    animation:false,
	                    showValue:{
	                    	fontStyle:'Helvetica',
	                    	fontSize: 20
	                    }
	                    
	                },
                
               
                
                
            });
           
            var dataset = { 
            		//라벨별 컬러설정 
            		backgroundColor: ['#0740fa', '#ff8af3'],
            		borderColor: '#22252B',
            		data: [${genderMap.male}, ${genderMap.female}] 
            }
            var labels=['남성','여성'];
            var datasets={ datasets:[dataset], labels:labels}
    		
            var config = { 
            		type: 'pie',
            		//데이터 셋 
            		data: datasets,
            		options: { 
            			responsive: true, 
            			//true 하게 되면 캔버스 width,height에 따라 리사이징된다.
            			maintainAspectRatio: false,  
            			legend: { 
            				position: 'top', 
            				fontColor: 'black', 
            				align: 'center', 
            				display: true, 
            				fullWidth: true, 
            				labels: { 
            					fontColor: 'rgb(0, 0, 0)' 
            				} 
            			}, 
            			plugins: { 
            				labels: {//두번째 script태그를 설정하면 각 항목에다가 원하는 데이터 라벨링을 할 수 있다. 
            					render: 'value', 
            					fontColor: 'black', 
            					fontSize: 15, 
            					precision: 2 
            					} 
            			} 
            	  } 
            }

            
            var contextpie = document.getElementById('pieChart');
            var pieChart = new Chart(contextpie,config);
            
            
            //연령별 확진자
             var context = document.getElementById('ageChart').getContext('2d');
            var myChart = new Chart(context, {
                type: 'bar', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        '0~9세','10대','20대','30대','40대','50대','60대','70대','80대이상'
                    ],
                    datasets: [
                        { //데이터
                            label: '확진자 수', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                                ${covidStatsAgeVO.teenagerYounger},${covidStatsAgeVO.teenager}
                                ,${covidStatsAgeVO.twenty},${covidStatsAgeVO.thirty}
                                ,${covidStatsAgeVO.forty},${covidStatsAgeVO.fifty}
                                ,${covidStatsAgeVO.sixty},${covidStatsAgeVO.seventy}
                                ,${covidStatsAgeVO.eighty} //x축 label에 대응되는 데이터 값
                            ],
                            backgroundColor: [
                                //색상
                                'rgba(247, 67, 54)'
                            ]
                            
                        }
                    ]
                },
                options: {
                	plugins: {
	                	legend: {
	                		display: false,
	                	},
                	},
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                    
                }
            });

            
        </script>
		
		
	
</body>
</html>