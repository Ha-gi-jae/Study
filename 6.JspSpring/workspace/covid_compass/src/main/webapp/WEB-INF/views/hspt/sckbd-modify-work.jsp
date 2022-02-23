<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head></head>

<title>병상등록</title>

<body>
  <script>
function submitbutton(){
	
	var sckbdCnt = $('#sckbdCnt').val();
	
	if(!sckbdCnt){
		alert('등록할 병상을 입력해주세요.');
		return;
	}
	
	$.ajax({
		url : '<%=request.getContextPath()%>/rest-hspt/sckbd-cnt-modify',
		data : {"sckbdCnt" : sckbdCnt},
		type: 'post',
		success : function(dataMap){
			if(dataMap.msg == "success"){
				alert("병상등록이 완료되었습니다.");
			}
			window.opener.location.reload();
			location.reload();
		},
		error : function(error){
			alert('error' + error.status);
		}
	})
}
</script>
  <div class="card card-success">
    <div class="register-card-body">
      <div class="card-header" style="background-color: #1a4f72; color: white;">
        <h3 class="card-title">병상 등록</h3>
      </div>
      <div class="card-body ">
        <div class="row">
          <div class="col-md-1"></div>
          <div class="col-md-6">
            <i class="fas fa-procedures fa-3x" style="color: #c2c7d0;"></i> <span style="font-size: 36px; color: #6c757d;">&nbsp;&nbsp;${loginHspt.rmndSckbdCnt }석</span>
          </div>
          <div class="input-group col-md-4 pr-0 pl-0" style="margin-top: 10px;">
            <input class="form-control" type="number" name="sckbdCnt" id="sckbdCnt" placeholder="" /> <span class="input-group-append col-sm-4 pl-0">
              <button type="button" class="btn btn-block btn-primary btn-sm" style="background: #1a4f72; color: #ffffff; border-color: #1a4f72; height: 31px;" onclick="submitbutton();">등록</button>
            </span>
          </div>
          <div class="col-md-1"></div>
        </div>
      </div>

      <div class="card-header" style="background-color: #1a4f72; color: white;">
        <h3 class="card-title">사용현황</h3>
      </div>

      <div class="card-body pl-0 pr-0">
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
            	<tr style="text-align: center; font-weight: bold; background-color: #f5fafc">
				<th style="text-align: center;" colspan="5">병상현황</th>
				</tr>
            </thead>
            <tbody>
              <tr style="text-align: center; font-weight: bold; background-color: #f5fafc">
                <th style="text-align: center; width: 20%;" class="col-md-3">총<br>병상수</th>
                <th style="text-align: center; width: 20%;" class="col-md-3">입원<br>환자수</th>
                <th style="text-align: center; width: 20%;" class="col-md-3">잔여<br>병상수</th>
                <th style="text-align: center; width: 20%;" class="col-md-3">처리대기<br>병상수</th>
                <th style="text-align: center; width: 20%; vertical-align: middle;" class="col-md-3">가동률</th>              
              </tr>
              <tr style="text-align: center">
                <td>${loginHspt.sckbdCnt}</td>
                <td><span class="badge badge-primary" id="curInptntCnt" style="background-color: #007bff; width: 45px;">${curInptntCnt}</span></td>
                <td><span class="badge badge-info" id="rmndSckbdCnt" style="background-color: #17a2b8; width: 45px;">${loginHspt.rmndSckbdCnt }</span></td>
                <td><span class="badge badge-info" id="toCheckSckbdCnt" style="background-color: #28a745; width: 45px;">${loginHspt.sckbdCnt - curInptntCnt - loginHspt.rmndSckbdCnt }</span></td>
                <td><span class="badge badge-warning" style="background-color: ${color}; border-color: ${color}; width: 45px; color: white;">${opRate }%</span></td>
              </tr>
            </tbody>
          </table>
          <table class="table table-bordered">
            <thead>
            	<tr style="text-align: center; font-weight: bold; background-color: #f5fafc">
					<th style="text-align: center;" colspan="4">일주일 현황</th>
				</tr>
            </thead>
            <tbody>
              <tr style="text-align: center; font-weight: bold; background-color: #f5fafc">
				<th style="text-align: center;" class="col-md-3">입원</th>
				<th style="text-align: center;" class="col-md-3">완치</th>
				<th style="text-align: center;" class="col-md-3">이원</th>
				<th style="text-align: center;" class="col-md-3">사망</th>
              </tr>
              <tr style="text-align: center">
                <td>${hsptStats.inptntCnt }</td>
                <td>${hsptStats.rlsedCnt }</td>
                <td>${hsptStats.outCnt }</td>
                <td>${hsptStats.deathCnt }</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

    <div class="col-md-3 float-right">
      <button type="button" onclick="window.close();" class="btn btn-block btn-danger">닫기</button>
    </div>


    </div>
  </div>

</body>