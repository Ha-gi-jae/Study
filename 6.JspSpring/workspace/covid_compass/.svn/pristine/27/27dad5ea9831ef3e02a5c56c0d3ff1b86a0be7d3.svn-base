<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<script type="text/x-handlebars-template" id="req-sckbd-hspt-list-template">
{{#each .}}
          <tr
			data-hspt-no="{{hsptNo}}" data-manage-no="{{manageNo}}" data-sckbdreq-no="{{sckbdreqNo}}"
			data-child-no="{{childNo}}" data-request-code="{{requestCode}}" data-type="{{type}}"
 			data-psti-nm="{{pstiNm}}" data-sckbdreq-code="{{sckbdreqCode}}" data-cancle-ymd="{{cancleYmd}}"
            class="each-my-sckbdreq-element">
            <td style="text-align: left;">{{pstiNm}}</td>
            <td>{{pstiTelno}}</td>
            <td style="text-align: left">{{checkSckbdreqCode sckbdreqCode hsptNm}}{{ltctNm}}</td>
            <td>{{prettifyDetailDate sckbdreqYmd}}</td>
            <td style="color : {{classifySckbdreqColor sckbdreqCode}}">{{sckbdreqCode}}</td>
            <td style="padding-top : 0px!important; padding-bottom: 0px!important; vertical-align:middle;">
				<button type="button" id="cancle-btn" name="cancle-btn" class="btn btn-block btn-xs"
						style="background-color: #1a4f72; border-color: #1a4f72; border-color: #1a4f72; color: white; width: 80%; height: 20px;
						margin-left: 6px;"
						onclick="showMySckbdReqDetail('{{manageNo}}', '{{sckbdreqNo}}')">보기</td>
          </tr>
{{/each}}
</script>

<script type="text/x-handlebars-template" id="my-sckbdreq-pagination-template">
  <li class="page-item each-my-sckbdreq-pagination-element">
    <a class="page-link" href="1">
      <i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
    </a>
  </li>

  <li class="page-item each-my-sckbdreq-pagination-element">
    <a class="page-link {{checkDisabled prev}}" href="{{#if prev}}{{prevPageNum}}{{/if}}">
      <i class="fas fa-angle-left" style="color:#1a4f72;"></i>
    </a>
  </li>
  
  {{#each pageNum}}
    <li class="page-item each-my-sckbdreq-pagination-element {{mySckbdreqSignActive this}}" >
      <a class="page-link" style="{{mySckbdreqStyleActive this}}" href="{{this}}">
        {{this}}
      </a>
    </li>
  {{/each}}
  
  <li class="page-item each-my-sckbdreq-pagination-element">
    <a class="page-link {{checkDisabled next}}" href="{{#if next}}{{nextPageNum}}{{/if}}">
      <i class="fas fa-angle-right" style="color:#1a4f72;"></i>
    </a>
  </li>

  <li class="page-item each-my-sckbdreq-pagination-element">
    <a class="page-link" href="{{realEndPage}}">
      <i class="fas fa-angle-double-right" style="color:#1a4f72;"></i>
    </a>
  </li>
</script>

<script>
function showMySckbdReqDetail(manageNo, sckbdreqNo){
	
	var url = '<%=request.getContextPath()%>/hspt/main-my-sckbdreq-detail?manageNo=' + manageNo + '&sckbdreqNo=' + sckbdreqNo;
	
	OpenWindow(url, '병상신청 상세', 770, 800);
}

function cancleGo(sckbdreqNo, childNo, type){
	console.log(sckbdreqNo, childNo, type);
	
	if(!confirm('병상신청을 취소하시겠습니까?')) return; 
	
	var url = '<%=request.getContextPath()%>/rest-hspt/process-sckbdreq-cancle';
	
	var data = 
	{
		 'sckbdreqNo' : sckbdreqNo
		,'childNo' : childNo
		,'type' : type
	}
	
	$.ajax({
		url : url,
		type : 'post',
		dataType : 'json',
		data : data,
		success : function(dataMap) {
			alert(dataMap.msg);
			
			location.reload();
		},
		error : function(error) {
			alert('error' + error.status);
		}
	})
	
	
}

function switchTab(){
	
	var mySckbdreqListURL = '<%=request.getContextPath()%>/rest-hspt/sckbdreq-list';
	
	var hiddens = $('.element-hidden');
	var visibles = $('.element-visible');
	
	hiddens.addClass('element-visible');
	hiddens.removeClass('element-hiddens');
	
	visibles.addClass('element-hidden');
	visibles.removeClass('element-visible');
	
	if(!$('#mySckbdreqForm').find("[name='typeCode']").val()
			|| $('#mySckbdreqForm').find("[name='typeCode']").val() == "C103"){
		$('#mySckbdreqForm').find("[name='typeCode']").val("C104");
		$('#mySckbdreqForm').find("[name='page']").val("1");
		
    	getMySckbdreqList(mySckbdreqListURL, makeMySckbdreqForm(1));
    	
		return;
	}
	if($('#mySckbdreqForm').find("[name='typeCode']").val() == "C104"){
		$('#mySckbdreqForm').find("[name='typeCode']").val("C103");
		$('#mySckbdreqForm').find("[name='page']").val("1");
		
    	getMySckbdreqList(mySckbdreqListURL, makeMySckbdreqForm(1));
		return;
	}
}

</script>

<div class="card" style="position: relative; left: 1%; top: 0px; width: 67%;">
  <div class="card-header ui-sortable-handle">
    <div class="row">
      <h3 class="card-title col-sm-10 element-visible">
        <i class="ion ion-clipboard mr-1"></i>타병원 이원신청
        <button type="button" class="btn btn-xs btn-tool" onclick="switchTab();">입소신청</button>
      </h3>
      <h3 class="card-title col-sm-10 element-hidden">
        <button type="button" class="btn btn-xs btn-tool" onclick="switchTab();">타병원 이원신청</button>
        <i class="ion ion-clipboard mr-1"></i>입소신청
      </h3>
      <div class="col-sm-2" style="float: right; text-align: right;">
        <button type="button" class="btn btn-tool" onclick="showMore('D');">
			<i class="fas fa-bars" style="color: black"></i>
		</button>
      </div>
    </div>
  </div>
  <div class="card-body" style="padding: 0px;">
    <div class="ddoing" style="height: 171px; padding: 0px; margin: 0px;">
    <div class="table-responsive">
    
      <table class="table table-sm table-bordered table-hover text-nowrap" style="text-align: center;">
        <thead>
          <tr>
            <th style="width: 10%; text-align: center;">환자이름</th>
            <th style="text-align: center; width: 12%;">연락처</th>
            <th style="text-align: center;">요청기관</th>
            <th style="text-align: center; width: 18%;">신청시각</th>
            <th style="width: 8%; text-align: center;">신청결과</th>
            <th style="width: 8%; text-align: center;">업무</th>
          </tr>
        </thead>
        <tbody id="req-sckbd-hspt-list-table-tbody">
          <tr class="each-my-sckbdreq-element">
            <td colspan="6">페이지 로딩중입니다. 잠시만 기다려주세요.</td>
          </tr>
        </tbody>
      </table>
      <div id="req-sckbd-hspt-page-info-div" style="float: right;"></div>
    </div>
  </div>
  </div>
  <div class="card-footer" style="text-align: center;">
    <ul class="mySckbdreq-pagination pagination-sm pagination m-0" id="my-sckbdreq-list-pagination-ul">
    </ul>
    <form id="mySckbdreqForm">
      <input type='hidden' name="page" value="" />
      <input type='hidden' name="perPageNum" value="5" /> 
      <input type='hidden' name="searchType" value="" /> 
      <input type='hidden' id="jobFormKeyword" name="keyword" value="" /> 
      <input type='hidden' name="typeCode" value="" />
      <input type='hidden' id="jobFormSearchCode"name="searchCode" value="" />   
    </form>
  </div>
</div>
