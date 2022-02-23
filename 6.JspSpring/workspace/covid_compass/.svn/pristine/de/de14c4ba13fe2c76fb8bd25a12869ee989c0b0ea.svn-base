<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
	<div class="wrapper" style="max-width: 1280px; margin: 0 auto; margin-top: 12px;">
		
		<span style="font-weight: bold; margin-left: 17px;">국내 발생현황</span>
		
		<div class="card-body">
                <table class="table table-bordered">
                  <thead>
                    <tr style="text-align: center; font-weight: bold; background-color:#f5fafc ">
                      <th colspan="2" style="width: 120px">사망</th>
                      <th colspan="2" style="width: 120px">재원 위중증</th>
                      <th colspan="2" style="width: 120px">신규입원</th>
                      <th colspan="2" style="width: 120px">확진</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr style="text-align: center; font-weight: bold; ">
                      <td>일일</td>
                      <td>인구 10만명당</td>
                      
                      <td>일일</td>
                      <td>인구 10만명당</td>
                      
                      <td >일일</td>
                      <td>인구 10만명당</td>
                      
                      <td>일일</td>
                      <td>인구 10만명당</td>
                    </tr>
                    
                    <tr style="text-align: center">
                      <td>36</td>
                      <td>0.07</td>
                      
                      <td>1,015</td>
                      <td>1.96</td>
                      
                      <td>347</td>
                      <td>0.67</td>
                      
                      <td>3,129</td>
                      <td>6.04</td>
                    </tr>
                   
                  </tbody>
                </table>
          </div>
          
        <span style="font-weight: bold; margin-left: 17px;">사망 현황</span>
		
		<div class="card-body">
                <table class="table table-bordered">
                  <thead>
                    <tr style="text-align: center; font-weight: bold; background-color:#f5fafc;">
                      <th style="width: 90px">구분</th>
                      <th style="width: 40px">12.28</th>
                      <th style="width: 40px">12.29</th>
                      <th style="width: 40px">12.30</th>
                      <th style="width: 40px">12.31</th>
                      <th style="width: 40px">01.01</th>
                      <th style="width: 40px">01.02</th>
                      <th style="width: 40px">01.02</th>
                      <th style="width: 70px">주간일평균</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr style="text-align: center;">
                      <td style="font-weight: bold">일일</td>
                      <td>46</td>
                      <td>46</td>
                      <td>46</td>
                      <td>46</td>
                      <td>46</td>
                      <td>46</td>
                      <td>46</td>
                      <td>46</td>
                    </tr>
                    
                    <tr style="text-align: center;">
                      <td style="font-weight: bold">인구 10만명 당</td>
                      <td>0.09</td>
                      <td>0.07</td>
                      <td>0.14</td>
                      <td>0.21</td>
                      <td>0.12</td>
                      <td>0.13</td>
                      <td>0.07</td>
                      <td>0.12</td>
                    </tr>
                   
                  </tbody> 
                </table>
          </div>
          
          <span style="font-weight: bold; margin-left: 17px;">확진 현황</span>
		
		<div class="card-body">
                <table class="table table-bordered">
                  <thead>
                    <tr style="text-align: center; font-weight: bold; background-color:#f5fafc;">
                      <th style="width: 90px">구분</th>
                      <th style="width: 40px">12.28</th>
                      <th style="width: 40px">12.29</th>
                      <th style="width: 40px">12.30</th>
                      <th style="width: 40px">12.31</th>
                      <th style="width: 40px">01.01</th>
                      <th style="width: 40px">01.02</th>
                      <th style="width: 40px">01.02</th>
                      <th style="width: 70px">주간일평균</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr style="text-align: center;">
                      <td style="font-weight: bold">일일</td>
                      <td>3,864</td>
                      <td>5,406</td>
                      <td>5,035</td>
                      <td>4,874</td>
                      <td>4,415</td>
                      <td>3,832</td>
                      <td>3,129</td>
                      <td>4,365</td>
                    </tr>
                    
                    <tr style="text-align: center;">
                      <td style="font-weight: bold">인구 10만명 당</td>
                      <td>7.49</td>
                      <td>10.43</td>
                      <td>9.71</td>
                      <td>9.41</td>
                      <td>8.52</td>
                      <td>7.39</td>
                      <td>6.07</td>
                      <td>8.42</td>
                    </tr>
                   
                  </tbody> 
                </table>
          </div>
          
          
          <span style="font-weight: bold; margin-left: 17px;">일일 및 누적 확진환자 추세</span>
          
          <div class="card-body">
          		<canvas id="myChart"></canvas>
          </div>
		  
		  <div class="col-6" style="float:left">
			  <span style="font-weight: bold; margin-left: 17px;">성별 확진자 현황</span>
				  <div class="card-body">
						<canvas id="pieChart"></canvas>		  
				  </div>
			  	  
		  </div>
		  <div class="col-6" style="float:right">
			  <span style="font-weight: bold; margin-left: 20px;">연령별 확진자 현황</span>
				  <div class="card-body">
						<canvas id="ageChart"></canvas>		  
				  </div>
			  	  
		  </div>
		  
			
	</div>
	
	<script type="text/javascript">
            var context = document.getElementById('myChart').getContext('2d');
            

            
            var myChart = new Chart(context, 
            {
                type: 'line', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                	//x축
                    labels: ['12.28','12.29','12.30','12.31','01.01','01.02','01.03'],
                    //데이터
                    //'rgb(247,12,12)'
                    datasets: [
				                    { 
				                            label: '일별 확진환자', //차트 제목
				                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
				                            backgroundColor:'rgb(247,12,12)',
				                            borderColor:'rgba(255, 99, 132, 1)',
				                            yAxisID: 'y_left',
				                            data: [3864,5406,5035,4874,4415,3832,3129] //x축 label에 대응되는 데이터 값
				                    },
				                    
				                    {
				                    	label: '누적 확진환자',
				                    	fill: false,
				                        type : 'bar', // 'bar' type, 전체 타입과 같다면 생략가능
				                        backgroundColor: 'rgb(111, 121, 255)',
				                        borderColor: 'rgb(255, 204, 102)',
				                        yAxisID: 'y_right',
				                        data: [615515, 620922, 625957, 630831, 635246, 639078, 642207],
				                    	
				                    }
				                    
                			  ],
                          
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
            		data: [50, 45] 
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
                                50834,64376,95818,93403,93897,93010,91227,38886,20756 //x축 label에 대응되는 데이터 값
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