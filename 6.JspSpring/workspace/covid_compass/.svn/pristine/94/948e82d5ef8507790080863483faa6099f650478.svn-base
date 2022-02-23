<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<head>
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<style>
.card-title {
  font-weight: bold;
  color: #333333;
  font-size: 16px;
}
.card-footer {
  background-color : white;
}
.pbht {
  color: #f56954;
}

.ltct {
  color: #3c8dbc
}
.table-sm td, .table-sm th {
    padding: 0.3rem!important;
}
.table-sm{
  margin-bottom: 10px;
}
.card-footer{
  padding: 0rem;
}
.element-hidden{
  display: none;
}
.element-visible{
  display: block;
}
</style>
<script>
function printData(jsonArray, target, templateObject, removeClass){
  var template = Handlebars.compile(templateObject.html()); // templateObject를 json data로 받으면 마크업을 return하는 function. template로 반환
  
  var html = template(jsonArray); // 함수 template에 파라미터 jsonArray를 넣어서 실행하여 html 생성
  
  $(removeClass).remove(); // 해당 html요소를 append하기 전에 기존 내용 지우기. 안그러면 리스트 목록이 10개씩 보이는게 아니라 10, 20, 30개 등 클릭할때마다 10개씩 추가된다.
  
  target.append(html);
}

function printPagination(pageMaker, target, templateObject, removeClass){
  var pageNum = new Array(pageMaker.endPage-pageMaker.startPage+1);
  
  for(var i=0; i<pageMaker.endPage-pageMaker.startPage+1;i++){
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


</head>

<title></title>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
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
"checkDisabled" : function(flag){
    if(!flag) return 'disabled';
},
"signActive" : function(pageNum){
  if(pageNum == dgnssListPage){
    return 'active';
  }
},
"reqsckbdSignActive" : function(pageNum){
  if(pageNum == reqsckbdListPage){
    return 'active';
  }
},
"inptntSignActive" : function(pageNum){
  if(pageNum == inptntListPage){
    return 'active';
  }
},
"mySckbdreqSignActive" : function(pageNum){
  if(pageNum == mySckbdreqListPage){
    return 'active';
  }
},
"styleActive" : function(pageNum){
  if(pageNum == dgnssListPage){
    return 'background:#1a4f72; border-color:#1a4f72;';
  }else{
    return 'color:#1a4f72';
  }
},
"reqsckbdStyleActive" : function(pageNum){
  if(pageNum == reqsckbdListPage){
    return 'background:#1a4f72; border-color:#1a4f72;';
  }else{
    return 'color:#1a4f72';
  }
},
"inptntStyleActive" : function(pageNum){
  if(pageNum == inptntListPage){
    return 'background:#1a4f72; border-color:#1a4f72;';
  }else{
    return 'color:#1a4f72';
  }
},
"mySckbdreqStyleActive" : function(pageNum){
  if(pageNum == mySckbdreqListPage){
    return 'background:#1a4f72; border-color:#1a4f72;';
  }else{
    return 'color:#1a4f72';
  }
},
"fnGender" : function(gender){
  if(gender == "M"){
    return "남자";
  }if(gender == "F"){
    return "여자";
  }
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
},
"codeTest" : function(sckbdreqCode){
  if(sckbdreqCode == "승인대기"){
    return;
  }else{
    return 'disabled';
  }
},
"isPossibleToCancle" : function(cancleYmd){
  if(!cancleYmd) return;
  var test = true;
  
  test = parseInt(Date.now()) < parseInt(cancleYmd);
  
  if(!test) return 'disabled';
  return;
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
    return '#17a2b8;';
  }
  if(requestCode == 'M102'){
    return '#007bff;'; 
  }
  if(requestCode == 'M103'){
    return '#28a745;'; 
  }
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
var dgnssListPage = 1;
var reqsckbdListPage = 1;
var inptntListPage = 1;
var mySckbdreqListPage = 1;

function makeDgnssForm(pageParam){
  var dgnssListForm=$('#dgnssListForm')
  
  if(!pageParam) dgnssListPage = 1;
  
  dgnssListPage = pageParam;
  
  dgnssListForm.find("[name='page']").val(dgnssListPage);
  dgnssListForm.find("[name='perPageNum']").val(5);
  
  return dgnssListForm;
}
function makeReqsckbdForm(pageParam){
  var reqsckbdListForm=$('#reqsckbdListForm')
  
  if(!pageParam) reqsckbdListPage = 1;
  
  reqsckbdListPage = pageParam;
  
  reqsckbdListForm.find("[name='page']").val(reqsckbdListPage);
  reqsckbdListForm.find("[name='perPageNum']").val(5);
  
  return reqsckbdListForm;
}
function makeInptntForm(pageParam){
  var inptntListForm=$('#inptntListForm')
  
  if(!pageParam) inptntListPage = 1;
  
  inptntListPage = pageParam;
  
  inptntListForm.find("[name='page']").val(inptntListPage);
  inptntListForm.find("[name='perPageNum']").val(5);
  
  return inptntListForm;
}
function makeMySckbdreqForm(pageParam){
  var mySckbdreqForm=$('#mySckbdreqForm')
  
  if(!pageParam) mySckbdreqListPage = 1;
  
  mySckbdreqListPage = pageParam;
  
  mySckbdreqForm.find("[name='page']").val(mySckbdreqListPage);
  mySckbdreqForm.find("[name='perPageNum']").val(5);
  
  return mySckbdreqForm;
}
function dgnssListGo(pageParam,dgnssListURL){
  getDgnssList(dgnssListURL, makeDgnssForm(pageParam));
}
function reqsckbdListGo(pageParam,reqsckbdListURL){
  getReqsckbdList(reqsckbdListURL, makeReqsckbdForm(pageParam));
}
function inptntListGo(pageParam,inptntListURL){
  getInptntList(inptntListURL, makeInptntForm(pageParam));
}
function mySckbdreqListGo(pageParam,mySckbdreqListURL){
  getMySckbdreqList(mySckbdreqListURL, makeMySckbdreqForm(pageParam));
}
function getDgnssList(handlebarsProcessingURL, form){
  $.ajax({
    url : handlebarsProcessingURL,
    type : 'post',
    dataType : 'json',
    data : form.serialize(),
    success: function(dataMap){
		if (dataMap.dgnssList.length == 0) {
			$('#dgnss-table-tbody').find('td').html('데이터가 없습니다.');
			dataMap.pageMaker.endPage = 1;
      		printPagination(dataMap.pageMaker, $('#dgnss-pagination-ul'), $('#dgnss-pagination-template'), '.each-dgnss-pagination-element');
		} else {
      		printData(dataMap.dgnssList, $('#dgnss-table-tbody'), $('#dgnss-template'), '.each-dgnss-element');
      		printPagination(dataMap.pageMaker, $('#dgnss-pagination-ul'), $('#dgnss-pagination-template'), '.each-dgnss-pagination-element');
		}    	
    },
    error : function(error){
      alert("error" + error.status);
    }
  })
}
function getReqsckbdList(handlebarsProcessingURL, form){
  $.ajax({
    url : handlebarsProcessingURL,
    type : 'post',
    dataType : 'json',
    data : form.serialize(),
    success: function(dataMap){
				if (dataMap.reqInptntList.length == 0) {
					$('#reqsckbd-table-tbody').find('td').html('데이터가 없습니다.');
					dataMap.pageMaker.endPage = 1;
      				printPagination(dataMap.pageMaker, $('#reqsckbd-pagination-ul'), $('#reqsckbd-pagination-template'), '.each-reqsckbd-pagination-element');
				} else {
				      printData(dataMap.reqInptntList, $('#reqsckbd-table-tbody'), $('#reqsckbd-template'), '.each-reqsckbd-element');
				      printPagination(dataMap.pageMaker, $('#reqsckbd-pagination-ul'), $('#reqsckbd-pagination-template'), '.each-reqsckbd-pagination-element');
				}
    },
    error : function(error){
      alert("error" + error.status);
    }
  })
}
function getInptntList(handlebarsProcessingURL, form){
  $.ajax({
    url : handlebarsProcessingURL,
    type : 'post',
    dataType : 'json',
    data : form.serialize(),
    success: function(dataMap){

				if (dataMap.inptntList.length == 0) {
					$('#inptnt-table-tbody').find('td').html('데이터가 없습니다.');
					dataMap.pageMaker.endPage = 1;
					printPagination(dataMap.pageMaker, $('#inptnt-pagination-ul'), $('#inptnt-pagination-template'), '.each-inptnt-pagination-element');
				} else {
					printData(dataMap.inptntList, $('#inptnt-table-tbody'), $('#inptnt-template'), '.each-inptnt-element');
					printPagination(dataMap.pageMaker, $('#inptnt-pagination-ul'), $('#inptnt-pagination-template'), '.each-inptnt-pagination-element');
				}
			},
			error : function(error) {
				alert("error" + error.status);
			}
		})
	}
	function getMySckbdreqList(handlebarsProcessingURL, form) {
		
		$.ajax({
			url : handlebarsProcessingURL,
			type : 'post',
			dataType : 'json',
			data : form.serialize(),
			success : function(dataMap) {

				if (dataMap.sckbdreqList.length == 0) {
					$('#req-sckbd-hspt-list-table-tbody').find('td').html('데이터가 없습니다.');
					dataMap.pageMaker.endPage = 1;
					printPagination(dataMap.pageMaker, $('#my-sckbdreq-list-pagination-ul'), $('#my-sckbdreq-pagination-template'), '.each-my-sckbdreq-pagination-element');
				} else {
					printData(dataMap.sckbdreqList, $('#req-sckbd-hspt-list-table-tbody'), $('#req-sckbd-hspt-list-template'), '.each-my-sckbdreq-element');
					printPagination(dataMap.pageMaker, $('#my-sckbdreq-list-pagination-ul'), $('#my-sckbdreq-pagination-template'), '.each-my-sckbdreq-pagination-element');
				}
			},
			error : function(error) {
				alert("error" + error.status);
			}
		})
	}

	window.onload = function() {
		var dgnssListURL = '<%=request.getContextPath()%>/rest-hspt/dgnss-list';
  var reqsckbdListURL = '<%=request.getContextPath()%>/rest-hspt/req-inptnt-list';
  var inptntListURL = '<%=request.getContextPath()%>/rest-hspt/inptnt-list';
  var mySckbdreqListURL = '<%=request.getContextPath()%>/rest-hspt/sckbdreq-list';
  
  dgnssListGo(dgnssListPage, dgnssListURL);
  reqsckbdListGo(reqsckbdListPage, reqsckbdListURL);
  inptntListGo(inptntListPage, inptntListURL);
  mySckbdreqListGo(mySckbdreqListPage, mySckbdreqListURL);
  getHsptMainSckbdCountAndStats();
  
  getHsptMainStatsChart();
  
  
  $('ul.dgnss-pagination').on('click', 'li a', function(event){
    if($(this).attr("href")){
      page = $(this).attr("href");
      getDgnssList(dgnssListURL, makeDgnssForm(page));
    }
    return false;
  });
  
  $('ul.reqsckbd-pagination').on('click', 'li a', function(event){
    if($(this).attr("href")){
      page = $(this).attr("href");
      getReqsckbdList(reqsckbdListURL, makeReqsckbdForm(page));
    }
    return false;
  });
  
  $('ul.inptnt-pagination').on('click', 'li a', function(event){
    if($(this).attr("href")){
      page = $(this).attr("href");
      getInptntList(inptntListURL, makeInptntForm(page));
    }
    return false;
  });
  
  $('ul.mySckbdreq-pagination').on('click', 'li a', function(event){
    if($(this).attr("href")){
      page = $(this).attr("href");
      getMySckbdreqList(mySckbdreqListURL, makeMySckbdreqForm(page));
    }
    return false;
  });
}

</script>

<script>

function showMore(type){
  
  if(type == "A"){
    parent.goPage('<%=request.getContextPath()%>/hspt/dgnss-list','M040100');
  }
  if(type == "B"){
    parent.goPage('<%=request.getContextPath()%>/hspt/req-inptnt-list','M040300');
  }
  if(type == "C"){
    parent.goPage('<%=request.getContextPath()%>/hspt/inptnt-list','M040200');
  }
  if(type == "D"){
    parent.goPage('<%=request.getContextPath()%>/hspt/req-sckbd-list','M040400');
  }
}

</script>

  <div style="box-sizing: content-box; padding: 16px; margin-top: 6px; min-width : 1000px;">
    <div class="#">
      <div class="row">
        <%@include file="./main-dgnss-list-module-work.jsp"%>
        <%@include file="./main-reqsckbd-list-module-work.jsp"%>
      </div>
    </div>
    <div class="#">
      <div class="row" style="position: relative; margin-top: 13px;">
        <%@include file="./main-inptnt-list-module-work.jsp"%>
        <%@include file="./main-sckbd-module.jsp"%>
      </div>
    </div>
    <div class="#">
      <div class="row" style="position: relative; margin-top: 13px;">
        <%@include file="./main-chart-module.jsp"%>
        <%@include file="./main-rmdsckbd-module.jsp" %>
      </div>
    </div>
  </div>

</body>


