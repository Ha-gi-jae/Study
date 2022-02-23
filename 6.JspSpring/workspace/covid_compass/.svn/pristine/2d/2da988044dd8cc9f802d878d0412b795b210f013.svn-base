<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/x-handlebars-template" id="inptnt-template">
{{#each .}}

	<tr
    	data-manage-no="{{manageNo}}" data-psti-nm="{{pstiNm}}"
    	ondblclick="OpenWindow('sckbdreq-inptnt?manageNo={{manageNo}}', '진료 신청 정보', 1250, 800)"
    	onclick="showInptntDetail('{{manageNo}}')"
    	class="each-inptnt-element" style="cursor: pointer;">
		<td style="text-align: left;">{{pstiNm}}</td>
		<td>{{age}}</td>
		<td>{{fnGender gender}}</td>
		<td>{{prettifyDate inYmd}}</td>
	</tr>
{{/each}}
</script>
  
<script type="text/x-handlebars-template" id="inptnt-pagination-template">
	<li class="page-item each-inptnt-pagination-element">
		<a class="page-link" href="1">
			<i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-inptnt-pagination-element">
		<a class="page-link {{checkDisabled prev}}" href="{{#if prev}}{{prevPageNum}}{{/if}}">
			<i class="fas fa-angle-left" style="color:#1a4f72;"></i>
		</a>
	</li>
	
	{{#each pageNum}}
		<li class="page-item each-inptnt-pagination-element {{inptntSignActive this}}" >
			<a class="page-link" style="{{inptntStyleActive this}}" href="{{this}}">
				{{this}}
			</a>
		</li>
	{{/each}}
	
	<li class="page-item each-inptnt-pagination-element">
		<a class="page-link {{checkDisabled next}}" href="{{#if next}}{{nextPageNum}}{{/if}}">
			<i class="fas fa-angle-right" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-inptnt-pagination-element">
		<a class="page-link" href="{{realEndPage}}">
			<i class="fas fa-angle-double-right" style="color:#1a4f72;"></i>
		</a>
	</li>
</script>
<script>
function showInptntDetail(manageNo){
  
  var url = '<%=request.getContextPath()%>/hspt/main-inptnt-detail?manageNo='+manageNo;
  OpenWindow(url,'상세정보','600','650');
  
}
</script>
<div class="card" style="position: relative; margin-left: 0px; left: 0px; top: 0px; width: 32%;">
  <div class="card-header ui-sortable-handle">
    <div class="row">
      <h3 class="card-title col-sm-10">
        <i class="ion ion-clipboard mr-1"></i>입원환자
      </h3>
      <div class="col-sm-2" style="float: right; text-align: right;">
        <button type="button" class="btn btn-tool" onclick="showMore('C');">
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
            <th style="text-align: center; width: 20%">이름</th>
            <th style="text-align: center; width: 20%">나이</th>
            <th style="text-align: center; width: 20%">성별</th>
            <th style="text-align: center; width: 40%">입원일</th>
          </tr>
        </thead>
        <tbody id="inptnt-table-tbody">
          <tr class="each-inptnt-element">
            <td colspan="4">페이지 로딩중입니다. 잠시만 기다려주세요.</td>
          </tr>
        </tbody>
      </table>
    </div>
      <div id="inptnt-page-info-div" style="float: right;"></div>
    </div>
    </div>
  <div class="card-footer" style="text-align: center;">
    <ul class="inptnt-pagination pagination-sm pagination m-0" id="inptnt-pagination-ul">
    </ul>
    <form id="inptntListForm">
      <input type='hidden' name="page" value="" />
      <input type='hidden' name="perPageNum" value="5" />
      <input type='hidden' name="searchType" value="" />
      <input type='hidden' name="keyword" value="" />
    </form>
  </div>
</div>
