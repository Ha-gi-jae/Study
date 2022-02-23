<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template" id="chckd-template">
{{#each .}}
	<tr style="cursor:pointer;" onclick="showDetail('{{pstiNo}}')" class="each-chckd-element" data-psti-no="{{pstiNo}}">
		<td onclick="event.cancelBubble=true">
			<input type="checkbox" class="form-check-input" onclick="cancleAll();" style="margin-left: -4px; vertical-align:middle; cursor:pointer;" name="pstiNo" value="{{pstiNo}}">
		</td>
		<td style="text-align:left;">{{pstiNm}}</td>
		<td style="text-align:center;">{{age}}</td>
		<td style="text-align:center;">{{pstiTelno}}</td>
		<td style="text-align:center;">{{prettifyDate htscYmd}}</td>
		<td style="text-align:center">{{prettifyDate resYmd}}</td>
		<td style="text-align:center"><span class="badge badge-{{fnBadgePstvYn pstvYn}}">{{fnPstvYn pstvYn}}</span></td>
	</tr>
{{/each}}
</script>
<script type="text/x-handlebars-template" id="chckd-psti-pagination-template">
	<li class="page-item each-chckd-psti-pagination-element">
		<a class="page-link" href="1">
			<i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-chckd-psti-pagination-element">
		<a class="page-link {{checkDisabled prev}}" href="{{#if prev}}{{prevPageNum}}{{/if}}">
			<i class="fas fa-angle-left" style="color:#1a4f72;"></i>
		</a>
	</li>
	
	{{#each pageNum}}
		<li class="page-item each-chckd-psti-pagination-element {{signActive this}}" >
			<a class="page-link" style="{{styleActive this}}" href="{{this}}">
				{{this}}
			</a>
		</li>
	{{/each}}
	
	<li class="page-item each-chckd-psti-pagination-element">
		<a class="page-link {{checkDisabled next}}" href="{{#if next}}{{nextPageNum}}{{/if}}">
			<i class="fas fa-angle-right" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-chckd-psti-pagination-element">
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
"prettifyDateDetail" : function(timeValue){
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
"fnGender" : function(gender){
	if(gender == "M"){
		return "남자";
	}if(gender == "F"){
		return "여자";
	}
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
"fnPstvYn" : function(pstvYn){
	if(pstvYn == "Y"){
		return "양성";
	}
	if(pstvYn == "N"){
		return "음성";
	}
	return "없음"
},
"checkDisabled" : function(flag){
  if(!flag) return 'disabled';
}
});
</script>
<script>
var page = 1;

window.onload = function(){
	var url = '<%=request.getContextPath()%>/rest-insp/chckd-list';
	list_go(page, url);
	$('ul.pagination').on('click', 'li a', function(event){
		if($(this).attr("href")){
			page = $(this).attr("href");
			getPage(url, make_form(page));
			document.getElementById('selectAll').checked=false
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
			$('#chckd-table-tbody').html("");
			if(dataMap.chckdList.length == 0){
				$('#chckd-table-tbody').html('<tr class="each-chckd-element"><td colspan="7">데이터가 없습니다.</td></tr>');
				dataMap.pageMaker.endPage = 1;
				dataMap.pageMaker.realEndPage = 1;
				printPagination(dataMap.pageMaker, $('#chckd-psti-pagination-ul'), $('#chckd-psti-pagination-template'), '.each-chckd-psti-pagination-element');
				printData('', $('#chckd-detail-module'), $('#chckd-detail-template'), '.chckd-detail-element')
				$('#enableReadRrn').attr('disabled', true);
			}else{
				printData(dataMap.chckdList, $('#chckd-table-tbody'), $('#chckd-template'), '.each-chckd-element');
				printPagination(dataMap.pageMaker, $('#chckd-psti-pagination-ul'), $('#chckd-psti-pagination-template'), '.each-chckd-psti-pagination-element');
				
				$('#enableReadRrn').data('rrn', dataMap.chckd.rrn);
				$('#enableReadRrn').data('manageNo', dataMap.chckd.pstiNo);
		      	dataMap.chckd.rrn = (dataMap.chckd.rrn.substring(0,8) + '******');
				
				printData(dataMap.chckd, $('#chckd-detail-module'), $('#chckd-detail-template'), '.chckd-detail-element');
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
	var pageNum = new Array(pageMaker.endPage-pageMaker.startPage+1);
	
	for(var i = 0; i < pageMaker.endPage-pageMaker.startPage+1;i++){
		pageNum[i] = pageMaker.startPage + i;
	}
	
	pageMaker.pageNum = pageNum;
	pageMaker.prevPageNum = pageMaker.startPage - 1;
	pageMaker.nextPageNum = pageMaker.endPage + 1;
	
	var template = Handlebars.compile(templateObject.html());
	var html = template(pageMaker);
	target.html("").html(html);
}
function selectAll(checkBox){
	var length = document.getElementsByName("pstiNo").length;
	if(document.getElementById('selectAll').checked==true){
		for(var i=0; i<length; i++) document.getElementsByName("pstiNo")[i].checked=true;
	}

	if(document.getElementById('selectAll').checked==false){
		for(var i=0; i<length; i++) document.getElementsByName("pstiNo")[i].checked=false;
	}


}
function cancleAll(){

	if(document.getElementById('selectAll').checked==true){
		document.getElementById('selectAll').checked=false;
	}
}
function registRequestSmpl(){
	var pstiNo ='';
	var pstiCount = 0;
	$('input[class="form-check-input"]:checked').each(function(){
		pstiNo += $(this).val() + ",";
		pstiCount += 1;
	});
	
	if(pstiCount == 0){
		alert("선택된 시료가 없습니다.");
		return;
	}
	
	$.ajax({
		url : '<%=request.getContextPath()%>/rest-insp/regist-Request-Smpl',
		type: 'post',
		data : {"pstiNo" : pstiNo},
		success : function(result){
			alert(pstiCount+"명의 시료를 성공적으로 보건소에 전달하였습니다.");
			location.reload();
		},
		error : function(error){
			alert('error' + error.status);
		}
		
	})
	
}
</script>
<section class="content">
		<div style="height: 640px;">

				<div class="table-responsive">
					<table class="table table-hover text-nowrap"
						style="text-align: center;">
						<thead>
							<tr role="row">
								<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width:10%;">
									<div class="form-group">
										<div class="form-check">
											<input type="checkbox" style="cursor:pointer; float : left;" name="psti_check_all" id="selectAll" onclick="selectAll();">
										</div>
									</div>
								</th>
								<th style="text-align:center; width:15%;" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="" >성명</th>
								<th style="text-align:center; width:10%;" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">나이</th>
								<th style="text-align:center; width:15%;" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">연락처</th>
								<th style="text-align:center; width:15%;" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">검사일</th>
								<th tabindex="0" aria-controls="example2" rowspan="1" style="text-align: center; width:15%;" colspan="1" aria-label="">결과일</th>
								<th tabindex="0" aria-controls="example2" rowspan="1" style="text-align: center; width:20%;" colspan="1" aria-label="">검사결과</th>
							</tr>
						</thead>
						<tbody id="chckd-table-tbody">
							<tr class="each-chckd-element">
								<td colspan="7">페이지 로딩중 입니다.</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="card-footer clearfix" style="background-color: white;">
		<ul class="pagination justify-content-center m-0" id="chckd-psti-pagination-ul">
		</ul>
	</div>
<form id="jobForm">
	<input type='hidden' name="page" value="" />
	<input type='hidden' name="perPageNum" value="" />
	<input type='hidden' name="searchType" value="" />
	<input type='hidden' name="keyword" value="" />
</form>
</section>