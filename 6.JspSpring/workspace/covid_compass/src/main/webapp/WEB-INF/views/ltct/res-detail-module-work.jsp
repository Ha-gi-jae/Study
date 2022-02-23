<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/x-handlebars-template" id="res-detail-template">
<table class="table table-bordered res-detail-element">
  <tbody>
    <tr style="text-align: left;">
      <th class="col-md-2">성명</th>
      <td class="col-md-4">{{pstiNm}}</td>
      <th class="col-md-2">국적</th>
      <td class="col-md-4">{{nlty}}</td>
    </tr>
    <tr class="shittr"  style="text-align: left;">
      <th>성별</th>
      <td>{{fnGender gender}}</td>
      <th>나이</th>
      <td>{{age}}</td>
    </tr>
    <tr class="shittr"  style="text-align: left;">
      <th>발열여부</th>
      <td>{{feverYn}}</td>
      <th>임신여부</th>
      <td>{{pregnYn}}</td>
    </tr>
    <tr class="shittr"  style="text-align: left;">
      <th>검사일자</th>
      <td>{{prettifyDate reqYmd}}</td>
      <th>누적음성수</th>
      <td>{{ngtvCnt}}</td>
    </tr>
    <tr class="shittr"  style="text-align: left;">
	  <th>결과일자</th>
	  <td>{{prettifyDate resYmd}}</td>
      <th>검사결과</th>
      <td>{{fnsmplResCode smplResCode}}</td>
    </tr>
    <tr class="shittr"  style="text-align: left;">
      <th style="vertical-align: middle; padding: 0px;padding-left: 9px;font-size: 12px;">주민/외국인<br>등록번호</th>
      <td id="dataRrn">{{rrn}}</td>
      <th>연락처</th>
      <td>{{pstiTelno}}</td>
    </tr>
    <tr class="shittr"  style="text-align: left;">
      <th>주소</th>
      <td colspan="3">{{pstiAdres}}</td>
    </tr>
    <tr class="shittr"  style="text-align: left;">
      <th>증상</th>
      <td colspan="3">{{symptms}}</td>
    </tr>
    <tr class="shittr"  style="text-align: left;">
      <th>확진자 코드</th>
      <td colspan="3">{{cnfmNo}}</td>
    </tr>
  </tbody>
</table>
<table class="table table-bordered  res-detail-element" style="margin-top: 12px;">
		<tbody>
			<tr>
				<th class="col-md-2">
					<strong>요청기관</strong>
				</th>
				<td class="col-md-4">{{instNm}}</td>
				<th class="col-md-2">
					<strong>연락처</strong>
				</th>
				<td class="col-md-4">{{instTelno}}</td>
			</tr>

			<tr>
				<th>
					<strong>주소</strong>
				</th>
				<td colspan="5">{{instAdres}}</td>
			</tr>
		</tbody>
	</table>
</script>
<script>
function showDetail(manageNo){
	var trs = $('tr.each-res-element');
	
	trs.removeClass('on');
	
	var target = $('tr[data-manage-no="'+manageNo+'"]');
	
	target.addClass('on');

	var url = '<%=request.getContextPath()%>/rest-ltct/manage-detail?manageNo='+manageNo;
	$.ajax({
		url : url,
		type : 'post',
		dataType : 'json',
		success : function(basicDetail){
			
			$('#enableReadRrn').data('rrn', basicDetail.rrn);
			$('#enableReadRrn').data('manageNo', manageNo);
	      	basicDetail.rrn = (basicDetail.rrn.substring(0,8) + '******');
			
			printData(basicDetail, $('#res-detail-module'), $('#res-detail-template'), '.res-detail-element')
		},
		error : function(error){
			alert('error' + error.status);
		}
	});
}
</script>
			<div id="res-detail-module">
				<table class="table table-bordered res-detail-element">
                  <tbody>
                    <tr style="text-align: left;">
                      <th class="col-md-2">성명</th>
                      <td class="col-md-4"></td>
                      <th class="col-md-2">국적</th>
                      <td class="col-md-4"></td>
                    </tr>
                    <tr class="shittr"  style="text-align: left;">
                      <th>검사일자</th>
                      <td></td>
                      <th>검사결과</th>
                      <td></td>
                    </tr>
                    <tr class="shittr"  style="text-align: left;">
                      <th>성별</th>
                      <td></td>
                      <th>나이</th>
                      <td></td>
                    </tr>
                    <tr class="shittr"  style="text-align: left;">
                      <th>발열여부</th>
                      <td></td>
                      <th>임신여부</th>
                      <td></td>
                    </tr>
                    <tr class="shittr"  style="text-align: left;">
                      <th>연락처</th>
                      <td></td>
                      <th>누적음성수</th>
                      <td></td>
                    </tr>
                    <tr class="shittr"  style="text-align: left;">
                      <th>주민/외국인등록번호</th>
                      <td colspan="3"></td>
                    </tr>
                    <tr class="shittr"  style="text-align: left;">
                      <th>주소</th>
                      <td colspan="3"></td>
                    </tr>
                    <tr class="shittr"  style="text-align: left;">
                      <th>증상</th>
                      <td colspan="3"></td>
                    </tr>
                    <tr class="shittr"  style="text-align: left;">
                      <th>확정일자</th>
                      <td colspan="3"></td>
                    </tr>
                    <tr class="shittr"  style="text-align: left;">
                      <th>확진자 코드</th>
                      <td colspan="3"></td>
                    </tr>
                  </tbody>
                </table>
                <table class="table table-bordered res-detail-element" style="margin-top: 12px;">
					<tbody>
						<tr>
							<th class="col-md-2">
								<strong>담당기관</strong>
							</th>
							<td class="col-md-4" id="inst_nm"></td>
							<th class="col-md-2">
								<strong>연락처</strong>
							</th>
							<td class="col-md-4" id="inst_telno"></td>
						</tr>
			
						<tr>
							<th>
								<strong>주소</strong>
							</th>
							<td colspan="5" id="inst_adres"></td>
						</tr>
					</tbody>
				</table>
           </div>
