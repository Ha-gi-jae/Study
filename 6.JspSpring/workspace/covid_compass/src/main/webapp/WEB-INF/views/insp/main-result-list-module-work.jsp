<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/x-handlebars-template" id="result-template">
{{#each .}}
	<tr class="each-result-element" data-psti-no="{{pstiNo}}">
		<td style="text-align:left;">{{pstiNm}}</td>
		<td style="text-align:center;">{{prettifyDate reqYmd}}</td>
		<td style="text-align:center;"><span class="badge badge-{{fnSmplBadgeChk smplResCode}}">{{fnResCode smplResCode}}</span></td>
	</tr>
{{/each}}
</script>
<script type="text/x-handlebars-template" id="result-pagination-template">
	<li class="page-item each-result-pagination-element">
		<a class="page-link" href="1">
			<i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-result-pagination-element">
		<a class="page-link {{checkDisabled prev}}" href="{{#if prev}}{{prevPageNum}}{{/if}}">
			<i class="fas fa-angle-left" style="color:#1a4f72;"></i>
		</a>
	</li>
	
	{{#each pageNum}}
		<li class="page-item each-result-pagination-element {{resSignActive this}}" >
			<a class="page-link" style="{{resStyleActive this}}" href="{{this}}">
				{{this}}
			</a>
		</li>
	{{/each}}
	
	<li class="page-item each-result-pagination-element">
		<a class="page-link {{checkDisabled next}}" href="{{#if next}}{{nextPageNum}}{{/if}}">
			<i class="fas fa-angle-right" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-result-pagination-element">
		<a class="page-link" href="{{realEndPage}}">
			<i class="fas fa-angle-double-right" style="color:#1a4f72;"></i>
		</a>
	</li>
</script>
<div class="card pr-0" style="padding-bottom: 10px; top:5px; height: 290px;">
				<div class="card-header ui-sortable-handle">
					<h3 class="card-title" style="font-weight: bold; color: #333333; font-size: 16px;">
						<i class="ion ion-clipboard mr-1"></i> 검사결과 목록
					</h3>
					<div class="card-tools ">
							<button type="button" class="btn btn-tool" onclick="showMore('C');">
								<i class="fas fa-bars" style="color: black"></i>
							</button>
						</div>
				</div>
				
				<!-- /.card-header -->
				<div class="card-body" style="padding: 0px;">
					<div class="table-responsive">
						<table class="table m-0" style="text-align: center;">
							<thead>
								<tr>
									<th style="width: 30%; text-align: center;">성명</th>
									<th style="width: 35%; text-align: center;">요청일자</th>
									<th style="width: 35%; text-align: center;">검사결과</th>
								</tr>
							</thead>
							<tbody id="result-table-tbody">
								<tr class="each-result-element">
									<td colspan="3">페이지 로딩중 입니다.</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
									<div class="card-footer" style="height: 30px; text-align: center; background: white;">
											<ul class="result-pagination pagination pagination-sm m-0" id="result-list-pagination-ul">
											</ul>
										<form id="resultListForm">
											<input type='hidden' name="page" value="" />
											<input type='hidden' name="perPageNum" value="" />
										</form>
									</div>
				<!-- /.card-body -->
			</div>
			<!-- /.card-header -->
			<!-- /.card-body -->