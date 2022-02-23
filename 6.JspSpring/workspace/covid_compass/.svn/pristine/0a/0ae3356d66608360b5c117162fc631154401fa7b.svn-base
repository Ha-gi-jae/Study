<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="main-insp-list-template" >
{{#each .}}
		<tr class="each-insp-element" style="cursor: default;">
		<td onclick="event.cancelBubble=true" style="cursor: default;">
		<input type="checkbox" name="instCheckBoxIn" value="{{instNo}}" onclick="cancleAll()"></td>
		<td><span class="badge badge-primary">검사소</span></td>
		<td style="text-align:left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
			{{instNm }}</td>
		<td style="text-align:left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
			{{instAdres }}</td>
		<td>{{instTelno }}</td>
		<td>{{empCnt }}</td>
		</tr>
{{/each}}
</script>
<script type="text/x-handlebars-template" id="main-insp-pagination-template">
	<li class="page-item each-insp-pagination-element">
		<a class="page-link" href="1"> 
			<i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
    	</a>
    </li>
    <li class="page-item each-insp-pagination-element">
		<a class="page-link" href="{{#if prev}}{{prevPageNum}}{{/if}}"> 
			<i class="fas fa-angle-left" style="color:#1a4f72;"></i>
    	</a>
	</li>

{{#each pageNum}}
    <li class="page-item each-insp-pagination-element {{signActive this}}" >
		<a class="page-link" href="{{this}}" >{{this}}
		</a>
	</li>
{{/each}}

    <li class="page-item each-insp-pagination-element">
		<a class="page-link" href="{{#if next}}{{nextPageNum}}{{/if}}"> 
			<i class="fas fa-angle-right" style="color:#1a4f72;"></i>
    	</a>
	</li>
    <li class="page-item each-insp-pagination-element">
		<a class="page-link" href="{{realEndPage}}"> 
			<i class="fas fa-angle-double-right" style="color:#1a4f72;"></i>
		</a>
	</li>
</script>

<script>
Handlebars.registerHelper({
	"signActive" : function(pageNum){
	  if(pageNum == page) return 'active';
	},
	"styleActive" : function(pageNum){
		if(pageNum == page){
			return 'background:#1a4f72; border-color:#1a4f72;';
		}else{
			return 'color:#1a4f72';
		}
  	}

})
</script>

<script>

var page =1;
var pbhtPage = 1;
var ltctPage = 1;
var hsptPage = 1;
window.onload = function(){
	
	var url='<%=request.getContextPath()%>/rest-main/insp-list';
	var pbhtUrl='<%=request.getContextPath()%>/rest-main/pbht-list';
	var ltctUrl='<%=request.getContextPath()%>/rest-main/ltct-list';
	var hsptUrl='<%=request.getContextPath()%>/rest-main/hspt-list';
	
	
	list_go(page, url);
	pbhtList_go(pbhtPage, pbhtUrl);
	ltctList_go(ltctPage, ltctUrl);
	hsptList_go(hsptPage, hsptUrl);
	
	$('ul.pagination').on('click', 'li a', function(event){
		if($(this).attr("href")){
		page = $(this).attr("href");
		getPage(url, make_form(page));
	}
		return false;
	});
	
	$('ul.hspt-pagination').on('click', 'li a', function(event){
		if($(this).attr("href")){
		page = $(this).attr("href");
		getHsptPage(hsptUrl, makeHspt_form(page));
	}
		return false;
	});
	
	$('ul.pbht-pagination').on('click', 'li a', function(event){
		if($(this).attr("href")){
		page = $(this).attr("href");
		getPbhtPage(pbhtUrl, makePbht_form(page));
	}
		return false;
	});
	$('ul.ltct-pagination').on('click', 'li a', function(event){
		if($(this).attr("href")){
		page = $(this).attr("href");
		getLtctPage(ltctUrl, makeLtct_form(page));
	}
		return false;
	});
	
		
}

function makeHspt_form(hsptPageParam){
	var hsptJobForm=$('#hsptJobForm');
	//alert(pageParam);
	if(!hsptPageParam) hsptPage = 1;
	
	hsptPage = hsptPageParam;
	
	hsptJobForm.find("[name='page']").val(hsptPage);
	hsptJobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	hsptJobForm.find("[name='searchType2']").val($('select[name="searchType2hs"]').val());
	hsptJobForm.find("[name='keyword']").val($('div.input-group>input[name="keywordhs"]').val());
	
	return hsptJobForm;
}


function makeLtct_form(ltctPageParam){
	var ltctJobForm=$('#ltctJobForm');
	//alert(pageParam);
	if(!ltctPageParam) ltctPage = 1;
	
	ltctPage = ltctPageParam;
	
	ltctJobForm.find("[name='page']").val(ltctPage);
	ltctJobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	ltctJobForm.find("[name='searchType2']").val($('select[name="searchType2lt"]').val());
	ltctJobForm.find("[name='keyword']").val($('div.input-group>input[name="keywordlt"]').val());
	
	return ltctJobForm;
}


function makePbht_form(pbhtPageParam){
	var pbhtJobForm=$('#pbhtJobForm');
	//alert(pageParam);
	if(!pbhtPageParam) pbhtPage = 1;
	
	pbhtPage = pbhtPageParam;
	
	pbhtJobForm.find("[name='page']").val(pbhtPage);
	pbhtJobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	pbhtJobForm.find("[name='searchType2']").val($('select[name="searchType2pb"]').val());
	pbhtJobForm.find("[name='keyword']").val($('div.input-group>input[name="keywordpb"]').val());
	
	return pbhtJobForm;
}


function make_form(pageParam){
	var jobForm=$('#jobForm');
	//alert(pageParam);
	if(!pageParam) page = 1;
	
	page = pageParam;
	
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	jobForm.find("[name='searchType2']").val($('select[name="searchType2"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	
	return jobForm;
}


function hsptList_go(hsptPageParam, hsptUrl){
	getHsptPage(hsptUrl, makeHspt_form(hsptPageParam));
}

function ltctList_go(ltctPageParam, ltctUrl){
	getLtctPage(ltctUrl, makeLtct_form(ltctPageParam));
}

function pbhtList_go(pbhtPageParam, pbhtUrl){
	getPbhtPage(pbhtUrl, makePbht_form(pbhtPageParam));
}

function list_go(pageParam, url){
	
	getPage(url, make_form(pageParam));
}

function getHsptPage(handlebarsProcessingURL, form){
	
	$.ajax({
		url : handlebarsProcessingURL,
		type : 'post',
		dataType : 'json',
		data : form.serialize(),
		success : function(hsptMap){
			$('#main-hspt-list-table-body').html('');
			if(hsptMap.hsptList.length == 0){
				$('#main-hspt-list-table-body').html('<tr class="each-hspt-element"> <td  id="initialTd3" colspan="6"><strong>데이터가 없습니다.</strong></td> </tr>');
				hsptMap.hsptPageMaker.realEndPage=1;
				printPagination(hsptMap.hsptPageMaker,$('#main-hspt-pagination-ul'), $('#main-hspt-pagination-template'), '.each-hspt-pagination-element');
			}else{
	 			printData(hsptMap.hsptList, $('#main-hspt-list-table-body'), $('#main-hspt-list-template'), '.each-hspt-element');
				printPagination(hsptMap.hsptPageMaker,$('#main-hspt-pagination-ul'), $('#main-hspt-pagination-template'), '.each-hspt-pagination-element'); 
			}
 		},
		error : function(error){
			alert('error'+error.status);
		}
	})
}

function getLtctPage(handlebarsProcessingURL, form){
	
	$.ajax({
		url : handlebarsProcessingURL,
		type : 'post',
		dataType : 'json',
		data : form.serialize(),
		success : function(ltctMap){
			$('#main-ltct-list-table-body').html('');
			if(ltctMap.ltctList.length == 0){
				$('#main-ltct-list-table-body').html('<tr class="each-ltct-element"> <td  id="initialTd4" colspan="6"><strong>데이터가 없습니다.</strong></td> </tr>');
				ltctMap.ltctPageMaker.realEndPage=1;
				printPagination(ltctMap.ltctPageMaker,$('#main-ltct-pagination-ul'), $('#main-ltct-pagination-template'), '.each-ltct-pagination-element');
			}else{
	 			printData(ltctMap.ltctList, $('#main-ltct-list-table-body'), $('#main-ltct-list-template'), '.each-ltct-element');
				printPagination(ltctMap.ltctPageMaker,$('#main-ltct-pagination-ul'), $('#main-ltct-pagination-template'), '.each-ltct-pagination-element');
			}
			
 		},
		error : function(error){
			alert('error'+error.status);
		}
	})
}

function getPbhtPage(handlebarsProcessingURL, form){
	
	$.ajax({
		url : handlebarsProcessingURL,
		type : 'post',
		dataType : 'json',
		data : form.serialize(),
		success : function(pbhtMap){
			$('#main-pbht-list-table-body').html('');
			if(pbhtMap.pbhtList.length == 0){
				$('#main-pbht-list-table-body').html('<tr class="each-pbht-element"> <td  id="initialTd2" colspan="6"><strong>데이터가 없습니다.</strong></td> </tr>');
				pbhtMap.pbhtPageMaker.endPage=1;
				pbhtMap.pbhtPageMaker.realEndPage=1;
				printPagination(pbhtMap.pbhtPageMaker,$('#main-pbht-pagination-ul'), $('#main-pbht-pagination-template'), '.each-pbht-pagination-element');
			}else{
	 			printData(pbhtMap.pbhtList, $('#main-pbht-list-table-body'), $('#main-pbht-list-template'), '.each-pbht-element');
				printPagination(pbhtMap.pbhtPageMaker,$('#main-pbht-pagination-ul'), $('#main-pbht-pagination-template'), '.each-pbht-pagination-element');
			}
 		},
		error : function(error){
			alert('error'+error.status);
		}
	})
}


function getPage(handlebarsProcessingURL, form){
	
	$.ajax({
		url : handlebarsProcessingURL,
		type : 'post',
		dataType : 'json',
		data : form.serialize(),
		success : function(inspMap){
			$('#main-insp-list-table-body').html('');
			if(inspMap.inspList.length == 0){
				$('#main-insp-list-table-body').html('<tr class="each-insp-element"> <td  id="initialTd" colspan="6"><strong>데이터가 없습니다.</strong></td> </tr>');
				inspMap.inspPageMaker.endPage=1;
				inspMap.inspPageMaker.realEndPage=1;
				printPagination(inspMap.inspPageMaker,$('#main-insp-pagination-ul'), $('#main-insp-pagination-template'), '.each-insp-pagination-element');
			}else{
	 			printData(inspMap.inspList, $('#main-insp-list-table-body'), $('#main-insp-list-template'), '.each-insp-element');
				printPagination(inspMap.inspPageMaker,$('#main-insp-pagination-ul'), $('#main-insp-pagination-template'), '.each-insp-pagination-element');
			}
 		},
		error : function(error){
			alert('error'+error.status);
		}
	})
}

function printData(jsonArray, target, templateObject, removeClass){

	//templateObject를 json data를 받으면 마크업을 return하는 function template로 반환한다.
	var template = Handlebars.compile(templateObject.html());
	
	//함수 template에 파라미터 jsonArray를 넣어서 실행하여 html을 생성한다.
	var html = template(jsonArray);
	
	//해당 html요소를 append하기 전에 기존에 있던 내용을 지운다. (안그러면 리스트 목록이 10개씩만 보이는 게 아니라 10개, 20개, 30개 등 페이지 클릭할 때마다 10개씩 추가되므로)
	$(removeClass).remove();
	
	//html요소를 append한다.
	target.append(html);
}

function printPagination(pageMaker, target, templateObject, removeClass){
	var pageNum = new Array(pageMaker.endPage - pageMaker.startPage + 1);
	
	for(var i=0; i < pageMaker.endPage - pageMaker.startPage + 1; i++){
		pageNum[i] = pageMaker.startPage + i;
	}	
	pageMaker.pageNum = pageNum;  
	pageMaker.prevPageNum = pageMaker.startPage - 1;
	pageMaker.nextPageNum = pageMaker.endPage + 1;
	
	var template=Handlebars.compile(templateObject.html());	
	
	var html = template(pageMaker);	
	
	target.html("").html(html);
}


</script>



 <div class="card-body" style="padding: 0px; height:252px;">
	<div class="table-responsive">
		<table class="table table-hover text-nowrap"
			style="text-align: center; table-layout: fixed;">
			<thead>
				<tr role="row">
					<th style="width: 5%;"><input type="checkbox"
						id="selectAll" onclick="selectAll()"></th>
					<th tabindex="0" aria-controls="example2" rowspan="1"
						style="text-align: center; width: 15%;" colspan="1" aria-label="">구분</th>
					<th tabindex="0" aria-controls="example2" rowspan="1"
						style="text-align: center; width: 30%;" colspan="1" aria-label="">기관명</th>
					<th tabindex="0" aria-controls="example2" rowspan="1"
						style="text-align: center;  width: 32%;" colspan="1"
						aria-sort="ascending" aria-label="">주소</th>
					<th tabindex="0" aria-controls="example2" rowspan="1"
						style="text-align: center; width: 15%;" colspan="1" aria-label="">연락처</th>
					<th tabindex="0" aria-controls="example2" rowspan="1"
						style="text-align: center; width: 15%;" colspan="1" aria-label="">직원수</th>
				</tr>
			</thead>
			<tbody id="main-insp-list-table-body">
				<tr class="each-insp-element">
					<td  id="initialTd" colspan="6"><strong>페이지 로딩중 입니다.</strong></td>
				</tr>
			</tbody>
		</table>

	</div>

</div>
<div class="card-footer clearfix" style="background: white;">
	<ul class="insp-pagination pagination justify-content-center m-0" id="main-insp-pagination-ul">
    </ul>
</div>

<form id="jobForm">
	<input type='hidden' name="page" value="" />
	<input type='hidden' name="perPageNum" value=""/>
	<input type='hidden' name="searchType" value="insp" />
	<input type='hidden' name="searchType2" value="" />
	<input type='hidden' name="keyword" value="" />
</form>

<script>
	function selectAll(checkBox){
		var length = document.getElementsByName("instCheckBoxIn").length;
		if(document.getElementById('selectAll').checked==true){
			for(var i=0; i<length; i++) document.getElementsByName("instCheckBoxIn")[i].checked=true;
		}
	
		if(document.getElementById('selectAll').checked==false){
			for(var i=0; i<length; i++) document.getElementsByName("instCheckBoxIn")[i].checked=false;
		}
	
	
	}
	function cancleAll(){
	
		if(document.getElementById('selectAll').checked==true){
			document.getElementById('selectAll').checked=false;
		}
	}
</script>








