<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template" id="manage-template">
{{#each .}}
  <tr class="each-mberManage-element">
  	<td style="text-align: left;">{{mberId}}</td>
	<td>{{mberNm}}</td>
	<td>{{prettifyDate mberBir}}</td>
    <td>{{mberTelno}}</td>
    <td style="text-align: left;">{{mberEmail}}</td>
    <td style="text-align: left;">{{mberAdres}}</td>
   <td><button type="button" onclick="mberDelete('{{mberNm}}', '{{mberNo}}');" class="btn btn-block btn-outline-danger btn-sm" style="{{fnCodeCheck mberCode}}">삭제</button></td>
  </tr>
{{/each}}
</script>

<script type="text/x-handlebars-template"
	id="manage-pagination-template">
	<li class="page-item each-mberManage-pagination-element">
		<a class="page-link" href="1">
			<i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-mberManage-pagination-element">
		<a class="page-link" href="{{#if prev}}{{prevPageNum}}{{/if}}">
			<i class="fas fa-angle-left" style="color:#1a4f72;"></i>
		</a>
	</li>
	
	{{#each pageNum}}
		<li class="page-item each-mberManage-pagination-element {{signActive this}}" >
			<a class="page-link" style="{{styleActive this}}" href="{{this}}">
				{{this}}
			</a>
		</li>
	{{/each}}
	
	<li class="page-item each-mberManage-pagination-element">
		<a class="page-link" href="{{#if next}}{{nextPageNum}}{{/if}}">
			<i class="fas fa-angle-right" style="color:#1a4f72;"></i>
		</a>
	</li>

	<li class="page-item each-mberManage-pagination-element">
		<a class="page-link" href="{{realEndPage}}">
			<i class="fas fa-angle-double-right" style="color:#1a4f72;"></i>
		</a>
	</li>
</script>
<script>
var page = 1;

window.onload = function(){


	var url = '<%=request.getContextPath()%>/rest-insp/emp-manage-list-go';

		list_go(page, url);
		$('ul.pagination').on('click', 'li a', function(event) {
			if ($(this).attr("href")) {
				page = $(this).attr("href");
				getPage(url, make_form(page));
			}
			return false;
		});

	}
</script>

<script>

function mberDelete(mberNm, mberNo){
	
	$.ajax({
		url : '<%=request.getContextPath()%>/insp/mberDelete',
		type : 'post',
		data : {'mberNo' : mberNo},
		success: function(res){
			alert(mberNm+"님의 정보가 삭제되었습니다.");
			location.reload();
		},
		error : function(error){
			alert('error' + error.status);
		}
	})
}

	function list_go(pageParam, url) {
		getPage(url, make_form(pageParam));
	}
	function make_form(pageParam) {
		var jobForm = $('#jobForm');

		if (!pageParam)
			page = 1;

		page = pageParam;

		jobForm.find("[name='page']").val(page);
		jobForm.find("[name='perPageNum']").val(
				$('select[name="perPageNum"]').val());
		//  jobForm.find("[name='perPageNum']").val(2);
		jobForm.find("[name='searchType']").val(
				$('select[name="searchType"]').val());
		jobForm.find("[name='keyword']").val(
				$('div.input-group>input[name="keyword"]').val());

		return jobForm;
	}

	function getPage(handlebarsProcessingURL, form) {
		$.ajax({
			url : handlebarsProcessingURL,
			type : 'POST',
			dataType : 'JSON',
			data : form.serialize(),
			success : function(dataMap) {
				printData(dataMap.mberManageList, $('#mberManage-table-tbody'),
						$('#manage-template'), '.each-mberManage-element');
				printPagination(dataMap.pageMaker,
						$('#manage-list-pagination-ul'),
						$('#manage-pagination-template'),
						'.each-mberManage-pagination-element');
			},
			error : function(error) {
				alert('error' + error.status);
			}
		})
	}

	function printData(jsonArray, target, templateObject, removeClass) {
		var template = Handlebars.compile(templateObject.html()); // templateObject를 json data로 받으면 마크업을 return하는 function. template로 반환

		var html = template(jsonArray); // 함수 template에 파라미터 jsonArray를 넣어서 실행하여 html 생성

		$(removeClass).remove(); // 해당 html요소를 append하기 전에 기존 내용 지우기. 안그러면 리스트 목록이 10개씩 보이는게 아니라 10, 20, 30개 등 클릭할때마다 10개씩 추가된다.

		target.append(html);
	}

	function printPagination(pageMaker, target, templateObject, removeClass) {
		var pageNum = new Array(pageMaker.endPage - pageMaker.startPage + 1);

		for (var i = 0; i < pageMaker.endPage - pageMaker.startPage + 1; i++) {
			pageNum[i] = pageMaker.startPage + i;
		}

		pageMaker.pageNum = pageNum;
		pageMaker.prevPageNum = pageMaker.startPage - 1;
		pageMaker.nextPageNum = pageMaker.endPage + 1;

		var template = Handlebars.compile(templateObject.html());
		var html = template(pageMaker);
		target.html("").html(html);

	}
</script>
<script>
	Handlebars.registerHelper({
		"prettifyDate" : function(timeValue){
			if(timeValue){
				var dateObj = new Date(timeValue);
				var year = dateObj.getFullYear();
				var month = dateObj.getMonth() + 1;
				month += '';
				if(month.length < 2){
					month = '0' + month;
				}
				var date = dateObj.getDate();
				date += '';
				if(date.length < 2){
					date = '0' + date;
				}
				return year + "-" + month + "-" + date;
			}
			return "없음";
		},
		"signActive" : function(pageNum) {
			if (pageNum == page) {
				return 'active';
			}
		},
		"styleActive" : function(pageNum) {
			if (pageNum == page) {
				return 'background:#1a4f72; border-color:#1a4f72;';
			} else {
				return 'color:#1a4f72';
			}
		},
		"fnCodeCheck" : function(mberCode){
			if(mberCode == 'B121'){
				return 'display:none;';
			}else{
				return;
			}
		}
	});
</script>


<section class="content">

	<div class="table-responsive">
		<div class="confirm" style="height: 590px;">
			<table class="table table-hover text-nowrap"
				style="text-align: center;">
				<thead>
					<tr role="row">
						<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
							aria-label="">아이디</th>
						<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
							aria-label="">성명</th>
						<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
							aria-sort="ascending" aria-label="">생년월일</th>
						<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
							aria-label="">전화번호</th>
						<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
							aria-label="">이메일</th>
						<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
							aria-label="">주소</th>
						<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
							aria-label=""></th>
					</tr>
				</thead>
				<tbody id="mberManage-table-tbody">
					<tr class="each-mberManage-element">
						<td colspan="8">페이지 로딩중 입니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<div class="card-footer clearfix" style="background-color: white;">
		<ul class="pagination justify-content-center m-0"
			id="manage-list-pagination-ul">
		</ul>
	</div>
	<form id="jobForm">
		<input type='hidden' name="page" value="" /> <input type='hidden'
			name="perPageNum" value="" /> <input type='hidden' name="searchType"
			value="" /> <input type='hidden' name="keyword" value="" />
	</form>
</section>
