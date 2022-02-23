<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="cnfrm-manage-list-template" >
{{#each .}}
          <tr style="cursor: pointer;"
			data-inst-no="{{pbhtNo}}" data-manage-no="{{manageNo}}"
			onclick="showDetail('{{manageNo}}')"
            class="each-smpl-result-element">
            <td style="text-align: left;white-space: nowrap;text-overflow: ellipsis;overflow: hidden;" title="{{pstiNm}}">{{pstiNm}}</td>
            <td>{{pstiTelno}}</td>
            <td>{{prettifyDate inYmd}}</td>
            <td style="text-align: left;white-space: nowrap;text-overflow: ellipsis;overflow: hidden;" title="{{sttusCode}}">{{sttusCode}}</td>
            <td style="text-align: left;white-space: nowrap;text-overflow: ellipsis;overflow: hidden;" title="{{instNm}}">{{instNm}}</td>
          </tr>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="cnfrm-slf-req-list-template" >
{{#each .}}
         <tr style="cursor: pointer;"
			data-inst-no="{{pbhtNo}}" data-manage-no="{{manageNo}}"
			onclick="showSlfDetail('{{manageNo}}')"
            class="each-smpl-result-element">
            <td id="{{pstiNo}}Nm" style="text-align: left;white-space: nowrap;text-overflow: ellipsis;overflow: hidden;" title="{{pstiNm}}">{{pstiNm}}</td>
            <td id="{{pstiNo}}Tel">{{pstiTelno}}</td>
            <td>{{prettifyDate inYmd}}</td>
            <td>{{prettifyDate slfInYmd}}</td>
            <td>{{ngtvCnt}}</td>
          </tr>
{{/each}}
</script>
<script type="text/x-handlebars-template"  id="inptnt-pagination-template" >
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
"signActive" : function(pageNum){
  if(pageNum == page) return 'active';
}


});


</script>
<script>

var page = 1;

var url = '<%=request.getContextPath() %>/rest-pbht/cnfrm-manage-list';

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
	
	if(!targetId) targetId = '#cnfrm-manage-list-table-tbody';
	if(!pagenationId) pagenationId = '#inptnt-list-pagination-ul';
	if(!templateId) templateId = '#cnfrm-manage-list-template';
	
	$.ajax({
    url : handelbarsProcessingURL,
    type : 'get',
    dataType : 'json',
    data : form.serialize(),
    success : function(dataMap){
    	
    	$(targetId).html("");
    	
     	if(dataMap.cfmList.length == 0){
     		
     		$(targetId).html('<tr class="each-smpl-element" ><td colspan="5" class="cnfmCheckList">데이터 로딩중 입니다.</td></tr>');
    		$('.cnfmCheckList').html('데이터가 없습니다.');
    		$('#modifybutton').attr("disabled", true);
    		$('.enableReadRrn').attr("disabled", true);
    		searchFalse();
    		dataMap.pageMaker.endPage = 1;
      		printPagination(dataMap.pageMaker, $(pagenationId), $('#inptnt-pagination-template'), '.each-inptnt-pagination-element');
    	}else{
      		printData(dataMap.cfmList, $(targetId), $(templateId), '.each-smpl-result-element');
      		printPagination(dataMap.pageMaker, $(pagenationId), $('#inptnt-pagination-template'), '.each-inptnt-pagination-element');
      		$('#modifybutton').attr("disabled", false);
      		$('.enableReadRrn').attr("disabled", false);
      		if($('#jobForm').find("[name='typeCode']").val()== "A107") {
				showSlfDetail(dataMap.cfmList[0].manageNo);
			}else{
				showDetail(dataMap.cfmList[0].manageNo);
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
		$('#jobForm').find("[name='typeCode']").val("");
		templateId = "#cnfrm-manage-list-template";
		targetId = "#cnfrm-manage-list-table-tbody";
		pagenationId = "#inptnt-list-pagination-ul";
		$("#searchType option:eq(0)").prop("selected", true);
		$("select#searchType").append("<option value='inst' ${pageMaker.cri.searchType eq 'inst' ? 'selected':''}>진료기관</option>");
		$('#keywordId').val("");
		$('#jobForm').find("[name='keyword']").val("");
		page = 1;
		list_go(url, page, targetId, pagenationId, templateId);
	})
}
function addEvnetReqTab(){
	
	var dgnssReqTab = $('#custom-cnfrm-dgnss-regist-list-tab');
	dgnssReqTab.on('click',function(){
		$('#jobForm').find("[name='typeCode']").val("A107");
		templateId = '#cnfrm-slf-req-list-template';
		targetId = "#cnfrm-slf-req-list-table-tbody";
		pagenationId = "#inptnt-req-list-pagination-ul";
		$("#searchType option:eq(0)").prop("selected", true);
		$("select#searchType option[value='inst']").remove();
		$('#keywordId').val("");
		$('#jobForm').find("[name='keyword']").val("");
		page = 1;
		list_go(url, page, targetId, pagenationId, templateId);
	})
}

function showDetail(manageNo){
	
	var trs = $('tr.each-smpl-result-element');
	 
	trs.removeClass('on');
	 
	var target = $('tr[data-manage-no="'+manageNo+'"]');
	 
	target.addClass('on');
	
	$.ajax({
	    url : '<%=request.getContextPath() %>/rest-pbht/cnfrm-list-datail',
	    type : 'get',
	    dataType : 'json',
	    data : {'manageNo':manageNo},
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
 	      	$('#inst_nm').html(dataMap.instNm); 
 	      	$('#dgnss_code').html(dataMap.dgnssCode); 
 	      	$('#inst_adres').html(dataMap.instAdres); 
 	      	$('#inst_telno').html(dataMap.instTelno); 
 	      	$('#update_ymd').html(prettifyDate(dataMap.updateYmd)); 
 	      	
	    },
	    error : function(error){
	      alert('error' + error.status);
	    }
	  })
}

function showSlfDetail(manageNo){
	var trs = $('tr.each-smpl-result-element');
	 
	trs.removeClass('on');
	 
	var target = $('tr[data-manage-no="'+manageNo+'"]');
	 
	target.addClass('on');
	
	$.ajax({
	    url : '<%=request.getContextPath() %>/rest-pbht/cnfrm-slf-list-datail',
	    type : 'get',
	    dataType : 'json',
	    data : {'manageNo':manageNo},
	    success : function(dataMap){
	 		console.log(dataMap);
	 		$('#slf_pstiNm').val(dataMap.pstiNm);
	 		$('#slf_nlty').val(dataMap.nlty);
	      	$('#slf_age').val(dataMap.age);
	      	$('#slf_gender').val(dataMap.gender);
	      	
	      	$('#enableReadRrn').data('rrn', dataMap.rrn);
	      	$('#enableReadRrn').data('manageNo', manageNo);
 	      	dataMap.rrn = (dataMap.rrn.substring(0,8) + '******');
 	      	
	     	$('#slf_rrn').val(dataMap.rrn);
	     
	       	$('#slf_pstiTelno').val(dataMap.pstiTelno);
	      	$('#slf_feverYn').val(dataMap.feverYn);
	      	$('#slf_pregnYn').val(dataMap.pregnYn);
	       	$('#slf_pstiAdres').val(dataMap.pstiAdres);
	       	$('#slf_reqYmd').val(prettifyDate(dataMap.reqYmd));
 	      	$('#slf_rechkdYn').val(dataMap.rechkdYn); 
 	      	$('#slf_vacCode').val(dataMap.vacCode); 
 	      	$('#slf_pstvYn').val(dataMap.pstvYn); 
 	      	$('#slf_ngtv_cnt').val(dataMap.ngtvCnt); 
 	      	$('#slf_symptms').val(dataMap.symptms); 
 	      	$('#slf_inst_nm').html(dataMap.instNm); 
 	      	$('#slf_dgnss_result_code').html(dataMap.dgnssResultCode); 
 	      	$('#slf_dgnss_note').html(dataMap.dgnssNote); 
 	      	
 	      	$('#modifyRegist').find("[name='pstiNo']").val(dataMap.pstiNo);
 	      	
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
	
	if($('#jobForm').find("[name='typeCode']").val()== "A107") {
		templateId = '#cnfrm-slf-req-list-template';
		targetId = "#cnfrm-slf-req-list-table-tbody";
		pagenationId = "#inptnt-req-list-pagination-ul";
		page = 1;
		list_go(url, page, targetId, pagenationId, templateId);
	}else{
		templateId = "#cnfrm-manage-list-template";
		targetId = "#cnfrm-manage-list-table-tbody";
		pagenationId = "#inptnt-list-pagination-ul";
		page = 1;
		list_go(url, page, targetId, pagenationId, templateId);
	}
}

function searchFalse(){
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
   	$('#enableReadRrn').data('manageNo',"");
   	
   	$('#rrn').html(""); 
   	
   	$('#psti_adres').html(""); 
   	$('#psti_telno').html(""); 
   	$('#symptms').html(""); 
   	$('#sttus_code').html(""); 
   	$('#inst_nm').html(""); 
   	$('#dgnss_code').html(""); 
   	$('#inst_adres').html(""); 
   	$('#inst_telno').html(""); 
   	$('#update_ymd').html(""); 
   	
   	$('#slf_pstiNm').val("");
		$('#slf_nlty').val("");
  	$('#slf_age').val("");
  	$('#slf_gender').val("");
  	
 	$('#slf_rrn').val("");
 
   	$('#slf_pstiTelno').val("");
  	$('#slf_feverYn').val("");
  	$('#slf_pregnYn').val("");
   	$('#slf_pstiAdres').val("");
   	$('#slf_reqYmd').val("");
   	$('#slf_rechkdYn').val(""); 
   	$('#slf_vacCode').val(""); 
   	$('#slf_pstvYn').val(""); 
   	$('#slf_ngtv_cnt').val(""); 
   	$('#slf_symptms').val(""); 
   	$('#slf_inst_nm').html(""); 
   	$('#slf_dgnss_result_code').html(""); 
   	$('#slf_dgnss_note').html(""); 
   	
   	$('#modifyRegist').find("[name='pstiNo']").val("");
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
			<table class="table table-hover text-nowrap"
				style="text-align: center;font-size: 15px;table-layout: fixed;">
				<thead>
					<tr role="row">
						<th style="width: 15%">이름</th>
						<th style="width: 15%">연락처</th>
						<th style="width: 14%">확정일자</th>
						<th style="width: 28%">상태</th>
						<th style="width: 28%">담당기관</th>
					</tr>
				</thead>
				<tbody id="cnfrm-manage-list-table-tbody">
						<tr class="each-smpl-result-element">
							<td colspan="5" class="cnfmCheckList">데이터 로딩중 입니다.</td>
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
			  <input type='hidden' name="perPageNum" value=""/>
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
				<table class="table table-bordered" style="border-left-color: white; border-right-color: white;" >
                  <thead>
                  	<tr>
                  		<th colspan="4" style="font-size: 17px;">
                  			<div class="row m-0" style="justify-content: space-between;">
								<label style="font-size: 17px; margin: 0px;">확진자 정보</label>
								<button type="button" class="btn btn-sm btn-primary enableReadRrn" onclick="enableReadRrn(this);" data-enable="N" data-rrn="" data-manageNo="">개인정보 열람</button>
							</div>
                  		</th>
                  	</tr>
                  </thead>
                  <tbody>
                  <tr class="ddoing" style="height: 12px;"></tr>
                    <tr >
                      <th class="col-md-2">성명</th>
                      <td class="col-md-4" id="psti_nm"></td>
                      <th class="col-md-2">국적</th>
                      <td class="col-md-4" id="nlty"></td>
                    </tr>
                    <tr class="shittr" >
                      <th>검사경위</th>
                      <td id="rechkd_yn"></td>
                      <th>백신접종</th>
                      <td id="vac_code"></td>
                    </tr>
                    <tr class="shittr" >
                      <th>성별</th>
                      <td id="gender"></td>
                      <th>나이</th>
                      <td id="age"></td>
                    </tr>
                    <tr class="shittr" >
                      <th>발열여부</th>
                      <td id="fever_yn"></td>
                      <th>임신여부</th>
                      <td id="pregn_yn"></td>
                    </tr>
                    <tr class="shittr" >
                      <th>확정일자</th>
                      <td id="in_ymd"></td>
                      <th>결과</th>
                      <td id="pstv_yn"></td>
                    </tr>
                    <tr class="shittr" >
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
                  </tbody>
                </table>  
                  <br>  
                    
                <table class="table table-bordered">
         			<tbody>
                    <tr class="shittr">
                      <th class="col-md-3">담당기관</th>
                      <td id="inst_nm" class="col-md-4"colspan="1"></td>
                      <th class="col-md-2">상태</th>
                      <td id="dgnss_code"class="col-md-3"colspan=>	</td>
                    </tr>
                    <tr class="shittr">
                      <th class="col-md-3">담당 기관주소</th>
                      <td id="inst_adres"class="col-md-9" colspan="3"></td>
                    </tr>
                    <tr class="shittr">
                      <th class="col-md-3">연락처</th>
                      <td id="inst_telno" class="col-md-4"></td>
                      <th class="col-md-2">갱신일</th>
                      <td id="update_ymd" class="col-md-3"></td>
                    </tr>
         			</tbody>
                </table>    
                		<div style="margin-bottom: 81px;"></div>
                 </div>
                 </div>
			</div>
</div>