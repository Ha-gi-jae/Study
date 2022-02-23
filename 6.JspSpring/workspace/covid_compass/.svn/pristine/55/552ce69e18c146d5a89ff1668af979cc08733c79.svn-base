<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/x-handlebars-template" id="chckd-detail-template">
	<table class="table table-bordered chckd-detail-element">
		<tbody>
			<tr>
				<th class="col-md-2" style="text-align: left;">성명</th>
				<td class="col-md-4" style="text-align: left;">{{pstiNm}}</td>
				<th class="col-md-2" style="text-align: left;">국적</th>
				<td class="col-md-4" style="text-align: left;">{{nlty}}</td>
			</tr>
			<tr class="shittr" style="text-align: left;">
				<th style="text-align: left;">검사일자</th>
				<td style="text-align: left;">{{prettifyDateDetail htscYmd}}</td>
				<th style="text-align: left;">백신접종</th>
				<td style="text-align: left;">{{vac}}</td>
			</tr>
			<tr class="shittr" style="text-align: left;">
				<th>성별</th>
				<td>{{fnGender gender}}</td>
				<th>나이</th>
				<td>{{age}}</td>
			</tr>
			<tr class="shittr" style="text-align: left;">
				<th>발열여부</th>
				<td>{{feverYn}}</td>
				<th>임신여부</th>
				<td>{{pregnYn}}</td>
			</tr>
			<tr class="shittr" style="text-align: left;">
				<th style="vertical-align: middle; padding: 0px;padding-left: 9px;font-size: 12px;" >주민/외국인<br>등록번호</th>
				<td id="dataRrn">{{rrn}}</td>
				<th>연락처</th>
				<td>{{pstiTelno}}</td>
			</tr>
			<tr class="shittr" style="text-align: left;">
				<th>주소</th>
				<td colspan="3">{{pstiAdres}}</td>
			</tr>
			<tr class="shittr" style="text-align: left;">
				<th>증상</th>
				<td colspan="3">{{symptms}}</td>
			</tr>
   </tbody>
               </table>
	<table class="table table-bordered chckd-detail-element" style="margin-top: 12px;">
		<tbody>

			<tr class="shittr" style="text-align: left;">
				<th class="col-md-2">피검자 코드</th>
				<td class="col-md-4">{{pstiNo}}</td>
                <th class="col-md-2">체온</th>
                <td class="col-md-4">{{bdheat}}</td>
			</tr>
                  <tr class="shittr"  style="text-align: left;">
                    <th>확정일자</th>
                    <td></td>
                    <th>검사결과</th>
                    <td></td>
                  </tr>
                  <tr style="text-align: left;">
                    <th>최저혈압</th>
                    <td>{{minBrssr}}</td>
                    <th>최고혈압</th>
                    <td>{{maxBrssr}}</td>
                  </tr>
                  <tr class="shittr"  style="text-align: left;">
                    <th>신장</th>
                    <td>{{bdheight}}</td>
                    <th>체중</th>
                    <td>{{bdweight}}</td>
                  </tr>
               	</tbody>
	</table>
</script>

<script>
function showDetail(pstiNo){
	
	var trs = $('tr.each-chckd-element');
	
	trs.removeClass('on');
	
	var target = $('tr[data-psti-no="'+pstiNo+'"]');
	
	target.addClass('on');
	
	var url = '<%=request.getContextPath()%>/rest-insp/chckd-detail?pstiNo='+pstiNo;
	$.ajax({
		url : url,
		type : 'post',
		dataType : 'json',
		success : function(chckd){

			$('#enableReadRrn').data('rrn', chckd.rrn);
			$('#enableReadRrn').data('manageNo', pstiNo);
			chckd.rrn = (chckd.rrn.substring(0,8) + '******');
			
			printData(chckd, $('#chckd-detail-module'), $('#chckd-detail-template'), '.chckd-detail-element');
		},
		error : function(error){
			alert('error' + error.status);
		}
	});
}
</script>
<div id="chckd-detail-module">
<table class="table table-bordered chckd-detail-element">
	<tbody>
		<tr style="text-align: left;">
			<th class="col-md-2">성명</th>
			<td class="col-md-4"></td>
			<th class="col-md-2">국적</th>
			<td class="col-md-4"></td>
		</tr>
		<tr class="shittr" style="text-align: left;">
			<th>검사일자</th>
			<td></td>
			<th>백신접종</th>
			<td></td>
		</tr>
		<tr class="shittr" style="text-align: left;">
			<th>성별</th>
			<td></td>
			<th>나이</th>
			<td></td>
		</tr>
		<tr class="shittr" style="text-align: left;">
			<th>발열여부</th>
			<td></td>
			<th>임신여부</th>
			<td></td>
		</tr>
		<tr class="shittr" style="text-align: left;">
			<th style="vertical-align: middle; padding: 0px;padding-left: 9px;font-size: 12px;" >주민/외국인<br>등록번호</th>
			<td></td>
			<th>연락처</th>
			<td></td>
		</tr>
		<tr class="shittr" style="text-align: left;">
			<th>주소</th>
			<td colspan="3"></td>
		</tr>
		<tr class="shittr" style="text-align: left;">
			<th>증상</th>
			<td colspan="3"></td>
		</tr>
		</tbody>
</table>
		
			<table class="table table-bordered chckd-detail-element" style="margin-top: 12px;">
		<tbody>
	
		<tr class="shittr" style="text-align: left;">
			<th class="col-md-2">피검자 코드</th>
			<td class="col-md-4"></td>
     		<th class="col-md-2">체온</th>
     		<td class="col-md-4"></td>
		</tr>
   <tr class="shittr"  style="text-align: left;">
     <th>확정일자</th>
     <td></td>
     <th>검사결과</th>
     <td></td>
   </tr>
   <tr style="text-align: left;">
     <th>최저혈압</th>
     <td></td>
     <th>최고혈압</th>
     <td></td>
   </tr>
   <tr class="shittr"  style="text-align: left;">
     <th>신장</th>
     <td></td>
     <th>체중</th>
     <td></td>
   </tr>
   	</tbody>
	</table>

</div>