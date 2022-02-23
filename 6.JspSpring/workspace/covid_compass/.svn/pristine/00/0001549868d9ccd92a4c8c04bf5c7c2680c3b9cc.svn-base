<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template" id="result-template">
{{#each .}}
	<tr style="cursor:pointer;" onclick="showDetail('{{smplNo}}')" class="each-result-element" data-psti-no="{{smplNo}}">
		<td style="text-align: center;">{{fnChkSmplCnt smplCnt}}</td>
		<td style="text-align: left;">{{pstiNm}}</td>
		<td style="text-align: center;">{{age}}</td>
		<td style="text-align: left;">{{fnVac vacCode}}</td>
		<td style="text-align: center;">{{prettifyDate reqYmd}}</td>
		<td style="text-align: center;">{{prettifyDate resYmd}}</td>
		<td style="text-align: center;"><span class="badge badge-{{fnBadgeChk smplResCode}}">{{fnResCode smplResCode}}</span></td>
	</tr>
{{/each}}
</script>
<script type="text/x-handlebars-template" id="psti-result-pagination-template">
	<li class="page-item each-psti-result-pagination-element">
		<a class="page-link" href="1">
			<i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-psti-result-pagination-element">
		<a class="page-link {{checkDisabled prev}}" href="{{#if prev}}{{prevPageNum}}{{/if}}">
			<i class="fas fa-angle-left" style="color:#1a4f72;"></i>
		</a>
	</li>
	
	{{#each pageNum}}
		<li class="page-item each-psti-result-pagination-element {{signActive this}}" >
			<a class="page-link" style="{{styleActive this}}" href="{{this}}">
				{{this}}
			</a>
		</li>
	{{/each}}
	
	<li class="page-item each-psti-result-pagination-element">
		<a class="page-link {{checkDisabled next}}" href="{{#if next}}{{nextPageNum}}{{/if}}">
			<i class="fas fa-angle-right" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-psti-result-pagination-element">
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
},
"fnChkSmplCnt" : function(smplCnt){
	if(1 < smplCnt){
		return "재검";
	}else{
		return "신규";
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
"fnBadgeChk" : function(smplResCode){
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
"fnGender" : function(gender){
	if(gender == "M"){
		return "남자";
	}
	if(gender =="F"){
		return "여자";
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
"fnVac" : function(vacCode){
	if(vacCode == "J101"){
		return "미접종";
	}
	if(vacCode == "J102"){
		return "1차 접종";
	}
	if(vacCode == "J103"){
		return "2차 접종";
	}
	if(vacCode == "J104"){
		return "3차 이상";
	}
},
"checkDisabled" : function(flag){
  if(!flag) return 'disabled';
}
});
</script>
<script>
var page = 1;

window.onload = function(){
	var url = '<%=request.getContextPath()%>/rest-insp/result-list';
	
	list_go(page, url);
	$('ul.pagination').on('click', 'li a', function(event){
		if($(this).attr("href")){
			page = $(this).attr("href");
			getPage(url, make_form(page));
		}
		return false;
	});
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
			$('#result-table-tbody').html("");
			if(dataMap.resultList.length == 0){
				$('#result-table-tbody').html('<tr class="each-result-element"><td colspan="7">데이터가 없습니다.</td></tr>');
				dataMap.pageMaker.endPage = 1;
				dataMap.pageMaker.realEndPage = 1;
				printPagination(dataMap.pageMaker, $('#psti-result-pagination-ul'), $('#psti-result-pagination-template'), '.each-psti-result-pagination-element');
				printData('', $('#result-detail-module'), $('#result-detail-template'), '.result-detail-element');
				$('#enableReadRrn').attr('disabled', true);
			}else{
				printData(dataMap.resultList, $('#result-table-tbody'), $('#result-template'), '.each-result-element');
				printPagination(dataMap.pageMaker, $('#psti-result-pagination-ul'), $('#psti-result-pagination-template'), '.each-psti-result-pagination-element');
				$('#enableReadRrn').data('rrn', dataMap.result.rrn);
				$('#enableReadRrn').data('manageNo', dataMap.result.smplNo);
		      	dataMap.result.rrn = (dataMap.result.rrn.substring(0,8) + '******');
				printData(dataMap.result, $('#result-detail-module'), $('#result-detail-template'), '.result-detail-element');
				$('#enableReadRrn').attr('disabled', false);
			}
		},
		error : function(error){
			alert('error' + error.status);
		}
	})
}

function printData(jsonArray, target, templateObject, removeClass){
	var template = Handlebars.compile(templateObject.html());
	
	var html = template(jsonArray);
	
	$(removeClass).remove();
	
	target.append(html);
}

function printPagination(pageMaker, target, templateObject, removeClass){
	var pageNum = new Array(pageMaker.endPage - pageMaker.startPage + 1);
	
	for(var i = 0; i < pageMaker.endPage - pageMaker.startPage + 1; i++){
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
								<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="" style="text-align: center; width:15%;">재검여부</th>
								<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="" style="text-align: center; width:15%;">성명</th>
								<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="" style="text-align: center; width:10%;">나이</th>
								<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="" style="width:15%;">백신접종</th>
								<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="" style="text-align: center; width:15%;">검사요청일자</th>
								<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="" style="text-align: center; width:15%;">결과일자</th>
								<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="" style="text-align: center; width:15%;">검사결과</th>
							</tr>
						</thead>
						<tbody id="result-table-tbody">
							<tr class="each-result-element">
								<td colspan="7">페이지 로딩중 입니다.</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
				<div class="card-footer clearfix" style="background-color: white;">
					<ul class="pagination justify-content-center m-0" id="psti-result-pagination-ul">
					</ul>
				</div>
			<form id="jobForm">
				<input type='hidden' name="page" value="" />
				<input type='hidden' name="perPageNum" value="" />
				<input type='hidden' name="searchType" value="" />
				<input type='hidden' name="keyword" value="" />
			</form>
</section>