<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/x-handlebars-template" id="isoptnt-detail-template">
<div class="isoptnt-detail-element">
	<div class="card pb-0" style="padding: 10px;">
	  <div class="row">
	    <div class="form-group col-lg-4">
		  <div class="row">
			<label for="pstiNm" class="col-sm-5 control-label text-left">성명</label>
		  </div>
		  <div class="row">
			<div class="col-sm-12" style="padding-left: 5px;">
			  <input name="pstiNm" type="text" class="form-control" id="pstiNm" value="{{pstiNm}}" readonly="readonly">
			</div>
		  </div>
		</div>
	    <div class="form-group col-lg-4">
		  <div class="row">
			<label for="nlty" class="col-sm-6 control-label text-left" style="padding-top: 0px;">국적</label>
			  <div class="col-sm-12">
				<input name="nlty" type="text" class="form-control" id="slf_nlty" value="{{nlty}}" readonly="">
			  </div>
			</div>
		  </div>
 	      <div class="form-group col-lg-4">
			<div class="row">
			  <div class="col-lg-6">
				<label for="age" class="col-sm-12 control-label text-left">나이</label>
				  <div class="row">
					<div class="col-sm-12">
					  <input name="age" type="text" class="form-control" id="slf_age" value="{{age}}" readonly="">
					</div>
				  </div>
			  </div>
			  <div class="col-lg-6">
				<label for="gender" class="col-sm-12 control-label text-left">성별</label>
				  <div class="row">
					<div class="col-sm-12">
					  <input name="gender" type="text" class="form-control" id="slf_gender" value="{{fnGender gender}}" readonly="">
					</div>
				  </div>
			  </div>
            </div>
		  </div>
		</div>

<div class="row">
		  <div class="form-group col-lg-4">
			<div class="row">
			  <label for="rrn" class="col-sm-12 control-label text-left">주민/외국인등록번호 </label>
			</div>
		    <div class="row">
			  <div class="col-sm-12" style="padding-left: 5px;">
			    <input name="rrn" id="inputRrn" type="text" class="form-control" value="{{rrn}}" readonly="">
			  </div>
		    </div>
		  </div>
        <div class="form-group col-lg-4">
		  <div class="row">
			<label for="pstiTelno" class="col-sm-4 control-label text-left">연락처</label>
			  <div class="col-sm-12">
				<input name="pstiTelno" type="text" class="form-control" id="pstiTelno" value="{{pstiTelno}}" readonly="readonly">
			  </div>
			</div>
		</div>

		<div class="form-group col-lg-2">
		  <div class="row">
			<label for="feverYn" class="col-sm-12 control-label text-left" style="padding-top: 0px;">발열여부</label>
			  <div class="col-sm-12">
				<input name="feverYn" type="text" class="form-control" id="slf_feverYn" value="{{feverYn}}" readonly="">
			  </div>
		  </div>
		</div>
		<div class="form-group col-lg-2">
		  <div class="row">
			<label for="pregnYn" class="col-sm-12 control-label text-left" style="padding-top: 0px;">임신여부</label>
			  <div class="col-sm-12">
				<input name="pregnYn" type="text" class="form-control" id="pregnYn" value="{{pregnYn}}" readonly="readonly">
			  </div>
		  </div>
		</div>

</div>

<div class="row">
  <div class="form-group col-lg-12">
    <div class="row">
	  <label for="pstiAdres" class="col-sm-12 control-label text-left">주소</label>
	</div>
    <div class="row">
	  <div id="changeclass" class="col-sm-12" style="padding-left: 5px;">
	    <input name="pstiAdres" type="text" class="form-control" id="pstiAdres" value="{{pstiAdres}}" readonly="readonly">
	  </div>
	  <div id="showAdress" class="col-sm-3" style="display: none;">
	    <button type="button" style="background-color: #1a4f72; border-color: #1a4f72;" onclick="address_go();" class="btn btn-block btn-primary">주소 검색</button>
	  </div>
    </div>
  </div>
</div>
</div>


<div class="card" style="padding: 10px;">
	<div class="row">
		<div class="form-group col-lg-3">
			<div class="row">
				<label for="wrtYmd" class="col-sm-12 control-label text-left">확진일자</label>
			</div>
			<div class="row">
				<div class="col-sm-12" style="padding-left: 5px;">
					<input name="wrtYmd" type="text" class="form-control" id="slf_reqYmd" value="{{prettifyDate inYmd}}" readonly="">
				</div>
			</div>
		</div>

		<div class="form-group col-lg-3">
			<div class="row">
				<label for="rechkdYn" class="col-sm-12 control-label text-left">입소일자</label>
				<div class="col-sm-12">
					<input name="rechkdYn" type="text" class="form-control" id="slf_rechkdYn" value="{{prettifyDate isoptntInYmd}}" readonly="">
				</div>
			</div>
		</div>


		<div class="form-group col-lg-2">
			<div class="row">
				<label for="vacCode" class="col-sm-12 control-label text-left" style="padding-top: 0px;">백신접종</label>
				<div class="col-sm-12">
					<input name="vacCode" type="text" class="form-control" id="slf_vacCode" value="{{vac}}" readonly="">
				</div>
			</div>
		</div>

		<div class="form-group col-lg-2">
			<div class="row">
				<label for="feverYn" class="col-sm-12 control-label text-left" style="padding-top: 0px;">검사결과</label>
				<div class="col-sm-12">
					<input name="feverYn" type="text" class="form-control" id="slf_pstvYn" value="{{fnResult inYmd}}" readonly="">
				</div>
			</div>
		</div>
		<div class="form-group col-lg-2">
			<div class="row">
				<label for="ngtvCnt" class="col-sm-12 control-label text-left" style="padding-top: 0px;">누적음성횟수</label>
				<div class="col-sm-12">
					<input name="ngtvCnt" type="text" class="form-control" id="slf_ngtv_cnt" value="{{ngtvCnt}}" readonly="readonly">
				</div>
			</div>
		</div>


	</div>

	<div class="row">
		<div class="form-group col-lg-12">
			<div class="row">
				<label for="symptms" class="col-sm-12 control-label text-left">증상</label>
			</div>
			<div class="row">
				<div class="col-sm-12" style="padding-left: 5px;">
					<input name="symptms" type="text" class="form-control" id="slf_symptms" value="{{symptms}}" readonly="">
				</div>
			</div>
		</div>
	</div>
</div>


<div class="form-group row">
	<div class="col-md-6"></div>
	<div class="col-md-3">
		<button id="modifysubmitbutton" onclick="modifysubmit();" style="background-color: rgb(26, 79, 114); border-color: rgb(26, 79, 114); display: none;" type="button" class="btn btn-block btn-primary">등록</button>
	</div>
	<div class="col-md-3">
		<button id="modifycancelbutton" onclick="modifycancel();" style="background-color: #c82333; border-color: #bd2130; display: none;" type="button" class="btn btn-block btn-primary">취소</button>
		<button id="modifybutton" style="background-color: rgb(26, 79, 114);margin-top: 0px; border-color: rgb(26, 79, 114); display: inline;" type="button" onclick="modify();" class="btn btn-block btn-primary">수정</button>
	</div>
</div>

<div class="card pb-0" style="padding: 10px;">
	<table class="table table-bordered">
		<tbody>
			<tr class="shittr" style="text-align: left;">
				<th class="col-md-2">진료병원</th>
				<td class="col-md-4" id="slf_inst_nm">{{instNm}}</td>
				<th class="col-md-2">진료결과</th>
				<td class="col-md-4" id="slf_dgnss_result_code">{{fnDgnssResultCode dgnssResultCode}}</td>
			</tr>
			<tr class="shittr" style="text-align: left;">
				<th rowspan="4" style="vertical-align: middle;">진료메모</th>
				<td colspan="3" style="height: 111px; vertical-align: middle; text-align: left;" id="slf_dgnss_note">{{dgnssNote}}</td>
			</tr>
		</tbody>
	</table>
</div>
<div class="row" style="text-align:center">
	<div class="col-md-12 align-self-center">
	  <button {{fnToday today}} id="openButton" data-manage-no="{{manageNo}}" data-name="{{pstiNm}}" onclick="proc(this);"  class="btn btn-block btn-primary" style="background: #1a4f72; border: #1a4f72; width:50%; margin:0 auto;">진료신청</button>
	</div>
</div>

<input type="hidden" id="pstiNo" name="pstiNo" value="{{pstiNo}}">
<input type="hidden" id="manageNo" name="manageNo" value="{{manageNo}}">
</div>

</script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function showDetail(manageNo){
	var trs = $('tr.each-isoptnt-element');
	
	trs.removeClass('on');
	
	var target = $('tr[data-manage-no="'+manageNo+'"]');
	
	target.addClass('on');

	var url = '<%=request.getContextPath()%>/rest-ltct/sckbd-detail?manageNo='+manageNo;
	$.ajax({
		url : url,
		type : 'post',
		dataType : 'json',
		success : function(basicDetail){
			
			$('#enableReadRrn').data('rrn', basicDetail.rrn)
			$('#enableReadRrn').data('manageNo', manageNo)
	      	basicDetail.rrn = (basicDetail.rrn.substring(0,8) + '******');
			
			printData(basicDetail, $('#isoptnt-detail-module'), $('#isoptnt-detail-template'), '.isoptnt-detail-element')
		},
		error : function(error){
			alert('error' + error.status);
		}
	});
}
function proc(ele){
	var manageNo = $('#openButton').attr('data-manage-no');
	var name = $('#openButton').attr('data-name');
  	window.open("cnfrm-detail-dgnss-regist?manageNo="+manageNo+"&pstiNm="+name+"", "진료 신청 정보", "width=1260, height=715" );  

}
function modify(){
	$('#pstiNm').attr('readonly', false);
	$('#pstiAdres').attr('readonly', false);
	$('#pstiTelno').attr('readonly', false);
	$('#pregnYn').attr('readonly', false);
	
	$('#pstiNm').   css('border', '1px solid blue');
	$('#pstiAdres').css('border', '1px solid blue');
	$('#pstiTelno').css('border', '1px solid blue');
	$('#pregnYn').  css('border', '1px solid blue');	
	
	$('#changeclass').removeClass('col-sm-12');
	$('#changeclass').addClass('col-sm-9');
	$('#showAdress').css('display', 'inline');
	$('#modifybutton').css('display', 'none');
	$('#modifysubmitbutton').css('display', 'inline');
	$('#modifycancelbutton').css('display', 'inline');
	$('#openButton').attr('disabled', true);
}

function modifysubmit(){
	var pstiNm = $('#pstiNm').val();
	var pstiAdres = $('#pstiAdres').val();
	var pregnYn = $('#pregnYn').val();
	var pstiTelno = $('#pstiTelno').val();
	var pstiNo = $('#pstiNo').val();
	var manageNo = $('#manageNo').val();
	
	$.ajax({
		url : '<%=request.getContextPath()%>/ltct/isoptnt-modify',
		type : 'post',
		data : {"pstiNm" : pstiNm, "pstiTelno" : pstiTelno, "pstiAdres" : pstiAdres, "pregnYn" : pregnYn, "pstiNo" : pstiNo, "manageNo" : manageNo},
		success : function(dataMap){
			$('#pstiNm').attr('readonly', true);
			$('#pregnYn').attr('readonly', true);
			$('#pstiAdres').attr('readonly', true);
			$('#pstiTelno').attr('readonly', true);
			
			$('#pstiNm').   css('border', '');
			$('#pstiAdres').css('border', '');
			$('#pstiTelno').css('border', '');
			$('#pregnYn').  css('border', '');	
			
			$('#changeclass').removeClass('col-sm-9');
			$('#changeclass').addClass('col-sm-12');
			$('#showAdress').css('display', 'none');
			$('#modifybutton').css('display', 'inline');
			$('#modifysubmitbutton').css('display', 'none');
			$('#modifycancelbutton').css('display', 'none');
			$('tr[data-manage-no="'+manageNo+'"] td div.pstiNm').text("").text(pstiNm);
			$('tr[data-manage-no="'+manageNo+'"] td div.pstiTelno').text("").text(pstiTelno);
			alert(pstiNm + "님의 정보가 성공적으로 수정되었습니다.");
			
			if(dataMap. result > 0){
				$('#openButton').attr('disabled', true);
			}else{
				$('#openButton').attr('disabled', false);
			}
			
		},
		error :  function(error){
			alert('error' + error.status);
		}
	})
}

function modifycancel(){
	var pstiNo = $('#pstiNo').val();
	var pstiNm = $('#pstiNm').val();
	var manageNo = $('#manageNo').val();
	
	$.ajax({
		url : '<%=request.getContextPath()%>/ltct/isoptnt-modify-cancel',
		type : 'post',
		data : {"pstiNo" : pstiNo, "manageNo" : manageNo},
		success : function(dataMap){
			$('#pstiNm').attr('readonly', true);
			$('#pregnYn').attr('readonly', true);
			$('#pstiAdres').attr('readonly', true);
			$('#pstiTelno').attr('readonly', true);
			
			$('#pstiNm').   css('border', '');
			$('#pstiAdres').css('border', '');
			$('#pstiTelno').css('border', '');
			$('#pregnYn').  css('border', '');	
			
			$('#changeclass').removeClass('col-sm-9');
			$('#changeclass').addClass('col-sm-12');
			$('#showAdress').css('display', 'none');
			$('#modifybutton').css('display', 'inline');
			$('#modifysubmitbutton').css('display', 'none');
			$('#modifycancelbutton').css('display', 'none');
			$('#pstiNm').val(dataMap.psti.pstiNm);
			$('#pregnYn').val(dataMap.psti.pregnYn);
			$('#pstiAdres').val(dataMap.psti.pstiAdres);
			$('#pstiTelno').val(dataMap.psti.pstiTelno);
			alert(pstiNm +"님의 정보 수정이 취소되었습니다.");
			
			if(dataMap. result > 0){
				$('#openButton').attr('disabled', true);
			}else{
				$('#openButton').attr('disabled', false);
			}
		},
		error : function(error){
			alert('error'+ error.status);
		}
	})
}

function address_go() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("pstiAdres").value = extraAddr;
            
            } else {
                document.getElementById("pstiAdres").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("pstiAdres").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("pstiAdres").focus();
        }
    }).open();
}
</script>
<div id="isoptnt-detail-module">

<div class="isoptnt-detail-element">
				<div class="card pb-0" style="padding: 10px;">
	  <div class="row">
	    <div class="form-group col-lg-4">
		  <div class="row">
			<label for="pstiNm" class="col-sm-5 control-label text-left">성명</label>
		  </div>
		  <div class="row">
			<div class="col-sm-12" style="padding-left: 5px;">
			  <input name="pstiNm" type="text" class="form-control" id="pstiNm" value="" readonly="readonly">
			</div>
		  </div>
		</div>
	    <div class="form-group col-lg-4">
		  <div class="row">
			<label for="nlty" class="col-sm-6 control-label text-left" style="padding-top: 0px;">국적</label>
			  <div class="col-sm-12">
				<input name="nlty" type="text" class="form-control" id="slf_nlty" value="" readonly="">
			  </div>
			</div>
		  </div>
 	      <div class="form-group col-lg-4">
			<div class="row">
			  <div class="col-lg-6">
				<label for="age" class="col-sm-12 control-label text-left">나이</label>
				  <div class="row">
					<div class="col-sm-12">
					  <input name="age" type="text" class="form-control" id="slf_age" value="" readonly="">
					</div>
				  </div>
			  </div>
			  <div class="col-lg-6">
				<label for="gender" class="col-sm-12 control-label text-left">성별</label>
				  <div class="row">
					<div class="col-sm-12">
					  <input name="gender" type="text" class="form-control" id="slf_gender" value="" readonly="">
					</div>
				  </div>
			  </div>
            </div>
		  </div>
		</div>

<div class="row">
		  <div class="form-group col-lg-4">
			<div class="row">
			  <label for="rrn" class="col-sm-12 control-label text-left">주민/외국인등록번호 </label>
			</div>
		    <div class="row">
			  <div class="col-sm-12" style="padding-left: 5px;">
			    <input name="rrn" id="slf_rrn" type="text" class="form-control" value="" readonly="">
			  </div>
		    </div>
		  </div>
        <div class="form-group col-lg-4">
		  <div class="row">
			<label for="pstiTelno" class="col-sm-4 control-label text-left">연락처</label>
			  <div class="col-sm-12">
				<input name="pstiTelno" type="text" class="form-control" id="pstiTelno" value="" readonly="readonly">
			  </div>
			</div>
		</div>

		<div class="form-group col-lg-2">
		  <div class="row">
			<label for="feverYn" class="col-sm-12 control-label text-left" style="padding-top: 0px;">발열여부</label>
			  <div class="col-sm-12">
				<input name="feverYn" type="text" class="form-control" id="slf_feverYn" value="" readonly="">
			  </div>
		  </div>
		</div>
		<div class="form-group col-lg-2">
		  <div class="row">
			<label for="pregnYn" class="col-sm-12 control-label text-left" style="padding-top: 0px;">임신여부</label>
			  <div class="col-sm-12">
				<input name="pregnYn" type="text" class="form-control" id="pregnYn" value="" readonly="readonly">
			  </div>
		  </div>
		</div>

</div>

<div class="row">
  <div class="form-group col-lg-12">
    <div class="row">
	  <label for="pstiAdres" class="col-sm-12 control-label text-left">주소</label>
	</div>
    <div class="row">
	  <div id="changeclass" class="col-sm-12" style="padding-left: 5px;">
	    <input name="pstiAdres" type="text" class="form-control" id="pstiAdres" value="" readonly="readonly">
	  </div>
	  <div id="showAdress" class="col-sm-3" style="display: none;">
	    <button type="button" style="background-color: #1a4f72; border-color: #1a4f72;" onclick="address_go();" class="btn btn-block btn-primary">주소 검색</button>
	  </div>
    </div>
  </div>
</div>
</div>


<div class="card" style="padding: 10px;">
	<div class="row">
		<div class="form-group col-lg-3">
			<div class="row">
				<label for="wrtYmd" class="col-sm-12 control-label text-left">확진일자</label>
			</div>
			<div class="row">
				<div class="col-sm-12" style="padding-left: 5px;">
					<input name="wrtYmd" type="text" class="form-control" id="slf_reqYmd" value="" readonly="">
				</div>
			</div>
		</div>

		<div class="form-group col-lg-3">
			<div class="row">
				<label for="rechkdYn" class="col-sm-12 control-label text-left">입소일자</label>
				<div class="col-sm-12">
					<input name="rechkdYn" type="text" class="form-control" id="slf_rechkdYn" value="" readonly="">
				</div>
			</div>
		</div>


		<div class="form-group col-lg-2">
			<div class="row">
				<label for="vacCode" class="col-sm-12 control-label text-left" style="padding-top: 0px;">백신접종</label>
				<div class="col-sm-12">
					<input name="vacCode" type="text" class="form-control" id="slf_vacCode" value="" readonly="">
				</div>
			</div>
		</div>

		<div class="form-group col-lg-2">
			<div class="row">
				<label for="feverYn" class="col-sm-12 control-label text-left" style="padding-top: 0px;">검사결과</label>
				<div class="col-sm-12">
					<input name="feverYn" type="text" class="form-control" id="slf_pstvYn" value="" readonly="">
				</div>
			</div>
		</div>
		<div class="form-group col-lg-2">
			<div class="row">
				<label for="ngtvCnt" class="col-sm-12 control-label text-left" style="padding-top: 0px;">누적음성횟수</label>
				<div class="col-sm-12">
					<input name="ngtvCnt" type="text" class="form-control" id="slf_ngtv_cnt" value="" readonly="readonly">
				</div>
			</div>
		</div>


	</div>

	<div class="row">
		<div class="form-group col-lg-12">
			<div class="row">
				<label for="symptms" class="col-sm-12 control-label text-left">증상</label>
			</div>
			<div class="row">
				<div class="col-sm-12" style="padding-left: 5px;">
					<input name="symptms" type="text" class="form-control" id="slf_symptms" value="" readonly="">
				</div>
			</div>
		</div>
	</div>
</div>


<div class="form-group row">
	<div class="col-md-6"></div>
	<div class="col-md-3">
		<button id="modifycancelbutton" onclick="modifycancel();" style="background-color: rgb(26, 79, 114); border-color: rgb(26, 79, 114); display: none;" type="button" class="btn btn-block btn-primary">취소</button>
	</div>
	<div class="col-md-3">
		<button id="modifysubmitbutton" onclick="modifysubmit();" style="background-color: rgb(26, 79, 114); border-color: rgb(26, 79, 114); display: none;" type="button" class="btn btn-block btn-primary">등록</button>
		<button id="modifybutton" style="background-color: rgb(26, 79, 114);margin-top: 0px; border-color: rgb(26, 79, 114); display: inline;" type="button" onclick="modify();" class="btn btn-block btn-primary">수정</button>
	</div>
</div>

<div class="card pb-0" style="padding: 10px;">
	<table class="table table-bordered">
		<tbody>
			<tr class="shittr">
				<th class="col-md-2" style="text-align:center;">진료병원</th>
				<td class="col-md-4" id="slf_inst_nm"></td>
				<th class="col-md-2" style="text-align:center;">진료결과</th>
				<td class="col-md-4" id="slf_dgnss_result_code"></td>
			</tr>
			<tr class="shittr" style="text-align: center;">
				<th rowspan="4" style="vertical-align: middle;">진료메모</th>
				<td colspan="3" style="height: 111px; vertical-align: middle; text-align: left;" id="slf_dgnss_note"></td>
			</tr>
		</tbody>
	</table>
</div>
<div class="row" style="text-align:center">
	<div class="col-md-12 align-self-center">
	  <button id="openButton" data-manage-no="{{manageNo}}" data-name="{{pstiNm}}" onclick="proc(this);"  class="btn btn-block btn-primary" style="background: #1a4f72; border: #1a4f72; width:50%; margin:0 auto;">진료신청</button>
	</div>
</div>
<input type="hidden" id="pstiNo" name="pstiNo" value="">
<input type="hidden" id="manageNo" name="manageNo" value="">
</div>				
</div>