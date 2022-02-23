<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template" id="psti-template">
{{#each .}}
	<tr style="cursor:pointer;" onclick="showDetail('{{pstiNo}}')" class="each-psti-element" data-psti-no="{{pstiNo}}">
		<td><span class="badge badge-{{fnBadgeChk pstvYn}}">{{fnRechkdYn pstvYn}}</span></td>
		<td style="text-align:left;"><div class="pstiNm">{{pstiNm}}</div></td>
		<td>{{fnGender gender}}</td>
		<td>{{age}}</td>
		<td><div class="pstiTelno">{{pstiTelno}}</div></td>
		<td>{{prettifyDate wrtYmd}}</td>
		<td style="text-align:center">{{prettifyDate resYmd}}</td>
		<td style="text-align:center"><span class="badge badge-{{fnBadgePstvYn pstvYn}}">{{fnPstvYn pstvYn}}</span></td>
	</tr>	
{{/each}}
</script>
<script type="text/x-handlebars-template" id="psti-pagination-template">
	<li class="page-item each-psti-pagination-element">
		<a class="page-link" href="1">
			<i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-psti-pagination-element">
		<a class="page-link {{checkDisabled prev}}" href="{{#if prev}}{{prevPageNum}}{{/if}}">
			<i class="fas fa-angle-left" style="color:#1a4f72;"></i>
		</a>
	</li>
	
	{{#each pageNum}}
		<li class="page-item each-psti-pagination-element {{signActive this}}" >
			<a class="page-link" style="{{styleActive this}}" href="{{this}}">
				{{this}}
			</a>
		</li>
	{{/each}}
	
	<li class="page-item each-psti-pagination-element">
		<a class="page-link {{checkDisabled next}}" href="{{#if next}}{{nextPageNum}}{{/if}}">
			<i class="fas fa-angle-right" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-psti-pagination-element">
		<a class="page-link" href="{{realEndPage}}">
			<i class="fas fa-angle-double-right" style="color:#1a4f72;"></i>
		</a>
	</li>
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
"fnRechkdYn" : function(pstvYn){
	if(pstvYn == "Y"){
		return "재검";
	}
	if(pstvYn == "N"){
		return "재검";
	}
	return "신규";
},
"fnRechkdYnKor" : function(rechkdYn){
	if(rechkdYn == "Y"){
		return "자가격리";
	}
	if(rechkdYn =="N"){
		return "본인판단";
	}
},
"signActive" : function(pageNum){
	if(pageNum == page){
		return 'active';
	}
},
"styleActive" : function(pageNum){
	if(pageNum == page){
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
"fnGender" : function(gender){
	if(gender == "M"){
		return "남자";
	}
	if(gender == "F"){
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
var page = 1;

// var data = "";
// function generateQR() {
// 	var qrcode = new QRCode(document.getElementById("qrBox"));
// 	data = $('#pstiNo').val();
// 	qrcode.makeCode(data);

// }
// function decode() {
// 	var devalue = document.getElementById('decodetext');
// 	devalue.value = data;
// }	

window.onload = function(){
//  	generateQR();

	var url = '<%=request.getContextPath()%>/rest-insp/psti-list';
	
	list_go(page, url);
	$('ul.pagination').on('click', 'li a', function(event){
		if($(this).attr("href")){
			page = $(this).attr("href");
			getPage(url, make_form(page));
		}
		return false;
	});
	generateQR();
}

function make_form(pageParam){
	var jobForm=$('#jobForm')
	
	if(!pageParam) page = 1;
	
	page = pageParam;
	
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('input[id="keyword"]').val());
	
	return jobForm;
}

function list_go(pageParam, url){
	getPage(url, make_form(pageParam));
}

function getPage(handlebarsProcessingURL, form){
	$.ajax({
		url : handlebarsProcessingURL,
		type : 'post',
		dataType : 'json',
		data : form.serialize(),
		success : function(dataMap){
				$('#psti-table-tbody').html("");
			if(dataMap.pstiList.length == 0){
				$('#psti-table-tbody').html('<tr class="each-psti-element"><td colspan="8">데이터가 없습니다.</td></tr>');
				dataMap.pageMaker.endPage = 1;
				dataMap.pageMaker.realEndPage = 1;
				printPagination(dataMap.pageMaker, $('#psti-list-pagination-ul'), $('#psti-pagination-template'), '.each-psti-pagination-element');
				printData('', $('#psti-detail-module'), $('#psti-detail-template'), '.psti-detail-element')
				$('#enableReadRrn').attr('disabled', true);
				$('#qrCodePrintBtn').attr('disabled', true);
				$('#submitbutton').attr('disabled', true);
				$('#modifybutton').attr('disabled', true);
				$('#maxBrssr').attr('disabled', true);
				$('#minBrssr').attr('disabled', true);
				$('#bdheight').attr('disabled', true);
				$('#bdweight').attr('disabled', true);
				$('#bdheat').attr('disabled', true);
				
			}else{
				printData(dataMap.pstiList, $('#psti-table-tbody'), $('#psti-template'), '.each-psti-element');
				printPagination(dataMap.pageMaker, $('#psti-list-pagination-ul'), $('#psti-pagination-template'), '.each-psti-pagination-element');
				$('#enableReadRrn').data('rrn', dataMap.psti.rrn);
				$('#enableReadRrn').data('manageNo', dataMap.psti.pstiNo);
		      	dataMap.psti.rrn = (dataMap.psti.rrn.substring(0,8) + '******');
				printData(dataMap.psti, $('#psti-detail-module'), $('#psti-detail-template'), '.psti-detail-element')
				generateQR(dataMap.psti.pstiNo);
				$('#enableReadRrn').attr('disabled', false);
				$('#qrCodePrintBtn').attr('disabled', false);
				$('#submitbutton').attr('disabled', false);
				$('#modifybutton').attr('disabled', false);
				$('#maxBrssr').attr('disabled', false);
				$('#minBrssr').attr('disabled', false);
				$('#bdheight').attr('disabled', false);
				$('#bdweight').attr('disabled', false);
				$('#bdheat').attr('disabled', false);
			}
		},
		error : function(error){
			alert('error' + error.status);
		}
	})
}

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
<section class="content">
<div style="height: 640px;">

		<div class="table-responsive">
			<table class="table table-hover text-nowrap"
				style="text-align: center;">
				<thead>
					<tr role="row">
						<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="" style="width:10%;">구분</th>
						<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="" style="width:10%; text-align: center;">성명</th>
						<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="" style="width:10%;">성별</th>
						<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="" style="width:10%;">나이</th>
						<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="" style="width:15%;">연락처</th>
						<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="" style="width:15%;">문진표 작성일</th>
						<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="" style="width:15%;">결과일</th>
						<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="" style="width:15%;">검사 결과</th>
						
					</tr>
				</thead>
				<tbody id="psti-table-tbody">
					<tr class="each-psti-element">
						<td colspan="8">페이지 로딩중 입니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="card-footer clearfix" style="background-color: white;">
		<ul class="pagination justify-content-center m-0" id="psti-list-pagination-ul">
		</ul>
	</div>
<form id="jobForm">
	<input type='hidden' name="page" value="" />
	<input type='hidden' name="perPageNum" value="" />
	<input type='hidden' name="searchType" value="" />
	<input type='hidden' name="keyword" value="" />
</form>
</section>
 