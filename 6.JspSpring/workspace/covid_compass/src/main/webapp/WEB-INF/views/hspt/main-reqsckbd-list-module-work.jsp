<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/x-handlebars-template" id="reqsckbd-template">
{{#each .}}
    <tr
		data-hspt-no="{{hsptNo}}" data-manage-no="{{manageNo}}" data-sckbdreq-no="{{sckbdreqNo}}"
		data-child-no="{{childNo}}" data-request-code="{{requestCode}}" data-type="{{type}}"
        class="each-reqsckbd-element">
		<td style="text-align: left;">{{pstiNm}}</td>
		<td>{{age}}</td>
		<td>{{pstiTelno}}</td>
		<td>{{prettifyDate sckbdreqYmd}}</td>
		<td style="text-align: left;">{{hsptNm}}</td>
        <td style="padding-top : 0px!important; padding-bottom: 0px!important; vertical-align:middle;"><span class="badge badge-info" style="background-color: {{classifyBadge requestCode}} ">{{classifyReqInptnt requestCode}}</span></td>
        <td style="padding-top : 0px!important; padding-bottom: 0px!important; vertical-align:middle;">
			<button style="width: 80%; height: 20px; background-color:#1a4f72; border-color: #1a4f72; color: white; margin-left: 6px;" type="button" class="btn btn-block btn-xs" onclick="showReqSckbdreqDetail('{{manageNo}}', '{{hsptNo}}', '{{sckbdreqNo}}', '{{childNo}}', '{{requestCode}}', '{{type}}');">보기</button>
		</td>
	</tr>
{{/each}}
</script>
<script type="text/x-handlebars-template" id="reqsckbd-pagination-template">
	<li class="page-item each-reqsckbd-pagination-element">
		<a class="page-link" href="1">
			<i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-reqsckbd-pagination-element">
		<a class="page-link {{checkDisabled prev}}" href="{{#if prev}}{{prevPageNum}}{{/if}}">
			<i class="fas fa-angle-left" style="color:#1a4f72;"></i>
		</a>
	</li>
	
	{{#each pageNum}}
		<li class="page-item each-reqsckbd-pagination-element {{reqsckbdSignActive this}}" >
			<a class="page-link" style="{{reqsckbdStyleActive this}}" href="{{this}}">
				{{this}}
			</a>
		</li>
	{{/each}}
	
	<li class="page-item each-reqsckbd-pagination-element">
		<a class="page-link {{checkDisabled next}}" href="{{#if next}}{{nextPageNum}}{{/if}}">
			<i class="fas fa-angle-right" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-reqsckbd-pagination-element">
		<a class="page-link" href="{{realEndPage}}">
			<i class="fas fa-angle-double-right" style="color:#1a4f72;"></i>
		</a>
	</li>
</script>

<script>
function showReqSckbdreqDetail(manageNo, hsptNo, sckbdreqNo, childNo, requestCode, type){
	
	console.log(manageNo, hsptNo, sckbdreqNo, childNo, requestCode, type);
	var url = '<%=request.getContextPath()%>/hspt/main-req-inptnt-detail';
	var frmObj = $('<form>', {'action' : url, 'method' : 'POST', 'target' : 'Map'});
	
	frmObj.append($('<input>', {'name' : 'manageNo', 'value' : manageNo}));
	frmObj.append($('<input>', {'name' : 'hsptNo', 'value' : hsptNo}));
	frmObj.append($('<input>', {'name' : 'sckbdreqNo', 'value' : sckbdreqNo}));
	frmObj.append($('<input>', {'name' : 'childNo', 'value' : childNo}));
	frmObj.append($('<input>', {'name' : 'requestCode', 'value' : requestCode}));
	frmObj.append($('<input>', {'name' : 'type', 'value' : type}));
	
	var WinWidth = 770;
	var WinHeight = 850;
	
	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	var map = window.open("", "Map","scrollbars=yes,width="+ WinWidth +", " +"height="+ WinHeight +", top="+ wintop +", left="+ winleft +", resizable=yes, status=yes");
	
	map.document.title = "병상 승인대기"; 
	
   console.log(map.document);
	
	document.body.appendChild(frmObj[0]);
	
	if(map){
    	frmObj.submit();
		map.focus();
	}else{
		alert('popup is not allowed');
	}
	
}


</script>
<div class="card" style="position: relative; left: 1%; top: 0px; width: 67%;">
  <div class="card-header ui-sortable-handle">
    <div class="row">
      <h3 class="card-title col-sm-10">
        <i class="ion ion-clipboard mr-1"></i>병상승인대기
      </h3>
      <div class="col-sm-2" style="float: right; text-align: right;">
        <button type="button" class="btn btn-tool" onclick="showMore('B');">
			<i class="fas fa-bars" style="color: black"></i>
		</button>
      </div>
    </div>
  </div>
  <div class="card-body" style="padding: 0px;">
  	<div class="ddoing" style="    height: 171px;    padding: 0px;    margin: 0px;">
    <div class="table-responsive">
    
      <table class="table table-sm table-bordered table-hover text-nowrap" style="text-align: center;">
        <thead>
          <tr>
            <th style="width: 10%; text-align: center;">환자이름</th>
            <th style="width: 8%; text-align: center;">나이</th>
            <th style="text-align: center; width: 12%;">연락처</th>
            <th style="text-align: center; width: 10%;">신청일</th>
            <th style="text-align: center;">요청기관</th>
            <th style="width: 8%; text-align: center;">환자구분</th>
            <th style="width: 8%; text-align: center;">업무</th>
          </tr>
        </thead>
        <tbody id="reqsckbd-table-tbody">
          <tr class="each-reqsckbd-element">
            <td colspan="7">페이지 로딩중입니다. 잠시만 기다려주세요.</td>
          </tr>
        </tbody>
      </table>
      <div id="reqsckbd-page-info-div" style="float: right;"></div>
    </div>
  </div>
  </div>
  <div class="card-footer" style="text-align: center;">
    <ul class="reqsckbd-pagination pagination-sm pagination m-0" id="reqsckbd-pagination-ul">
    </ul>
    
    <form id="reqsckbdListForm">
      <input type='hidden' name="page" value="" />
      <input type='hidden' name="perPageNum" value="" />
      <input type='hidden' name="perPageNum" value="5" /> 
      <input type='hidden' name="searchType" value="" /> 
      <input type='hidden' name="keyword" value="" />      
    </form>
  </div>
</div>