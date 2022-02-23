<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template" id="sckbd-template">
{{#each .}}
	<tr style="cursor:pointer;" onclick="showDetail('{{manageNo}}')" class="each-sckbd-element" data-manage-no="{{manageNo}}">
		<td style="text-align:left;">{{pstiNm}}</td>
		<td>{{fnGender gender}}</td>
		<td>{{age}}</td>
		<td>{{pstiTelno}}</td>
		<td>{{prettifyDate sckbdreqYmd}}</td>
		<td style="text-align:left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">{{hsptNm}}</td>
	</tr>
{{/each}}
</script>
<script type="text/x-handlebars-template" id="sckbd-pagination-template">
	<li class="page-item each-sckbd-pagination-element">
		<a class="page-link" href="1">
			<i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-sckbd-pagination-element">
		<a class="page-link {{checkDisabled prev}}" href="{{#if prev}}{{prevPageNum}}{{/if}}">
			<i class="fas fa-angle-left" style="color:#1a4f72;"></i>
		</a>
	</li>
	
	{{#each pageNum}}
		<li class="page-item each-sckbd-pagination-element {{signActive this}}" >
			<a class="page-link" style="{{styleActive this}}" href="{{this}}">
				{{this}}
			</a>
		</li>
	{{/each}}
	
	<li class="page-item each-sckbd-pagination-element">
		<a class="page-link {{checkDisabled next}}" href="{{#if next}}{{nextPageNum}}{{/if}}">
			<i class="fas fa-angle-right" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-sckbd-pagination-element">
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
"fnsmplResCode" : function(smplResCode){
	if(smplResCode == "K101"){
		return "검사중";
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
		return "남";
	}
	if(gender =="F"){
		return "여";
	}
},
"fnDgnssResult" : function(dgnssResultCode){
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
"checkDisabled" : function(flag){
  if(!flag) return 'disabled';
}
});
</script>
<script>
var page = 1;

window.onload = function(){
	var url = '<%=request.getContextPath()%>/rest-ltct/sckbd-list';
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
			$('#sckbd-table-tbody').html("")
			if(dataMap.sckbdList.length == 0){
				$('#sckbd-table-tbody').html('<tr class="each-sckbd-element"><td colspan="6">데이터가 없습니다.</td></tr>');
				dataMap.pageMaker.endPage = 1;
				dataMap.pageMaker.realEndPage = 1;
				printPagination(dataMap.pageMaker, $('#sckbd-pagination-ul'), $('#sckbd-pagination-template'), '.each-sckbd-pagination-element');
				printData('', $('#sckbd-detail-module'), $('#sckbd-detail-template'), '.sckbd-detail-element');
				$('#enableReadRrn').attr('disabled', true);
				$('#sckbdreqOkBtn').attr('disabled', true);
				$('#sckbdreqReturnBtn').attr('disabled', true);
			}else{
				printData(dataMap.sckbdList, $('#sckbd-table-tbody'), $('#sckbd-template'), '.each-sckbd-element');
				printPagination(dataMap.pageMaker, $('#sckbd-pagination-ul'), $('#sckbd-pagination-template'), '.each-sckbd-pagination-element');
				$('#enableReadRrn').data('rrn', dataMap.basicDetail.rrn);
				$('#enableReadRrn').data('manageNo', dataMap.basicDetail.manageNo);
		      	dataMap.basicDetail.rrn = (dataMap.basicDetail.rrn.substring(0,8) + '******');
				printData(dataMap.basicDetail, $('#sckbd-detail-module'), $('#sckbd-detail-template'), '.sckbd-detail-element');
				$('#enableReadRrn').attr('disabled', false);
				$('#sckbdreqOkBtn').attr('disabled', false);
				$('#sckbdreqReturnBtn').attr('disabled', false);
			}
		},
		error : function(error){
// 			alert('error' + error.status);
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
</script>
<section class="content">
  <div style="height: 640px;">
    <div class="table-responsive">
      <table class="table table-hover text-nowrap" style="text-align: center;">
        <thead>
          <tr>
          <tr role="row">
            <th style="width:20%;" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">성명</th>
            <th style="width:10%;" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">성별</th>
            <th style="width:10%;" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">나이</th>
            <th style="width:15%;" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="">연락처</th>
            <th style="width:15%;" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">신청일자</th>
            <th style="width:30%;" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">신청기관</th>
          </tr>
        </thead>
        <tbody id="sckbd-table-tbody">
          <tr class="each-sckbd-element">
            <td colspan="6">페이지 로딩중 입니다.</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
  <div class="card-footer clearfix" style="background-color: white;">
    <ul class="pagination justify-content-center m-0" id="sckbd-pagination-ul">
		</ul>
  </div>
  <form id="jobForm">
	<input type='hidden' name="page" value="" />
	<input type='hidden' name="perPageNum" value="" />
	<input type='hidden' name="searchType" value="" />
	<input type='hidden' name="keyword" value="" />
</form>
</section>

