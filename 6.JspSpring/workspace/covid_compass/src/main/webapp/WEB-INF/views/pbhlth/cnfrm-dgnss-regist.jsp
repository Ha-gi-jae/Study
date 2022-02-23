<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template" id="cnfrm-dgnss-list-template">
{{#each .}}
          <tr style="cursor: pointer;"
			ondblclick="OpenWindow('cnfrm-detail-dgnss-regist','확진자 진료 신청', 1260, 715)"
			onclick="showDetail('{{cnfmNo}}', '{{manageNo}}')"
			data-inst-no="{{pbhtNo}}" data-manage-no="{{manageNo}}" data-cnfm-no="{{cnfmNo}}"
            class="each-smpl-result-element">
            <td>{{cnfmNo}}</td>
            <td style="text-align: left;white-space: nowrap;text-overflow: ellipsis;overflow: hidden;" title="{{pstiNm}}">{{pstiNm}}</td>
            <td>{{pstiTelno}}</td>
            <td>{{prettifyDate inYmd}}</td>
          </tr>
{{/each}}
</script>

<script type="text/x-handlebars-template" id="cnfrm-dgnss-req-list-template">
{{#each .}}
          <tr style="cursor: pointer;"
			data-inst-no="{{pbhtNo}}" data-manage-no="{{manageNo}}" data-dgnss-no="{{dgnssNo}}"
			onclick="showReqDetail('{{dgnssNo}}', '{{manageNo}}')"
            class="each-smpl-result-element">
            <td>{{cnfmNo}}</td>
            <td style="text-align: left;white-space: nowrap;text-overflow: ellipsis;overflow: hidden;" title="{{pstiNm}}">{{pstiNm}}</td>
            <td style="text-align: left;white-space: nowrap;text-overflow: ellipsis;overflow: hidden;" title="{{instNm}}">{{instNm}}</td>
            <td>{{prettifyDate reqYmd}}</td>
          </tr>
{{/each}}
</script>

<script type="text/x-handlebars-template" id="inptnt-pagination-template">
    <li class="page-item each-inptnt-pagination-element"><a class="page-link" href="1"> <i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
    </a></li>
    <li class="page-item each-inptnt-pagination-element"><a class="page-link" href="{{#if prev}}{{prevPageNum}}{{/if}}"> <i class="fas fa-angle-left" style="color:#1a4f72;"></i>
    </a></li>

{{#each pageNum}}
    <li class="page-item each-inptnt-pagination-element {{signActive this}}" ><a class="page-link" href="{{this}}" >{{this}}</a></li>
{{/each}}

    <li class="page-item each-inptnt-pagination-element"><a class="page-link" href="{{#if next}}{{nextPageNum}}{{/if}}"> <i class="fas fa-angle-right" style="color:#1a4f72;"></i>
    </a></li>
    <li class="page-item each-inptnt-pagination-element"><a class="page-link" href="{{realEndPage}}"> <i class="fas fa-angle-double-right" style="color:#1a4f72;"></i>
</a></li>
</script>


<script type="text/javascript">

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
"signActive" : function(pageNum){
  if(pageNum == page) return 'active';
}


});


</script>
<script>

var page = 1;

var url = '<%=request.getContextPath()%>/rest-pbht/cnfrm-list';

var targetId = '';

var pagenationId = '';

var templateId = '';

window.onload = function(){
	
	addEvnetWaitTab();
	addEvnetReqTab();
	
  list_go(url, page);
	$('ul.pagination').on('click','li a',function(event){
		if($(this).attr("href")) {
			page=$(this).attr("href");
 			getPage(url, make_form(page), targetId, pagenationId, templateId);
//			list_go(url, pageParam, targetId, pagenationId);
		}
		
		return false;
	});
}

function make_form(pageParam){
  
  var jobForm=$('#jobForm');
  if(!pageParam) page = 1;
  
  page = pageParam;
  
  jobForm.find("[name='page']").val(page);
  jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
//  jobForm.find("[name='perPageNum']").val(2);
  return jobForm;
}

function list_go(url, pageParam, targetId, pagenationId, templateId){
	
  getPage(url, make_form(pageParam), targetId, pagenationId, templateId);
}

function getPage(handelbarsProcessingURL, form, targetId, pagenationId, templateId){

	console.log(targetId, pagenationId);
	
	if(!targetId) targetId = '#cnfrm-dgnss-list-table-tbody';
	if(!pagenationId) pagenationId = '#inptnt-list-pagination-ul';
	if(!templateId) templateId = '#cnfrm-dgnss-list-template';
	
	$.ajax({
    url : handelbarsProcessingURL,
    type : 'get',
    dataType : 'json',
    data : form.serialize(),
    success : function(dataMap){
    	
    	$(targetId).html("");
    	
     	if(dataMap.cfdList.length == 0){
     		
     		$(targetId).html('<tr class="each-smpl-result-element"><td colspan="5" class="dgnssList">데이터 로딩중 입니다.</td></tr>');
     		
     		$('.dgnssList').html("데이터가 없습니다.");
 	      	$('#openButton').attr("disabled", true);
 	      	$('#cancleButton').attr("disabled", true);
 	      	$('.enableReadRrn').attr("disabled", true);
 	      	searchfalse();
     		dataMap.pageMaker.endPage = 1;
	      	printPagination(dataMap.pageMaker, $(pagenationId), $('#inptnt-pagination-template'), '.each-inptnt-pagination-element');
     	}else{
      		printData(dataMap.cfdList, $(targetId), $(templateId), '.each-smpl-result-element');
      		printPagination(dataMap.pageMaker, $(pagenationId), $('#inptnt-pagination-template'), '.each-inptnt-pagination-element');
      		$('#openButton').attr("disabled", false);
      		$('#cancleButton').attr("disabled", false);
      		$('.enableReadRrn').attr("disabled", false);
	      	if($('#jobForm').find("[name='typeCode']").val() == "A104"){
		      	showReqDetail(dataMap.cfdList[0].dgnssNo, dataMap.cfdList[0].manageNo)
	      	}else{
		      	showDetail(dataMap.cfdList[0].cnfmNo, dataMap.cfdList[0].manageNo)
	      	}
     	}
    },
    error : function(error){
      alert('error' + error.status);
    }
  })
 }
 
//jsonArray는 ResponseEntity에서 넣어준 List가 들어가는 자리
//target은 handlebars로 생성한 마크업을 append할 대상으로 jquery객체이며 리스트에서 쓸 경우 보통 tbody에 id를 줘서 target으로 잡는다.
//templateObject는 handlebars를 이용하여 만든 템플릿으로 jquery객체이다.
//removeClass는 append하기전에 기존에 있던 리스트<여기서는 handlebars로 붙인 요소 목록>를 지우기 위해서 '.(클래스이름)'을 넣는다.
//이를 위하여 templateObject에서 handlebars로 붙인 요소 목록를 지칭할 class를 주어야 한다. 여기서는 .each-inptnt-element이며,
//tr태그에 붙어있다.
function printData(jsonArray, target, templateObject, removeClass){

	// templateObject를 json data를 받으면 마크업을 return하는 function template로 반환한다.
	var template = Handlebars.compile(templateObject.html());
	
	// 함수 template에 파라미터 jsonArray를 넣어서 실행하여 html을 생성한다.
	var html = template(jsonArray);
	
	// 해당 html요소를 append하기 전에 기존에 있던 내용을 지운다. (안그러면 리스트 목록이 10개씩만 보이는 게 아니라 10개, 20개, 30개 등 페이지 클릭할 때마다 10개씩 추가되므로)
	$(removeClass).remove();
	
	// html요소를 append한다.
	target.append(html);
}

function printPagination(pageMaker, target, templateObject, removeClass){
	
	
	var pageNum = new Array(pageMaker.endPage-pageMaker.startPage+1);
	
	for(var i=0;i<pageMaker.endPage-pageMaker.startPage+1;i++){
		pageNum[i]=pageMaker.startPage+i;
	}	
	pageMaker.pageNum=pageNum;  
	pageMaker.prevPageNum=pageMaker.startPage-1;
	pageMaker.nextPageNum=pageMaker.endPage+1;
	
	var template=Handlebars.compile(templateObject.html());	
	var html = template(pageMaker);	
	target.html("").html(html);
}
</script>

<script>
function addEvnetWaitTab(){
	var dgnssWaitTab = $('#custom-cnfrm-dgnss-regist-tab');
	dgnssWaitTab.on('click',function(){
		$('#jobForm').find("[name='typeCode']").val("A102");
		$('#jobForm').find("[name='keyword']").val("");
		templateId = "#cnfrm-dgnss-list-template";
		targetId = "#cnfrm-dgnss-list-table-tbody";
		pagenationId = "#inptnt-list-pagination-ul";
		$("select#searchType option[value='inst']").remove();
		$("#searchType option:eq(0)").prop("selected", true);
		$('#keywordId').val("");
		page = 1;
		list_go(url, page, targetId, pagenationId, templateId);
	})
}
function addEvnetReqTab(){
	
	var dgnssReqTab = $('#custom-cnfrm-dgnss-regist-list-tab');
	dgnssReqTab.on('click',function(){
		$('#jobForm').find("[name='typeCode']").val("A104");
		$('#jobForm').find("[name='keyword']").val("");
		templateId = '#cnfrm-dgnss-req-list-template'
		targetId = "#cnfrm-dgnss-req-list-table-tbody";
		pagenationId = "#inptnt-req-list-pagination-ul";
		$("select#searchType option[value='inst']").remove();
		$("#searchType option:eq(0)").prop("selected", true);
		$('#keywordId').val("");
		$("select#searchType").append("<option value='inst' ${pageMaker.cri.searchType eq 'inst' ? 'selected':''}>진료기관</option>");
		page = 1;
		list_go(url, page, targetId, pagenationId, templateId);
	})
}

function showDetail(cnfmNo, manageNo){
	
	 var trs = $('tr.each-smpl-result-element');
	  
	 trs.removeClass('on');
	  
	 var target = $('tr[data-cnfm-no="'+cnfmNo+'"]');
	  
	 target.addClass('on');
	
	$.ajax({
	    url : '<%=request.getContextPath()%>/rest-pbht/cnfrm-wait-datail',
	    type : 'get',
	    dataType : 'json',
	    data : {'cnfmNo':cnfmNo, 'manageNo':manageNo},
	    success : function(dataMap){
	 		console.log(dataMap);
	 		$('#psti_nm').html(dataMap.pstiNm);
	 		$('#nlty').html(dataMap.nlty);
	      	$('#rechkd_yn').html(dataMap.rechkdYn);
	      	$('#vac_code').html(dataMap.vacCode);
	      	$('#gender').html(dataMap.gender);
	       	$('#age').html(dataMap.age);
	      	$('#fever_yn').html(dataMap.feverYn);
	      	$('#pregn_yn').html(dataMap.pregnYn);
	       	$('#in_ymd').html(prettifyDate(dataMap.inYmd));
	       	$('#pstv_yn').html(dataMap.pstvYn);
 	      	$('#cnfm_no').html(dataMap.cnfmNo); 
 	      	
 	      	$('#enableReadRrn').data('rrn', dataMap.rrn);
 	      	$('#enableReadRrn').data('manageNo', manageNo);
 	      	dataMap.rrn = (dataMap.rrn.substring(0,8) + '******');
 	      	
 	      	$('#rrn').html(dataMap.rrn); 
 	      	
 	      	
 	      	$('#psti_adres').html(dataMap.pstiAdres); 
 	      	$('#psti_telno').html(dataMap.pstiTelno); 
 	      	$('#symptms').html(dataMap.symptms); 
 	      	$('#sttus_code').html(dataMap.sttusCode); 
 	      	$('#openButton').attr('data-manage-no', dataMap.manageNo);
 	      	$('#openButton').attr('data-name', dataMap.pstiNm);
 	      	
 	      	
	    },
	    error : function(error){
	      alert('error' + error.status);
	    }
	  })
}

function showReqDetail(dgnssNo, manageNo){
	
	var trs = $('tr.each-smpl-result-element');
	  
	trs.removeClass('on');
	  
	var target = $('tr[data-dgnss-no="'+dgnssNo+'"]');
	  
	target.addClass('on');
	
	$.ajax({
	    url : '<%=request.getContextPath()%>/rest-pbht/cnfrm-req-datail',
	    type : 'get',
	    dataType : 'json',
	    data : {'dgnssNo':dgnssNo},
	    success : function(dataMap){
	 		console.log(dataMap);
	 		$('#r_psti_nm').html(dataMap.pstiNm);
	 		$('#r_nlty').html(dataMap.nlty);
	      	$('#r_rechkd_yn').html(dataMap.rechkdYn);
	      	$('#r_vac_code').html(dataMap.vacCode);
	      	$('#r_gender').html(dataMap.gender);
	       	$('#r_age').html(dataMap.age);
	      	$('#r_fever_yn').html(dataMap.feverYn);
	      	$('#r_pregn_yn').html(dataMap.pregnYn);
	       	$('#r_in_ymd').html(prettifyDate(dataMap.inYmd));
	       	$('#r_pstv_yn').html(dataMap.pstvYn);
 	      	$('#r_cnfm_no').html(dataMap.cnfmNo); 
 	      	
 	      	$('#enableReadRrn').data('rrn', dataMap.rrn);
 	      	$('#enableReadRrn').data('manageNo', manageNo);
 	      	dataMap.rrn = (dataMap.rrn.substring(0,8) + '******');
 	      	
 	      	$('#r_rrn').html(dataMap.rrn);
 	      	
 	      	$('#r_psti_adres').html(dataMap.pstiAdres); 
 	      	$('#r_psti_telno').html(dataMap.pstiTelno); 
 	      	$('#r_symptms').html(dataMap.symptms); 
 	      	$('#r_sttus_code').html(dataMap.sttusCode); 
 	      	
 	      	$('#r_inst_nm').html(dataMap.instNm); 
 	      	$('#r_dgnss_code').html(dataMap.dgnssCode); 
 	      	$('#r_inst_adres').html(dataMap.instAdres); 
 	      	$('#r_inst_telno').html(dataMap.instTelno); 
 	      	$('#r_req_ymd').html(prettifyDate(dataMap.reqYmd)); 
 	      	
 	      	$('#cancleButton').attr('data-dgnss-no', dataMap.dgnssNo);
 	      	$('#cancleButton').attr('data-manage-no', manageNo);
 	      	$('#cancleButton').attr('data-hspt-no', dataMap.hsptNo);
 	      	
 	      	if(!dataMap.result){
 	      		$('#cancleButton').attr("disabled", true);
 	      	}else{
 	      		$('#cancleButton').attr("disabled", false);
 	      	}
 	      	
	    },
	    error : function(error){
	      alert('error' + error.status);
	    }
	  })
	
}

	 
function prettifyDate(timeValue){
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
}

function list_go_check(){
	
	var jobForm = $('#jobForm');
	
	 jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	 jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	
	if($('#jobForm').find("[name='typeCode']").val() == "A104"){
		templateId = '#cnfrm-dgnss-req-list-template'
		targetId = "#cnfrm-dgnss-req-list-table-tbody";
		pagenationId = "#inptnt-req-list-pagination-ul";
		page = 1;
		list_go(url, page, targetId, pagenationId, templateId);
	}else{
		templateId = "#cnfrm-dgnss-list-template";
		targetId = "#cnfrm-dgnss-list-table-tbody";
		pagenationId = "#inptnt-list-pagination-ul";
		page = 1;
		list_go(url, page, targetId, pagenationId, templateId);
	}
}

function searchfalse(){
	$('#psti_nm').html("");
	$('#nlty').html("");
  	$('#rechkd_yn').html("");
  	$('#vac_code').html("");
  	$('#gender').html("");
   	$('#age').html("");
  	$('#fever_yn').html("");
  	$('#pregn_yn').html("");
   	$('#in_ymd').html("");
   	$('#pstv_yn').html("");
   	$('#cnfm_no').html(""); 
   	
   	$('#enableReadRrn').data('rrn', "");
   	$('#enableReadRrn').data('manageNo', "");
   	
   	$('#rrn').html(""); 
  	
  	$('#psti_adres').html(""); 
   	$('#psti_telno').html(""); 
   	$('#symptms').html(""); 
   	$('#sttus_code').html(""); 
   	$('#openButton').attr('data-manage-no', "");
   	$('#openButton').attr('data-name', "");
   	
   	$('#r_psti_nm').html("");
	$('#r_nlty').html("");
  	$('#r_rechkd_yn').html("");
  	$('#r_vac_code').html("");
  	$('#r_gender').html("");
   	$('#r_age').html("");
  	$('#r_fever_yn').html("");
  	$('#r_pregn_yn').html("");
   	$('#r_in_ymd').html("");
   	$('#r_pstv_yn').html("");
   	$('#r_cnfm_no').html(""); 
   	
   	$('#enableReadRrn').data('rrn', "");
   	$('#enableReadRrn').data('manageNo', "");
   	
   	$('#r_rrn').html("");
   	
   	$('#r_psti_adres').html(""); 
   	$('#r_psti_telno').html(""); 
   	$('#r_symptms').html(""); 
   	$('#r_sttus_code').html(""); 
   	
   	$('#r_inst_nm').html(""); 
   	$('#r_dgnss_code').html(""); 
   	$('#r_inst_adres').html(""); 
   	$('#r_inst_telno').html(""); 
   	$('#r_req_ymd').html(""); 
   	
   	$('#cancleButton').attr('data-dgnss-no', "");
   	$('#cancleButton').attr('data-manage-no', "");
   	$('#cancleButton').attr('data-hspt-no', "");
	
}


</script>


<!-- 진료 요청 대기환자 목록 -->
<div class="row" style="margin: 1px;">
	<div class="col-md-6 pl-0">
		<div class="card">
			<!-- search bar -->
			<div class="card-body">
				<div class="table-responsive">
					<div class="ddoing" style="height: 650px;">
						<table class="table table-hover text-nowrap" style="text-align: center;font-size: 15px;table-layout: fixed;">
							<thead>
								<tr role="row">
									<th style="width: 25%">확진자코드</th>
									<th style="width: 25%">성명</th>
									<th style="width: 25%">연락처</th>
									<th style="width: 25%">확정일자</th>
								</tr>
							</thead>
							<tbody id="cnfrm-dgnss-list-table-tbody">
								<tr class="each-smpl-result-element">
									<td colspan="5" class="dgnssList">데이터 로딩중 입니다.</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="card-footer clearfix pb-0 pt-0" style="background-color: white;">
						<ul class="pagination justify-content-center m-0" id="inptnt-list-pagination-ul">
						</ul>
					</div>
					<form id="jobForm">
						<input type='hidden' name="page" value="" /> 
						<input type='hidden' name="perPageNum" value="" /> 
						<input type='hidden' name="searchType" value="" /> 
						<input type='hidden' name="keyword" value="" /> 
						<input type='hidden' name="typeCode" value="" />
					</form>
				</div>
				<!-- /.table-responsive -->
			</div>
		</div>
	</div>
	<div class="col-md-6 pr-0">
		<!-- /.card-body -->
		<div class="card">
			<div class="card-body">
				<table class="table table-bordered" style="border-left-color: white; border-right-color: white;">
					<thead>
						<tr>
							<th colspan="4" style="font-size: 17px;">
								<div class="row m-0" style="justify-content: space-between;">
									<label style="font-size: 17px; margin: 0px;">확진자 진료신청 정보</label>
									<button type="button" class="btn btn-sm btn-primary enableReadRrn" onclick="enableReadRrn(this);" data-enable="N" data-rrn="" data-manageNo="">개인정보 열람</button>
								</div>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr class="ddoing" style="height: 12px;"></tr>
						<tr>
							<th class="col-md-3">성명</th>
							<td class="col-md-4" id="psti_nm"></td>
							<th class="col-md-2">국적</th>
							<td class="col-md-5" id="nlty"></td>
						</tr>
						<tr class="shittr">
							<th>검사경위</th>
							<td id="rechkd_yn"></td>
							<th>백신접종</th>
							<td id="vac_code"></td>
						</tr>
						<tr class="shittr">
							<th>성별</th>
							<td id="gender"></td>
							<th>나이</th>
							<td id="age"></td>
						</tr>
						<tr class="shittr">
							<th>발열여부</th>
							<td id="fever_yn"></td>
							<th>임신여부</th>
							<td id="pregn_yn"></td>
						</tr>
						<tr class="shittr">
							<th>확정일자</th>
							<td id="in_ymd"></td>
							<th>결과</th>
							<td id="pstv_yn"></td>
						</tr>
						<tr class="shittr">
							<th class="col-md-3">확진자 코드</th>
							<td id="cnfm_no"></td>
							<th>상태</th>
							<td id="sttus_code"></td>
						</tr>
						<tr class="shittr">
							<th>주민/외국인등록번호</th>
							<td colspan="3" id="rrn"></td>
						</tr>
						<tr class="shittr">
							<th>주소</th>
							<td colspan="3" id="psti_adres"></td>
						</tr>
						<tr class="shittr">
							<th>연락처</th>
							<td colspan="3" id="psti_telno"></td>
						</tr>
						<tr class="shittr">
							<th>증상</th>
							<td colspan="3" id="symptms"></td>
						</tr>
						<tr class="shittr">
							<th>진료기관</th>
							<td colspan=></td>
							<th>요청 상태</th>
							<td colspan=></td>
						</tr>
						<tr class="shittr">
							<th>진료기관 주소</th>
							<td colspan="3"></td>
						</tr>
						<tr class="shittr">
							<th>연락처</th>
							<td></td>
							<th>요청 시간</th>
							<td></td>
						</tr>
					</tbody>
				</table>
				<div style="text-align: center; margin-bottom: 24px; margin-top: 10px;">
					<button id="openButton" data-manage-no="" data-name="" onclick="proc(this);" class="btn btn-success btn-sm" style="width: 50%; height: 35px; background: #1a4f72; border: #1a4f72;">진료신청</button>
				</div>
				<div style="margin-bottom: 56px;"></div>
			</div>

		</div>

	</div>
</div>

<script>
function proc(ele){
	var manageNo = $('#openButton').attr('data-manage-no');
	var name = $('#openButton').attr('data-name');
  	window.open("cnfrm-detail-dgnss-regist?manageNo="+manageNo+"&pstiNm="+name+"", "진료 신청 정보", "width=1260, height=715" );  


}
</script>


