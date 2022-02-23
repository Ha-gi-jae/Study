<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="req-inptnt-list-template" >
{{#each .}}
          <tr
			data-hspt-no="{{hsptNo}}" data-manage-no="{{manageNo}}" data-sckbdreq-no="{{sckbdreqNo}}"
			data-child-no="{{childNo}}" data-request-code="{{requestCode}}" data-type="{{type}}"
            onclick="showDetail('{{manageNo}}')"
            class="each-req-inptnt-element" style="cursor: pointer;">
            <td><span class="badge badge-{{classifyBadge requestCode}}">{{classifyReqInptnt requestCode}}</span></td>
            <td style="text-align: left;">{{pstiNm}}</td>
            <td>{{age}}</td>
            <td>{{pstiTelno}}</td>
            <td>{{prettifyDate sckbdreqYmd}}</td>
            <td style="text-align: left;">{{hsptNm}}</td>
          </tr>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="inptnt-pagination-template" >
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
"checkDisabled" : function(flag){
    if(!flag) return 'disabled';
},
"signActive" : function(pageNum){
  if(pageNum == page) return 'active';
},
"classifyReqInptnt" : function(requestCode){
	if(!requestCode) return '';
	if(requestCode == 'M101'){
		return '진료환자';
	}
	if(requestCode == 'M102'){
		return '입원환자'; 
	}
	if(requestCode == 'M103'){
		return '입소환자'; 
	}
},
"classifyBadge" : function(requestCode){
	if(!requestCode) return '';
	if(requestCode == 'M101'){
		return 'info';
	}
	if(requestCode == 'M102'){
		return 'primary'; 
	}
	if(requestCode == 'M103'){
		return 'success'; 
	}
}
});


</script>
<script>

var page = 1;

window.onload = function(){

  var url = '<%=request.getContextPath() %>/rest-hspt/req-inptnt-list';
  
  list_go(page, url);
	$('ul.pagination').on('click','li a',function(event){
		if($(this).attr("href")) {
			page=$(this).attr("href");
			getPage(url, make_form(page));
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
  jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
  jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
  
  return jobForm;
}

function list_go(pageParam, url){
	
  getPage(url, make_form(pageParam));
}

function getPage(handelbarsProcessingURL, form){
	
	$.ajax({
    url : handelbarsProcessingURL,
    type : 'get',
    dataType : 'json',
    data : form.serialize(),
    success : function(dataMap){

		if(dataMap.reqInptntList.length == 0){
			$('#enableReadRrn').attr('disabled', true);
			$('#agree-btn').attr('disabled', true);
			$('#reject-btn').attr('disabled', true);
			
			$('#req-inptnt-list-table-tbody').html('<tr class="each-req-inptnt-element"><td colspan="6" id="initialTd">페이지를 로딩중입니다.</td></tr>');
	          
			
    		$('#initialTd').html('데이터가 없습니다.');
    		dataMap.pageMaker.endPage = 1;
    		printPagination(dataMap.pageMaker, $('#inptnt-list-pagination-ul'), $('#inptnt-pagination-template'), '.each-inptnt-pagination-element');
    		
      	  $('#enableReadRrn').data('rrn', '');
    	  $('#enableReadRrn').data('manageNo', '');
    	  
    	  printData('', $('#req-inptnt-detail-info-module'), $('#req-inptnt-detail-template'), '.req-inptnt-detail-info');
        
        $('#dgnssHsptNm').html('');
        $('#dgnssResultCode').html('');
        $('#dgnssNote').html('');
	      
    	}else{
			$('#enableReadRrn').attr('disabled', false);
			$('#agree-btn').attr('disabled', false);
			$('#reject-btn').attr('disabled', false);
			
	      printData(dataMap.reqInptntList, $('#req-inptnt-list-table-tbody'), $('#req-inptnt-list-template'), '.each-req-inptnt-element');
	      printPagination(dataMap.pageMaker, $('#inptnt-list-pagination-ul'), $('#inptnt-pagination-template'), '.each-inptnt-pagination-element');
	      
	      if(dataMap.firstRecord){
	    	  showDetail(dataMap.firstRecord.manageNo);
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

<section class="content">
  <div style="height: 640px;">
    <div class="table-responsive">
      <table class="table table-hover text-nowrap" style="text-align: center;">

        <thead>
          <tr role="row">
            <th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">환자구분</th>
            <th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">성명</th>
            <th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">나이</th>
            <th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="">연락처</th>
            <th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="">신청일자</th>
            <th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">신청기관</th>
          </tr>
        </thead>
        <tbody id="req-inptnt-list-table-tbody">

          <tr class="each-req-inptnt-element">
            <td colspan="6" id="initialTd">페이지를 로딩중입니다.</td>
          </tr>
        </tbody>
      </table>
        <div id="req-inptnt-page-info-div" style="float: right;">
        </div>       
    </div>
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
</section>

