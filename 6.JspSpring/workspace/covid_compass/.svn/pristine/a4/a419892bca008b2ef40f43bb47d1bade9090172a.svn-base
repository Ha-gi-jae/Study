<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<head>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback">
 <!-- Font Awesome -->
 <link rel="stylesheet" href="../resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
 <!-- Theme style -->
 <link rel="stylesheet" href="../resources/bootstrap/dist/css/adminlte.min.css">
<script type="text/javascript" src="../resources/bootstrap/plugins/jquery/jquery.min.js"></script>
</head>
<title></title>
<body>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="smpl-list-template" >
{{#each .}}
          <tr style="cursor: pointer;"
			data-inst-no="{{instNo}}" data-manage-no="{{manageNo}}" data-smpl-no="{{smplNo}}"
            onclick="showDetail('{{smplNo}}', '{{manageNo}}')"
            class="each-smpl-element">
            <td>
			  <div class="form-group">
				  <div class="form-check">
					  <input type="checkbox" class="form-check-input" value="{{smplNo}}" data-manage-no="{{manageNo}}"
						  name="psti_req_check" onclick="cancleAll(this);">
				  </div>
			  </div>
			 </td>
            <td class="smplNo" nno="{{smplNo}}">{{smplNo}}</td>
            <td style="text-align: left;">{{instNm}}</td>
            <td>{{prettifyDate reqYmd}}</td>
            <td>{{chkdYn}}</td>
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

window.onload = function(){
 	//generateQR();
 	
  var url = '<%=request.getContextPath() %>/rest-pbht/smpl-list';
  
  list_go(url,page );
	$('ul.pagination').on('click','li a',function(event){
		if($(this).attr("href")) {
			page=$(this).attr("href");
			getPage(url, make_form(page));
		}
		
		return false;
	});
}
function make_form(pageParam, search){
  var jobForm=$('#jobForm');
  
  if(!pageParam) page = 1;
  
  page = pageParam;
  
  jobForm.find("[name='page']").val(page);
  jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
//  jobForm.find("[name='perPageNum']").val(2);
  if(search){
	  jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	  jobForm.find("[name='keyword']").val($('#keywordId').val());
  }
  
  return jobForm;
}

function list_go(url, pageParam, search){
	
  getPage(url, make_form(pageParam, search));
}

function getPage(handelbarsProcessingURL, form){
	
	$.ajax({
    url : handelbarsProcessingURL,
    type : 'get',
    dataType : 'json',
    data : form.serialize(),
    success : function(dataMap){
    	$('#smpl-list-table-tbody').html("");
    	
     	if(dataMap.smplList.length == 0){
     		
     		$('#smpl-list-table-tbody').html('<tr class="each-smpl-element" ><td colspan="5" id="noSemlpeData">데이터 로딩중 입니다.</td></tr>');
    		$('#noSemlpeData').html('데이터가 없습니다.');
    		$('#option_b1').attr("disabled", true);
 	      	$('#option_b2').attr("disabled", true);
 	      	searchfalse();
    		dataMap.pageMaker.endPage = 1;
      		printPagination(dataMap.pageMaker, $('#inptnt-list-pagination-ul'), $('#inptnt-pagination-template'), '.each-inptnt-pagination-element');
    	}else{
    		$('#option_b1').attr("disabled", false);
 	      	$('#option_b2').attr("disabled", false);
    		printData(dataMap.smplList, $('#smpl-list-table-tbody'), $('#smpl-list-template'), '.each-smpl-element');
      		printPagination(dataMap.pageMaker, $('#inptnt-list-pagination-ul'), $('#inptnt-pagination-template'), '.each-inptnt-pagination-element');
      		showDetail(dataMap.smplList[0].smplNo);
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

var data = "";

function generateQR(pstiNo, smplNo){
	
	console.log(pstiNo);
	
	$("#qrBox").empty();
	
	var qrcode = new QRCode(document.getElementById("qrBox"));
	var url = 'http://192.168.143.14<%=request.getContextPath()%>/common/qrInfo?pstiNo=' + pstiNo + '&smplNo=' + smplNo;
	
	if(!pstiNo) url = "";
	
	qrcode.makeCode(url);
}
function decode() {
	//alert(data);
	var devalue = document.getElementById('decodetext');
	devalue.value = data;
}
	function checkAllBox(checkBox){
		//alert("눌림");
		var length = document.getElementsByName("checkSmple").length;
		//alert("length:"+length);
		if(document.getElementById('all').checked==true){
			for(var i=0; i<length; i++) document.getElementsByName("checkSmple")[i].checked=true;
		}
		
		if(document.getElementById('all').checked==false){
			for(var i=0; i<length; i++) document.getElementsByName("checkSmple")[i].checked=false;
		}
		
	}


function showDetail(smplNo, manageNo, checkAll){
	
	  var trs = $('tr.each-smpl-element');
	  
	  trs.removeClass('on');
	  
	  var target = $('tr[data-smpl-no="'+smplNo+'"]');
	  
	  target.addClass('on');
	  
	$.ajax({
	    url : '<%=request.getContextPath() %>/rest-pbht/smpl-detail',
	    type : 'get',
	    dataType : 'json',
	    data : {'smplNo':smplNo},
	    success : function(dataMap){
	 		console.log(dataMap);
	    	$('#req_ymd').html(prettifyDate(dataMap.reqYmd));
			$('#inst_nm').html(dataMap.instNm);
			$('#psti_nm').html(dataMap.pstiNm);
			$('#bir').html(dataMap.bir);
			$('#psti_telno').html(dataMap.pstiTelno);
			$('#rechkd_yn').html(dataMap.rechkdYn);
			$('#psti_adres').html(dataMap.pstiAdres);
			$('#req_inst_nm').html(dataMap.reqInstNm);
			$('#inst_telno').html(dataMap.instTelno);
	 		$('#inst_adres').html(dataMap.instAdres); 
	 		// 확정버튼 세팅
	 		$('#data-smpl-no').val(dataMap.smplNo);
	 		$('#data-manage-no').val(dataMap.manageNo);
	 		
	 		console.log($('#pstiNoInput')[0]);
	 		
	 		$('#pstiNoInput').val(dataMap.pstiNo);
	 		
	 		
	 		generateQR(dataMap.pstiNo, smplNo)
	 		
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
function searchfalse(){
	$('#req_ymd').html("");
	$('#inst_nm').html("");
	$('#psti_nm').html("");
	$('#bir').html("");
	$('#psti_telno').html("");
	$('#rechkd_yn').html("");
	$('#psti_adres').html("");
	$('#req_inst_nm').html("");
	$('#inst_telno').html("");
	$('#inst_adres').html(""); 
	// 확정버튼 세팅
	$('#data-smpl-no').val("");
	$('#data-manage-no').val("");
	
	$('#pstiNoInput').val("");
	
	$("#qrBox").empty();
}


function psti_check_all(checkAll){
	// alert("왔음 ?");
	// var checktest = document.querySelectorAll('input[type="checkbox"]');
	if($(checkAll).prop("checked")){
        $("input[type=checkbox]").prop("checked",true);
    }else{
        $("input[type=checkbox]").prop("checked",false);
    }
}

function cancleAll(check){
	 if(!$(check).prop("checked")) $("input[name=psti_check_all]").prop("checked",false);
	 //psti_req_check
	 
	 if(($("input[type=checkbox]").length-1) == $("input[name=psti_req_check]:checked").length) $("input[name=psti_check_all]").prop("checked",true);
}
</script>
<section class="content">

<div class="row" style="height: 70px; margin: 1px;">
		<div class="col-lg-6 pl-0" style="margin-top: 17px; margin-bottom: 12px;">
			<div class="card" style="margin: 1px; padding-bottom: 10px;">
						<!-- sort num -->
						
						<div class="card-header d-flex p-0">
						<select name="checkResult" style="width: 55px; height: 30px;margin-top: 8px;margin-left: 17px;margin-right: 4px;">
                      	<option value="" selected="selected">미정</option>
                      	<option value="A102">양성</option>
                      	<option value="A103">음성</option>
                      </select>
						<button onclick="smplsConfirmed_go();" class="btn btn-success" name="options" id="option_b1" style="margin-top: 8px;height: 30px;width: 67px;background: #1a4f72; border: #1a4f72;">확정</button>
							<ul class="nav nav-pills ml-auto p-2" role="tablist">
								<li class="nav-item">
								<div class="input-group float-right" style="max-width: 600px; width:300px;">
								
						<!-- search bar -->
                    	
						<select class="form-control " name="searchType" id="searchType" >
							<option value="" ${pageMaker.cri.searchType eq '' ? 'selected':''}>검색구분</option>
							<option value="smpl"
								${pageMaker.cri.searchType eq 'smpl' ? 'selected':''}>시료번호</option>
							<option value="inst"
								${pageMaker.cri.searchType eq 'inst' ? 'selected':''}>요청기관</option>
						</select>

						<!-- keyword -->
						<input id="keywordId" class="form-control" type="text" name="keyword"
							value="${pageMaker.cri.keyword }"
							style="width: 18%; display: inline-block;" />
						<span class="input-group-append">
							<button class="btn btn-primary" type="button" id="searchBtn"
								style="background: #1a4f72; color: #ffffff; border-color: #1a4f72; display: inline-block; margin-bottom: 4px; margin-left: -7px;"
								data-card-widget="search" onclick="list_go('<%=request.getContextPath() %>/rest-pbht/smpl-list', 1, true);">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
						</div></li>
							</ul>
							</div>
						<!-- end : search bar -->
						<div class="card-body pb-0">
						<div class="table-responsive">
						<div class="ddoing" style="height: 650px;">
							<table class="table table-hover text-nowrap"style="text-align: center;">
								<thead>
									<tr>
			                      <th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">
									  <div class="form-group m-0">
										  <div class="form-check p-0">
											  <input type="checkbox" class="form-check-input-all"
												 name="psti_check_all" onclick="psti_check_all(this);">
										  </div>
									  </div>
								  </th>
			                      <th>시료번호</th>
			                      <th>요청기관</th>
			                      <th>요청일</th>
			                      <th>검사여부</th>
			                    </tr>
								</thead>
								<tbody id="smpl-list-table-tbody">
									<tr class="each-smpl-element" >
				                      <td colspan="5" id="noSemlpeData">데이터 로딩중 입니다.</td>
				                    </tr>
								</tbody>
							</table>
						</div>
			  <div class="card-footer clearfix" style="background-color: white;">
			    <ul class="pagination justify-content-center m-0" id="inptnt-list-pagination-ul">
			    </ul>
			  </div>
			<form id="jobForm">
			  <input type='hidden' name="page" value="" />
			  <input type='hidden' name="perPageNum" value=""/>
			  <input type='hidden' name="searchType" value="" />
			  <input type='hidden' name="keyword" value="" />
			</form>
									</div>
					</div>
			</div>
		</div>
		<div class="col-lg-6 pr-0" style="margin-top: 17px;">
		 <div class="card" style="margin-bottom: 7px;">
			<form name="psti-regist-form" action="${pageContext.request.contextPath }/insp/psti-regist" method="post">
			<div class="card-body">
			  <div class="row" style="justify-content: center;">
				<div id="qrBox" class="brand-link mt-2 pb-3 mb-3 d-flex"
					style="background-size: cover; background-position: center; background-repeat: no-repeat; height: 135px; text-align: center;"></div>
			</div>
			
			<div class="input-group mb-3" style="justify-content: center;">
				<div class="login-box-msg"
					style="display: inline-block; width: 50px;">
					<i class="fas fa-qrcode fa-2x"></i>
				</div>
				<div class="col-md-6">
					<input type="text" class="form-control" name="pstiNoInput" id="pstiNoInput"
						value="" readonly style="text-align: center;">
				</div>
			</div>
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th colspan="4">검사결과 정보</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th class="col-md-2"><strong>요청일자</strong></th>
                      <td class="col-md-4" id="req_ymd" ></td>
                      <th class="col-md-2"><strong>확정일자</strong></th>
                      <td class="col-md-4"></td>
                    </tr>
                    
                    <tr>
                      <th><strong>검사결과</strong></th>
                      <td>
	                      <select name="result">
	                      	<option value="" selected="selected">미정</option>
	                      	<option value="A102">양성</option>
	                      	<option value="A103">음성</option>
	                      </select>
                      </td>
                      <th><strong>검사기관</strong></th>
                      <td id="inst_nm"></td>
                    </tr>
                  </tbody>
                </table>
			</div>
			<div style="margin: 0 auto;" class="col-2">
				<button  
				type="button" id="option_b2" class="btn btn-block btn-default" onclick="smplConfirmed_go();" style="background-color: #1a4f72; border: #1a4f72;">
				<span style="color: white;">확정</span></button>
				
			</div>
			</form>
			<form id="smplConfirmed" action="<%=request.getContextPath() %>/pbhlth/smpl-confirmed" method="post">
				<input id="data-smpl-no" type="hidden" name="smplNo" value=""/>
				<input id="data-manage-no" type="hidden" name="manageNo" value=""/>
				<input id="data-result-code" type="hidden" name="sttusCode" value="" />
			</form>
			
			<form id="smplsConfirmed" action="<%=request.getContextPath() %>/pbhlth/smpls-confirmed" method="post">
				<input id="data-smpls-no" type="hidden" name="smplNo" value=""/>
				<input id="data-manages-no" type="hidden" name="manageNo" value=""/>
				<input id="data-results-code" type="hidden" name="sttusCode" value="" />
			</form>
			
			  
			
			<div class="card-body">
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th colspan="4">피검자정보</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th class="col-md-2"><strong>성명</strong></th>
                      <td class="col-md-4" style="border-top: 2px solid black;" id="psti_nm" ></td>
                      
                      <th class="col-md-2"><strong>생년월일</strong></th>
                      <td class="col-md-4" style="border-top: 2px solid black;" id="bir"></td>
                      
                    </tr>
                    
                    <tr>
                      <th><strong>연락처</strong></th>
                      <td id="psti_telno"></td>
                      <th><strong>재검여부</strong></th>
                      <td id="rechkd_yn"></td>
                    </tr>
                    
                     <tr>
                      <th><strong>주소</strong></th>
                      <td colspan="3" id="psti_adres"></td>
                    </tr>
                  </tbody>
                </table>
			</div>
			
			<div class="card-body" style="margin-bottom: 20px;">
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th colspan="6">검사 요청기관</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th class="col-md-2"><strong>요청기관</strong></th>
                      <td class="col-md-4" id="req_inst_nm" ></td>
                      <th class="col-md-2"><strong>연락처</strong></th>
                      <td class="col-md-4" id="inst_telno"></td>
                    </tr>
                    
                    <tr>
                      <th><strong>주소</strong></th>
                      <td colspan="5" id="inst_adres"></td>
                    </tr>
                     
                  </tbody>
                </table>
                  <div style="margin-bottom: 7px;"></div>
                
			</div>
		  </div>
		</div>
	</div>
</section>
<script>

function smplConfirmed_go(){
	
	if(!$('select[name="result"]').val()){
		alert("검사결과를 선택해 주세요.")	  
		return; 
	}
	
	var check = confirm("결과를 등록하시겠습니까?");
	
	if(check){
		var result = $('select[name="result"]').val();
		$('#data-result-code').val(result);
		$('#smplConfirmed').submit();
	}else{
		return;
	}
}
function smplsConfirmed_go(){
	var smplNo = "";  
	var manageNo = "";
	
	if(!$('select[name="checkResult"]').val()){
		alert("검사결과를 선택해 주세요.")	  
		return; 
	}
	if($('input[class="form-check-input"]:checked').length == 0){
		alert("시료를 선택해 주세요.");
		return;
	}
	
	var check = confirm("결과를 등록하시겠습니까?");
	
	if(check){
		$('input[class="form-check-input"]:checked').each(function(){
		    smplNo += $(this).val()+ ",";
		    manageNo += $(this).attr('data-manage-no') + ",";
		});
	  	var result = $('select[name="checkResult"]').val();
	    $('#data-smpls-no').val(smplNo);
	    $('#data-manages-no').val(manageNo);
	    $('#data-results-code').val(result);
	    $('#smplsConfirmed').submit(); 
	}else{
		return;
	}
}


</script>

</body>
