<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template" id="isoptnt-template">
{{#each .}}
	<tr style="cursor:pointer;" onclick="showDetail('{{manageNo}}')" class="each-isoptnt-element" data-manage-no="{{manageNo}}" data-inst-no="{{ltctNo}}">
		<td onclick="event.cancelBubble=true"><input {{fnToday today}} type="checkbox" class="form-check-input" onclick="cancleAll();" name="manageNo" style="margin-left:-7px;" value="{{manageNo}}"></td>
		<td style="text-align:left;"><div class="pstiNm">{{pstiNm}}</div></td>
		<td>{{fnGender gender}}</td>
		<td>{{age}}</td>
		<td><div class="pstiTelno">{{pstiTelno}}</div></td>
		<td>{{prettifyDate inYmd}}</td>
		<td>{{ngtvCnt}}</td>
		<td><span class="badge badge-{{fnFeverBadge bdtemp}}">{{fnBdtempCheck bdtemp}}</span></td>
	</tr>
{{/each}}
</script>
<script type="text/x-handlebars-template" id="isoptnt-pagination-template">
	<li class="page-item each-isoptnt-pagination-element">
		<a class="page-link" href="1">
			<i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-isoptnt-pagination-element">
		<a class="page-link {{checkDisabled prev}}" href="{{#if prev}}{{prevPageNum}}{{/if}}">
			<i class="fas fa-angle-left" style="color:#1a4f72;"></i>
		</a>
	</li>
	
	{{#each pageNum}}
		<li class="page-item each-isoptnt-pagination-element {{signActive this}}" >
			<a class="page-link" style="{{styleActive this}}" href="{{this}}">
				{{this}}
			</a>
		</li>
	{{/each}}
	
	<li class="page-item each-isoptnt-pagination-element">
		<a class="page-link {{checkDisabled next}}" href="{{#if next}}{{nextPageNum}}{{/if}}">
			<i class="fas fa-angle-right" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-isoptnt-pagination-element">
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
"fnFeverBadge" : function(bdtemp){
	if(bdtemp < 37.5){
		return "success";
	}else if(bdtemp < 38.0){
		return "warning";
	}
	return "danger";
},
"fnGender" : function(gender){
	if(gender == "M"){
		return "남";
	}
	if(gender =="F"){
		return "여";
	}
},
"fnPstvYn" : function(chkdYn, pstvYn){
	if(chkdYn == "Y"){
		if(pstvYn == "Y"){
			return "양성";
		}
		if(pstvYn == "N"){
			return "음성";
		}
	}
	if(chkdYn == "N"){
		return "검사중"
	}
},
"fnResult" : function(inYmd){
	if(inYmd){
		return "양성";
	}
},
"fnDgnssResultCode" : function(dgnssResultCode){
	if(dgnssResultCode == "D101"){
		return "중증 및 중등증";
	}
	if(dgnssResultCode == "D102"){
		return "미중증 및 경증";
	}
	if(dgnssResultCode == "D103"){
		return "무증상";
	}
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
"checkDisabled" : function(flag){
  if(!flag) return 'disabled';
}
});
</script>
<script>
var page = 1;

window.onload = function(){
	var url = '<%=request.getContextPath()%>/rest-ltct/isoptnt-list';
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
	jobForm.find("[name='keyword']").val($('#keyword').val());
	
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
				$('#isoptnt-table-tbody').html("");
			if(dataMap.isoptntList.length == 0){
				$('#isoptnt-table-tbody').html('<tr class="each-isoptnt-element"><td colspan="7">데이터가 없습니다.</td></tr>')
				dataMap.pageMaker.endPage = 1;
				dataMap.pageMaker.realEndPage = 1;
				printPagination(dataMap.pageMaker, $('#isoptnt-pagination-ul'), $('#isoptnt-pagination-template'), '.each-isoptnt-pagination-element');
				printData('', $('#isoptnt-detail-module'), $('#isoptnt-detail-template'), '.isoptnt-detail-element')
				$('#enableReadRrn').attr('disabled', true);
				$('#modifybutton').attr('disabled', true);
				$('#openButton').attr('disabled', true);
			}else{
				printData(dataMap.isoptntList, $('#isoptnt-table-tbody'), $('#isoptnt-template'), '.each-isoptnt-element');
				printPagination(dataMap.pageMaker, $('#isoptnt-pagination-ul'), $('#isoptnt-pagination-template'), '.each-isoptnt-pagination-element');
				$('#enableReadRrn').data('rrn', dataMap.basicDetail.rrn);
				$('#enableReadRrn').data('manageNo', dataMap.basicDetail.manageNo);
		      	dataMap.basicDetail.rrn = (dataMap.basicDetail.rrn.substring(0,8) + '******');
				$('#enableReadRrn').attr('disabled', false);
				$('#modifybutton').attr('disabled', false);
				if(dataMap.basicDetail.today == 0){
					$('#openButton').attr('disabled', false);
				}else{
					$('#openButton').attr('disabled', true);
				}
		      	printData(dataMap.basicDetail, $('#isoptnt-detail-module'), $('#isoptnt-detail-template'), '.isoptnt-detail-element')
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
	var length = document.getElementsByName("manageNo").length;
	if(document.getElementById('selectAll').checked==true){
		for(var i=0; i<length; i++){
			if(document.getElementsByName('manageNo')[i].disabled==false){
				document.getElementsByName("manageNo")[i].checked=true;
			}
		}
	}

	if(document.getElementById('selectAll').checked==false){
		for(var i=0; i<length; i++) document.getElementsByName("manageNo")[i].checked=false;
	}
}
function cancleAll(){
	if(document.getElementById('selectAll').checked==true){
		document.getElementById('selectAll').checked=false;
	}
}
function requestSmpl(){
	var manageNo = '';
	var count = 0;
	var pbhtNm = $('option[class="pbhtNo"]:selected').text();
	$('input[class="form-check-input"]:checked').each(function(){
		manageNo += $(this).val()+ ",";
		count = count + 1;
	});
	var pbhtNo = $('option[class="pbhtNo"]:selected').val();
	
	if(count == 0){
		alert("재검신청할 입소자를 선택해주세요.");
		return;
	}
	
	$.ajax({
		url: '<%=request.getContextPath()%>/rest-ltct/request-smpl',
		type: 'post',
		data : {'manageNo' : manageNo, 'pbhtNo' : pbhtNo},
		success: function(success){
			alert(count+"명의 시료를 " + pbhtNm +"에 성공적으로 전달하였습니다.");
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
								style="text-align: center; margin-top: 10px;">
								<thead>
									<tr role="row">
										<th style="width: 10%;"><input id="selectAll" type="checkbox" onclick="selectAll();" name="manage_check_all"></th>
										<th style="width: 15%;" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">성명</th>
										<th style="width: 10%;" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">성별</th>
										<th style="width: 10%;" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">나이</th>
										<th style="width: 15%;" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">연락처</th>
										<th style="width: 15%;" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">입소일자</th>
										<th style="width: 10%;" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">누적음성수</th>
										<th style="width: 15%;" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">체온</th>
									</tr>
								</thead>
								<tbody id="isoptnt-table-tbody">
									<tr class="each-isoptnt-element">
										<td colspan="7">페이지 로딩중 입니다.</td>
									</tr>
								</tbody>
							</table>
				</div>
		</div>
		<div class="card-footer clearfix" style="background-color: white;">
			<ul class="pagination justify-content-center m-0" id="isoptnt-pagination-ul">
		</ul>
		</div>
		<form id="jobForm">
			<input type='hidden' name="page" value="" />
			<input type='hidden' name="perPageNum" value="" />
			<input type='hidden' name="searchType" value="" />
			<input type='hidden' name="keyword" value="" />
		</form>
</section>
