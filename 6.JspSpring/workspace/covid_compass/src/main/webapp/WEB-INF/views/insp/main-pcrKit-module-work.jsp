<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/x-handlebars-template" id="pcr-template">
{{#each .}}
	<tr class="each-pcr-element">
		<td style="text-align:left">{{mberNm}}</td>
		<td style="text-align:left">{{inputCnt}}</td>
		<td style="text-align:center" class="sorting_1" tabindex="0">{{prettifyDate inputYmd}}</td>
	</tr>
{{/each}}
</script>
<script type="text/x-handlebars-template" id="pcr-pagination-template">
	<li class="page-item each-pcr-pagination-element">
		<a class="page-link" href="1">
			<i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-pcr-pagination-element">
		<a class="page-link {{checkDisabled prev}}" href="{{#if prev}}{{prevPageNum}}{{/if}}">
			<i class="fas fa-angle-left" style="color:#1a4f72;"></i>
		</a>
	</li>
	
	{{#each pageNum}}
		<li class="page-item each-pcr-pagination-element {{pcrSignActive this}}" >
			<a class="page-link" style="{{pcrStyleActive this}}" href="{{this}}">
				{{this}}
			</a>
		</li>
	{{/each}}
	
	<li class="page-item each-pcr-pagination-element">
		<a class="page-link {{checkDisabled next}}" href="{{#if next}}{{nextPageNum}}{{/if}}">
			<i class="fas fa-angle-right" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-pcr-pagination-element">
		<a class="page-link" href="{{realEndPage}}">
			<i class="fas fa-angle-double-right" style="color:#1a4f72;"></i>
		</a>
	</li>
</script>

				<div class="card-header ui-sortable-handle" style="height: 33.59px;">
							<h3 class="card-title" style="font-weight:bold; color: #333333; font-size: 16px;">
								키트관리
							</h3>
							<div class="card-tools">
								<i class="ion ion-clipboard mr-1"></i><b>PCR키트  <span id="kitCount"></span>개</b>
								<button type="button" class="btn btn-tool" onclick="OpenWindow('pcrKitForm', '키트등록', 850,600)">
									<i class="fas fa-plus" style="color: black;"></i>
								</button>
							</div>
				</div>
				<!-- /.card-header -->
				<div class="card-body" style="padding: 0px;">
					<div class="table-responsive">
						<table class="table m-0" style="text-align: center;">
							<thead>
								<tr role="row">
									<th tabindex="0" aria-controls="example2" rowspan="1" style="width: 30%; text-align: center;" colspan="1" class="col-md-4" aria-label="Browser: activate to sort column ascending">이름</th>
									<th tabindex="0" aria-controls="example2" rowspan="1" style="width: 35%; text-align: center;" colspan="1" class="col-md-4" aria-label="Platform(s): activate to sort column ascending">수량</th>
									<th tabindex="0" aria-controls="example2" rowspan="1" style="width: 35%; text-align: center;" colspan="1" class="col-md-4" aria-label="Browser: activate to sort column ascending">등록일</th>
								</tr>
							</thead>
							<tbody id="pcr-table-tbody">
								<tr class="each-pcr-element">
									<td colspan="3">페이지 로딩중입니다.</td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>
				<!-- /.card-body -->
				<div class="card-footer" style="height: 44px; text-align: center; background: white;">
						<ul class="pcr-pagination pagination pagination-sm m-0" id="pcr-list-pagination-ul">
						</ul>
							<form id="pcrListForm">
								<input type='hidden' name="page" value="" />
								<input type='hidden' name="perPageNum" value="" />
							</form>
				</div>