<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/x-handlebars-template" id="dgnss-template">
{{#each .}}
          <tr
			data-inst-no="{{instNo}}" data-manage-no="{{manageNo}}" data-dgnss-no="{{dgnssNo}}" data-child-no="{{childNo}}"
			data-type="{{type}}" data-psti-nm="{{pstiNm}}"
            onclick="showDgnssDetail('{{manageNo}}', '{{getInstNm pbhtNm ltctNm}}')"
            class="each-dgnss-element" style="cursor: pointer;">
            <td style="text-align: left;">{{pstiNm}}</td>
            <td>{{prettifyDate reqYmd}}</td>
            <td style="text-align: left;"><span class="{{addClass pbhtNm ltctNm}}" data-inst-nm="{{manageNo}}">{{getInstNm pbhtNm ltctNm}}</span></td>
          </tr>
{{/each}}
</script>
<script type="text/x-handlebars-template" id="dgnss-pagination-template">
	<li class="page-item each-dgnss-pagination-element">
		<a class="page-link" href="1">
			<i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-dgnss-pagination-element">
		<a class="page-link {{checkDisabled prev}}" href="{{#if prev}}{{prevPageNum}}{{/if}}">
			<i class="fas fa-angle-left" style="color:#1a4f72;"></i>
		</a>
	</li>
	
	{{#each pageNum}}
		<li class="page-item each-dgnss-pagination-element {{signActive this}}" >
			<a class="page-link" style="{{styleActive this}}" href="{{this}}">
				{{this}}
			</a>
		</li>
	{{/each}}
	
	<li class="page-item each-dgnss-pagination-element">
		<a class="page-link {{checkDisabled next}}" href="{{#if next}}{{nextPageNum}}{{/if}}">
			<i class="fas fa-angle-right" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-dgnss-pagination-element">
		<a class="page-link" href="{{realEndPage}}">
			<i class="fas fa-angle-double-right" style="color:#1a4f72;"></i>
		</a>
	</li>

</script>

<script>
function showDgnssDetail(manageNo, instNm){
	
	var url = '<%=request.getContextPath()%>/hspt/main-dgnss-detail?manageNo='+manageNo+'&instNm='+instNm;
	OpenWindow(url,'상세정보','600','600');
	
}
</script>

<div class="card" style="position: relative; margin-left: 0px; left: 0px; top: 0px; width: 32%;">
  <div class="card-header ui-sortable-handle">
    <div class="row">
      <h3 class="card-title col-sm-10">
        <i class="ion ion-clipboard mr-1"></i>진료대기환자
      </h3>
      <div class="col-sm-2" style="float: right; text-align: right;">
        <button type="button" class="btn btn-tool"
					onclick="showMore('A');">
					<!-- <i class="fas fa-plus" style="color: black"></i> -->
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
            <th style="text-align: center; width: 40%">요청일자</th>
            <th style="text-align: center; width: 40%">요청기관</th>
          </tr>
        </thead>
        <tbody id="dgnss-table-tbody">
          <tr class="each-dgnss-element">
            <td colspan="3">페이지 로딩중 입니다.</td>
          </tr>
        </tbody>
      </table>
    </div>
    <div id="dgnss-page-info-div" style="float: right;"></div>
  </div>
  </div>
  <div class="card-footer" style="text-align: center;">
    <ul class="dgnss-pagination pagination-sm pagination m-0" id="dgnss-pagination-ul">
    </ul>
    <form id="dgnssListForm">
      <input type='hidden' name="page" value="" />
      <input type='hidden' name="perPageNum" value="5" />
      <input type='hidden' name="searchType" value="" />
      <input type='hidden' name="keyword" value="" />
    </form>
  </div>
</div>
