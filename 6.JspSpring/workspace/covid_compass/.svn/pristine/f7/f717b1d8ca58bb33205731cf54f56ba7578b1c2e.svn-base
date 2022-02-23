<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/x-handlebars-template" id="isoptnt-template">
{{#each .}}
	<tr class="each-isoptnt-element">
		<td><input {{fnToday today}} type="checkbox" class="form-check-input" onclick="cancleAll();" name="manageNo" style="margin-left:-6px;" value="{{manageNo}}"></td>
		<td style="text-align:left;">{{pstiNm}}</td>
		<td>{{age}}</td>
		<td>{{fnGender gender}}</td>
		<td>{{pstiTelno}}</td>
		<td style="text-align:left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">{{hsptNm}}</td>
		<td>{{prettifyDate inYmd}}</td>
		<td><span class="badge badge-{{fnFeverBadge bdtemp}}">{{fnBdtempCheck bdtemp}}</span></td>
	</tr>
{{/each}}
</script>
<script type="text/x-handlebars-template" id="isoptnt-pagination-template">
	<li class="page-item each-isoptnt-pagination-element">
		<a class="page-link" href="1">
			<i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-isoptnt-pagination-element">
		<a class="page-link {{checkDisabled prev}}" href="{{#if prev}}{{prevPageNum}}{{/if}}">
			<i class="fas fa-angle-left" style="color:#1a4f72;"></i>
		</a>
	</li>
	
	{{#each pageNum}}
		<li class="page-item each-isoptnt-pagination-element {{isoptntSignActive this}}" >
			<a class="page-link" style="{{isoptntStyleActive this}}" href="{{this}}">
				{{this}}
			</a>
		</li>
	{{/each}}
	
	<li class="page-item each-isoptnt-pagination-element">
		<a class="page-link {{checkDisabled next}}" href="{{#if next}}{{nextPageNum}}{{/if}}">
			<i class="fas fa-angle-right" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-isoptnt-pagination-element">
		<a class="page-link" href="{{realEndPage}}">
			<i class="fas fa-angle-double-right" style="color:#1a4f72;"></i>
		</a>
	</li>
</script>
<script>
function selectAll(checkBox){
	var length = document.getElementsByName("manageNo").length;
		if(document.getElementById('selectAll').checked==true){
			for(var i=0; i<length; i++){
				if(document.getElementsByName('manageNo')[i].disabled==false){
					document.getElementsByName("manageNo")[i].checked=true;
				}
			}
		}

	if(document.getElementById('selectAll').checked==false){
		for(var i=0; i<length; i++) document.getElementsByName("manageNo")[i].checked=false;
	}
}
function cancleAll(){
	if(document.getElementById('selectAll').checked==true){
		document.getElementById('selectAll').checked=false;
	}
}
function requestSmpl(){
	var manageNo = '';
	var count = 0;
	var pbhtNm = $('option[class="each-pbhtlist-element pbhtNo"]:selected').text();
	$('input[class="form-check-input"]:checked').each(function(){
		manageNo += $(this).val()+ ",";
		count = count + 1;
	});
	var pbhtNo = $('option[class="each-pbhtlist-element pbhtNo"]:selected').val();
	
	if(count == 0){
		alert("재검요청할 입소자를 선택해주세요.");
		return;
	}
	$.ajax({
		url: '<%=request.getContextPath()%>/rest-ltct/request-smpl',
		type: 'post',
		data : {'manageNo' : manageNo, 'pbhtNo' : pbhtNo},
		success: function(success){
			alert(count+"명의 시료를 " + pbhtNm +"에 성공적으로 전달하였습니다.");
			location.reload();
		},
		error : function(error){
			alert('error' + error.status);
		}
	})
}
</script>
<script type="text/x-handlebars-template" id="pbht-list-template">
{{#each .}}
<option class="each-pbhtlist-element pbhtNo" value="{{pbhtNo}}">{{instNm}}</option>
{{/each}}
</script>
<div class="card" style="position: relative; left: 0px; top: 0px; height:290px;">
					<div class="card-header ui-sortable-handle" style="cursor: move;">
						<h3 class="card-title">
							<i class="ion ion-clipboard mr-1"></i> 입소자 목록
						</h3>
						<div class="card-tools" style="height:30px;">
							<select class="form-control" name="pbhtNm" id="pbhtlist-select" style="width: 230px; display:inline; height: 100%; max-height: 100px;">
							</select>
							<button class="btn btn-success btn-sm" onclick="requestSmpl();" type="button" style="border-color:#1a4f72; height:100%; background: #1a4f72; color: white; margin-bottom: 4px;">재검요청</button>
							<button type="button" class="btn btn-tool" onclick="showMore('A');">
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
										<th style="text-align: center; width:10%;"><input id="selectAll" type="checkbox" onclick="selectAll();" style="margin:0px;" name="manage_check_all"></th>
										<th style="text-align: center; width:10%;">성명</th>
										<th style="text-align: center; width:10%;">나이</th>
										<th style="text-align: center; width:10%;">성별</th>
										<th style="text-align: center; width:15%;">연락처</th>
										<th style="text-align: center; width:25%;">신청기관</th>
										<th style="text-align: center; width:10%;">입소일자</th>
										<th style="text-align: center; width:10%;">체온</th>
									</tr>
								</thead>
								<tbody id="isoptnt-table-tbody">
									<tr class="each-isoptnt-element">
										<td colspan="8">페이지 로딩중 입니다.</td>
									</tr>
								</tbody>
							</table>
						</div>

					</div>
					<div class="card-footer" style="margin-bottom:0px;text-align: center; background-color: white; padding: 0; height: 50px;">
								<ul class="isoptnt-pagination pagination pagination-sm" id="isoptnt-pagination-ul">
								</ul>
							<form id="isoptntListForm">
								<input type='hidden' name="page" value="" />
								<input type='hidden' name="perPageNum" value="" />
							</form>
					</div>
				</div>
</div>