<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 확진자 조회 테이블 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template" id="smpl-Result-list-template">
{{#each .}}
          <tr style="cursor: pointer;"
			data-inst-no="{{pbhtNo}}" data-manage-no="{{manageNo}}" data-smpl-no="{{smplNo}}"
            onclick="showDetail('{{manageNo}}', '{{smplNo}}')"
            class="each-smpl-result-element">
            <td>{{smplNo}}</td>
            <td style="text-align: left;white-space: nowrap;text-overflow: ellipsis;overflow: hidden;" title="{{pstiNm}}">{{pstiNm}}</td>
            <td style="text-align: left;white-space: nowrap;text-overflow: ellipsis;overflow: hidden;" title="{{instNm}}">{{instNm}}</td>
            <td>{{prettifyDate reqYmd}}</td>
            <td>{{prettifyDate resYmd}}</td>
            <td><span class="badge badge-{{fnBadge smplResCode}}">{{smplResCode}}</span></td>
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
},
"fnBadge" : function(smplResCode){
	if(smplResCode == "양성"){
		return "danger";
	}
	if(smplResCode == "음성"){
		return "success";
	}
}


});


</script>
<script>

var page = 1;

var url = '<%=request.getContextPath()%>/rest-pbht/res-smple-list';

var targetId = '';

var pagenationId = '';

	window.onload = function() {

		addEvnetAllTab();
		addEvnetYTab();
		addEvnetNTab();
		list_go_check();
		
		list_go(url, page);
		$('ul.pagination').on('click', 'li a', function(event) {
			if ($(this).attr("href")) {
				page = $(this).attr("href");
				getPage(url, make_form(page), targetId, pagenationId);
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
		//  jobForm.find("[name='perPageNum']").val(2);
		

		return jobForm;
	}
	
	function search_go(){
		
	}

	function list_go(url, pageParam, targetId, pagenationId) {

		getPage(url, make_form(pageParam), targetId, pagenationId);
	}

	function getPage(handelbarsProcessingURL, form, targetId, pagenationId) {
		//alert(targetId);
		if (!targetId) targetId = '#smpl-Result-list-table-tbody';
		if (!pagenationId) pagenationId = '#inptnt-list-pagination-ul';
		
		$.ajax({
			url : handelbarsProcessingURL,
			type : 'get',
			dataType : 'json',
			data : form.serialize(),
			success : function(dataMap) {
				
				$(targetId).html("");
		    	
		     	if(dataMap.smplResultList.length == 0){
		     		
		     		$(targetId).html('<tr class="each-smpl-element" ><td colspan="5" class="noSmplResultList">데이터 로딩중 입니다.</td></tr>');
					
					$('.noSmplResultList').html('데이터가 없습니다.');
					$('.enableReadRrn').attr("disabled", true);
					searchfalse();
					dataMap.pageMaker.endPage = 1;
					printPagination(dataMap.pageMaker, $(pagenationId),$('#inptnt-pagination-template'),'.each-inptnt-pagination-element');
				}else{
					$('.enableReadRrn').attr("disabled", false);
					printData(dataMap.smplResultList, $(targetId),$('#smpl-Result-list-template'),'.each-smpl-result-element');
					printPagination(dataMap.pageMaker, $(pagenationId),$('#inptnt-pagination-template'),'.each-inptnt-pagination-element');
					showDetail(dataMap.smplResultList[0].manageNo, dataMap.smplResultList[0].smplNo)
				}
			},
			error : function(error) {
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
	function printData(jsonArray, target, templateObject, removeClass) {

		// templateObject를 json data를 받으면 마크업을 return하는 function template로 반환한다.
		var template = Handlebars.compile(templateObject.html());

		// 함수 template에 파라미터 jsonArray를 넣어서 실행하여 html을 생성한다.
		var html = template(jsonArray);

		// 해당 html요소를 append하기 전에 기존에 있던 내용을 지운다. (안그러면 리스트 목록이 10개씩만 보이는 게 아니라 10개, 20개, 30개 등 페이지 클릭할 때마다 10개씩 추가되므로)
		$(removeClass).remove();

		// html요소를 append한다.
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
	function addEvnetAllTab() {
		var allTab = $('#custom-res-smple-pstv-all-list-tab');
		allTab.on('click', function() {
			$('#jobForm').find("[name='typeCode']").val("");
			targetId = "#smpl-Result-list-table-tbody";
			pagenationId = "#inptnt-list-pagination-ul";
			$("#searchType option:eq(0)").prop("selected", true);
			$('#jobForm').find("[name='searchType']").val("");
			$('#keywordId').val("");
			page = 1;
			list_go(url, page, targetId, pagenationId);
		})
	}
	function addEvnetYTab() {

		var yTab = $('#custom-res-smple-pstv-y-list-tab');
		yTab.on('click', function() {
			$('#jobForm').find("[name='typeCode']").val("K102");
			targetId = "#smpl-Result-list-y-table-tbody";
			pagenationId = "#inptnt-y-list-pagination-ul";
			$("#searchType option:eq(0)").prop("selected", true);
			$('#jobForm').find("[name='searchType']").val("");
			$('#keywordId').val("");
			page = 1;
			list_go(url, page, targetId, pagenationId);
		})
	}
	function addEvnetNTab() {
		
		var nTab = $('#custom-res-smple-pstv-n-list-tab');

		nTab.on('click', function() {
			$('#jobForm').find("[name='typeCode']").val("K103");
			targetId = "#smpl-Result-list-n-table-tbody";
			pagenationId = "#inptnt-n-list-pagination-ul";
			$("#searchType option:eq(0)").prop("selected", true);
			$('#jobForm').find("[name='searchType']").val("");
			$('#keywordId').val("");
			page = 1;
			list_go(url, page, targetId, pagenationId);
		})
	}

	function showDetail(manageNo, smplNo){
		
		var trs = $('tr.each-smpl-result-element');
		 
		trs.removeClass('on');
		 
		var target = $('tr[data-smpl-no="'+smplNo+'"]');
		 
		target.addClass('on');
		

		var typeCode = $('#jobForm').find("[name='typeCode']").val();
		
		if(typeCode==""){
		$.ajax({
		    url : '<%=request.getContextPath() %>/rest-pbht/res-smple-detail',
		    type : 'get',
		    dataType : 'json',
		    data : {'manageNo':manageNo, 'typeCode':typeCode, 'smplNo':smplNo },
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
	 	      	$('#sttus_code ').html(dataMap.sttusCode);
	 	      	
	 	      	$('#enableReadRrn').data('rrn', dataMap.rrn);
	 	      	$('#enableReadRrn').data('manageNo', manageNo);
	 	      	dataMap.rrn = (dataMap.rrn.substring(0,8) + '******');
	 	      	
	 	      	$('#rrn').html(dataMap.rrn);
	 	      	
	 	      	$('#psti_telno ').html(dataMap.pstiTelno); 
	 	      	$('#psti_adres').html(dataMap.pstiAdres); 
	 	      	$('#symptms').html(dataMap.symptms); 
	 	      	$('#min_brssr').html(dataMap.minBrssr); 
	 	      	$('#max_brssr').html(dataMap.maxBrssr); 
	 	      	$('#bdheight').html(dataMap.bdheight); 
	 	      	$('#bdweight').html(dataMap.bdweight); 
	 	      	$('#bdheat').html(dataMap.bdheat); 
	 	      	$('#inst_nm').html(dataMap.instNm); 
	 	      	$('#inst_telno').html(dataMap.instTelno ); 
	 	      	$('#inst_adres').html(dataMap.instAdres ); 
		    },
		    error : function(error){
		      alert('error' + error.status);
		    }
		  })
		}
		if(typeCode=="K102"){
		$.ajax({
		    url : '<%=request.getContextPath() %>/rest-pbht/res-smple-detail',
		    type : 'get',
		    dataType : 'json',
		    data : {'manageNo':manageNo, 'typeCode':typeCode, 'smplNo':smplNo},
		    success : function(dataMap){
		 		console.log(dataMap);
		 		$('#y_psti_nm').html(dataMap.pstiNm);
		 		$('#y_nlty').html(dataMap.nlty);
		      	$('#y_rechkd_yn').html(dataMap.rechkdYn);
		      	$('#y_vac_code').html(dataMap.vacCode);
		      	$('#y_gender').html(dataMap.gender);
		       	$('#y_age').html(dataMap.age);
		      	$('#y_fever_yn').html(dataMap.feverYn);
		      	$('#y_pregn_yn').html(dataMap.pregnYn);
		       	$('#y_in_ymd').html(prettifyDate(dataMap.inYmd));
		       	$('#y_pstv_yn').html(dataMap.pstvYn);
	 	      	$('#y_cnfm_no').html(dataMap.cnfmNo); 
	 	      	$('#y_sttus_code ').html(dataMap.sttusCode); 
	 	      	
	 	      	$('#enableReadRrn').data('rrn', dataMap.rrn);
	 	      	$('#enableReadRrn').data('manageNo', manageNo);
	 	      	dataMap.rrn = (dataMap.rrn.substring(0,8) + '******');
	 	      	
	 	      	$('#y_rrn').html(dataMap.rrn);
	 	      	
	 	      	$('#y_psti_telno ').html(dataMap.pstiTelno); 
	 	      	$('#y_psti_adres').html(dataMap.pstiAdres); 
	 	      	$('#y_symptms').html(dataMap.symptms); 
	 	      	$('#y_min_brssr').html(dataMap.minBrssr); 
	 	      	$('#y_max_brssr').html(dataMap.maxBrssr); 
	 	      	$('#y_bdheight').html(dataMap.bdheight); 
	 	      	$('#y_bdweight').html(dataMap.bdweight); 
	 	      	$('#y_bdheat').html(dataMap.bdheat); 
	 	      	$('#y_inst_nm').html(dataMap.instNm); 
	 	      	$('#y_inst_telno').html(dataMap.instTelno ); 
	 	      	$('#y_inst_adres').html(dataMap.instAdres ); 
		    },
		    error : function(error){
		      alert('error' + error.status);
		    }
		  })
		}
		if(typeCode=="K103"){
		$.ajax({
		    url : '<%=request.getContextPath() %>/rest-pbht/res-smple-detail',
		    type : 'get',
		    dataType : 'json',
		    data : {'manageNo':manageNo, 'typeCode':typeCode, 'smplNo':smplNo},
		    success : function(dataMap){
		 		console.log(dataMap);
		 		$('#n_psti_nm').html(dataMap.pstiNm);
		 		$('#n_nlty').html(dataMap.nlty);
		      	$('#n_rechkd_yn').html(dataMap.rechkdYn);
		      	$('#n_vac_code').html(dataMap.vacCode);
		      	$('#n_gender').html(dataMap.gender);
		       	$('#n_age').html(dataMap.age);
		      	$('#n_fever_yn').html(dataMap.feverYn);
		      	$('#n_pregn_yn').html(dataMap.pregnYn);
		       	$('#n_in_ymd').html(prettifyDate(dataMap.resYmd));
		       	$('#n_pstv_yn').html(dataMap.pstvYn);
	 	      	$('#n_cnfm_no').html(dataMap.cnfmNo); 
	 	      	$('#n_sttus_code ').html(dataMap.sttusCode); 
	 	      	
	 	      	$('#enableReadRrn').data('rrn', dataMap.rrn);
	 	      	$('#enableReadRrn').data('manageNo', manageNo);
	 	      	dataMap.rrn = (dataMap.rrn.substring(0,8) + '******');
	 	      	
	 	      	$('#n_rrn').html(dataMap.rrn);
	 	      	
	 	      	$('#n_psti_telno ').html(dataMap.pstiTelno); 
	 	      	$('#n_psti_adres').html(dataMap.pstiAdres); 
	 	      	$('#n_symptms').html(dataMap.symptms); 
	 	      	$('#n_min_brssr').html(dataMap.minBrssr); 
	 	      	$('#n_max_brssr').html(dataMap.maxBrssr); 
	 	      	$('#n_bdheight').html(dataMap.bdheight); 
	 	      	$('#n_bdweight').html(dataMap.bdweight); 
	 	      	$('#n_bdheat').html(dataMap.bdheat); 
	 	      	$('#n_inst_nm').html(dataMap.instNm); 
	 	      	$('#n_inst_telno').html(dataMap.instTelno ); 
	 	      	$('#n_inst_adres').html(dataMap.instAdres ); 
		    },
		    error : function(error){
		      alert('error' + error.status);
		    }
		  })
		}
		
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
		var typeCode = $('#jobForm').find("[name='typeCode']").val();
			jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
			jobForm.find("[name='keyword']").val($('#keywordId').val());
		
		if(typeCode == "K102"){
			$('#jobForm').find("[name='typeCode']").val("K102");
			targetId = "#smpl-Result-list-y-table-tbody";
			pagenationId = "#inptnt-y-list-pagination-ul";
			page = 1;
			list_go(url, page, targetId, pagenationId);
		}else if(typeCode == "K103"){
			$('#jobForm').find("[name='typeCode']").val("K103");
			targetId = "#smpl-Result-list-n-table-tbody";
			pagenationId = "#inptnt-n-list-pagination-ul";
			page = 1;
			list_go(url, page, targetId, pagenationId);	
		}else{
			$('#jobForm').find("[name='typeCode']").val("");
			targetId = "#smpl-Result-list-table-tbody";
			pagenationId = "#inptnt-list-pagination-ul";
			page = 1;
			list_go(url, page, targetId, pagenationId);
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
      	$('#sttus_code ').html("");
      	
      	$('#enableReadRrn').data('rrn', "");
      	$('#enableReadRrn').data('manageNo', "");
      	
      	$('#rrn').html("");
      	
      	$('#psti_telno ').html(""); 
      	$('#psti_adres').html(""); 
      	$('#symptms').html(""); 
      	$('#min_brssr').html(""); 
      	$('#max_brssr').html(""); 
      	$('#bdheight').html(""); 
      	$('#bdweight').html(""); 
      	$('#bdheat').html(""); 
      	$('#inst_nm').html(""); 
      	$('#inst_telno').html(""); 
      	$('#inst_adres').html(""); 
		
      	$('#y_psti_nm').html("");
 		$('#y_nlty').html("");
      	$('#y_rechkd_yn').html("");
      	$('#y_vac_code').html("");
      	$('#y_gender').html("");
       	$('#y_age').html("");
      	$('#y_fever_yn').html("");
      	$('#y_pregn_yn').html("");
       	$('#y_in_ymd').html("");
       	$('#y_pstv_yn').html("");
      	$('#y_cnfm_no').html(""); 
      	$('#y_sttus_code ').html("");
      	
      	$('#enableReadRrn').data('rrn', "");
      	$('#enableReadRrn').data('manageNo', "");
      	
      	$('#y_rrn').html("");
      	
      	$('#y_psti_telno ').html(""); 
      	$('#y_psti_adres').html(""); 
      	$('#y_symptms').html(""); 
      	$('#y_min_brssr').html(""); 
      	$('#y_max_brssr').html(""); 
      	$('#y_bdheight').html(""); 
      	$('#y_bdweight').html(""); 
      	$('#y_bdheat').html(""); 
      	$('#y_inst_nm').html(""); 
      	$('#y_inst_telno').html(""); 
      	$('#y_inst_adres').html(""); 
      	
      	$('#n_psti_nm').html("");
 		$('#n_nlty').html("");
      	$('#n_rechkd_yn').html("");
      	$('#n_vac_code').html("");
      	$('#n_gender').html("");
       	$('#n_age').html("");
      	$('#n_fever_yn').html("");
      	$('#n_pregn_yn').html("");
       	$('#n_in_ymd').html("");
       	$('#n_pstv_yn').html("");
      	$('#n_cnfm_no').html(""); 
      	$('#n_sttus_code ').html("");
      	
      	$('#enableReadRrn').data('rrn', "");
      	$('#enableReadRrn').data('manageNo', "");
      	
      	$('#n_rrn').html("");
      	
      	$('#n_psti_telno ').html(""); 
      	$('#n_psti_adres').html(""); 
      	$('#n_symptms').html(""); 
      	$('#n_min_brssr').html(""); 
      	$('#n_max_brssr').html(""); 
      	$('#n_bdheight').html(""); 
      	$('#n_bdweight').html(""); 
      	$('#n_bdheat').html(""); 
      	$('#n_inst_nm').html(""); 
      	$('#n_inst_telno').html(""); 
      	$('#n_inst_adres').html(""); 
	}

</script>
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
									<th style="width: 15%">시료고유번호</th>
									<th style="width: 15%">성명</th>
									<th style="width: 20%">요청기관</th>
									<th style="width: 10%">요청일자</th>
									<th style="width: 10%">확정일자</th>
									<th style="width: 10%">검사결과</th>
								</tr>
							</thead>
							<tbody id="smpl-Result-list-table-tbody">
								<tr class="each-smpl-result-element">
									<td colspan="5" class="noSmplResultList">데이터 로딩중 입니다.</td>
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
			</div>
		</div>
	</div>
	<!-- /.table-responsive -->
	<!-- /.card-body -->
	<div class="col-md-6 pr-0">
		<!-- /.card-body -->
		<div class="card">
			<div class="card-body pb-0">
				<table class="table table-bordered" style="border-left-color: white; border-right-color: white;">
					<thead>
						<tr>
							<th colspan="4" style="font-size: 17px;">

								<div class="row m-0" style="justify-content: space-between;">
									<label style="font-size: 17px; margin: 0px;">확진자 정보</label>
									<button type="button" class="btn btn-sm btn-primary enableReadRrn"  onclick="enableReadRrn(this);" data-enable="N" data-rrn="" data-manageNo="">개인정보 열람</button>
								</div>

							</th>
						</tr>
					</thead>
					<tbody>
						<tr class="ddoing" style="height: 12px;"></tr>
						<tr>
							<th class="col-md-2">성명</th>
							<td class="col-md-4" id="psti_nm"></td>
							<th class="col-md-2">국적</th>
							<td class="col-md-4" id="nlty"></td>
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
							<th >확진자 코드</th>
							<td id="cnfm_no"></td>
							<th>상태</th>
							<td id="sttus_code"></td>
						</tr>
						<tr class="shittr">
							<th style="vertical-align: middle; padding: 0px;padding-left: 9px;font-size: 12px;" >주민/외국인<br>등록번호</th>
							<td colspan="1" id="rrn"></td>
							<th>연락처</th>
							<td colspan="1" id="psti_telno"></td>
						</tr> 
						<tr class="shittr">
							<th>주소</th>
							<td colspan="3" id="psti_adres"></td>
						</tr>
						<tr class="shittr">
							<th>증상</th>
							<td colspan="3" id="symptms"></td>
						</tr>
					</tbody>
				</table>

				<table class="table table-bordered chckd-detail-element" style="margin-top: 12px;">
					<tbody>
						<tr>
							<th class="col-md-2">최저혈압</th>
							<td class="col-md-4" id="min_brssr"></td>
							<th class="col-md-2">최고혈압</th>
							<td class="col-md-4" id="max_brssr"></td>
						</tr>
						<tr class="shittr">
							<th>신장</th>
							<td id="bdheight"></td>
							<th>체중</th>
							<td id="bdweight"></td>
						</tr>
						<tr class="shittr">
							<th>체온</th>
							<td id="bdheat"></td>
							<th></th>
							<td></td>
						</tr>
					</tbody>
				</table>

				<table class="table table-bordered" style="margin-top: 12px;">
					<tbody>
						<tr>
							<th class="col-md-2">
								<strong>요청기관</strong>
							</th>
							<td class="col-md-4" id="inst_nm"></td>
							<th class="col-md-2">
								<strong>연락처</strong>
							</th>
							<td class="col-md-4" id="inst_telno"></td>
						</tr>

						<tr>
							<th>
								<strong>주소</strong>
							</th>
							<td colspan="5" id="inst_adres"></td>
						</tr>
					</tbody>
				</table>
				<div style="margin-bottom: 52px;"></div>
			</div>
		</div>
	</div>

</div>
<input type="hidden" name="tempTypeCode">




