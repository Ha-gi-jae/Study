<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
</head>
<body>
	<div class="wrapper" style="max-width: 1280px; margin: 0 auto;">
		<br>
		<br>
		<h2>상세 현황</h2>
		<hr>
          <span style="font-weight: bold; margin-left: 17px;">일일 및 누적 확진환자 추세</span>
          
          <div class="card-body">
          		<canvas id="myChart"></canvas>
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
	        						suggestedMax: 10000,
	        						stepSize : 1000
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
            		backgroundColor: ['#f74336', '#36302f'],
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