<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/x-handlebars-template" id="res-template">
{{#each .}}
	<tr class="each-res-element">
		<td style="text-align:left;">{{pstiNm}}</td>
		<td>{{prettifyDate reqYmd}}</td>
		<td><span class="badge badge-{{fnBadgetPstvYn pstvYn}}">{{fnPstvYn pstvYn}}</span></td>
	</tr>
{{/each}}
</script>
<script type="text/x-handlebars-template" id="res-pagination-template">
	<li class="page-item each-res-pagination-element">
		<a class="page-link" href="1">
			<i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-res-pagination-element">
		<a class="page-link {{checkDisabled prev}}" href="{{#if prev}}{{prevPageNum}}{{/if}}">
			<i class="fas fa-angle-left" style="color:#1a4f72;"></i>
		</a>
	</li>
	
	{{#each pageNum}}
		<li class="page-item each-res-pagination-element {{resSignActive this}}" >
			<a class="page-link" style="{{resStyleActive this}}" href="{{this}}">
				{{this}}
			</a>
		</li>
	{{/each}}
	
	<li class="page-item each-res-pagination-element">
		<a class="page-link {{checkDisabled next}}" href="{{#if next}}{{nextPageNum}}{{/if}}">
			<i class="fas fa-angle-right" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-res-pagination-element">
		<a class="page-link" href="{{realEndPage}}">
			<i class="fas fa-angle-double-right" style="color:#1a4f72;"></i>
		</a>
	</li>
</script>
<div class="card" style="position: relative; left: 0px; top: 0px; height:290px;">
					<div class="card-header ui-sortable-handle" style="cursor: move;">
						<h3 class="card-title">
							<i class="ion ion-clipboard mr-1"></i> 재검결과 목록
						</h3>
						<div class="card-tools" style="height:30px;">
							<button type="button" class="btn btn-tool" onclick="showMore('B');">
								<i class="fas fa-bars" style="color: black"></i>
							</button>
						</div>
					</div>

					<div class="card-body" style="padding: 0px;">
					<div class="ddoing" style="height: 194px;">
						<div class="table-responsive">
							<table class="table m-0" style="text-align: center;">
								<thead>
									<tr>
										<th style="text-align: center; width:30%;">성명</th>
										<th style="text-align: center; width:35%;">검사일자</th>
										<th style="text-align: center; width:35%;">결과</th>
									</tr>
								</thead>
								<tbody id="res-table-tbody">
									<tr class="each-res-element">
										<td colspan="3">페이지 로딩중입니다.</td>
									</tr>
								</tbody>
							</table>

						</div>
					  </div>
							<div class="card-footer" style="margin-bottom:0px; text-align: center; background-color: white; padding: 0; height: 50px;">
									<ul class="res-pagination pagination pagination-sm" id="res-pagination-ul">
									</ul>
								<form id="resListForm">
									<input type='hidden' name="page" value="" />
									<input type='hidden' name="perPageNum" value="" />
								</form>
							</div>
					</div>
				</div>