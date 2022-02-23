<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
function enableReadRrn(btn){
	
	if(confirm('개인정보 열람에 동의하시겠습니까?') == false) return;
	
	console.log($('#enableReadRrn').data('enable'));
	console.log($('#enableReadRrn').data('manageNo'));
	
	$('#purpose').val('N101');
	$('#purposeNote').val('');
	$('#confirmModal').modal('show');
	
}

function agree(){
	
	if($('#purpose').val() == 'N101'){
		alert('열람목적을 선택해주세요.');
		return;
	}
	
	$('#enableReadRrn').data('enable', 'Y');
	$('#dataRrn').html($('#enableReadRrn').data('rrn'));

	const data =
		{
			'manageNo' : $('#enableReadRrn').data('manageNo') || $('#enableReadRrn').data('manageno')
		   ,'purposeCode' : $('#purpose').val()
		   ,'purposeNote' : $('#purposeNote').val()
		}
	
	
	const url = '<%=request.getContextPath()%>/common/read-detail';
	$.ajax({
      url : url,
      type : 'post',
      dataType : 'json',
      data : data,
      success : function(dataMap){
    	    console.log(dataMap);
        	if($('#hspt-tab-rrn')) $('#hspt-tab-rrn').html($('#enableReadRrn').data('rrn'));
        	if($('#ltct-tab-rrn')) $('#ltct-tab-rrn').html($('#enableReadRrn').data('rrn'));
        	if($('#r_rrn')) $('#r_rrn').html($('#enableReadRrn').data('rrn'));
        	if($('#rrn')) $('#rrn').html($('#enableReadRrn').data('rrn'));
        	if($('#slf_rrn')) $('#slf_rrn').val($('#enableReadRrn').data('rrn'));
        	if($('#n_rrn')) $('#n_rrn').html($('#enableReadRrn').data('rrn'));
        	if($('#y_rrn')) $('#y_rrn').html($('#enableReadRrn').data('rrn'));
        	if($('#inputRrn')) $('#inputRrn').val($('#enableReadRrn').data('rrn'));
        	$('#openRrn').html($('#hiddenRrn').html());
        	if($('#rrn')){
        		$('#rrn').val($('#hiddenRrn').html());
        	}
      },
      error : function(error){
        alert('error' + error.status);
      }
    }); 	
	
	$('#confirmModal').modal('hide');
	
}

function cancle(){
	
	$('#purpose').val('N101');
	$('#confirmModal').modal('hide');
	
}

function enableOpenRrn(btn){
	
	if(confirm('개인정보 열람에 동의하시겠습니까?') == false) return;
	
	console.log($('#enableReadRrn').data('enable'));
	console.log($('#enableReadRrn').data('manageno'));
	
	$('#purpose').val('N101');
	$('#purposeNote').val('');
	$('#confirmModal').modal('show');
	
}


</script>

  <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content" style="width: 450px;">
        <div class="modal-header">
          <h5 class="modal-title" id="myModalLabel">개인정보 열람확인</h5>
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        </div>
        <div class="modal-body">
          <table class="table table-bordered">
            <tbody>
              <tr style="text-align: center;">
                <th style="width: 120px; vertical-align: middle;">열람목적</th>
                <td style="text-align: left; padding-top: 4px; padding-bottom: 0px;">
                  <select name="purpose" id="purpose" class="form-control">
                    <option value="N101">열람목적을 선택해주세요</option>
                    <option value="N102">개인정보 제공 동의</option>
                    <option value="N103">역학조사 작성</option>
                    <option value="N104">대상자 요청</option>
                    <option value="N105">기타</option>
                  </select>
                </td>
              </tr>

              <tr style="text-align: center;">
                <th colspan="2" align="left" style="vertical-align: middle;">열람목적 상세</th>
              </tr>
              
              <tr style="text-align: center;">
                <td colspan="2" align="center" style="vertical-align: middle;">
                      <div class="form-group row">
                        <div class="col-sm-12">
                          <textarea name="purposeNote" class="form-control" rows="5" id="purposeNote" style="width: 97%;"></textarea>
                        </div>
                        <span>*개인정보 열람시 열람내역이 기록됩니다.</span>
                      </div>
                </td>
              </tr>
              
              <tr>
                <td colspan="2" align="center">
                  <div class="row">
                    <div class=" col-md-6">
                      <button class="btn btn-primary" style="width: 100%;" onclick="agree();">확인</button>
                    </div>
                    <div class=" col-md-6">
                      <button class="btn btn-secondary" style="width: 100%;" onclick="cancle();">취소</button>
                    </div>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>

        </div>
      </div>
    </div>
  </div>