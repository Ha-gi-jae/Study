<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head></head>

<title></title>

<body>
	<div class="card card-info">
	
              <div class="card-header row m-0" style="background: #1a4f72; justify-content: space-between;">
                <h3 class="card-title" id="checkTitle"></h3>
                <button type="button" class="btn btn-success btn-sm" onclick="inputData('1');" style="margin-top: 0px; margin-bottom: 0px; padding-top: 0px; padding-bottom: 0px;">양성</button>
                <button type="button" class="btn btn-success btn-sm" onclick="inputData('2');" style="margin-top: 0px; margin-bottom: 0px; padding-top: 0px; padding-bottom: 0px;">음성</button>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form class="form-horizontal" name="testResultCheck" id="testResultCheck">
              	<input type="hidden" id="backPage" value="${backPage}"/>
                <div class="card-body pb-0 pt-0">
                  <div class="form-group row ">
                    <label for="inputEmail3" class="col-sm-3 col-form-label">성명</label>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="pstiNm" name="pstiNm" placeholder="홍길동">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputPassword3" class="col-sm-3 col-form-label pt-0">주민등록 번호</label>
                    <div class="col-sm-4">
                      <input type="text" class="form-control" name="rrn" id="rrn" maxlength="14" oninput="rrnAutoHyphen(this)" placeholder="960123-1234567">
                    </div>
                  </div>
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                  <button type="button" class="btn btn-danger float-right " onclick="openClose();" >취소</button>
                  <button type="button" class="btn btn-info float-right mr-2" onclick="lookUp();" id="lookup_go"style="background: #1a4f72; border-color: #1a4f72;">조회</button>
                  <button type="button" class="btn btn-info float-right mr-2" onclick="confirmation_go();" id="confirmation"style="background: #1a4f72; border-color: #1a4f72;display: none;">확인서발급</button>
                </div>
                <!-- /.card-footer -->
              </form>
            </div>
            
<script>
window.onload = function(){
	
	var backPage = $('#backPage').val();
	if(backPage=="lookup"){
		$('#checkTitle').html("검사결과조회");
	}else{
		$('#checkTitle').html("확인서발급");
		$('#lookup_go').css('display', 'none');
		$('#confirmation').css('display', 'block');
	}
	
}

function openClose(){
	var check = confirm("취소 하시겠습니까?");

      if(check) window.close();
}
	
function lookUp(){
	
		var rrn = $('#rrn').val();
		var nm = $('#pstiNm').val();
		
		var rrn_length = $('#rrn').val().length;
		if(rrn_length < 14){
			alert("주민/외국인등록번호를 잘못 입력하셨습니다.")
			return false;
		}

		if(!(rrn && nm)){
			alert("이름과 주민등록번호를 모두 작성해 주세요.");
			return false;
		}
		
		 var check = confirm("조회 하시겠습니까?");

	     if(check) {
		    	 
		     window.close();
			
			 var gsWin = window.open('about:blank','testResultCheck','width=580,height=480');
		     var frm = document.getElementById('testResultCheck');
		     frm.action = 'testResultCheck';
		     frm.target ="testResultCheck";
		     frm.method ="post";
		     frm.submit();
	     }else{
	    	 return false;
	     }
		
	//OpenWindow('testResultCheck', '확진결과', 580,440)
	
}

function confirmation_go(){
	
	var rrn = $('#rrn').val();
	var nm = $('#pstiNm').val();
	var frm = document.getElementById('testResultCheck');
	
	
	var rrn_length = $('#rrn').val().length;
	if(rrn_length < 14){
		alert("주민/외국인등록번호를 잘못 입력하셨습니다.")
		return false;
	}

	if(!(rrn && nm)){
		alert("이름과 주민등록번호를 모두 작성해 주세요.");
		return false;
	}
	
  	 $.ajax({
  		    url : '<%=request.getContextPath()%>/guest/confirmationCheck',
  		    type : 'get',
  		    dataType : 'json',
  		    data : {"pstiNm": nm, "rrn":rrn},
  		    success : function(result){
  		    	 
  		    	if(result > 0){
  		    		var check = confirm("확인서를 발급하시겠습니까?");

  	  		         if(check) {
  	  		        	 window.close();
  	  		    		 var gsWin = window.open('about:blank','confirmation','width=950,height=900');
  	  		    	     frm.action = 'confirmation';
  	  		    	     frm.target ="confirmation";
  	  		    	     frm.method ="post";
  	  		    	     frm.submit();
  	  		         }else{
  	  		      	 return;
  	  		       }
  		    	}else{
  		    		var check = confirm("일치하는 음성 정보가없습니다.\n확인서 발급을 종료하시겠습니까?");
  		    		
  		    		if(check){
  		    			window.close();
  		    		}
  		    		else{
  		    			return;
  		    		}
  		    	}
  		    
  		    },
  		    error : function(error){
  		      alert('error' + error.status);
  		    }
  		  })
    
	
}

const rrnAutoHyphen = (target) =>{
	target.value = target.value.replace(/[^0-9]/, '').replace(/^(\d{6})(\d{1,7})$/,`$1-$2`);
}

function inputData(type){
	
	if(type == '1'){
		$('#pstiNm').val('노선옥');
		$('#rrn').val('960604-1800508');		
	}
	if(type == '2'){
		$('#pstiNm').val('복은샘');
		$('#rrn').val('650408-2805425');		
	}
	
}
</script>            
            
</body>