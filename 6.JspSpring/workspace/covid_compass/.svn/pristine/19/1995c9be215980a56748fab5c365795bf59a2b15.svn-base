<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
table tr td {
	overflow: hidden;
	white-space: initial;
	text-overflow: ellipsis;
	-webkit-box-orient: vertical;
	word-break: break-all;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="hspt-bookmark-list-template" >
{{#each .}}
          <tr style="cursor:pointer;"
			data-inst-no="{{instNo}}" data-manage-no="{{manageNo}}"
			onclick="showDetail('{{hsptNo}}', '{{instAdres}}', '{{rmndSckbdCnt}}')"
            class="each-hspt-element">
            <td style="white-space: nowrap;text-overflow: ellipsis;overflow: hidden;">{{instNm}}</td>
            <td style="white-space: nowrap;text-overflow: ellipsis;overflow: hidden;" data-adres-map="{{instAdres}}">{{instAdres}}</td>
            <td>{{rmndSckbdCnt}}/{{sckbdCnt}}</td>
            <td style="text-align:center;"><span class="badge badge-{{fnBadge opRate}}" style="width: 35px;">{{opRate}}%</span></td>
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
  var dateObj = new Date(timeValue);
  var year = dateObj.getFullYear();
  var month = dateObj.getMonth() + 1;
  var date = dateObj.getDate();
  return year + "-" + month + "-" + date;
},
"signActive" : function(pageNum){
  if(pageNum == page) return 'active';
},
"fnBadge" : function(opRate){
	if(opRate > 79){
		return "danger";
	}
	if(opRate < 71){
		return "primary";
	}
	else{
		return "warning";
	}
}
});
</script>

<script>

var page = 1;

var targetId = '';

var pagenationId = '';

var instNm ="";

var sckbdCnt ="";

var url = '<%=request.getContextPath() %>/rest-ltct/hspt-bookmark-list';
window.onload = function(){
 	
	addEvnetWaitTab();
	addEvnetReqTab();
  list_go(url, page, targetId, pagenationId);
	$('ul.pagination').on('click','li a',function(event){
		if($(this).attr("href")) {
			page=$(this).attr("href");
			getPage(url, make_form(page), targetId, pagenationId);
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
  jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
  jobForm.find("[name='keyword']").val($('#keywordId').val());
  
  
  
  
  return jobForm;
}

function list_go(url, pageParam, targetId, pagenationId){
	
	
  getPage(url, make_form(pageParam), targetId, pagenationId);
}

function getPage(handelbarsProcessingURL, form, targetId, pagenationId){
	
	
	if(!targetId) targetId='#hspt-bookmark-list-table-tbody';
	if(!pagenationId) pagenationId = '#inptnt-list-pagination-ul';
	
	
	$.ajax({
    url : handelbarsProcessingURL,
    type : 'get',
    dataType : 'json',
    data : form.serialize(),
    success : function(dataMap){
    	if(dataMap.dhbList.length == 0){
    		$(targetId).html('<tr class="each-hspt-element"><td style="text-align:center;" colspan="4">데이터가 없습니다.</td></tr>')
    		dataMap.pageMaker.endPage = 1;
    		dataMap.pageMaker.realEndPage = 1;
    		printPagination(dataMap.pageMaker, $(pagenationId), $('#inptnt-pagination-template'), '.each-inptnt-pagination-element');
    		initKakaoMap(dataMap.dhbList, dataMap.psti.pstiAdres);
    	}else{
			printData(dataMap.dhbList, $(targetId), $('#hspt-bookmark-list-template'), '.each-hspt-element');
			printPagination(dataMap.pageMaker, $(pagenationId), $('#inptnt-pagination-template'), '.each-inptnt-pagination-element');
			initKakaoMap(dataMap.dhbList, dataMap.psti.pstiAdres);
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
function addEvnetWaitTab(){
	var dgnssWaitTab = $('#custom-hspt-bookmark-list-tab');
	dgnssWaitTab.on('click',function(){
		$('#keywordId').val("")
		$('#jobForm').find("[name='typeCode']").val("");
		targetId = "#hspt-bookmark-list-table-tbody";
		pagenationId = "#inptnt-list-pagination-ul";
		page = 1;
		list_go(url, page, targetId, pagenationId);
	})
}

function addEvnetReqTab(){
	var dgnssReqTab = $('#custom-hspt-all-list-tab');
	dgnssReqTab.on('click',function(){
		$('#jobForm').find("[name='typeCode']").val("all");
		$("#searchType option:eq(0)").prop("selected", true);
		$('#jobForm').find("[name='searchType']").val("");
		$('#keywordId').val("");
		targetId = "#hspt-all-list-table-tbody";
		pagenationId = "#inptnt-all-pagination-template";
		page = 1;
		list_go(url, page, targetId, pagenationId);
	})
}

function showDetail(hsptNo, instAdres, rmndSckbdCnt){
	
var trs = $('tr.each-hspt-element');
	
	trs.removeClass('on');
	
	target = $('tr[data-hspt-no="'+hsptNo+'"]');
	
	target.addClass('on');
	
	parseRmndSckbdCnt = parseInt(rmndSckbdCnt);
	
	$.ajax({
	    url : '<%=request.getContextPath() %>/rest-ltct/hspt-detail',
	    type : 'get',
	    dataType : 'json',
	    data : {'hsptNo':hsptNo},
	    success : function(dataMap){
	 		console.log(dataMap);
	 		$('#inst_nm').html(dataMap.dgnssHspt.instNm);
	 		$('#op_rate').html(dataMap.dgnssHspt.opRate + "%" 
	 				+ "  " +"(" + (dataMap.dgnssHspt.sckbdCnt - dataMap.dgnssHspt.rmndSckbdCnt) 
	 				+ "/" + dataMap.dgnssHspt.sckbdCnt + ")");
	      	$('#inst_telno').html(dataMap.dgnssHspt.instTelno);
	      	$('#emp_cnt').html(dataMap.dgnssHspt.empCnt);
	      	$('#inst_adres').html(dataMap.dgnssHspt.instAdres);
	      	var opRate = dataMap.dgnssHspt.opRate;
	      	mapOpen(instAdres, dataMap.dgnssHspt.instNm, dataMap.dgnssHspt.rmndSckbdCnt, opRate, dataMap.result);
	      	
	      	$('#setHsptNo').val(hsptNo);
	      	$('#setHsptAdres').val(instAdres);
	      	$('#dgnssGo').find("[name=hsptNo]").val(hsptNo);
	      	if(parseRmndSckbdCnt <= 0 ){
	      		$('#dgnssBtn').attr('disabled', true);
	      	}else{
	      		$('#dgnssBtn').attr('disabled', false);
	      	}
	      	
	    },
	    error : function(error){
	      alert('error' + error.status);
	    }
	  })
	
}
function bookmark_go(){
	//alert(instNo);
	var hsptNo = $('#setHsptNo').val();
	var adres = $('#setHsptAdres').val();
	
	var check = confirm("연기기관을 등록하시겠습니까?");
	if(check){
		$.ajax({
		    url : '<%=request.getContextPath() %>/rest-ltct/bookmark-regist',
		    type : 'get',
		    dataType : 'json',
		    data : {'hsptNo':hsptNo},
		    success : function(result){
		    	if(result == 1){
		    		showDetail(hsptNo, adres);
		    		alert("연계기관 등록에 성공하였습니다.");
		    	}else{
		    		alert("연계기관 등록에 실패하였습니다. 관리자에게 문의해 주세요.")
		    	}
		    },
		    error : function(error){
		      alert('error' + error.status);
		    }
		  })
	}else{
		return false;
	}
}

function bookmark_remove(){
	
	var hsptNo = $('#setHsptNo').val();
	var adres = $('#setHsptAdres').val();
	
	var check = confirm("연기기관을 해제하시겠습니까?");
	
	if(check){
		$.ajax({
		    url : '<%=request.getContextPath() %>/rest-ltct/bookmark-remove',
		    type : 'get',
		    dataType : 'json',
		    data : {'hsptNo':hsptNo},
		    success : function(result){
		    	if(result > 0){
		    		showDetail(hsptNo, adres);
		    		alert("연계기관 해제에 성공하였습니다.");
		    		location.reload();
		    	}else{
		    		alert("연계기관 해제에 실패하였습니다. 관리자에게 문의해 주세요.")
		    	}
		    },
		    error : function(error){
		      alert('error' + error.status);
		    }
		  })
	}else{
		return false;
	}
	
}
function dgnssGo(){
	
	if(!$('#dgnssGo').find("[name=hsptNo]").val()){
		alert("병원을 선택해 주세요.");
		return;
	}
	
	getRmndSckbd();
	
	var realRmndSckbdCnt = $('#realRmndSckbdCnt').val();
	var parseRealRmndSckbdCnt = parseInt(realRmndSckbdCnt);
	
	if(parseRealRmndSckbdCnt <= 0){
		alert("타 기관에서 진료신청하여 병상이 가득찼습니다.");
		return;
	}
	
	
	var check = confirm("진료를 신청 하시겠습니까?");
	if(check) $('#dgnssGo').submit();
}
function getRmndSckbd(){
	var hsptNo = $('#dgnssGo').find("[name=hsptNo]").val();
	
	$.ajax({
		url : '<%=request.getContextPath()%>/rest-ltct/getRmndSckbd',
		type : 'get',
		data: {'hsptNo' : hsptNo},
		dataType : 'json',
		success : function(rmndSckbdCnt){
			$('#realRmndSckbdCnt').val(rmndSckbdCnt);
		},
		error : function(error){
			alert('error' + error.status);
		}
	})
}
</script>
<div class="ddoing" style="height: 455px">
<table class="table table-bordered" style="table-layout: fixed;">
	<thead>
		<tr style="text-align: center;">
			<th class="col-md-2" style="width:20%;overflow: true;">병원명</th>
			<th class="col-md-6">주소</th>
			<th class="col-md-2 pl-0 pr-0" style="width:10%;">잔여병상</th>
			<th class="col-md-2" style="width: 10%;">가동률</th>
		</tr>
	</thead>
	<tbody id="hspt-bookmark-list-table-tbody">
		<tr class="each-hspt-element">
			<td colspan="4">데이터 로딩중 입니다.</td>
		</tr>
	</tbody>
</table>
</div>
<div class="card-footer clearfix pb-0 pt-0" style="background-color: white;">
	<ul class="pagination justify-content-center m-0" id="inptnt-list-pagination-ul">
	</ul>
</div>
