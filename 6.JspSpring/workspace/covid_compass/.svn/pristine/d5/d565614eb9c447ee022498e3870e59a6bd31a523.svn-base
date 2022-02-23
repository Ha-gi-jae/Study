<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
printData(dataMap.pbhtList, $('#pbht-table-tbody'), $('#pbht-template'), '.each-pbht-element');
printPagination(dataMap.pageMaker, $('#pbht-pagination-ul'), $('#pbht-pagination-template'), '.each-pbht-pagination-element');
<script type="text/x-handlebars-template" id="pbht-template">
{{#each .}}
	<tr class="each-pbht-element" style="text-align: center;">
        <td>{{instNm}}</td>
        <td>{{instAdres}</td>
        <td>{{instTelno}}</td>
    </tr>
{{/each}}
</script>
<script type="text/x-handlebars-template" id="pbht-pagination-template">
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
			<a class="page-link" style="{{styleActive this}}" href="{{this}}">
				{{this}}
			</a>
		</li>
	{{/each}}
	
	<li class="page-item each-pbht-pagination-element">
		<a class="page-link" href="{{#if next}}{{nextPageNum}}{{/if}}">
			<i class="fas fa-angle-right" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-pbht-pagination-element">
		<a class="page-link href="{{realEndPage}}">
			<i class="fas fa-angle-double-right" style="color:#1a4f72;"></i>
		</a>
	</li>
</script>
<table class="table table-sm table-bordered">
                  <thead>
                    <tr style="text-align: center;">
                      <th>병원명</th>
                      <th>주소</th>
                      <th>연락처</th>
                    </tr>
                  </thead>
                  <tbody id="pbht-table-tbody">
                    <tr class="each-pbht-element" style="text-align: center;">
                      <td >페이지 로딩중입니다.</td>
                    </tr>
                  </tbody>
                </table>
                
          <div class="card-footer clearfix" style="background-color: white;">
			<ul class="pbht-pagination pagination justify-content-center m-0" id="pbht-pagination-ul">
			</ul>
		  </div>
		<form id="pbhtForm">
			<input type='hidden' name="page" value="" />
			<input type='hidden' name="perPageNum" value="" />
			<input type='hidden' name="searchType" value="" />
			<input type='hidden' name="keyword" value="" />
		</form>