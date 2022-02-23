<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="dgnss-list-template" >
{{#each .}}
          <tr
			data-inst-no="{{instNo}}" data-manage-no="{{manageNo}}" data-dgnss-no="{{dgnssNo}}" data-child-no="{{childNo}}"
			data-type="{{type}}" data-psti-nm="{{pstiNm}}"
            onclick="showDetail('{{manageNo}}', '{{dgnssNo}}', '{{type}}')"
            class="each-dgnss-element" style="cursor: pointer;">
            <td style="text-align: left;"><span class="{{addClass pbhtNm ltctNm}}" data-inst-nm="{{manageNo}}">{{getInstNm pbhtNm ltctNm}}</span></td>
            <td style="text-align: left;">{{pstiNm}}</td>
            <td>{{age}}</td>
            <td>{{pstiTelno}}</td>
            <td>{{prettifyDate reqYmd}}</td>
            <td>{{vacType}}</td>
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
"signActive" : function(pageNum){
  if(pageNum == page) return 'active';
},
"checkDisabled" : function(flag){
  if(!flag) return 'disabled';
},
"getInstNm" : function(pbhtNm, ltctNm){
	
	return pbhtNm || ltctNm;
},
"addClass" : function(pbhtNm, ltctNm){
	if(pbhtNm){
		return "pbht";
	}
	if(ltctNm){
		return "ltct";
	}
}
});


</script>
<script>

var page = 1;
var myManageNo = '';

window.onload = function(){

  var url = '<%=request.getContextPath() %>/rest-hspt/dgnss-list';
  
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
  jobForm.find("[name='keyword']").val($('#keyword').val());
  
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
    	
    	 if(dataMap.dgnssList.length == 0){
    		$('#enableReadRrn').attr('disabled', true);
    		
    		$('#dgnss-list-table-tbody').html('<tr class="each-dgnss-element"><td colspan="6" id="initialTd">페이지를 로딩중입니다.</td></tr>');
    		
    		$('#initialTd').html('데이터가 없습니다.');
    		dataMap.pageMaker.endPage = 1;
    		printPagination(dataMap.pageMaker, $('#inptnt-list-pagination-ul'), $('#inptnt-pagination-template'), '.each-inptnt-pagination-element');
    		
    		printData('', $('#dgnss-detail-info-module'), $('#dgnss-detail-template'), '.dgnss-detail-info');
            $('#req-inst-nm').html('');
	      
    	}else{
    		
    		$('#enableReadRrn').attr('disabled', false);
  	      printData(dataMap.dgnssList, $('#dgnss-list-table-tbody'), $('#dgnss-list-template'), '.each-dgnss-element');
	      printPagination(dataMap.pageMaker, $('#inptnt-list-pagination-ul'), $('#inptnt-pagination-template'), '.each-inptnt-pagination-element');
	      if(dataMap.firstRecord){
		      showDetail(dataMap.firstRecord.manageNo, dataMap.firstRecord.dgnssNo ,dataMap.firstRecord.type);
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
	
function inputData(type){
	
	reset();
	
	var dgnssNotes = [
		'인후통을 앓고있지만, 심각하지않다.'
		,'상태가 빠르게 호전되고 있습니다.음성 판정이 3번 이상 나온다면 곧바로 퇴소하셔도 됩니다.'
		,'상태가 많이 좋아졌습니다.'
		,'미열이 있었으나, 상태가 호전되어 생활치료센터에서 지속적으로 입소하며 상태를 지켜보는것이 좋겠습니다.'
		,'다소 열이 날 경우가 있으니 처방 약을 복용해주세요.'
		,'다소 기침을 하나, 심각한 수준이 아님.'
		,'기침을 심하게 하나, 진료 결과 중증은 아닙니다.'
	];                                                                                 
	
	var random = Math.floor(Math.random() * dgnssNotes.length);
	
	var dgnssNote = dgnssNotes[random];
	
	if(type){
		$('button[name="isoptnt-dgnss-button"]').attr('disabled', false);
		$('button[name="isoptnt-inptnt-button"]').attr('disabled', false);
		$('button[name="isoptnt-sckbdreq-inptnt-button"]').attr('disabled', false);
	}
	
	if(type == '1'){
    	$('select[name="statusCode"]').val('D101').prop('selected', true);
    	//$('textarea[name="dgnssNote"]').html('중증 및 중등증 입력 테스트');
    	$('textarea[name="dgnssNote"]').html(dgnssNote);
    
    	$('button[name="inptnt-button"]').attr('disabled', false);
    	$('button[name="sckbdreq-inptnt-button"]').attr('disabled', false);
    	
    	$('form[name="processForm"] input[name="dgnssResultCode"]').val('D101');
//    	$('form[name="processForm"] input[name="dgnssNote"]').val('중증 및 중등증 입력 테스트');
    	$('form[name="processForm"] input[name="dgnssNote"]').val(dgnssNote);
    	return;
	}
	if(type == '2'){
    	$('select[name="statusCode"]').val('D102').prop('selected', true);
    	//$('textarea[name="dgnssNote"]').html('미중증 및 경증 입력 테스트');
    	$('textarea[name="dgnssNote"]').html(dgnssNote);
    
    	$('button[name="sckbdreq-isoptnt-button"]').attr('disabled', false);
    	
    	$('form[name="processForm"] input[name="dgnssResultCode"]').val('D102');
    	//$('form[name="processForm"] input[name="dgnssNote"]').val('미중증 및 경증 입력 테스트');
    	$('form[name="processForm"] input[name="dgnssNote"]').val(dgnssNote);
    	return;
	}
	if(type == '3'){
    	$('select[name="statusCode"]').val('D103').prop('selected', true);
    	//$('textarea[name="dgnssNote"]').html('무증상 입력 테스트');
    	$('textarea[name="dgnssNote"]').html(dgnssNote);
    
    	$('button[name="slfptnt-button"]').attr('disabled', false);
    	
    	$('form[name="processForm"] input[name="dgnssResultCode"]').val('D103');
    	//$('form[name="processForm"] input[name="dgnssNote"]').val('무증상 입력 테스트');
    	$('form[name="processForm"] input[name="dgnssNote"]').val(dgnssNote);
    	return;
	}
}
</script>

<section class="content">
  <div style="height: 640px;">
    <div class="table-responsive">
      <table class="table table-hover text-nowrap" style="text-align: center;">

        <thead>
          <tr role="row">
            <th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">요청기관</th>
            <th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">성명</th>
            <th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="">나이</th>
            <th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="">연락처</th>
            <th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">진료요청일자</th>
            <th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">백신접종여부</th>
          </tr>
        </thead>
        <tbody id="dgnss-list-table-tbody">

          <tr class="each-dgnss-element">
            <td colspan="6" id="initialTd">페이지를 로딩중입니다.</td>
          </tr>
        </tbody>
      </table>
        <div id="dgnss-page-info-div" style="float: right;">
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

<form style="display : none;">
<input type="button" value="입원 및 이원" onclick="inputData('1');">
<input type="button" value="생활치료센터" onclick="inputData('2');">
<input type="button" value="자가격리" onclick="inputData('3');">
</form>