<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<style>
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
.badge-warning {
    color: #1f2d3d;
    background-color: #ffc107;
}
	</style>
</head>

<title></title>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
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
"isoptntSignActive" : function(pageNum){
	if(pageNum == isoptntListPage){
		return 'active';
	}
},
"sckbdSignActive" : function(pageNum){
	if(pageNum == sckbdListPage){
		return 'active';
	}
},
"resSignActive" : function(pageNum){
	if(pageNum == resListPage){
		return 'active';
	}
},
"isoptntStyleActive" : function(pageNum){
	if(pageNum == isoptntListPage){
		return 'background:#1a4f72; border-color:#1a4f72;';
	}else{
		return 'color:#1a4f72';
	}
},
"sckbdStyleActive" : function(pageNum){
	if(pageNum == sckbdListPage){
		return 'background:#1a4f72; border-color:#1a4f72;';
	}else{
		return 'color:#1a4f72';
	}
},
"resStyleActive" : function(pageNum){
	if(pageNum == resListPage){
		return 'background:#1a4f72; border-color:#1a4f72;';
	}else{
		return 'color:#1a4f72';
	}
},
"fnGender" : function(gender){
	if(gender == "M"){
		return "남자";
	}
	if(gender =="F"){
		return "여자";
	}
},
"fnBadgetPstvYn" : function(pstvYn){
	if(pstvYn == "Y"){
		return "danger";
	}
	if(pstvYn =="N"){
		return "success";
	}
	return "secondary";
},
"fnPstvYn" : function(pstvYn){
	if(pstvYn == "Y"){
		return "양성";
	}
	if(pstvYn == "N"){
		return "음성";
	}
	return "대기"
},
"fnBadgesckbdCnt" : function(rmndSckbdCnt, sckbdCnt){
	var a = ((sckbdCnt - rmndSckbdCnt) / sckbdCnt) * 100;
	if(a > 80){
		return "danger";
	}
	if(a > 60){
		return "warning";
	}
	if(a > 40){
		return "success";
	}
	else{
		return "primary"
	}
},
"fnUsePer" : function(rmndSckbdCnt, sckbdCnt){
	if(rmndSckbdCnt != 0 && sckbdCnt != 0){
		return Math.round(((sckbdCnt - rmndSckbdCnt)/sckbdCnt)*100);
	}else{
		return 0;
	}
},
"fnFeverBadge" : function(bdtemp){
	if(bdtemp < 37.5){
		return "success";
	}else if(bdtemp < 38.0){
		return "warning";
	}
	return "danger";
},
"fnBdtempCheck" : function(bdtemp){
	a = bdtemp + "";
	if(a.length == 2){
		return a+".0";
	}
	return bdtemp;
},
"fnToday" : function(today){
	if(today == 1){
		return "disabled";
	}
},
"fnRmndSckbdCnt" : function(rmndSckbdCnt){
	$('#rmndSckbdCount').text(rmndSckbdCnt);
	return rmndSckbdCnt;
},
"checkDisabled" : function(flag){
  if(!flag) return 'disabled';
}
})
</script>
<script>
var sckbdListPage = 1;
var isoptntListPage = 1;
var resListPage = 1;

function makeSckbdForm(pageParam){
	var sckbdListForm=$('#sckbdListForm')
	
	if(!pageParam) sckbdListPage = 1;
	
	sckbdListPage = pageParam;
	
	sckbdListForm.find("[name='page']").val(sckbdListPage);
	sckbdListForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	
	return sckbdListForm;
}
function makeIsoptntForm(pageParam){
	var isoptntListForm=$('#isoptntListForm')
	
	if(!pageParam) isoptntListPage = 1;
	
	isoptntListPage = pageParam;
	
	isoptntListForm.find("[name='page']").val(isoptntListPage);
	isoptntListForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	
	return isoptntListForm;
}	
function makeResForm(pageParam){
	var resListForm=$('#resListForm')
	
	if(!pageParam) resListPage = 1;
	
	resListPage = pageParam;
	
	resListForm.find("[name='page']").val(resListPage);
	resListForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	
	return resListForm;
}
function sckbdListGo(pageParam,sckbdListURL){
	getSckbdList(sckbdListURL, makeSckbdForm(pageParam));
}
function isoptntListGo(pageParam,isoptntListURL){
	getIsoptntList(isoptntListURL, makeIsoptntForm(pageParam));
}
function resListGo(pageParam,resListURL){
	getResList(resListURL, makeResForm(pageParam));
}
function getSckbdList(handlebarsProcessingURL, form){
	$.ajax({
		url : handlebarsProcessingURL,
		type : 'post',
		dataType : 'json',
		data : form.serialize(),
		success: function(dataMap){
			$('#sckbd-table-tbody').html("");
			if(dataMap.sckbdList.length == 0){
				$('#sckbd-table-tbody').html("<tr class='each-sckbd-element'><td colspan='7'>데이터가 없습니다.</td></tr>");
				dataMap.pageMaker.endPage = 1;
				dataMap.pageMaker.realEndPage = 1;
				printPagination(dataMap.pageMaker, $('#sckbd-pagination-ul'), $('#sckbd-pagination-template'), '.each-sckbd-pagination-element');
				
			}else{
				printData(dataMap.sckbdList, $('#sckbd-table-tbody'), $('#sckbd-template'), '.each-sckbd-element');
				printPagination(dataMap.pageMaker, $('#sckbd-pagination-ul'), $('#sckbd-pagination-template'), '.each-sckbd-pagination-element');
			}
		},
		error : function(error){
			alert("error" + error.status);
		}
	})
}
function getIsoptntList(handlebarsProcessingURL, form){
	$.ajax({
		url : handlebarsProcessingURL,
		type : 'post',
		dataType : 'json',
		data : form.serialize(),
		success: function(dataMap){
			$('#isoptnt-table-tbody').html("");
			if(dataMap.isoptntList.length == 0){
				$('#isoptnt-table-tbody').html('<tr class="each-isoptnt-element"><td colspan="8">데이터가 없습니다.</td></tr>');
				dataMap.pageMaker.endPage = 1;
				dataMap.pageMaker.realEndPage = 1;
				printPagination(dataMap.pageMaker, $('#isoptnt-pagination-ul'), $('#isoptnt-pagination-template'), '.each-isoptnt-pagination-element');
				printData(dataMap.pbhtList, $('#pbhtlist-select'), $('#pbht-list-template'), '.each-pbhtlist-element')
			}else{
				printData(dataMap.pbhtList, $('#pbhtlist-select'), $('#pbht-list-template'), '.each-pbhtlist-element')
				printData(dataMap.isoptntList, $('#isoptnt-table-tbody'), $('#isoptnt-template'), '.each-isoptnt-element');
				printPagination(dataMap.pageMaker, $('#isoptnt-pagination-ul'), $('#isoptnt-pagination-template'), '.each-isoptnt-pagination-element');
			}
		},
		error : function(error){
			alert("error" + error.status);
		}
	})
}
function getResList(handlebarsProcessingURL, form){
	$.ajax({
		url : handlebarsProcessingURL,
		type : 'post',
		dataType : 'json',
		data : form.serialize(),
		success: function(dataMap){
			$('#res-table-tbody').html("");
			if(dataMap.resList.length == 0){
				$('#res-table-tbody').html('<tr class="each-res-element"><td colspan="3">데이터가 없습니다.</td></tr>');
				dataMap.pageMaker.endPage = 1;
				dataMap.pageMaker.realEndPage = 1;
				printPagination(dataMap.pageMaker, $('#res-pagination-ul'), $('#res-pagination-template'), '.each-res-pagination-element');
			}else{
				printData(dataMap.resList, $('#res-table-tbody'), $('#res-template'), '.each-res-element');
				printPagination(dataMap.pageMaker, $('#res-pagination-ul'), $('#res-pagination-template'), '.each-res-pagination-element');
			}
		},
		error : function(error){
			alert("error" + error.status);
		}
	})
}
window.onload = function(){
// 	if(${popupCheck eq 'YES'}){
// 		if(${popupList !='' || popupList ne null}){
// 			var size = '${popupList.size()}';
// 			var noticeNo = '${popupList[0].noticeNo}';
// 			OpenWindow('notice-popup?noticeNo='+noticeNo, '공지사항 등록', 800,530);
// 		}
// 	}  
	var sckbdListURL = '<%=request.getContextPath()%>/rest-ltct/main-sckbd-list';
	var isoptntListURL = '<%=request.getContextPath()%>/rest-ltct/main-isoptnt-list';
	var resListURL = '<%=request.getContextPath()%>/rest-ltct/main-res-list';
	
	sckbdListGo(sckbdListPage, sckbdListURL);
	isoptntListGo(isoptntListPage, isoptntListURL);
	resListGo(resListPage, resListURL);
	getSckbdCountAndStats();
	
	$('ul.sckbd-pagination').on('click', 'li a', function(event){
		if($(this).attr("href")){
			page = $(this).attr("href");
			getSckbdList(sckbdListURL, makeSckbdForm(page));
		}
		return false;
	});
	
	$('ul.isoptnt-pagination').on('click', 'li a', function(event){
		if($(this).attr("href")){
			page = $(this).attr("href");
			getIsoptntList(isoptntListURL, makeIsoptntForm(page));
		}
		return false;
	});
	
	$('ul.res-pagination').on('click', 'li a', function(event){
		if($(this).attr("href")){
			page = $(this).attr("href");
			getResList(resListURL, makeResForm(page));
		}
		return false;
	});
}

function proc(ele){
	var manageNo = $('#openButton').attr('data-manage-no');
	var name = $('#openButton').attr('data-name');
  	window.open("cnfrm-detail-dgnss-regist?manageNo="+manageNo+"&pstiNm="+name+"", "진료 신청 정보", "width=1260, height=715" );  
}

function showMore(type){
	  
//  alert(type);
  if(type == "A"){
    parent.goPage('<%=request.getContextPath()%>/ltct/isoptnt-list','M050100');
  }
  if(type == "B"){
    parent.goPage('<%=request.getContextPath()%>/ltct/res-smple-list','M050200');
  }
  if(type == "C"){
    parent.goPage('<%=request.getContextPath()%>/ltct/req-isoptnt-list','M050300');
  }
}
</script>
<c:set var="highTempCardList" value="${highTempCardList }" />
<section class="content">
<div style="box-sizing: content-box; padding:1px; margin-top: 10px; min-width : 1000px;">
  <div class="row" style="margin: 0px;">
   <div class="col-md-12 pr-0 pl-0">
	<div class="card" style="box-sizing: content-box; padding: 16px;">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
	
		<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
		
				
		<!-- 값이없으면 카드 1개에 입소자가 존재하지않습니다.		 -->
					<c:if test="${empty highTempCardList }">
					<c:forEach begin='1' end='8' varStatus='indexN'>
						<c:if test="${indexN.count eq 1}">
							<div class="item active">
						</c:if>
						<c:if test='${indexN.count ne 1 }'>
							<c:if test="${indexN.count % 4 == 1 }">
								<div class="item">
							</c:if>
						</c:if>
							<div class="col-sm-3">
								<div class="card card-dark card-outline" style="height: 180px;">
									<div class="card-header">
										<div class="col-sm-8" style="text-align: center;">
											<span></span>
										</div>
										<div class="col-sm-4">
											<span class="badge badge-primary" style="background: #dc3545;"></span>
										</div>
									</div>
									<div class="card-body" style="text-align: center;">
									입소자가 존재하지않습니다.
									</div>
								</div>
							</div>
						<c:if test='${indexN.count % 4 == 0}'>
							</div>
						</c:if>
					</c:forEach>
					</c:if>
		
		<c:if test="${!empty highTempCardList }">
		<c:set var='listSize'	value='${fn:length(highTempCardList) }' />
			<c:forEach items='${highTempCardList }' var='highTempCard' varStatus='indexN'>
				<c:if test="${indexN.count eq 1}">
					<div class="item active">
				</c:if>
				<c:if test='${indexN.count ne 1 }'>
					<c:if test="${indexN.count % 4 == 1 }">
						<div class="item">
					</c:if>
				</c:if>
					<div class="col-sm-3">
						<div class="card card-dark card-outline" style="height: 180px;">
							<div class="card-header">
								<div class="col-sm-5">
									<span style="font-size:15px; text-align:left;"><c:out value='${highTempCard.pstiNm}'></c:out></span>
								</div>
								<div class="col-sm-3">
									<span style="margin:4px auto; text-align:left;" class="badge badge-${highTempCard.bdtemp lt 38.0 ? 'warning' : 'danger'}">${highTempCard.bdtemp}</span>
								</div>
								<div class="col-sm-4">
									<c:if test="${highTempCard.today eq 0 }">
										<button id="openButton" data-manage-no="${highTempCard.manageNo}" data-name="${highTempCard.pstiNm}" onclick="proc(this);" class="btn btn-block btn-primary" style="background: #1a4f72; border: #1a4f72; width:69px; height: 26px; font-size:11px;  margin:0 auto; padding-bottom: 6px;">진료신청</button>
									</c:if>
									<c:if test="${highTempCard.today eq 1 }">
										<button disabled id="openButton" data-manage-no="${highTempCard.manageNo}" data-name="${highTempCard.pstiNm}" onclick="proc(this);" class="btn btn-block btn-primary" style="background: #1a4f72; border: #1a4f72; width:69px; height: 26px; font-size:11px;  margin:0 auto; padding-bottom: 6px;">진료신청</button>
									</c:if>
									
								</div>
							</div>
							<div class="card-body" style="text-align: center;">
								<table class="table border">
									<tr>
										<th style="text-align: center;">연락처</th>
										<td style="text-align: left;">${highTempCard.pstiTelno }</td>
									</tr>
									<tr>
										<th style="text-align: center;">증상</th>
										<td style="text-align: left;">${highTempCard.symptms }</td>
									</tr>
									<tr>
										<th style="text-align: center;">입소일</th>
										<td style="text-align: left;"><fmt:formatDate value='${highTempCard.inYmd }' pattern="yyyy-MM-dd"/></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				<c:if test='${indexN.count % 4 == 0 || indexN.count eq listSize}'>
					</div>
				</c:if>
			</c:forEach>
			</div>
  </div>
		</c:if>
				</div>
		
			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev" style="background-image: none; width: 20px;"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next" style="background-image: none; width: 20px;"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		
		</div>
		</div>

		<div class="row" style="margin: 0px; top: 12px;">
			<div class="col-md-8 pl-0">
				<%@ include file="./main-sckbd-list-module-work.jsp" %>
				
			</div>

			<div class="col-md-4 pr-0">
				<%@ include file="./main-sckbdCountAndStats.jsp" %>
			</div>

		</div>


		<div class="row" style="margin: 0px; top: 12px;">
			<div class="col-md-8 pl-0" >	
				<%@ include file="./main-isoptnt-list-module-work.jsp" %>
			</div>
			<div class="col-md-4 pr-0">
				<%@ include file="./main-res-list-module-work.jsp" %>
			</div>
		</div>

	</div>
</div>	
</section>
</body>