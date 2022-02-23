<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<div class="card"
	style="position: relative; margin-left: 0px; left: 0px; top: 0px; width: 412px;">
	<div class="card-header ui-sortable-handle">
		<h3 class="card-title">
			<i class="ion ion-clipboard mr-1"></i>입원환자
		</h3>

	</div>
	<div class="card-body" style="padding: 0px;">
		<div class="table-responsive">
			<table class="table m-0" style="text-align: center;">
				<thead>
					<tr>
						<th style="text-align: center;">이름</th>
						<th style="text-align: center;">나이</th>
						<th style="text-align: center;">성별</th>
						<th style="text-align: center;">입원일</th>
					</tr>
				</thead>
				<tbody id="inptnt-list-table-tbody">
					<tr class="each-inptnt-element">
						<td colspan="6">페이지 로딩중 입니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="card-footer" style="text-align: center;">
		<div class="card-tools">
			<ul class="inptnt-pagination pagination m-0" id="inptnt-pagination-ul">
			</ul>
		</div>
		<form id="inptntListForm">
			<input type='hidden' name="page" value="" /> <input type='hidden'
				name="perPageNum" value="" />
		</form>
	</div>
</div>
<script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="inptnt-list-template" >
{{#each .}}
          <tr class="each-inptnt-element">
            <td>{{pstiNm}}</td>
            <td>{{age}}</td>
            <td>{{gender}}</td>
            <td>{{prettifyDate inYmd}}</td>
			</tr>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="inptnt-pagination-template" >
    <li class="page-item each-inptnt-pagination-element"><a class="page-link" href="1"> <i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
    </a></li>
    <li class="page-item each-inptnt-pagination-element"><a class="page-link" href="{{#if prev}}{{prevPageNum}}{{/if}}"> <i class="fas fa-angle-left" style="color:#1a4f72;"></i>
    </a></li>

{{#each pageNum}}
    <li class="page-item each-inptnt-pagination-element {{this}}" ><a class="page-link" href="{{this}}" >{{this}}</a></li>
{{/each}}

    <li class="page-item each-inptnt-pagination-element"><a class="page-link" href="{{#if next}}{{nextPageNum}}{{/if}}"> <i class="fas fa-angle-right" style="color:#1a4f72;"></i>
    </a></li>
    <li class="page-item each-inptnt-pagination-element"><a class="page-link" href="{{realEndPage}}"> <i class="fas fa-angle-double-right" style="color:#1a4f72;"></i>
</a></li>
</script>

<%@ include file="../template/handlebars_js.jsp" %>
	<!-- 주소API js -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>

function registInptntSample(){
	var checkedManageNo ='';
	var count = 0;
	$('input[class="form-check-input"]:checked').each(function(){
		checkedManageNo += $(this).val() + ",";
		count += 1;
	});
	
	$.ajax({
		url : '<%=request.getContextPath()%>/rest-hspt/process-regist-smpl',
		type: 'post',
		data : {"checkedManageNo" : checkedManageNo},
		success : function(result){
			alert(count+"명의 시료를 성공적으로 보건소에 전달하였습니다.");
			location.reload();
		},
		error : function(error){
			alert('error' + error.status);
		}
		
	})
		
}	

function goExpire(){
	
	var manageNo = $('form[name="inptntModifyForm"] input[name="manageNo"]').val();
	
	var url = '<%=request.getContextPath()%>/rest-hspt/expire-inptnt';
	
	$.ajax({
		url : url,
		type: 'post',
		data : {"manageNo" : manageNo},
		dataType : 'json',
		success : function(dataMap){
			alert(dataMap.msg);
			location.reload();
		},
		error : function(error){
			alert('error' + error.status);
		}
		
	})	
	
}

	</script>
<script>


function prettyDate(timeValue){
	  var dateObj = new Date(timeValue);
	  var year = dateObj.getFullYear();
	  var month = dateObj.getMonth() + 1;
	  var date = dateObj.getDate();
	  return year + "-" + month + "-" + date;	
}

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


var page = 1;

window.onload = function(){

  var url = '<%=request.getContextPath() %>/rest-hspt/inptnt-list';

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
//  jobForm.find("[name='perPageNum']").val(2);
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
    	printData(dataMap.inptntList, $('#inptnt-list-table-tbody'), $('#inptnt-list-template'), '.each-inptnt-element');
        printPagination(dataMap.pageMaker, $('#inptnt-list-pagination-ul'), $('#inptnt-pagination-template'), '.each-inptnt-pagination-element');
        console.log(dataMap.firstRecord);
        
        if(dataMap.firstRecord){
	        showDetail(dataMap.firstRecord.manageNo);
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

function prettyDate(timeValue){
	  var dateObj = new Date(timeValue);
	  var year = dateObj.getFullYear();
	  var month = dateObj.getMonth() + 1;
	  var date = dateObj.getDate();
	  return year + "-" + month + "-" + date;
	}

</script>