<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/x-handlebars-template" id="sckbd-template">
{{#each .}}
	<tr class="each-sckbd-element" data-manage-no="{{manageNo}}">
		<td style="text-align:left;">{{pstiNm}}</td>
		<td>{{age}}</td>
		<td>{{fnGender gender}}</td>
		<td>{{pstiTelno}}</td>
		<td>{{prettifyDate sckbdreqYmd}}</td>
		<td style="text-align:left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">{{hsptNm}}</td>
		<td><button onclick="OpenWindow('<%=request.getContextPath()%>/ltct/main-sckbd-detail?manageNo={{manageNo}}','병상신청 상세정보','770','655')" style="background-color: #1a4f72; color: white; border-color: #1a4f72; width: 50px; margin:0 auto; cursor:pointer;" type="button" class="btn btn-block btn-xs">보기</button></td>
	</tr>
{{/each}}
</script>
<script type="text/x-handlebars-template" id="sckbd-pagination-template">
	<li class="page-item each-sckbd-pagination-element">
		<a class="page-link" href="1">
			<i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-sckbd-pagination-element">
		<a class="page-link {{checkDisabled prev}}" href="{{#if prev}}{{prevPageNum}}{{/if}}">
			<i class="fas fa-angle-left" style="color:#1a4f72;"></i>
		</a>
	</li>
	
	{{#each pageNum}}
		<li class="page-item each-sckbd-pagination-element {{sckbdSignActive this}}" >
			<a class="page-link" style="{{sckbdStyleActive this}}" href="{{this}}">
				{{this}}
			</a>
		</li>
	{{/each}}
	
	<li class="page-item each-sckbd-pagination-element">
		<a class="page-link {{checkDisabled next}}" href="{{#if next}}{{nextPageNum}}{{/if}}">
			<i class="fas fa-angle-right" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-sckbd-pagination-element">
		<a class="page-link" href="{{realEndPage}}">
			<i class="fas fa-angle-double-right" style="color:#1a4f72;"></i>
		</a>
	</li>
</script>
<div class="card" style="height: 324px;">
					<div class="card-header ui-sortable-handle">
						<h3 class="card-title">
							<i class="ion ion-clipboard mr-1"></i>입소 승인 대기목록
						</h3>
						<div class="card-tools ">
							<button type="button" class="btn btn-tool" onclick="showMore('C');">
								<i class="fas fa-bars" style="color: black"></i>
							</button>
						</div>
					</div>

					<div class="card-body" style="padding: 0px;">
					<div class="ddoing" style="height: 223px;">
						<div class="table-responsive">
							<table class="table m-0" style="text-align: center;">
								<thead>
									<tr>
										<th style="text-align: center; width: 15%;">성명</th>
										<th style="text-align: center; width: 10%;">나이</th>
										<th style="text-align: center; width: 10%;">성별</th>
										<th style="text-align: center; width: 15%;">연락처</th>
										<th style="text-align: center; width: 15%;">신청일자</th>
										<th style="text-align: center; width: 25%;">신청기관</th>
										<th style="text-align: center; width: 10%;">상세정보</th>
									</tr>
								</thead>
								<tbody id="sckbd-table-tbody">
									<tr class="each-sckbd-element">
										<td colspan="7">페이지 로딩중 입니다.</td>
									</tr>
								</tbody>
							</table>
						</div>

					</div>
							<div class="card-footer" style="text-align: center; background-color: white; padding: 0; height: 57px;">
									<ul class="sckbd-pagination pagination pagination-sm" id="sckbd-pagination-ul">
									</ul>
								<form id="sckbdListForm">
									<input type='hidden' name="page" value="" />
									<input type='hidden' name="perPageNum" value="" />
								</form>
							</div>
					</div>
				</div>