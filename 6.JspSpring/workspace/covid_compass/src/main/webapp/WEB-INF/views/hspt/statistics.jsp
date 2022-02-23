<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>

<style>
.chart-container {
  position: relative;
  margin: 0px;
  padding: 0px;
}

</style>

</head>
<body>
	<div class="wrapper" style="max-width: 1280px; margin: 0 auto;">
		<h2>병원 통계</h2>
		<hr>
		
		<span style="font-weight: bold; margin-left: 17px;">입퇴원 추이</span>
		
		<div class="card-body">
                <table class="table table-bordered">
                  <thead>
                    <tr style="text-align: center; font-weight: bold; background-color:#f5fafc ">
                      <th colspan="2" style="width: 120px">입원</th>
                      <th colspan="2" style="width: 120px">완치</th>
                      <th colspan="2" style="width: 120px">이원</th>
                      <th colspan="2" style="width: 120px">사망</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr style="text-align: center; font-weight: bold; ">
                      <td>일일</td>
                      <td>최근 일주일간</td>
                      
                      <td>일일</td>
                      <td>최근 일주일간</td>
                      
                      <td >일일</td>
                      <td>최근 일주일간</td>
                      
                      <td>일일</td>
                      <td>최근 일주일간</td>
                    </tr>
                    
                    <tr style="text-align: center; font-weight: bold;">
                    
                      <td id="inptntCntDaily"style="color: red;">-</td>
                      <td id="inptntCntWeekly">-</td>
                      
                      <td id="rlsedCntDaily"style="color: red;">-</td>
                      <td id="rlsedCntWeekly">-</td>

                      <td id="outCntDaily"style="color: red;">-</td>
                      <td id="outCntWeekly">-</td>
                      
                      <td id="deathCntDaily"style="color: red;">-</td>
                      <td id="deathCntWeekly">-</td>
                      
                    </tr>
                   
                  </tbody>
                </table>
          </div>
          
        <span style="font-weight: bold; margin-left: 17px;">병상신청 현황</span>
		
		<div class="card-body">
                <table class="table table-bordered">
                  <thead>
                    <tr style="text-align: center; font-weight: bold; background-color:#f5fafc;">
                      <th style="width: 90px">구분</th>
                      <th style="width: 40px" id="oneDay1"   >${dailyCovidMap.oneDay.month}-${dailyCovidMap.oneDay.day}일</th>
                      <th style="width: 40px" id="twoDay1"   >${dailyCovidMap.twoDay.month}-${dailyCovidMap.twoDay.day}일</th>
                      <th style="width: 40px" id="threeDay1" >${dailyCovidMap.threeDay.month}-${dailyCovidMap.threeDay.day}일</th>
                      <th style="width: 40px" id="fourDay1"  >${dailyCovidMap.fourDay.month}-${dailyCovidMap.fourDay.day}일</th>
                      <th style="width: 40px" id="fiveDay1"  >${dailyCovidMap.fiveDay.month}-${dailyCovidMap.fiveDay.day}일</th>
                      <th style="width: 40px" id="sixDay1"   >${dailyCovidMap.sixDay.month}-${dailyCovidMap.sixDay.day}일</th>
                      <th style="width: 40px" id="sevenDay1" >${dailyCovidMap.sevenDay.month}-${dailyCovidMap.sevenDay.day}일</th>
                      <th style="width: 70px" id="week1"     >7일 평균</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr style="text-align: center;">
                      <td style="font-weight: bold">이원신청 수</td>
                      <td id="reqSckbdOneDay"    >-</td>
                      <td id="reqSckbdTwoDay"    >-</td>
                      <td id="reqSckbdThreeDay"  >-</td>
                      <td id="reqSckbdFourDay"   >-</td>
                      <td id="reqSckbdFiveDay"   >-</td>
                      <td id="reqSckbdSixDay"    >-</td>
                      <td id="reqSckbdSevenday"  >-</td>
                      <td style="color: red; font-weight: bold;" id="reqSckbdOneWeek">-</td>
                    </tr>
                    
                    <tr style="text-align: center;">
                      <td style="font-weight: bold">입소신청 수</td>
                      <td id="goLtctOneDay"  >-</td>
                      <td id="goLtctTwoDay"  >-</td>
                      <td id="goLtctThreeDay">-</td>
                      <td id="goLtctFourDay" >-</td>
                      <td id="goLtctFiveDay" >-</td>
                      <td id="goLtctSixDay"  >-</td>
                      <td id="goLtctSevenday">-</td>
                      <td style="color: red; font-weight: bold;" id="goLtctOneWeek" >-</td>
                    </tr>
                   
                  </tbody> 
                </table>
          </div>
          
          <span style="font-weight: bold; margin-left: 17px;">잔여병상 현황</span>
		
		<div class="card-body">
                <table class="table table-bordered">
                  <thead>
                    <tr style="text-align: center; font-weight: bold; background-color:#f5fafc;">
                      <th style="width: 90px">구분</th>
                      <th style="width: 40px" id="oneDay2"   >${dailyCovidMap.oneDay.month}-${dailyCovidMap.oneDay.day}일</th>
                      <th style="width: 40px" id="twoDay2"   >${dailyCovidMap.twoDay.month}-${dailyCovidMap.twoDay.day}일</th>
                      <th style="width: 40px" id="threeDay2" >${dailyCovidMap.threeDay.month}-${dailyCovidMap.threeDay.day}일</th>
                      <th style="width: 40px" id="fourDay2"  >${dailyCovidMap.fourDay.month}-${dailyCovidMap.fourDay.day}일</th>
                      <th style="width: 40px" id="fiveDay2"  >${dailyCovidMap.fiveDay.month}-${dailyCovidMap.fiveDay.day}일</th>
                      <th style="width: 40px" id="sixDay2"   >${dailyCovidMap.sixDay.month}-${dailyCovidMap.sixDay.day}일</th>
                      <th style="width: 40px" id="sevenDay2" >${dailyCovidMap.sevenDay.month}-${dailyCovidMap.sevenDay.day}일</th>
                      <th style="width: 70px" id="week2"     >7일 평균</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr style="text-align: center;">
                      <td style="font-weight: bold">잔여병상 수</td>
                      <td id="rmndSckbdOneDay"  >-</td>
                      <td id="rmndSckbdTwoDay"  >-</td>
                      <td id="rmndSckbdThreeDay">-</td>
                      <td id="rmndSckbdFourDay" >-</td>
                      <td id="rmndSckbdFiveDay" >-</td>
                      <td id="rmndSckbdSixDay"  >-</td>
                      <td id="rmndSckbdSevenday">-</td>
                      <td id="rmndSckbdOneWeek" style="color: red; font-weight: bold;" >-</td>
                    </tr>
                    
                    <tr style="text-align: center;">
                      <td style="font-weight: bold">가동률</td>
                      <td id="opRateOneDay"  >-</td>
                      <td id="opRateTwoDay"  >-</td>
                      <td id="opRateThreeDay">-</td>
                      <td id="opRateFourDay" >-</td>
                      <td id="opRateFiveDay" >-</td>
                      <td id="opRateSixDay"  >-</td>
                      <td id="opRateSevenday">-</td>
                      <td id="opRateOneWeek" style="color: red; font-weight: bold;" >-</td>
                    </tr>
                    
                    <tr style="text-align: center;">
                      <td style="font-weight: bold">총 병상 수</td>
                      <td id="sckbdOneDay"  >-</td>
                      <td id="sckbdTwoDay"  >-</td>
                      <td id="sckbdThreeDay">-</td>
                      <td id="sckbdFourDay" >-</td>
                      <td id="sckbdFiveDay" >-</td>
                      <td id="sckbdSixDay"  >-</td>
                      <td id="sckbdSevenday">-</td>
                      <td id="sckbdOneWeek" style="color: red; font-weight: bold;" >-</td>
                    </tr>
                   
                  </tbody> 
                </table>
          </div>
          
          
          <span style="font-weight: bold; margin-left: 17px;">잔여병상수 추이</span>
          
          <div class="card-body chart-container" id="rmndSckbdChardDiv" style="width : 1247px; height : 623px;">
          		<canvas id="rmndSckbdChart"></canvas>
          </div>
		  
		  <div class="col-6" style="float:left">
			  <span style="font-weight: bold; margin-left: 17px;">입퇴원 추이</span>
				  <div class="card-body chart-container" style="width: 592px; height: 300px;">
						<canvas id="inoutPtntChart"></canvas>		  
				  </div>
			  	  
		  </div>
		  <div class="col-6" style="float:right">
			  <span style="font-weight: bold; margin-left: 20px;">진료결과</span>
				  <div class="card-body chart-container" style="width: 592px; height: 296px;">
						<canvas id="dgnssChart"></canvas>		  
				  </div>
			  	  
		  </div>
		  
			
	</div>
	
       
<script>


window.onload = function(){
	getHsptMainStatsChart();
}

function getHsptMainStatsChart(){
	
	var url = '<%=request.getContextPath()%>/rest-hspt/main-chart';
	$.ajax({
	    url : url,
	    type : 'post',
	    dataType : 'json',
	    success: function(dataMap){
	    	printChart(dataMap);
	    },
	    error : function(error){
	      alert("error" + error.status);
	    }
	  })
	
}

function getOpRate(sckbdCnt, rmndSckbdCnt){
	var sckbd = parseInt(sckbdCnt);
	var rmndSckbd = parseInt(rmndSckbdCnt);
	
	if(sckbdCnt == 0) return 0;
	
	var opRate = rmndSckbd / sckbd;
	
	opRate = Math.round(opRate * 100) / 100;
	
	return opRate;
}

function printChart(dataMap){
	
	var hsptStatsList = dataMap.hsptStatsList;
	
	var myLabels = [];
	
	var curInptntCntData = [];
	var deathCntData = [];
	var dngssCntData = [];
	var goLtctCntData = [];
	var goSlfCntData = [];
	
	var inptntCntData = [];
	var outCntData = [];
	var reqSckbdCntData = [];
	var rlsedCntData = [];
	var rmndSckbdCntData = [];
	
	var sckbdCntData = [];
	var opRateData = [];
	
	hsptStatsList.forEach(function(item, index){
		myLabels.push(item.statsYmd.substring(0,10));
		
		curInptntCntData.push(item.curInptntCnt);
		deathCntData.push(item.deathCnt);
		dngssCntData.push(item.dgnssCnt);
		goLtctCntData.push(item.goLtctCnt);
		goSlfCntData.push(item.goSlfCnt);
		
		inptntCntData.push(item.inptntCnt);
		outCntData.push(item.outCnt);
		reqSckbdCntData.push(item.reqSckbdCnt);
		rlsedCntData.push(item.rlsedCnt);
		rmndSckbdCntData.push(item.rmndSckbdCnt);
		
		sckbdCntData.push(item.sckbdCnt);
		opRateData.push(getOpRate(item.sckbdCnt, item.rmndSckbdCnt));
		
	})
	
	const fnSum = (sum, curr) => sum + curr;
	
	// 표 생성
	$('#inptntCntDaily').html(inptntCntData[inptntCntData.length - 1]);
	$('#inptntCntWeekly').html(inptntCntData.reduce(fnSum));
	
	$('#rlsedCntDaily').html(rlsedCntData[rlsedCntData.length - 1]);
	$('#rlsedCntWeekly').html(rlsedCntData.reduce(fnSum));
	
	$('#outCntDaily').html(outCntData[outCntData.length - 1]);
	$('#outCntWeekly').html(outCntData.reduce(fnSum));
	
	$('#deathCntDaily').html(deathCntData[deathCntData.length - 1]);
	$('#deathCntWeekly').html(deathCntData.reduce(fnSum));
	
	$('#oneDay1').   html(getDate(myLabels[0]));
	$('#twoDay1').   html(getDate(myLabels[1]));
	$('#threeDay1'). html(getDate(myLabels[2]));
	$('#fourDay1').  html(getDate(myLabels[3]));
	$('#fiveDay1').  html(getDate(myLabels[4]));
	$('#sixDay1').   html(getDate(myLabels[5]));
	$('#sevenDay1'). html(getDate(myLabels[6]));
	
	$('#reqSckbdOneDay')  .html(reqSckbdCntData[0]);
	$('#reqSckbdTwoDay')  .html(reqSckbdCntData[1]);
	$('#reqSckbdThreeDay').html(reqSckbdCntData[2]);
	$('#reqSckbdFourDay') .html(reqSckbdCntData[3]);
	$('#reqSckbdFiveDay') .html(reqSckbdCntData[4]);
	$('#reqSckbdSixDay')  .html(reqSckbdCntData[5]);
	$('#reqSckbdSevenday').html(reqSckbdCntData[6]);
	$('#reqSckbdOneWeek') .html(getAvg(reqSckbdCntData));
	
	$('#goLtctOneDay')  .html(goLtctCntData[0]);
	$('#goLtctTwoDay')  .html(goLtctCntData[1]);
	$('#goLtctThreeDay').html(goLtctCntData[2]);
	$('#goLtctFourDay') .html(goLtctCntData[3]);
	$('#goLtctFiveDay') .html(goLtctCntData[4]);
	$('#goLtctSixDay')  .html(goLtctCntData[5]);
	$('#goLtctSevenday').html(goLtctCntData[6]);
	$('#goLtctOneWeek') .html(getAvg(goLtctCntData));
	
	$('#oneDay2').   html(getDate(myLabels[0]));
	$('#twoDay2').   html(getDate(myLabels[1]));
	$('#threeDay2'). html(getDate(myLabels[2]));
	$('#fourDay2').  html(getDate(myLabels[3]));
	$('#fiveDay2').  html(getDate(myLabels[4]));
	$('#sixDay2').   html(getDate(myLabels[5]));
	$('#sevenDay2'). html(getDate(myLabels[6]));

	$('#rmndSckbdOneDay')  .html(rmndSckbdCntData[0]);
	$('#rmndSckbdTwoDay')  .html(rmndSckbdCntData[1]);
	$('#rmndSckbdThreeDay').html(rmndSckbdCntData[2]);
	$('#rmndSckbdFourDay') .html(rmndSckbdCntData[3]);
	$('#rmndSckbdFiveDay') .html(rmndSckbdCntData[4]);
	$('#rmndSckbdSixDay')  .html(rmndSckbdCntData[5]);
	$('#rmndSckbdSevenday').html(rmndSckbdCntData[6]);
	$('#rmndSckbdOneWeek') .html(getAvg(rmndSckbdCntData));
	
	$('#opRateOneDay')  .html(opRateData[0]);
	$('#opRateTwoDay')  .html(opRateData[1]);
	$('#opRateThreeDay').html(opRateData[2]);
	$('#opRateFourDay') .html(opRateData[3]);
	$('#opRateFiveDay') .html(opRateData[4]);
	$('#opRateSixDay')  .html(opRateData[5]);
	$('#opRateSevenday').html(opRateData[6]);
	$('#opRateOneWeek') .html(getAvg(opRateData));
	
	$('#sckbdOneDay')  .html(sckbdCntData[0]);
	$('#sckbdTwoDay')  .html(sckbdCntData[1]);
	$('#sckbdThreeDay').html(sckbdCntData[2]);
	$('#sckbdFourDay') .html(sckbdCntData[3]);
	$('#sckbdFiveDay') .html(sckbdCntData[4]);
	$('#sckbdSixDay')  .html(sckbdCntData[5]);
	$('#sckbdSevenday').html(sckbdCntData[6]);
	$('#sckbdOneWeek') .html(getAvg(sckbdCntData));
	
	// 차트 생성
    var rmndSckbdChartContext = document.getElementById('rmndSckbdChart').getContext('2d');
	
	
    var rmndSckbdChart = new Chart(rmndSckbdChartContext, {
      type : 'bar', // 차트의 형태
      data : { // 차트에 들어갈 데이터
        labels :  myLabels,
        datasets : [
             { //데이터
                label : '총 병상 수' //차트 제목
                    ,fill : false // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                    ,data : sckbdCntData
                    ,backgroundColor : 'rgb(111, 121, 255)'
                    ,borderColor : 'rgb(255, 204, 102)'
                    ,borderWidth : 1
                    ,yAxisID: 'y_left'
                  //경계선 굵기
            }
            
            ,{ //데이터
                label : '잔여 병상 수' //차트 제목
                    ,fill : false // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                    ,data : rmndSckbdCntData
                    ,backgroundColor : 'rgba(255, 0, 0, 0.4)'
                    ,borderColor : 'rgba(255, 0, 0, 0.4)'
                    ,borderWidth : 1
                    ,yAxisID: 'y_left'
                  //경계선 굵기
            }
            
            
            ]
      },
      options : {
      	responsive:true,
        scales: {
        	y_left:{
				ticks: {
					
					suggestedMin: 0,
					suggestedMax: Math.max(...sckbdCntData),
					stepSize : Math.max(...sckbdCntData)/10
				},
				beginAtZero:true,
				position : 'left'
			},
  			y_right:{
				ticks: {
					suggestedMin: 0,
					suggestedMax: 1,
					stepSize : 0.2
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
    	  
      }
    });
    
	var inoutPtntChartContext = document.getElementById('inoutPtntChart').getContext('2d');
	
	console.log(Math.max(...curInptntCntData));
	
	var inoutPtntChart = new Chart(inoutPtntChartContext, {
	      type : 'bar', // 차트의 형태
	      data : { // 차트에 들어갈 데이터
	        labels :  myLabels,
	        datasets : [
	               { //데이터
	                   label : '입원' //차트 제목
	                       ,fill : false // line 형태일 때, 선 안쪽을 채우는지 안채우는지
	                       ,data : inptntCntData
	                       ,backgroundColor : 'rgba(0, 0, 0, 0.4)'
	                       ,borderColor : 'rgba(0, 0, 0, 0.4)'
	                       ,borderWidth : 1
	                     //경계선 굵기
	               }
	               
	               ,{ //데이터
	                   label : '완치' //차트 제목
	                       ,fill : false // line 형태일 때, 선 안쪽을 채우는지 안채우는지
	                       ,data : rlsedCntData
	                       ,backgroundColor : 'rgba(255, 0, 0, 0.4)'
	                       ,borderColor : 'rgba(255, 0, 0, 0.4)'
	                       ,borderWidth : 1
	                     //경계선 굵기
	               }
	               
	               ,{ //데이터
	                   label : '이원' //차트 제목
	                       ,fill : false // line 형태일 때, 선 안쪽을 채우는지 안채우는지
	                       ,data : rlsedCntData
	                       ,backgroundColor : 'rgba(0, 255, 0, 0.4)'
	                       ,borderColor : 'rgba(0, 255, 0, 0.4)'
	                       ,borderWidth : 1
	                     //경계선 굵기
	               }
	               
	               ,{ //데이터
	                   label : '사망' //차트 제목
	                       ,fill : false // line 형태일 때, 선 안쪽을 채우는지 안채우는지
	                       ,data : deathCntData
	                       ,backgroundColor : 'rgba(0, 0, 255, 0.4)'
	                       ,borderColor : 'rgba(0, 0, 255, 0.4)'
	                       ,borderWidth : 1
	                     //경계선 굵기
	               }
	               ]
	      },
	      options : {
	      	responsive:true,
	        scales: {
	        	y_left:{
					ticks: {
						
	  					suggestedMin: 0,
	  					suggestedMax: Math.max(...curInptntCntData),
	  					stepSize : Math.max(...curInptntCntData)/10
					},
					beginAtZero:true,
					position : 'left'
				},
	        },
	        animation:false,
	        showValue:{
	        	fontStyle:'Helvetica',
	        	fontSize: 20
	        }    	  
	    	  
	      }
	    });
	
	var dgnssChartcontext = document.getElementById('dgnssChart').getContext('2d');
    var dgnssChart = new Chart(dgnssChartcontext, {
      type : 'bar', // 차트의 형태
      data : { // 차트에 들어갈 데이터
        labels :  myLabels,
        datasets : [
             { //데이터
                label : '진료' //차트 제목
                    ,fill : false // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                    ,data : dngssCntData
                    ,backgroundColor : 'rgba(0, 0, 0, 0.4)'
                    ,borderColor : 'rgba(0, 0, 0, 0.4)'
                    ,borderWidth : 1
                  //경계선 굵기
            }
            
            ,{ //데이터
                label : '이원신청' //차트 제목
                    ,fill : false // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                    ,data : reqSckbdCntData
                    ,backgroundColor : 'rgba(255, 0, 0, 0.4)'
                    ,borderColor : 'rgba(255, 0, 0, 0.4)'
                    ,borderWidth : 1
                  //경계선 굵기
            }
            
            ,{ //데이터
                label : '입소신청' //차트 제목
                    ,fill : false // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                    ,data : goLtctCntData
                    ,backgroundColor : 'rgba(0, 255, 0, 0.4)'
                    ,borderColor : 'rgba(0, 255, 0, 0.4)'
                    ,borderWidth : 1
                  //경계선 굵기
            }
            
            ,{ //데이터
                label : '자가격리' //차트 제목
                    ,fill : false // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                    ,data : goSlfCntData
                    ,backgroundColor : 'rgba(0, 0, 255, 0.4)'
                    ,borderColor : 'rgba(0, 0, 255, 0.4)'
                    ,borderWidth : 1
                  //경계선 굵기
            }
            
            ,{ //데이터
                label : '입원수' //차트 제목
                    ,fill : false // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                    ,data : inptntCntData
                    ,backgroundColor : 'rgba(128, 128, 128, 0.4)'
                    ,borderColor : 'rgba(0, 0, 255, 0.4)'
                    ,borderWidth : 1
                  //경계선 굵기
            }
            
            ]
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
}    

function getDate(str){
	if(str){
		return str.substring(5) + '일';
	}else{
		return '-일';
	}
}

function getAvg(arr){
	
	const fnSum = (sum, curr) => sum + curr;
	
	if(arr.length > 0){
		return Math.round((arr.reduce(fnSum) / arr.length) * 100) / 100;
	}else{
		return '-';
	}
}

</script>	
	
</body>
</html>