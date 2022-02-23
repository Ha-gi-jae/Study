<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template" id="req-sckbd-hspt-list-template">
{{#each .}}
          <tr
			data-hspt-no="{{hsptNo}}" data-manage-no="{{manageNo}}" data-sckbdreq-no="{{sckbdreqNo}}"
			data-child-no="{{childNo}}" data-request-code="{{requestCode}}" data-type="{{type}}"
 			data-psti-nm="{{pstiNm}}" data-sckbdreq-code="{{sckbdreqCode}}" data-cancle-ymd="{{cancleYmd}}"
            onclick="showDetail('{{manageNo}}', '{{sckbdreqNo}}')"
            class="each-sckbdreq-element" style="cursor: pointer;">
            <td style="text-align: left;">{{pstiNm}}</td>
            <td>{{age}}</td>
            <td>{{pstiTelno}}</td>
            <td style="text-align: left">{{checkSckbdreqCode sckbdreqCode hsptNm}}</td>
            <td>{{prettifyDetailDate sckbdreqYmd}}</td>
            <td style="color: {{classifySckbdreqColor sckbdreqCode}}">{{sckbdreqCode}}</td>
          </tr>
{{/each}}
</script>

<script type="text/x-handlebars-template" id="req-sckbd-ltct-list-template">
{{#each .}}
          <tr
			data-hspt-no="{{hsptNo}}" data-manage-no="{{manageNo}}" data-sckbdreq-no="{{sckbdreqNo}}"
			data-child-no="{{childNo}}" data-request-code="{{requestCode}}" data-type="{{type}}"
			data-psti-nm="{{pstiNm}}" data-sckbdreq-code="{{sckbdreqCode}}" data-cancle-ymd="{{cancleYmd}}"
            onclick="showDetail('{{manageNo}}', '{{sckbdreqNo}}')"
            class="each-sckbdreq-element" style="cursor: pointer;">
            <td style="text-align: left;">{{pstiNm}}</td>
            <td>{{age}}</td>
            <td>{{pstiTelno}}</td>
            <td style="text-align: left">{{ltctNm}}</td>
            <td>{{prettifyDetailDate sckbdreqYmd}}</td>
            <td style="color: {{classifySckbdreqColor sckbdreqCode}}">{{sckbdreqCode}}</td>
          </tr>
{{/each}}
</script>

<script type="text/x-handlebars-template" id="search-template">
<select class="form-control " name="searchCode" id="searchCode" onchange="searchCodeFunction();">
	<option value="">검색구분</option>
	<option value="H101">승인대기</option>
	<option value="H103">승인</option>
	<option value="H104">취소</option>
	<option value="H105">반려</option>							
</select>
</script>

<script type="text/x-handlebars-template" id="inptnt-pagination-template">
    <li class="page-item each-inptnt-pagination-element"><a class="page-link" href="1"> <i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
    </a></li>
    <li class="page-item each-inptnt-pagination-element"><a class="page-link {{checkDisabled prev}}" href="{{#if prev}}{{prevPageNum}}{{/if}}"> <i class="fas fa-angle-left" style="color:#1a4f72;"></i>
    </a></li>

{{#each pageNum}}
    <li class="page-item each-inptnt-pagination-element {{signActive this}}" ><a class="page-link" href="{{this}}" >{{this}}</a></li>
{{/each}}

    <li class="page-item each-inptnt-pagination-element"><a class="page-link {{checkDisabled next}}" href="{{#if next}}{{nextPageNum}}{{/if}}"> <i class="fas fa-angle-right" style="color:#1a4f72;"></i>
    </a></li>
    <li class="page-item each-inptnt-pagination-element"><a class="page-link" href="{{realEndPage}}"> <i class="fas fa-angle-double-right" style="color:#1a4f72;"></i>
</a></li>
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
"prettifyDetailDate" : function(timeValue){
	if(timeValue){
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		
		var hour = dateObj.getHours();
		var minute = dateObj.getMinutes();
		var second = dateObj.getSeconds();
		
		date += '';
		if(date.length < 2){
			date = '0' + date;
		}
		month += '';
		if(month.length < 2){
			month = '0' + month;
		}
		hour += '';
		if(hour.length < 2){
			hour = '0' + hour;
		}
		minute += '';
		if(minute.length < 2){
			minute = '0' + minute;
		}
		second += '';
		if(second.length < 2){
			second = '0' + second;
		}
		
		
		return year + "-" + month + "-" + date + " " + hour + ":" + minute + ":" + second;
	}
},
"signActive" : function(pageNum){
  if(pageNum == page) return 'active';
},
"checkDisabled" : function(flag){
    if(!flag) return 'disabled';
},
"getExist" : function(a, b){
	return a || b;
},
"classifySckbdreqColor" : function(sckbdreqCode){
	if(!sckbdreqCode) return '';
	if(sckbdreqCode == '승인대기'){
		return '#28a745;';
	}
	if(sckbdreqCode == '승인'){
		return '#007bff;'; 
	}
	if(sckbdreqCode == '반려'){
		return '#dc3545;'; 
	}
	if(sckbdreqCode == '취소'){
		return '#777;'; 
	}
},
"checkSckbdreqCode" : function(sckbdreqCode, hsptNm){
	if(sckbdreqCode != '자가처리') return hsptNm;
	return '${loginInst.instNm}';
}
});


</script>
<script>

var page = 1;

var url = '<%=request.getContextPath()%>/rest-hspt/sckbdreq-list';

	var targetId = '';

	var pagenationId = '';

	var templateId = '';

	window.onload = function() {

		addEvnetWaitTab();
		addEvnetReqTab();

		list_go(url, page);
		$('ul.pagination').on('click', 'li a', function(event) {
			if ($(this).attr("href")) {
				page = $(this).attr("href");
				getPage(url, make_form(page), targetId, pagenationId, templateId);
				//			list_go(url, pageParam, targetId, pagenationId);
			}

			return false;
		});
	}

	function make_form(pageParam) {

		var jobForm = $('#jobForm');
		if (!pageParam)
			page = 1;

		page = pageParam;

		jobForm.find("[name='page']").val(page);
		jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
		jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
		jobForm.find("[name='keyword']").val($('#keywordId').val());

		return jobForm;
	}

	function list_go(url, pageParam, targetId, pagenationId, templateId) {
		getPage(url, make_form(pageParam), targetId, pagenationId, templateId);
	}

	function getPage(handelbarsProcessingURL, form, targetId, pagenationId, templateId) {

		if(!$('#jobForm').find("[name='typeCode']").val()
				|| $('#jobForm').find("[name='typeCode']").val() == "C103"){
			targetId = '#req-sckbd-hspt-list-table-tbody';
			pagenationId = '#inptnt-list-pagination-ul';
			templateId = '#req-sckbd-hspt-list-template';
			pageInfoId = '#req-sckbd-hspt-page-info-div';
		}
		if($('#jobForm').find("[name='typeCode']").val() == "C104"){
			templateId = '#req-sckbd-ltct-list-template'
			targetId = "#req-sckbd-ltct-list-table-tbody";
			pagenationId = "#inptnt-req-list-pagination-ul";			
			pageInfoId = '#req-sckbd-ltct-page-info-div';
		}
		
		$.ajax({
			url : handelbarsProcessingURL,
			type : 'get',
			dataType : 'json',
			data : form.serialize(),
			success : function(dataMap) {
				
				if(dataMap.sckbdreqList.length == 0){
					$('.enableReadRrn').attr('disabled', true);
		    		
					$('#process-inptnt-btn').attr('disabled', true);
					$('#sckbdreq-inptnt-button').attr('disabled', true);
					$('#cancle-btn').attr('disabled', true);
					$('#cancle-btn-iso').attr('disabled', true);
					$('#sckbdreq-isoptnt-button').attr('disabled', true);	
		    		
					$(targetId).html('<tr class="each-sckbdreq-element"><td colspan="6" class="initialTd">데이터를 불러오는 중입니다.</td></tr>');
	                
		    		$('.initialTd').html('데이터가 없습니다.');
		    		
		    		dataMap.pageMaker.endPage = 1;
		    		printPagination(dataMap.pageMaker,$(pagenationId), $('#inptnt-pagination-template'), '.each-inptnt-pagination-element');
		    		
		    		emptyList();
			      
		    	}else{
					$('.enableReadRrn').attr('disabled', false);
					
					$('#process-inptnt-btn').attr('disabled', false);
					$('#sckbdreq-inptnt-button').attr('disabled', false);
					$('#cancle-btn').attr('disabled', false);
					$('#cancle-btn-iso').attr('disabled', false);
					$('#sckbdreq-isoptnt-button').attr('disabled', false);	
					
					printData(dataMap.sckbdreqList, $(targetId), $(templateId), '.each-sckbdreq-element');
					printPagination(dataMap.pageMaker, $(pagenationId), $('#inptnt-pagination-template'), '.each-inptnt-pagination-element');
					if(dataMap.firstRecord){
						showDetail(dataMap.firstRecord.manageNo, dataMap.firstRecord.sckbdreqNo);
					}
		    	}				
				
			},
			error : function(error) {
				alert('error' + error.status);
			}
		})
	}

	function printData(jsonArray, target, templateObject, removeClass) {

		var template = Handlebars.compile(templateObject.html());
		var html = template(jsonArray);
		$(removeClass).remove();
		target.append(html);
	}

	function printPagination(pageMaker, target, templateObject, removeClass) {

		var pageNum = new Array(pageMaker.endPage - pageMaker.startPage + 1);

		for (var i = 0; i < pageMaker.endPage - pageMaker.startPage + 1; i++) {
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

function emptyList(){
	
	$('form[name="sckbdreqProcessForm"] input[name="sckbdreqNo"]').val("");
	$('form[name="sckbdreqProcessForm"] input[name="type"]').val("");
	$('form[name="sckbdreqProcessForm"] input[name="hsptNo"]').val("");
	$('form[name="sckbdreqProcessForm"] input[name="requestCode"]').val("");	
	$('form[name="sckbdreqProcessForm"] input[name="childNo"]').val("");	
	$('form[name="sckbdreqProcessForm"] input[name="manageNo"]').val("");
	
	$("#hspt-tab-pstiNm").         html('');
	$("#hspt-tab-nlty").           html('');
	$("#hspt-tab-sckbdreqYmd").    html('');
	$("#hspt-tab-vacType").        html('');
	$("#hspt-tab-gender").         html('');
	$("#hspt-tab-age").            html('');
	$("#hspt-tab-resYmd").         html('');
	$("#hspt-tab-pstvYn").         html('');
	$("#hspt-tab-feverYn").        html('');
	$("#hspt-tab-pregnYn").        html('');
	$("#hspt-tab-rrn").            html('');
	$("#hspt-tab-pstiTelno").      html('');
	$("#hspt-tab-pstiAdres").      html('');
	$("#hspt-tab-symptms").        html('');
	$("#hspt-tab-instNm").         html('');
	$("#hspt-tab-instTelno").      html('');
	$("#hspt-tab-instAdres").      html('');
	$("#hspt-tab-sckbdreqCode").   html('');
	$("#hspt-tab-dgnssNote").      html('');
	$("#hspt-tab-dgnssHsptNm").    html('');
	$("#hspt-tab-dgnssResultCode").html('');

	$("#ltct-tab-pstiNm").         html('');
	$("#ltct-tab-nlty").           html('');
	$("#ltct-tab-sckbdreqYmd").    html('');
	$("#ltct-tab-vacType").        html('');
	$("#ltct-tab-gender").         html('');
	$("#ltct-tab-age").            html('');
	$("#ltct-tab-resYmd").         html('');
	$("#ltct-tab-pstvYn").         html('');
	$("#ltct-tab-feverYn").        html('');
	$("#ltct-tab-pregnYn").        html('');
	$("#ltct-tab-rrn").            html('');
	$("#ltct-tab-pstiTelno").      html('');
	$("#ltct-tab-pstiAdres").      html('');
	$("#ltct-tab-symptms").        html('');
	$("#ltct-tab-instNm").         html('');
	$("#ltct-tab-instTelno").      html('');
	$("#ltct-tab-instAdres").      html('');
	$("#ltct-tab-sckbdreqCode").   html('');
	$("#ltct-tab-dgnssNote").      html('');
	$("#ltct-tab-dgnssHsptNm").    html('');
	$("#ltct-tab-dgnssResultCode").html('');
	
	$('#process-inptnt-btn').attr('disabled', true);
	$('#sckbdreq-inptnt-button').attr('disabled', true);
	$('#cancle-btn').attr('disabled', true);
	$('#cancle-btn-iso').attr('disabled', true);
	$('#sckbdreq-isoptnt-button').attr('disabled', true);
	
	$('#sckbdreq-inptnt-button').attr('data-psti-nm', '');
	$('#sckbdreq-inptnt-button').attr('data-manage-no', '');
	$('#sckbdreq-inptnt-button').attr('data-sckbdreq-no', '');
	
	$('#sckbdreq-isoptnt-button').attr('data-psti-nm', '');
	$('#sckbdreq-isoptnt-button').attr('data-manage-no', '');
	$('#sckbdreq-isoptnt-button').attr('data-sckbdreq-no', '');
	
	$('#process-inptnt-btn').attr('data-manage-no','');
	$('#process-inptnt-btn').attr('data-sckbdreq-no','');
	
	$('#cancle-btn').attr('data-sckbdreq-no','');
	$('#cancle-btn').attr('data-child-no','');
	$('#cancle-btn').attr('data-type','');

	$('#cancle-btn-iso').attr('data-sckbdreq-no','');
	$('#cancle-btn-iso').attr('data-child-no','');
	$('#cancle-btn-iso').attr('data-type','');
	
}
</script>

<script>
	function addEvnetWaitTab() {
		var dgnssWaitTab = $('#custom-req-sckbd-hspt-tab');
		dgnssWaitTab.on('click', function() {
			$('#jobForm').find("[name='typeCode']").val("C103");
			
			$("#searchType option:eq(0)").prop("selected", true);
			$('#keywordId').val("");
			
			templateId = "#req-sckbd-hspt-list-template";
			targetId = "#req-sckbd-hspt-list-table-tbody";
			pagenationId = "#inptnt-list-pagination-ul";
			page = 1;
			list_go(url, page, targetId, pagenationId, templateId);
		})
	}
	function addEvnetReqTab() {

		var dgnssReqTab = $('#custom-req-sckbd-ltct-tab');
		dgnssReqTab.on('click', function() {
			$('#jobForm').find("[name='typeCode']").val("C104");

			$("#searchType option:eq(0)").prop("selected", true);
			$('#keywordId').val("");
			
			templateId = '#req-sckbd-ltct-list-template'
			targetId = "#req-sckbd-ltct-list-table-tbody";
			pagenationId = "#inptnt-req-list-pagination-ul";
			page = 1;
			list_go(url, page, targetId, pagenationId, templateId);
		})
	}

	function searchFunction(){
		
 		var url = '<%=request.getContextPath()%>/rest-hspt/sckbdreq-list';
		
 		$('#jobFormSearchCode').val($('#searchCode').val());
 		$('#jobForm').find('input[name="searchType"]').val($('#searchType').val());
 		
 		var typeCode = $('#jobForm').find('input[name="typeCode"]').val();
 		
		if(typeCode == "C103"){
			templateId = "#req-sckbd-hspt-list-template";
			targetId = "#req-sckbd-hspt-list-table-tbody";
			pagenationId = "#inptnt-list-pagination-ul";
			
			list_go(url, page, targetId, pagenationId, templateId);			
		}else if(typeCode == "C104"){
			templateId = '#req-sckbd-ltct-list-template'
			targetId = "#req-sckbd-ltct-list-table-tbody";
			pagenationId = "#inptnt-req-list-pagination-ul";
			list_go(url, page, targetId, pagenationId, templateId);			
		}else if(!typeCode){
			templateId = "#req-sckbd-hspt-list-template";
			targetId = "#req-sckbd-hspt-list-table-tbody";
			pagenationId = "#inptnt-list-pagination-ul";
			list_go(url, page, targetId, pagenationId, templateId);				
		}
		
	}
	
</script>
<script>
function prettyDate(timeValue){
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
}
function prettifyDetailDate(timeValue){
	if(timeValue){
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		
		var hour = dateObj.getHours();
		var minute = dateObj.getMinutes();
		var second = dateObj.getSeconds();
		
		date += '';
		if(date.length < 2){
			date = '0' + date;
		}
		month += '';
		if(month.length < 2){
			month = '0' + month;
		}
		hour += '';
		if(hour.length < 2){
			hour = '0' + hour;
		}
		minute += '';
		if(minute.length < 2){
			minute = '0' + minute;
		}
		second += '';
		if(second.length < 2){
			second = '0' + second;
		}
		
		
		return year + "-" + month + "-" + date + " " + hour + ":" + minute + ":" + second;
	}
}
function showDetail(manageNo, sckbdreqNo){
	
	$('form[name="sckbdreqProcessForm"] input[name="sckbdreqNo"]').val("");
	$('form[name="sckbdreqProcessForm"] input[name="type"]').val("");
	$('form[name="sckbdreqProcessForm"] input[name="hsptNo"]').val("");
	$('form[name="sckbdreqProcessForm"] input[name="requestCode"]').val("");	
	$('form[name="sckbdreqProcessForm"] input[name="childNo"]').val("");	
	$('form[name="sckbdreqProcessForm"] input[name="manageNo"]').val("");
	
	detailUrl = '<%=request.getContextPath()%>/rest-hspt/sckbdreq-detail';
	
	var trs = $('tr.each-sckbdreq-element');
	
	trs.removeClass('on');
	
	var target = $('tr[data-sckbdreq-no="'+sckbdreqNo+'"]');
	
	target.addClass('on');	
	
	var sckbdreqNo = target.attr('data-sckbdreq-no');
	var type = target.attr('data-type');
	var requestCode = target.attr('data-request-code');
	var hsptNo = target.attr('data-hspt-no');
	var childNo = target.attr('data-child-no');
	
	$('form[name="sckbdreqProcessForm"] input[name="sckbdreqNo"]').val(sckbdreqNo);
	$('form[name="sckbdreqProcessForm"] input[name="type"]').val(type);
	$('form[name="sckbdreqProcessForm"] input[name="hsptNo"]').val(hsptNo);
	$('form[name="sckbdreqProcessForm"] input[name="requestCode"]').val(requestCode);	
	$('form[name="sckbdreqProcessForm"] input[name="childNo"]').val(childNo);	
	$('form[name="sckbdreqProcessForm"] input[name="manageNo"]').val(manageNo);	
	
	$('#sckbdreq-inptnt-button').attr('data-psti-nm', target.attr('data-psti-nm'));
	$('#sckbdreq-inptnt-button').attr('data-manage-no', manageNo);
	$('#sckbdreq-inptnt-button').attr('data-sckbdreq-no', sckbdreqNo);
	
	$('#sckbdreq-isoptnt-button').attr('data-psti-nm', target.attr('data-psti-nm'));
	$('#sckbdreq-isoptnt-button').attr('data-manage-no', manageNo);
	$('#sckbdreq-isoptnt-button').attr('data-sckbdreq-no', sckbdreqNo);
	
	$('#process-inptnt-btn').attr('data-manage-no',manageNo);
	$('#process-inptnt-btn').attr('data-sckbdreq-no',sckbdreqNo);
	
	$('#cancle-btn').attr('data-sckbdreq-no',sckbdreqNo);
	$('#cancle-btn').attr('data-child-no',childNo);
	$('#cancle-btn').attr('data-type',type);

	$('#cancle-btn-iso').attr('data-sckbdreq-no',sckbdreqNo);
	$('#cancle-btn-iso').attr('data-child-no',childNo);
	$('#cancle-btn-iso').attr('data-type',type);
	
	var sckbdreqCode = target.attr('data-sckbdreq-code');
	
	statusSetButton(target);
	
	$.ajax({
		url : detailUrl,
		type : 'get',
		dataType : 'json',
		data : {
			manageNo : manageNo
		   ,sckbdreqNo : sckbdreqNo
		   },
		success : function(sdc) {

			console.log(sdc);
			
			if(!sdc.lastRecord){
				
				console.log('it is not last record buttons disabled!');
				
				$('#process-inptnt-btn').attr('disabled', true);
				$('#sckbdreq-inptnt-button').attr('disabled', true);
				$('#cancle-btn').attr('disabled', true);
				$('#cancle-btn-iso').attr('disabled', true);
				$('#sckbdreq-isoptnt-button').attr('disabled', true);				
			}
			
			$('#enableReadRrn').data('rrn', sdc.rrn);
			$('#enableReadRrn').data('manageNo', manageNo);
	      	sdc.rrn = (sdc.rrn.substring(0,8) + '******');
			
			if(sdc.type == "A"){
				$("#hspt-tab-pstiNm").        html(sdc.pstiNm);
				$("#hspt-tab-nlty").          html(sdc.nlty);
				$("#hspt-tab-sckbdreqYmd").   html(prettifyDetailDate(sdc.sckbdreqYmd));
				$("#hspt-tab-vacType").       html(sdc.vacType);
				$("#hspt-tab-gender").        html(sdc.gender);
				$("#hspt-tab-age").           html(sdc.age);
				$("#hspt-tab-resYmd").        html(prettyDate(sdc.resYmd));
				$("#hspt-tab-pstvYn").        html(sdc.pstvYn);
				$("#hspt-tab-feverYn").       html(sdc.feverYn);
				$("#hspt-tab-pregnYn").       html(sdc.pregnYn);
				$("#hspt-tab-rrn").           html(sdc.rrn);
				$("#hspt-tab-pstiTelno").     html(sdc.pstiTelno);
				$("#hspt-tab-pstiAdres").     html(sdc.pstiAdres);
				$("#hspt-tab-symptms").       html(sdc.symptms);
				$("#hspt-tab-instNm").        html(sdc.instNm);
				$("#hspt-tab-instTelno").     html(sdc.instTelno);
				$("#hspt-tab-instAdres").     html(sdc.instAdres);
				$("#hspt-tab-sckbdreqCode").  html(sdc.sckbdreqCode);
				$("#hspt-tab-dgnssNote").     html(sdc.dgnssNote);
				$("#hspt-tab-dgnssHsptNm").    html(sdc.dgnssHsptNm);
				$("#hspt-tab-dgnssResultCode").html(sdc.dgnssResultCode);
			}
			if(sdc.type == "B"){
				$("#ltct-tab-pstiNm").html(sdc.pstiNm);
				$("#ltct-tab-nlty").html(sdc.nlty);
				$("#ltct-tab-sckbdreqYmd").html(prettifyDetailDate(sdc.sckbdreqYmd));
				$("#ltct-tab-vacType").html(sdc.vacType);
				$("#ltct-tab-gender").html(sdc.gender);
				$("#ltct-tab-age").html(sdc.age);
				$("#ltct-tab-resYmd").html(prettyDate(sdc.resYmd));
				$("#ltct-tab-pstvYn").html(sdc.pstvYn);
				$("#ltct-tab-feverYn").html(sdc.feverYn);
				$("#ltct-tab-pregnYn").html(sdc.pregnYn);
				$("#ltct-tab-rrn").html(sdc.rrn);
				$("#ltct-tab-pstiTelno").html(sdc.pstiTelno);
				$("#ltct-tab-pstiAdres").html(sdc.pstiAdres);
				$("#ltct-tab-symptms").html(sdc.symptms);
				$("#ltct-tab-ltctNm").html(sdc.ltctNm);
				$("#ltct-tab-ltctTelno").html(sdc.ltctTelno);
				$("#ltct-tab-ltctAdres").html(sdc.ltctAdres);
				$("#ltct-tab-sckbdreqCode").html(sdc.sckbdreqCode);
				$("#ltct-tab-dgnssNote").html(sdc.dgnssNote);				
				$("#ltct-tab-dgnssHsptNm").html(sdc.dgnssHsptNm);				
				$("#ltct-tab-dgnssResultCode").html(sdc.dgnssResultCode);				
			}

		},
		error : function(error) {
			alert('error' + error.status);
		}
	})		
	
}
function statusSetButton(target){
	
	var sckbdreqCode = target.attr('data-sckbdreq-code');
	var cancleYmd = target.attr('data-cancle-ymd');
	
	if(sckbdreqCode == '취소'){
		$('#process-inptnt-btn').attr('disabled', false);
		$('#sckbdreq-inptnt-button').attr('disabled', false);
		$('#cancle-btn').attr('disabled', true);
		$('#cancle-btn-iso').attr('disabled', true);
		$('#sckbdreq-isoptnt-button').attr('disabled', false);
	}
	if(sckbdreqCode == '승인'){
		$('#process-inptnt-btn').attr('disabled', true);
		$('#sckbdreq-inptnt-button').attr('disabled', true);
		$('#cancle-btn').attr('disabled', true);
		$('#cancle-btn-iso').attr('disabled', true);
		$('#sckbdreq-isoptnt-button').attr('disabled', true);
	}
	if(sckbdreqCode == '승인대기'){
		$('#process-inptnt-btn').attr('disabled', true);
		$('#sckbdreq-inptnt-button').attr('disabled', true);
		$('#cancle-btn').attr('disabled', true);
		$('#cancle-btn-iso').attr('disabled', true);
		$('#sckbdreq-isoptnt-button').attr('disabled', true);
		
		if(isPossibleToCancle(cancleYmd)){
			$('#cancle-btn').attr('disabled', false);
			$('#cancle-btn-iso').attr('disabled', false);			
		}
	}
	if(sckbdreqCode == '반려'){
		$('#process-inptnt-btn').attr('disabled', false);
		$('#sckbdreq-inptnt-button').attr('disabled', false);
		$('#cancle-btn').attr('disabled', true);
		$('#cancle-btn-iso').attr('disabled', true);
		$('#sckbdreq-isoptnt-button').attr('disabled', false);
	}
	if(sckbdreqCode == '자가처리'){
		$('#process-inptnt-btn').attr('disabled', true);
		$('#sckbdreq-inptnt-button').attr('disabled', true);
		$('#cancle-btn').attr('disabled', true);
		$('#cancle-btn-iso').attr('disabled', true);
		$('#sckbdreq-isoptnt-button').attr('disabled', false);
	}	
	
}

function isPossibleToCancle(timeValue){
	
	if(!timeValue) return;
	var test = true;
	
	test = parseInt(Date.now()) < parseInt(timeValue);
	return test;
}
</script>

<script>



function inptntGo(btn, type){
	
	var openUrl = 'sckbdreq-inptnt?manageNo=' +  $(btn).attr('data-manage-no') + '&pstiNm=' + $(btn).attr('data-psti-nm')
					+ '&type=' + type + '&sckbdreqNo=' + $(btn).attr('data-sckbdreq-no');
	
	OpenWindow(openUrl, '병원 조회', 1260, 715);
}

function processInptntGo(btn){
	
	var url = '<%=request.getContextPath()%>/rest-hspt/process-rejected-or-cancled-sckbdreq-to-inptnt';
	
	data = 
	{
		 sckbdreqNo : $(btn).attr('data-sckbdreq-no')
		,manageNo : $(btn).attr('data-manage-no')
	}
	
	$.ajax({
		url : url,
		type : 'post',
		dataType : 'json',
		data : data,
		success : function(dataMap) {
			alert('입원처리가 완료되었습니다.');
			location.reload();
		},
		error : function(error) {
			alert('error' + error.status);
		}
	})
}

function cancleGo(btn){
	
 	if(!confirm('병상신청을 취소하시겠습니까?')) return; 
	
	if(!$(btn).attr('data-sckbdreq-no')){
		alert('병상신청을 선택해주세요');
	}
	
	var url = '<%=request.getContextPath()%>/rest-hspt/process-sckbdreq-cancle';
	
	data = 
	{
		 sckbdreqNo : $(btn).attr('data-sckbdreq-no')
		,childNo : $(btn).attr('data-child-no')
		,type : $(btn).attr('data-type')
	}
	
	$.ajax({
		url : url,
		type : 'post',
		dataType : 'json',
		data : data,
		success : function(dataMap) {
			alert('병상신청을 취소하였습니다.');
			
			location.reload();
		},
		error : function(error) {
			alert('error' + error.status);
		}
	})		
}

function isoCancleGo(btn){
	
 	if(!confirm('입소신청을 취소하시겠습니까?')) return; 
	
	if(!$(btn).attr('data-sckbdreq-no')){
		alert('입소신청을 선택해주세요');
	}
	
	var url = '<%=request.getContextPath()%>/rest-hspt/process-sckbdreq-cancle';
	
	data = 
	{
		 sckbdreqNo : $(btn).attr('data-sckbdreq-no')
		,childNo : $(btn).attr('data-child-no')
		,type : $(btn).attr('data-type')
	}
	
	$.ajax({
		url : url,
		type : 'post',
		dataType : 'json',
		data : data,
		success : function(dataMap) {
			
			alert('입소신청을 취소하였습니다.');
			
			$('#jobForm').find("[name='typeCode']").val("C104");

			$("#searchType option:eq(0)").prop("selected", true);
			$('#keywordId').val("");
			
			var templateId = '#req-sckbd-ltct-list-template'
			var targetId = "#req-sckbd-ltct-list-table-tbody";
			var pagenationId = "#inptnt-req-list-pagination-ul";
			var page = 1;
			
			list_go('<%=request.getContextPath()%>/rest-hspt/sckbdreq-list', page, targetId, pagenationId, templateId);
			
		},
		error : function(error) {
			alert('error' + error.status);
		}
	})		
}

function isoptntGo(btn, type){
	
	var openUrl = 'sckbdreq-isoptnt?manageNo=' +  $(btn).attr('data-manage-no') + '&pstiNm=' + $(btn).attr('data-psti-nm')
					+ '&type=' + type + '&sckbdreqNo=' + $(btn).attr('data-sckbdreq-no');
	
	OpenWindow(openUrl, '생활치료센터 조회', 1260, 715);
} 

</script>

<!-- 진료 요청 대기환자 목록 -->
<div class="row" style="margin: 1px;">
  <div class="col-md-6 pl-0">
    <div class="card">
      <!-- search bar -->
      <div class="card-body">
        <div class="table-responsive">
          <div style="height: 662px;">
            <table class="table table-hover text-nowrap" style="text-align: center;">
              <thead>
                <tr role="row">
                  <th style="width: 12%">성명</th>
                  <th style="width: 10%">나이</th>
                  <th style="width: 20%">연락처</th>
                  <th                   >병원이름</th>
                  <th style="width: 10%">신청시각</th>
                  <th style="width: 10%">신청결과</th>
                </tr>
              </thead>
              <tbody id="req-sckbd-hspt-list-table-tbody">
                <tr class="each-sckbdreq-element">
                  <td colspan="6" class="initialTd">데이터를 불러오는 중입니다.</td>
                </tr>
              </tbody>
            </table>
            <div id="req-sckbd-hspt-page-info-div" style="float: right;"></div>
          </div>
          <div class="card-footer clearfix pb-0 pt-0" style="background-color: white;">
            <ul class="pagination justify-content-center m-0" id="inptnt-list-pagination-ul">
            </ul>
          </div>
          <form id="jobForm">
            <input type='hidden' name="page" value="" />
            <input type='hidden' name="perPageNum" value="" />
            <input type='hidden' name="searchType" value="" />
            <input type='hidden' id="jobFormKeyword" name="keyword" value="" />
            <input type='hidden' name="typeCode" value="" />
            <input type='hidden' id="jobFormSearchCode" name="searchCode" value="" />
          </form>
        </div>
        <!-- /.table-responsive -->
      </div>
    </div>
  </div>
  <div class="col-md-6 pr-0">
    <!-- /.card-body -->
    <div class="card">
      <div class="card-body pb-0">
        <table class="table table-bordered" style="border-left-color: white; border-right-color: white;">
          <thead>
            <tr>
              <th colspan="4" style="font-size: 17px; padding: 7px;">
              
                        <div class="row m-0" style="justify-content: space-between;">
                    		<label style="font-size: 17px; margin: 0px;">병상신청 환자상세</label>
                    		<button type="button" class="btn btn-sm btn-primary enableReadRrn" id="enableReadRrn" onclick="enableReadRrn(this);" data-enable="N" data-rrn="" data-manageNo="">개인정보 열람</button>
                    	</div>              
              
              </th>
            </tr>
          </thead>
          <tbody id="dgnss-detail-info-module">
            <tr class="ddoing dgnss-detail-info" style="height: 15px;"></tr>
            <tr class="shittr dgnss-detail-info">
              <th class="col-sm-3">성명</th>
              <td id="hspt-tab-pstiNm" class="col-sm-4"></td>
              <th class="col-sm-2">국적</th>
              <td id="hspt-tab-nlty" class="col-sm-3"></td>
            </tr>
            <tr class="shittr dgnss-detail-info">
              <th>병상신청일자</th>
              <td id="hspt-tab-sckbdreqYmd"></td>
              <th>백신접종</th>
              <td id="hspt-tab-vacType"></td>
            </tr>
            <tr class="shittr dgnss-detail-info">
              <th>성별</th>
              <td id="hspt-tab-gender"></td>
              <th>나이</th>
              <td id="hspt-tab-age"></td>
            </tr>
            <tr class="shittr dgnss-detail-info">
              <th>확정일자</th>
              <td id="hspt-tab-resYmd"></td>
              <th>결과</th>
              <td id="hspt-tab-pstvYn"></td>
            </tr>
            <tr class="shittr dgnss-detail-info">
              <th>발열여부</th>
              <td id="hspt-tab-feverYn"></td>
              <th>임신여부</th>
              <td id="hspt-tab-pregnYn"></td>
            </tr>
            <tr class="shittr dgnss-detail-info">
              <th>주민/외국인등록번호</th>
              <td id="hspt-tab-rrn"></td>
              <th>연락처</th>
              <td id="hspt-tab-pstiTelno"></td>
            </tr>
            <tr class="shittr dgnss-detail-info">
              <th>주소</th>
              <td colspan="3" id="hspt-tab-pstiAdres"></td>
            </tr>
            <tr class="shittr dgnss-detail-info">
              <th>증상</th>
              <td colspan="3" id="hspt-tab-symptms"></td>
            </tr>
            <tr class="shittr dgnss-detail-info">
              <th>병상신청기관</th>
              <td id="hspt-tab-instNm"></td>
              <th>기관연락처</th>
              <td id="hspt-tab-instTelno"></td>
            </tr>
            <tr class="shittr dgnss-detail-info">
              <th>신청결과</th>
              <td colspan="3" id="hspt-tab-sckbdreqCode"></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="card-body pb-0" style="">
        <table class="table table-bordered">
          <tbody>
            <tr class="shittr">
              <th class="col-md-3">진료병원</th>
              <td class="col-md-4" id="hspt-tab-dgnssHsptNm"></td>
              <th class="col-md-2">진료결과</th>
              <td class="col-md-3" id="hspt-tab-dgnssResultCode"></td>
            </tr>
            <tr class="shittr">
              <th rowspan="4" style="vertical-align: middle;">진료메모</th>
              <td colspan="3" style="height: 111px; vertical-align: middle; text-align: left;" id="hspt-tab-dgnssNote"></td>
            </tr>
          </tbody>
        </table>
        <div class="form-group row" style="padding-top: 45px;">
          <div class="col-md-3">
            <button type="button" id="process-inptnt-btn" class="btn btn-block btn-primary btn-sm" style="background-color: #1a4f72; border-color: #1a4f72;" data-manage-no="" data-sckbdreq-no="" onclick='processInptntGo(this)'>입원</button>
          </div>
          <div class="col-md-3">
            <button type="button" id="sckbdreq-inptnt-button" name="sckbdreq-inptnt-button" class="btn btn-block btn-primary btn-sm" style="background-color: #1a4f72; border-color: #1a4f72;" data-manage-no="" data-sckbdreq-no="" data-psti-nm="" onclick='inptntGo(this, "C");'>이원신청</button>
          </div>
          <div class="col-md-3"></div>
          <div class="col-md-3">
            <button type="button" id="cancle-btn" name="cancle-btn" class="btn btn-block btn-danger btn-sm" data-child-no="" data-sckbdreq-no="" data-type="" onclick='cancleGo(this);'>취소</button>
          </div>
        </div>
      </div>
    </div>
  </div>

</div>