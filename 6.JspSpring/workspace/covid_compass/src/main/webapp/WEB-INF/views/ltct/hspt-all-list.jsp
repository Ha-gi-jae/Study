<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
table tr td {
	overflow: hidden;
	white-space: initial;
	text-overflow: ellipsis;
	-webkit-box-orient: vertical;
	word-break: break-all;
}
</style>


<div class="ddoing" style="height: 455px">
<table class="table table-bordered" style="table-layout: fixed;">
	<thead>
		<tr style="text-align: center;">
			<th class="col-md-2" style="width:20%;overflow: true;">병원명</th>
			<th class="col-md-6">주소</th>
			<th class="col-md-2 pl-0 pr-0" style="width:10%;">잔여병상</th>
			<th class="col-md-2" style="width: 10%;">가동률</th>
		</tr>
	</thead>
	<tbody id="hspt-all-list-table-tbody">
		<tr class="each-hspt-element">
			<td colspan="4" class="dgnssHsptList">데이터 로딩중 입니다.</td>
		</tr>
	</tbody>
</table>
</div>
<div class="card-footer clearfix pb-0 pt-0" style="background-color: white;">
	<ul class="pagination justify-content-center m-0" id="inptnt-all-pagination-template">
	</ul>
</div>