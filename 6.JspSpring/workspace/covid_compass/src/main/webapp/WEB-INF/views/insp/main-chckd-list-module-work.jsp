<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/x-handlebars-template" id="chckd-template">
{{#each .}}
	<tr class="each-chckd-element" style="data-psti-no="{{pstiNo}}">
		<td onclick="event.cancelBubble=true"><input type="checkbox" class="form-check-input" onclick="cancleAll();" style="cursor:pointer; margin-left: -22px; vertical-align:middle;" name="pstiNo" value="{{pstiNo}}"></td>
		<td style="text-align:center;">{{pstiNo}}</td>
		<td style="text-align:left;">{{pstiNm}}</td>
		<td style="text-align:center;">{{fnGender gender}}</td>
		<td style="text-align:center;">{{age}}</td>
		<td style="text-align:center;">{{pstiTelno}}</td>
		<td style="text-align:center;">{{prettifyDate htscYmd}}</td>
		<td style="text-align:center">{{prettifyDate resYmd}}</td>
		<td style="text-align:center"><span class="badge badge-{{fnBadgePstvYn pstvYn}}">{{fnPstvYn pstvYn}}</span></td>
	</tr>
{{/each}}
</script>
<script type="text/x-handlebars-template" id="chckd-pagination-template">
	<li class="page-item each-chckd-pagination-element">
		<a class="page-link" href="1">
			<i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-chckd-pagination-element">
		<a class="page-link {{checkDisabled prev}}" href="{{#if prev}}{{prevPageNum}}{{/if}}">
			<i class="fas fa-angle-left" style="color:#1a4f72;"></i>
		</a>
	</li>
	
	{{#each pageNum}}
		<li class="page-item each-chckd-pagination-element {{chkSignActive this}}" >
			<a class="page-link" style="{{chkStyleActive this}}" href="{{this}}">
				{{this}}
			</a>
		</li>
	{{/each}}
	
	<li class="page-item each-chckd-pagination-element">
		<a class="page-link {{checkDisabled next}}" href="{{#if next}}{{nextPageNum}}{{/if}}">
			<i class="fas fa-angle-right" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-chckd-pagination-element">
		<a class="page-link" href="{{realEndPage}}">
			<i class="fas fa-angle-double-right" style="color:#1a4f72;"></i>
		</a>
	</li>
</script>
<div class="card pl-0" style="padding-bottom: 10px; top:5px; height: 290px;">
				<div class="card-header ui-sortable-handle" >
					<h3 class="card-title" style="font-weight: bold; color: #333333; font-size: 16px;">
						검사요청대기 목록
					</h3>
					<div class="card-tools">
					<button class="btn btn-success btn-sm" onclick="registRequestSmpl();" type="button" style="padding-top: 0px;border-color:#1a4f72; height:20px; background: #1a4f72; color: white;">검사요청</button>
							<button type="button" class="btn btn-tool" onclick="showMore('B');">
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
									<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">
										<div class="form-group">
											<div class="form-check" style="margin-bottom: -20px;">
												<input type="checkbox" style="cursor:pointer; float : left; vertical-align: middle;" name="psti_check_all" id="selectAll" onclick="selectAll();">
											</div>
										</div>
									</th>
									<th tabindex="0" aria-controls="example2" rowspan="1" style="width: 10%; text-align: center;" colspan="1" aria-label="">피검자 번호</th>
									<th tabindex="0" aria-controls="example2" rowspan="1" style="width: 10%; text-align: center;" colspan="1" aria-label="">성명</th>
									<th tabindex="0" aria-controls="example2" rowspan="1" style="width: 10%; text-align: center;" colspan="1" aria-label="">성별</th>
									<th tabindex="0" aria-controls="example2" rowspan="1" style="width: 10%; text-align: center;" colspan="1" aria-label="">나이</th>
									<th tabindex="0" aria-controls="example2" rowspan="1" style="width: 15%; text-align: center;" colspan="1" aria-label="">연락처</th>
									<th tabindex="0" aria-controls="example2" rowspan="1" style="width: 15%; text-align: center;" colspan="1" aria-sort="ascending" aria-label="">검사일</th>
									<th tabindex="0" aria-controls="example2" rowspan="1" style="width: 10%; text-align: center;" colspan="1" aria-label="">결과일</th>
									<th tabindex="0" aria-controls="example2" rowspan="1" style="width: 10%; text-align: center;" colspan="1" aria-label="">검사결과</th>
								</tr>
							</thead>
							<tbody id="chckd-table-tbody">
								<tr class="each-chckd-element">
									<td colspan="9">페이지 로딩중입니다.</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
										<div class="card-footer" style="height: 32px; text-align: center; background: white;">
												<ul class="chckd-pagination pagination pagination-sm m-0" id="chckd-list-pagination-ul" style="margin-top: 1px;">
												</ul>
											<form id="chckdListForm">
												<input type='hidden' name="page" value="" />
												<input type='hidden' name="perPageNum" value="" />
											</form>
										</div>
				<!-- /.card-body -->
			</div>
<script>
function selectAll(checkBox){
	var length = document.getElementsByName("pstiNo").length;
	if(document.getElementById('selectAll').checked==true){
		for(var i=0; i<length; i++) document.getElementsByName("pstiNo")[i].checked=true;
	}

	if(document.getElementById('selectAll').checked==false){
		for(var i=0; i<length; i++) document.getElementsByName("pstiNo")[i].checked=false;
	}


}
function cancleAll(){

	if(document.getElementById('selectAll').checked==true){
		document.getElementById('selectAll').checked=false;
	}
}
function registRequestSmpl(){
	var pstiNo ='';
	var pstiCount = 0;
	$('input[class="form-check-input"]:checked').each(function(){
		pstiNo += $(this).val() + ",";
		pstiCount += 1;
	});
	
	if(pstiCount == 0){
		alert("선택된 시료가 없습니다.");
		return;
	}
	$.ajax({
		url : '<%=request.getContextPath()%>/rest-insp/regist-Request-Smpl',
		type: 'post',
		data : {"pstiNo" : pstiNo},
		success : function(result){
			alert(pstiCount+"명의 시료를 성공적으로 보건소에 전달하였습니다.");
			location.reload();
		},
		error : function(error){
			alert('error' + error.status);
		}
		
	})
	
}
</script>