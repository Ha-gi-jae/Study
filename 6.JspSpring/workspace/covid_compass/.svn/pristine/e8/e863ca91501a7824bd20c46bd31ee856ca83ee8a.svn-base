<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

var dgnssResultForm = '';
function reset(){
  $('select[name="statusCode"]').val("");
  $('form[name="processForm"] input[name="dgnssNote"]').val('');
  $('textarea[name="dgnssNote"]').val('');
  disableButton();
}
function disableButton(){
  $('button[name="inptnt-button"]').attr('disabled', true);
  $('button[name="sckbdreq-inptnt-button"]').attr('disabled', true);
  $('button[name="sckbdreq-isoptnt-button"]').attr('disabled', true);
  $('button[name="slfptnt-button"]').attr('disabled', true);
  $('button[name="isoptnt-dgnss-button"]').attr('disabled', true);
  $('button[name="isoptnt-inptnt-button"]').attr('disabled', true);
  $('button[name="isoptnt-sckbdreq-inptnt-button"]').attr('disabled', true);
}
function enableButton(value){
  disableButton();
  
  if(value){
    $('button[name="isoptnt-dgnss-button"]').attr('disabled', false);
    $('button[name="isoptnt-inptnt-button"]').attr('disabled', false);
    $('button[name="isoptnt-sckbdreq-inptnt-button"]').attr('disabled', false);
  }
  
  if(value == 'D101'){
    $('button[name="inptnt-button"]').attr('disabled', false);
    $('button[name="sckbdreq-inptnt-button"]').attr('disabled', false);
    return;
  }
  if(value == 'D102'){
    $('button[name="sckbdreq-isoptnt-button"]').attr('disabled', false);
    return;
  }
  if(value == 'D103'){
    $('button[name="slfptnt-button"]').attr('disabled', false);
    return;
  }
}

function openInptntGo(btn, type){

	  $('form[name="processForm"] input[name="dgnssResultCode"]').val($('select[name="statusCode"]').val());
	  //$('form[name="processForm"] input[name="dgnssNote"]').val($('textarea[name="dgnssNote"]').val());
	  $('form[name="processForm"] input[name="dgnssNote"]').val('[' + prettifyDetailDate(parseInt(Date.now())) + ']' + $('textarea[name="dgnssNote"]').val());
  $(btn).attr('data-manage-no');
  $(btn).attr('data-psti-nm');
  
  var openUrl = 'sckbdreq-inptnt?manageNo=' +  $(btn).attr('data-manage-no') + '&pstiNm=' + $(btn).attr('data-psti-nm')
          + '&type=' + type;
  
  OpenWindow(openUrl, '병원 조회', 1260, 715);
  
}
function openIsoptntGo(btn, type){

	  $('form[name="processForm"] input[name="dgnssResultCode"]').val($('select[name="statusCode"]').val());
	  //$('form[name="processForm"] input[name="dgnssNote"]').val($('textarea[name="dgnssNote"]').val());
	  $('form[name="processForm"] input[name="dgnssNote"]').val('[' + prettifyDetailDate(parseInt(Date.now())) + ']' + $('textarea[name="dgnssNote"]').val());
  $(btn).attr('data-manage-no');
  $(btn).attr('data-psti-nm');
  
  var openUrl = 'sckbdreq-isoptnt?manageNo=' +  $(btn).attr('data-manage-no') + '&pstiNm=' + $(btn).attr('data-psti-nm')
          + '&type=' + type;
  
  OpenWindow(openUrl, '생활치료센터 조회', 1260, 715);
  
}
function showDetail(manageNo, dgnssNo, paramType){
  var typeTemp = $('form[name="processForm"] input[name="type"]').val();

  if(!typeTemp) typeTemp = 'A';
  
  if(typeTemp != paramType){
    
      var divShows = $('div.show-element');
      var divHiddens = $('div.hidden-element');
      
      divShows.removeClass('show-element');
      divShows.addClass('hidden-element');
      
      divHiddens.removeClass('hidden-element');
      divHiddens.addClass('show-element');
      
  }
  
  reset();
  
/*   var trs = $('tr.each-dgnss-element');
  
  trs.removeClass('on');
  
  var target = $('tr[data-manage-no="'+manageNo+'"]');
 */
 var trs = $('tr.each-dgnss-element');
  
  trs.removeClass('on');
  
  var target = $('tr[data-dgnss-no="'+dgnssNo+'"]');
  
  target.addClass('on');
  
  var instNm = $('span[data-inst-nm="'+manageNo+'"]').html();
  
  var childNo = target.attr('data-child-no');
  var type = target.attr('data-type');
  var dgnssNo = target.attr('data-dgnss-no');
  var manageNo = target.attr('data-manage-no');
  //alert($('input[name="instNm"]'));
  
  var openInptntbtn = $('button[name="sckbdreq-inptnt-button"]');
  var openIsoptntbtn = $('button[name="sckbdreq-isoptnt-button"]');
  
  $(openInptntbtn).attr('data-manage-no', manageNo);
  $(openInptntbtn).attr('data-psti-nm', target.attr('data-psti-nm'));
  $(openIsoptntbtn).attr('data-manage-no', manageNo);
  $(openIsoptntbtn).attr('data-psti-nm', target.attr('data-psti-nm'));
  
  $('form[name="processForm"] input[name="childNo"]').val(childNo);
  $('form[name="processForm"] input[name="type"]').val(type);
  $('form[name="processForm"] input[name="dgnssNo"]').val(dgnssNo);
  $('form[name="processForm"] input[name="manageNo"]').val(manageNo);
  
  var url = '<%=request.getContextPath()%>/rest-hspt/dgnss-detail';
  
  $.ajax({
      url : url,
      type : 'post',
      data : {
          'manageNo' : manageNo
          },
      dataType : 'json',
      success : function(dgnssDetailCommand){
    	
    	$('#enableReadRrn').data('rrn', dgnssDetailCommand.rrn);
    	$('#enableReadRrn').data('manageNo', manageNo);
   		dgnssDetailCommand.rrn = (dgnssDetailCommand.rrn.substring(0,8) + '******');
    	  
        printData(dgnssDetailCommand, $('#dgnss-detail-info-module'), $('#dgnss-detail-template'), '.dgnss-detail-info');
        $('#req-inst-nm').html(instNm);
      },
      error : function(error){
        alert('error' + error.status);
      }
    });
}


function process_go(type){
  
  $('form[name="processForm"] input[name="dgnssResultCode"]').val($('select[name="statusCode"]').val());
  $('form[name="processForm"] input[name="dgnssNote"]').val('[' + prettifyDetailDate(parseInt(Date.now())) + ']' + $('textarea[name="dgnssNote"]').val());
  
  
  var closeWindow = false;
  var message = '';
  
  if(type == '1'){
    process_url = '<%=request.getContextPath()%>/rest-hspt/process-dgnss-inptnt';
    message = '입원처리가 완료되었습니다.';
  }
  if(type == '2'){
    
    process_url = '<%=request.getContextPath()%>/rest-hspt/process-dgnss-sckbdreq-inptnt';
    closeWindow = true;
    message = '이원신청이 완료되었습니다.';
  }
  if(type == '3'){
    process_url = '<%=request.getContextPath()%>/rest-hspt/process-dgnss-sckbdreq-isoptnt';
    closeWindow = true;
    message = '입소신청이 완료되었습니다.';
  }
  if(type == '4'){
    process_url = '<%=request.getContextPath()%>/rest-hspt/process-dgnss-slfptnt';
    message = '자가격리처리가 완료되었습니다.';
  }
  if(type == '5'){
    process_url = '<%=request.getContextPath()%>/rest-hspt/process-dgnss-result-isoptnt';
    message = '검사를 완료했습니다.';
  }
  
  $('form[name="processForm"] input[name="closeWindow"]').val(closeWindow);
  
  processForm = $('form[name="processForm"]');
  
    $.ajax({
      url : process_url,
      type : 'post',
      data : processForm.serialize(),
      dataType : 'json',
      success : function(dataMap) {
        
        console.log(dataMap.colseWindow);
        
        if(dataMap.msg == 'success'){
          alert(message);
        }
        
        if(dataMap.colseWindow){
          window.opener.location.reload(true);    
          window.close();
        }else{
          window.location.reload(true);
        }
      },
      error : function(error) {
        alert('error' + error.status);
      }
    });
  }

</script>