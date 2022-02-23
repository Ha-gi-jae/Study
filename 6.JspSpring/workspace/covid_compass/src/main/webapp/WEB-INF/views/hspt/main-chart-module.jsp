<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<div class="card"
	style="position: relative; left: 0px; top: 0px; width: 67%;">
          <div class="card-header ui-sortable-handle">
          <h3 class="card-title" style="font-weight: bold; color: #333333; font-size: 16px;">
            	병원통계
          </h3>
          <button type="button" class="btn btn-tool" style="visibility: hidden;">
          <i class="fas fa-plus" style="color: black"></i>
        </button>
        </div>
        <div class="card-body">
	<div id="myCarousel" class="carousel slide" data-interval="false">
		<!-- Indicators -->

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">

				<canvas id="barChart"
					style="min-height: 240px; height: 240px; max-height: 240px; max-width: 100%; display: block; width: 100%;"
					height="240" class="chartjs-render-monitor"></canvas>
			</div>

			<div class="item">

				<canvas id="barChart2"
					style="min-height: 240px; height: 240px; max-height: 240px; max-width: 100%; display: block; width: 100%"
					height="240" class="chartjs-render-monitor"></canvas>

			</div>
      <!-- 
			<div class="item">

				<canvas id="pieChart"
					style="min-height: 240px; height: 240px; max-height: 240px; max-width: 100%; display: block; width: 100%"
					height="240" class="chartjs-render-monitor"></canvas>

			</div>
 -->
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			style="background-image: none; width: 20px;" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			style="background-image: none; width: 20px;" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
  </div>
</div>

<script>
function getHsptMainStatsChart(){
	
	//alert('test');
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
</script>

<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
<script type="text/javascript">

function printChart(dataMap){
	
	console.log(dataMap);
	
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
	})
	
	console.log(myLabels);

    var context = document.getElementById('barChart').getContext('2d');
    var myChart = new Chart(context, {
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
                label : '사망' //차트 제목
                    ,fill : false // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                    ,data : deathCntData
                    ,backgroundColor : 'rgba(255, 0, 0, 0.4)'
                    ,borderColor : 'rgba(255, 0, 0, 0.4)'
                    ,borderWidth : 1
                  //경계선 굵기
            }
            
            ,{ //데이터
                label : '완치' //차트 제목
                    ,fill : false // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                    ,data : rlsedCntData
                    ,backgroundColor : 'rgba(0, 255, 0, 0.4)'
                    ,borderColor : 'rgba(0, 255, 0, 0.4)'
                    ,borderWidth : 1
                  //경계선 굵기
            }
            
            ,{ //데이터
                label : '이원' //차트 제목
                    ,fill : false // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                    ,data : outCntData
                    ,backgroundColor : 'rgba(0, 0, 255, 0.4)'
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
        },
        plugins: {
            legend : {
                position : 'right',
              },
            title: {
                display: true,
                text: '입퇴원 추이'
                
                
            }
        }
      }
    });
    
    var context2 = document.getElementById('barChart2').getContext('2d');
    var myChart2 = new Chart(context2, {
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
      ,plugins: {
          legend : {
              position : 'right',
            },
          title: {
              display: true,
              text: '진료결과'
              
              
          }
      }
      }
    });

    const data = {
      labels : [ '입원', '이원', '입소', '자가격리'],
      datasets : [ 
    	  { //데이터
              label : '진료' //차트 제목
              ,fill : false // line 형태일 때, 선 안쪽을 채우는지 안채우는지
              ,data : [
            	   inptntCntData[inptntCntData.length - 1]
            	  ,outCntData[outCntData.length - 1]
            	  ,goLtctCntData[goLtctCntData.length - 1]
            	  ,goSlfCntData[goSlfCntData.length - 1]
              ] 
        	  ,backgroundColor : [
        //색상
        'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)'
        ]
        	  ,borderColor : [
        //경계선 색상
        'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)'
        ]
              ,borderWidth : 1
            //경계선 굵기
          }
           
    	  ]
    };
/* 
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
            text : '진료 사후처리'
          }
        }
      },
    }); */
    
}    
  </script>