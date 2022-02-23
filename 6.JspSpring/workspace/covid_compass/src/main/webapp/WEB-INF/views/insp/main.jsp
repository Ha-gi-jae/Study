<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>"src/main/webapp/WEB-INF/views/insp/main.jsp"
.card-title {
	font-weight: bold;
	color: #333333;
	font-size: 16px;
}
.badge-primary{
	color: #fff;
	background-color: #007bff;
}
.badge-danger {
    color: #fff;
    background-color: #dc3545;
}
.badge-success {
    color: #fff;
    background-color: #28a745;
}
.badge-info {
    color: #fff;
    background-color: #17a2b8;
}
.badge-secondary {
    color: #fff;
    background-color: #6c757d;
}
</style>
<script>
function printData(jsonArray, target, templateObject, removeClass){
	var template = Handlebars.compile(templateObject.html()); // templateObject를 json data로 받으면 마크업을 return하는 function. template로 반환
	
	var html = template(jsonArray); // 함수 template에 파라미터 jsonArray를 넣어서 실행하여 html 생성
	
	$(removeClass).remove(); // 해당 html요소를 append하기 전에 기존 내용 지우기. 안그러면 리스트 목록이 10개씩 보이는게 아니라 10, 20, 30개 등 클릭할때마다 10개씩 추가된다.
	
	target.append(html);
}

function printPagination(pageMaker, target, templateObject, removeClass){
	var pageNum = new Array(pageMaker.endPage-pageMaker.startPage+1);
	
	for(var i=0; i<pageMaker.endPage-pageMaker.startPage+1;i++){
		pageNum[i] = pageMaker.startPage + i;
	}
	
	pageMaker.pageNum = pageNum;
	pageMaker.prevPageNum = pageMaker.startPage - 1;
	pageMaker.nextPageNum = pageMaker.endPage + 1;
	
	var template = Handlebars.compile(templateObject.html());
	var html = template(pageMaker);
	target.html("").html(html);
	
}
</script>
</head>

<title></title>


<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

<c:set var="statsList" value='${statsList }' />
<script>
Handlebars.registerHelper({
"prettifyDate" : function(timeValue){
	if(timeValue){
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		month += '';
		if(month.length < 2){
			month = '0' + month;
		}
		var date = dateObj.getDate();
		date += '';
		if(date.length < 2){
			date = '0' + date;
		}
		return year + "-" + month + "-" + date;
	}
	return "없음";
},
"fnRechkdYn" : function(pstvYn){
	if(pstvYn == "Y"){
		return "재검";
	}
	if(pstvYn == "N"){
		return "재검";
	}
	return "신규";
},
"signActive" : function(pageNum){
	if(pageNum == pstiListPage){
		return 'active';
	}
},
"chkSignActive" : function(pageNum){
	if(pageNum == chckdListPage){
		return 'active';
	}
},
"resSignActive" : function(pageNum){
	if(pageNum == resultListPage){
		return 'active';
	}
},
"pcrSignActive" : function(pageNum){
	if(pageNum == pcrListPage){
		return 'active';
	}
},
"styleActive" : function(pageNum){
	if(pageNum == pstiListPage){
		return 'background:#1a4f72; border-color:#1a4f72;';
	}else{
		return 'color:#1a4f72';
	}
},
"chkStyleActive" : function(pageNum){
	if(pageNum == chckdListPage){
		return 'background:#1a4f72; border-color:#1a4f72;';
	}else{
		return 'color:#1a4f72';
	}
},
"resStyleActive" : function(pageNum){
	if(pageNum == resultListPage){
		return 'background:#1a4f72; border-color:#1a4f72;';
	}else{
		return 'color:#1a4f72';
	}
},
"pcrStyleActive" : function(pageNum){
	if(pageNum == pcrListPage){
		return 'background:#1a4f72; border-color:#1a4f72;';
	}else{
		return 'color:#1a4f72';
	}
},
"fnBadgeChk" : function(pstvYn){
	if(pstvYn == "Y"){
		return "success";
	}
	if(pstvYn == "N"){
		return "success";
	}
	return "info";
},
"fnSmplBadgeChk" : function(smplResCode){
	if(smplResCode == "K101"){
		return "secondary";
	}
	if(smplResCode == "K102"){
		return "danger";
	}
	if(smplResCode == "K103"){
		return "primary";
	}
},
"fnResCode" : function(smplResCode){
	if(smplResCode == "K101"){
		return "대기";
	}
	if(smplResCode == "K102"){
		return "양성";
	}
	if(smplResCode == "K103"){
		return "음성";
	}
},
"fnGender" : function(gender){
	if(gender == "M"){
		return "남자";
	}if(gender == "F"){
		return "여자";
	}
},
"fnPstvYn" : function(pstvYn){
	if(pstvYn == "Y"){
		return "양성";
	}
	if(pstvYn == "N"){
		return "음성";
	}
	return "없음"
},
"fnBadgePstvYn" : function(pstvYn){
	if(pstvYn == "Y"){
		return "danger";
	}
	if(pstvYn == "N"){
		return "primary";
	}
	return "secondary"
},
"checkDisabled" : function(flag){
  if(!flag) return 'disabled';
}
});
</script>
<script>
var pstiListPage = 1;
var chckdListPage = 1;
var resultListPage = 1;
var pcrListPage = 1;

function makePstiForm(pageParam){
	var pstiListForm=$('#pstiListForm')
	
	if(!pageParam) pstiListPage = 1;
	
	pstiListPage = pageParam;
	
	pstiListForm.find("[name='page']").val(pstiListPage);
	pstiListForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	
	return pstiListForm;
}
function makeChckdForm(pageParam){
	var chckdListForm=$('#chckdListForm')
	
	if(!pageParam) chckdListPage = 1;
	
	chckdListPage = pageParam;
	
	chckdListForm.find("[name='page']").val(chckdListPage);
	chckdListForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	
	return chckdListForm;
}
function makeResultForm(pageParam){
	var resultListForm=$('#resultListForm')
	
	if(!pageParam) resultListPage = 1;
	
	resultListPage = pageParam;
	
	resultListForm.find("[name='page']").val(resultListPage);
	resultListForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	
	return resultListForm;
}
function makePcrForm(pageParam){
	var pcrListForm=$('#pcrListForm')
	
	if(!pageParam) pcrListPage = 1;
	
	pcrListPage = pageParam;
	
	pcrListForm.find("[name='page']").val(pcrListPage);
	pcrListForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	
	return pcrListForm;
}
function pstiListGo(pageParam,pstiListURL){
	getPstiList(pstiListURL, makePstiForm(pageParam));
}
function chckdListGo(pageParam,chckdListURL){
	getChckdList(chckdListURL, makeChckdForm(pageParam));
}
function resultListGo(pageParam,resultListURL){
	getResultList(resultListURL, makeResultForm(pageParam));
}
function pcrListGo(pageParam,pcrListURL){
	getPcrList(pcrListURL, makePcrForm(pageParam));
}
function getPstiList(handlebarsProcessingURL, form){
	$.ajax({
		url : handlebarsProcessingURL,
		type : 'post',
		dataType : 'json',
		data : form.serialize(),
		success: function(dataMap){
				$('#psti-table-tbody').html("");
			if(dataMap.pstiList.length == 0){
				$('#psti-table-tbody').html('<tr class="each-psti-element"><td colspan="9">데이터가 없습니다.</td></tr>');
				dataMap.pageMaker.endPage = 1;
				dataMap.pageMaker.realEndPage = 1;
				printPagination(dataMap.pageMaker, $('#psti-list-pagination-ul'), $('#psti-pagination-template'), '.each-psti-pagination-element');
			}else{
				printData(dataMap.pstiList, $('#psti-table-tbody'), $('#psti-template'), '.each-psti-element');
				printPagination(dataMap.pageMaker, $('#psti-list-pagination-ul'), $('#psti-pagination-template'), '.each-psti-pagination-element');
			}
		},
		error : function(error){
			alert("error" + error.status);
		}
	})
}
function getChckdList(handlebarsProcessingURL, form){
	$.ajax({
		url : handlebarsProcessingURL,
		type : 'post',
		dataType : 'json',
		data : form.serialize(),
		success: function(dataMap){
			$('#chckd-table-tbody').html("");
			if(dataMap.chckdList.length == 0){
				$('#chckd-table-tbody').html('<tr class="each-chckd-element"><td colspan="9">데이터가 없습니다.</td></tr>');
				dataMap.pageMaker.endPage = 1;
				dataMap.pageMaker.realEndPage = 1;
				printPagination(dataMap.pageMaker, $('#chckd-list-pagination-ul'), $('#chckd-pagination-template'), '.each-chckd-pagination-element');
			}else{
				printData(dataMap.chckdList, $('#chckd-table-tbody'), $('#chckd-template'), '.each-chckd-element');
				printPagination(dataMap.pageMaker, $('#chckd-list-pagination-ul'), $('#chckd-pagination-template'), '.each-chckd-pagination-element');
			}
		},
		error : function(error){
			alert("error" + error.status);
		}
	})
}
function getResultList(handlebarsProcessingURL, form){
	$.ajax({
		url : handlebarsProcessingURL,
		type : 'post',
		dataType : 'json',
		data : form.serialize(),
		success: function(dataMap){
			$('#result-table-tbody').html("");
			if(dataMap.resultList.length == 0){
				$('#result-table-tbody').html("<tr class='each-result-element'><td colspan='3'>데이터가 없습니다.</td></tr>");
				dataMap.pageMaker.endPage = 1;
				dataMap.pageMaker.realEndPage = 1;
				printPagination(dataMap.pageMaker, $('#result-list-pagination-ul'), $('#result-pagination-template'), '.each-result-pagination-element');
			}else{
				printData(dataMap.resultList, $('#result-table-tbody'), $('#result-template'), '.each-result-element');
				printPagination(dataMap.pageMaker, $('#result-list-pagination-ul'), $('#result-pagination-template'), '.each-result-pagination-element');
			}
		},
		error : function(error){
			alert("error" + error.status);
		}
	})
}
function getPcrList(handlebarsProcessingURL, form){
		$.ajax({
			url : handlebarsProcessingURL,
			type : 'post',
			dataType : 'json',
			data : form.serialize(),
			success: function(dataMap){
				$('#pcr-table-tbody').html("");
				if(dataMap.pcrKitList.length == 0){
					$('#pcr-table-tbody').html("<tr class='each-pcr-element'><td colspan='3'>데이터가 없습니다.</td></tr>");
					dataMap.pageMaker.endPage = 1;
					dataMap.pageMaker.realEndPage = 1;
					printPagination(dataMap.pageMaker, $('#pcr-list-pagination-ul'), $('#pcr-pagination-template'), '.each-pcr-pagination-element');
				}else{
					printData(dataMap.pcrKitList, $('#pcr-table-tbody'),$('#pcr-template'),'.each-pcr-element');
					printPagination(dataMap.pageMaker, $('#pcr-list-pagination-ul'), $('#pcr-pagination-template'), '.each-pcr-pagination-element');
				}
			},
			error : function(error){
				alert('error'+ error.status);
			}
		})
}
function getKitCount(){
	$.ajax({
		url : '<%=request.getContextPath()%>/rest-insp/main-kit-count',
		type : 'post',
		dataType : 'json',
		success : function(kitCount){
			$('#kitCount').html(kitCount);
		},
		error : function(error){
			alert("error" + error.status);
		}
	})
}
window.onload = function(){
// 	 if(${popupCheck eq 'YES'}){
// 		if(${popupList !='' || popupList ne null}){
// 			var size = '${popupList.size()}';
// 			var noticeNo = '${popupList[0].noticeNo}';
// 			OpenWindow('notice-popup?noticeNo='+noticeNo, '공지사항 등록', 800,530);
// 		}
// 	}  
	
	var pstiListURL = '<%=request.getContextPath()%>/rest-insp/main-psti-list';
	var chckdListURL = '<%=request.getContextPath()%>/rest-insp/main-chckd-list';
	var resultListURL = '<%=request.getContextPath()%>/rest-insp/main-result-list';
	var pcrListURL= '<%=request.getContextPath()%>/rest-insp/main-pcr-list';
	pstiListGo(pstiListPage, pstiListURL);
	chckdListGo(chckdListPage, chckdListURL);
	resultListGo(resultListPage, resultListURL);
	pcrListGo(pcrListPage, pcrListURL)
	$('ul.psti-pagination').on('click', 'li a', function(event){
		if($(this).attr("href")){
			page = $(this).attr("href");
			getPstiList(pstiListURL, makePstiForm(page));
		}
		return false;
	});
	
	$('ul.chckd-pagination').on('click', 'li a', function(event){
		if($(this).attr("href")){
			page = $(this).attr("href");
			getChckdList(chckdListURL, makeChckdForm(page));
		}
		return false;
	});
	
	$('ul.result-pagination').on('click', 'li a', function(event){
		if($(this).attr("href")){
			page = $(this).attr("href");
			getResultList(resultListURL, makeResultForm(page));
		}
		return false;
	});
	$('ul.pcr-pagination').on('click', 'li a', function(event){
		if($(this).attr("href")){
			page = $(this).attr("href");
			getPcrList(pcrListURL, makePcrForm(page));
		}
		return false;
	});
	getKitCount();
}

function showMore(type){
	  
//  alert(type);
  if(type == "A"){
    parent.goPage('<%=request.getContextPath()%>/insp/psti-list','M020100');
  }
  if(type == "B"){
    parent.goPage('<%=request.getContextPath()%>/insp/chckd-psti-list','M020200');
  }
  if(type == "C"){
    parent.goPage('<%=request.getContextPath()%>/insp/res-psti-list','M020300');
  }
}
</script>
<section class="content">
<div style="box-sizing: content-box; padding:1px; margin-top: 10px; min-width : 1000px;">
	<!-- main psti list -->
	<div class="row" style="margin: 0px;">
	  <div class="col-md-12 pr-0 pl-0">
		<%@include file="./main-psti-list-module-work.jsp"%>
	  </div>
	</div>
	
	<div class="row" style="margin: 0px;">
	  <div class="col-md-8 pl-0 pr-0">
		<%@include file="./main-chckd-list-module-work.jsp" %>
	  </div>
	  <div class="col-md-4 pr-0">
		<%@include file="./main-result-list-module-work.jsp" %>
	  </div>		
	  </div>
			
			

		<div class="row" style="margin: 1px; margin-bottom: 20px;">
		  <div class="col-md-8 pl-0 pr-0">
			<div class="card pl-0" style="top: 10px; height: 290px;">
				
				<div class="card-header ui-sortable-handle">
					<h3 class="card-title" style="font-weight: bold; color: #333333; font-size: 16px;">
						최근 7일 PCR 검사자 집계
					</h3>
				</div>
				<div class="card-body">
				<div id="myCarousel" class="carousel slide" data-interval="false">
					<!-- Indicators -->
					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<canvas id="barChart"
								style="min-height: 230px; height: 270px; max-height: 230px; max-width: 100%; display: block; width: 644px;"
								width="644" height="230" class="chartjs-render-monitor"></canvas>
						</div>
<!-- 						<div class="item"> -->
<%-- 							<canvas id="pieChart" --%>
<%-- 								style="min-height: 230px; height: 270px; max-height: 230px; max-width: 100%; display: block; width: 644px;" --%>
<%-- 								width="644" height="230" class="chartjs-render-monitor"></canvas> --%>
<!-- 						</div> -->
					</div>

					<!-- Left and right controls -->
<!-- 					<a class="left carousel-control" href="#myCarousel" role="button" style="background-image: none;width: 20px;" data-slide="prev"> -->
<!-- 						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> -->
<!-- 						<span class="sr-only">Previous</span> -->
<!-- 					</a> -->
<!-- 					<a class="right carousel-control" href="#myCarousel" role="button" style="background-image: none;width: 20px;" data-slide="next"> -->
<!-- 						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> -->
<!-- 						<span class="sr-only">Next</span> -->
<!-- 					</a> -->
				</div>
				</div>
			</div>
		</div>
		  <div class="col-md-4 pr-0">
			<div class="card pr-0" style="top: 10px; height: 290px;">
				<%@ include file="./main-pcrKit-module-work.jsp" %>
			</div>
		  </div>
		</div>
</div>
</section>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
<script type="text/javascript">
	var context = document.getElementById('barChart').getContext('2d');
	var myChart = new Chart(context, {
		type : 'bar', // 차트의 형태
		data : { // 차트에 들어갈 데이터
			labels : [
			//x 축
			'${statsList[0].statsYmd}', '${statsList[1].statsYmd}', '${statsList[2].statsYmd}', '${statsList[3].statsYmd}', '${statsList[4].statsYmd}', '${statsList[5].statsYmd}', '${statsList[6].statsYmd}' ],
			datasets : [
					{ //데이터
						label : '일일 PCR검사자', //차트 제목
						fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
						data : [ '${statsList[0].reqSmpleCnt}', '${statsList[1].reqSmpleCnt}', '${statsList[2].reqSmpleCnt}', '${statsList[3].reqSmpleCnt}', '${statsList[4].reqSmpleCnt}', '${statsList[5].reqSmpleCnt}', '${statsList[6].reqSmpleCnt}' //x축 label에 대응되는 데이터 값
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

// 	const data = {
// 		labels : [ '${statsList[0].statsYmd}', '${statsList[1].statsYmd}', '${statsList[2].statsYmd}', '${statsList[3].statsYmd}', '${statsList[4].statsYmd}', '${statsList[5].statsYmd}', '${statsList[6].statsYmd}' ],
// 		datasets : [ {
// 			label : '일일 PCR 검사자',
// 			data : ['${statsList[0].reqSmpleCnt}', '${statsList[1].reqSmpleCnt}', '${statsList[2].reqSmpleCnt}', '${statsList[3].reqSmpleCnt}', '${statsList[4].reqSmpleCnt}', '${statsList[5].reqSmpleCnt}', '${statsList[6].reqSmpleCnt}' ], //x축 label에 대응되는 데이터 값

// 			backgroundColor : [
// 			//색상
// 			'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 1)',
// 					'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)',
// 					'rgba(153, 102, 255, 1)' ],
// 			borderColor : [
// 			//경계선 색상
// 			'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)',
// 					'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)',
// 					'rgba(153, 102, 255, 1)', ],
// 			borderWidth : 1
// 		} ]
// 	};

// 	var context1 = document.getElementById('pieChart').getContext('2d');
// 	var pieChart = new Chart(context1, {
// 		type : 'pie',
// 		data : data,
// 		options : {
// 			responsive : true,
// 			plugins : {
// 				legend : {
// 					position : 'right',
// 				},
// 				title : {
// 					display : true,
// 					text : '일일 PCR 검사자'
// 				}
// 			}
// 		},
// 	});
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>


