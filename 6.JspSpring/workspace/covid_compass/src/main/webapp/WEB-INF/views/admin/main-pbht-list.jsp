<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/x-handlebars-template"  id="main-pbht-list-template" >
{{#each .}}
		<tr class="each-pbht-element" style="cursor: default;">
		<td onclick="event.cancelBubble=true" style="cursor: default;">
		<input type="checkbox" name="instCheckBoxPb" value="{{instNo}}" onclick="cancleAll2()"></td>
		<td><span class="badge badge-success">보건소</span></td>
		<td style="text-align:left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
			{{instNm }}</td>
		<td style="text-align:left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
			{{instAdres }}</td>
		<td>{{instTelno }}</td>
		<td>{{empCnt }}</td>
		</tr>
{{/each}}
</script>
<script type="text/x-handlebars-template" id="main-pbht-pagination-template">
<li class="page-item each-pbht-pagination-element">
		<a class="page-link" href="1"> 
			<i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
    	</a>
    </li>
    <li class="page-item each-pbht-pagination-element">
		<a class="page-link" href="{{#if prev}}{{prevPageNum}}{{/if}}"> 
			<i class="fas fa-angle-left" style="color:#1a4f72;"></i>
    	</a>
	</li>

{{#each pageNum}}
    <li class="page-item each-pbht-pagination-element {{signActive this}}" >
		<a class="page-link" href="{{this}}" >{{this}}
		</a>
	</li>
{{/each}}

    <li class="page-item each-pbht-pagination-element">
		<a class="page-link" href="{{#if next}}{{nextPageNum}}{{/if}}"> 
			<i class="fas fa-angle-right" style="color:#1a4f72;"></i>
    	</a>
	</li>
    <li class="page-item each-pbht-pagination-element">
		<a class="page-link" href="{{realEndPage}}"> 
			<i class="fas fa-angle-double-right" style="color:#1a4f72;"></i>
		</a>
	</li>
</script>

 <div class="card-body" style="padding: 0px; height:252px;">
	<div class="table-responsive">
		<table class="table table-hover text-nowrap"
			style="text-align: center; table-layout: fixed;">
			<thead>
				<tr role="row">
					<th style="width: 5%;"><input type="checkbox"
						id="selectAll2" onclick="selectAll2()"></th>
					<th tabindex="0" aria-controls="example2" rowspan="1"
						style="text-align: center; width: 15%;" colspan="1" aria-label="">구분</th>
					<th tabindex="0" aria-controls="example2" rowspan="1"
						style="text-align: center; width: 30%;" colspan="1" aria-label="">기관명</th>
					<th tabindex="0" aria-controls="example2" rowspan="1"
						style="text-align: center; width: 32%;" colspan="1"
						aria-sort="ascending" aria-label="">주소</th>
					<th tabindex="0" aria-controls="example2" rowspan="1"
						style="text-align: center; width: 15%;" colspan="1" aria-label="">연락처</th>
					<th tabindex="0" aria-controls="example2" rowspan="1"
						style="text-align: center; width: 15%;" colspan="1" aria-label="">직원수</th>
				</tr>
			</thead>
			<tbody id="main-pbht-list-table-body">
				<tr class="each-pbht-element">
					<td id="initialTd2" colspan="6"><strong>페이지 로딩중 입니다.</strong></td>
				</tr>
			</tbody>
		</table>

	</div>

</div>
<div class="card-footer clearfix" style="background: white;">
	<ul class="pbht-pagination pagination justify-content-center m-0" id="main-pbht-pagination-ul">
    </ul>
</div>

<form id="pbhtJobForm">
	<input type='hidden' name="page" value="" />
	<input type='hidden' name="perPageNum" value=""/>
	<input type='hidden' name="searchType" value="pbht" />
	<input type='hidden' name="searchType2" value="" />
	<input type='hidden' name="keyword" value="" />
</form>

<script>
	function selectAll2(checkBox){
		var length = document.getElementsByName("instCheckBoxPb").length;
		if(document.getElementById('selectAll2').checked==true){
			for(var i=0; i<length; i++) document.getElementsByName("instCheckBoxPb")[i].checked=true;
		}
	
		if(document.getElementById('selectAll2').checked==false){
			for(var i=0; i<length; i++) document.getElementsByName("instCheckBoxPb")[i].checked=false;
		}
	
	
	}
	function cancleAll2(){
	
		if(document.getElementById('selectAll2').checked==true){
			document.getElementById('selectAll2').checked=false;
		}
	}
</script>









