<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/x-handlebars-template" id="psti-template">
{{#each .}}
	<tr class="each-psti-element" data-psti-no="{{pstiNo}}">
		<td style="text-align:center"><span class="badge badge-{{fnBadgeChk pstvYn}}">{{fnRechkdYn pstvYn}}</span></td>
		<td style="text-align:left">{{pstiNm}}</td>
		<td style="text-align:center">{{fnGender gender}}</td>
		<td style="text-align:center">{{age}}</td>
		<td style="text-align:center">{{pstiTelno}}</td>
		<td style="text-align:center" class="dtr-control sorting_1" tabindex="0">{{prettifyDate wrtYmd}}</td>
		<td style="text-align:center">{{prettifyDate resYmd}}</td>
		<td style="text-align:center"><span class="badge badge-{{fnBadgePstvYn pstvYn}}">{{fnPstvYn pstvYn}}</span></td>
		<td><button onclick="OpenWindow('main-psti-regist-form?pstiNo={{pstiNo}}','피검자 문진표 등록','992','779');" style="cursor:pointer; background-color: #1a4f72; color: white; border-color: #1a4f72; width: 50px; margin:0 auto; cursor:pointer;" type="button" class="btn btn-block btn-xs">보기</button></td>
	</tr>	
{{/each}}
</script>
<script type="text/x-handlebars-template" id="psti-pagination-template">
	<li class="page-item each-psti-pagination-element">
		<a class="page-link" href="1">
			<i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-psti-pagination-element">
		<a class="page-link {{checkDisabled prev}}" href="{{#if prev}}{{prevPageNum}}{{/if}}">
			<i class="fas fa-angle-left" style="color:#1a4f72;"></i>
		</a>
	</li>
	
	{{#each pageNum}}
		<li class="page-item each-psti-pagination-element {{signActive this}}" >
			<a class="page-link" style="{{styleActive this}}" href="{{this}}">
				{{this}}
			</a>
		</li>
	{{/each}}
	
	<li class="page-item each-psti-pagination-element">
		<a class="page-link {{checkDisabled next}}" href="{{#if next}}{{nextPageNum}}{{/if}}">
			<i class="fas fa-angle-right" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-psti-pagination-element">
		<a class="page-link" href="{{realEndPage}}">
			<i class="fas fa-angle-double-right" style="color:#1a4f72;"></i>
		</a>
	</li>
</script>

	<div class="card pl-0 pr-0" style="position: relative; left: 0px; top: 0px; padding-left: 0px; padding-right:0px; padding-bottom: 10px; height: 310px;">
		<div class="card-header ui-sortable-handle">
			<h3 class="card-title" style="font-weight: bold; color: #333333; font-size: 16px;">
				<i class="ion ion-clipboard mr-1"></i> 피검자 목록
			</h3>
			<div class="card-tools ">
				<button type="button" class="btn btn-tool" onclick="showMore('A');">
					<i class="fas fa-bars" style="color: black"></i>
				</button>
			</div>
		</div>

		<!-- /.card-header -->
		<div class="card-body" style="padding: 0px;">
			<div class="table-responsive">
				<table class="table table-hover text-nowrap"
					style="text-align: center;">
					<thead>
						<tr role="row">
							<th tabindex="0" aria-controls="example2" rowspan="1" style="width: 10%; text-align: center;" colspan="1" aria-label="">구분</th>
							<th tabindex="0" aria-controls="example2" rowspan="1" style="width: 10%; text-align: center;" colspan="1" aria-label="">성명</th>
							<th tabindex="0" aria-controls="example2" rowspan="1" style="width: 10%; text-align: center;" colspan="1" aria-label="">성별</th>
							<th tabindex="0" aria-controls="example2" rowspan="1" style="width: 10%; text-align: center;" colspan="1" aria-label="">나이</th>
							<th tabindex="0" aria-controls="example2" rowspan="1" style="width: 15%; text-align: center;" colspan="1" aria-label="">연락처</th>
							<th tabindex="0" aria-controls="example2" rowspan="1" style="width: 15%; text-align: center;" colspan="1" aria-sort="ascending" aria-label="">문진표 작성일</th>
							<th tabindex="0" aria-controls="example2" rowspan="1" style="width: 10%; text-align: center;" colspan="1" aria-label="">결과일</th>
							<th tabindex="0" aria-controls="example2" rowspan="1" style="width: 10%; text-align: center;" colspan="1" aria-label="">검사결과</th>
							<th tabindex="0" aria-controls="example2" rowspan="1" style="width: 10%; text-align: center;" colspan="1" aria-sort="ascending" aria-label="">상세정보</th>
							
						</tr>
					</thead>
					<tbody id="psti-table-tbody">
						<tr class="each-psti-element">
							<td colspan="9">페이지 로딩중 입니다.</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
				<div class="card-footer" style="height: 30px; text-align: center; background: white;">
						<ul class="psti-pagination pagination pagination-sm m-0" id="psti-list-pagination-ul">
						</ul>
							<form id="pstiListForm">
								<input type='hidden' name="page" value="" />
								<input type='hidden' name="perPageNum" value="" />
							</form>
				</div>
		<!-- /.card-body -->
	</div>
