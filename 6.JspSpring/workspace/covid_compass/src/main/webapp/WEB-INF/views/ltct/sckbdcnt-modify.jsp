<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="sckbdCountAndStats" value='${sckbdCountAndStats }' />
<head></head>

<title>병상등록</title>

<body>
<script>
function Close(){
	var check = confirm("페이지를 닫으시겠습니까?");
	if(check){
		window.close();
	}else{
		return;
	}
}
function submitbutton(){
	var sckbdCnt = $('#sckbdCnt').val(); // 입력 병상
	var rmndCnt = $('#rmndCnt').val(); // 잔여병상
	if(sckbdCnt == "" || sckbdCnt == "0"){
		alert("등록할 병상을 입력해주세요.");
		return;
	}
	var parseCnt = parseInt(sckbdCnt);
	if(parseCnt<0){
		var minCnt = parseCnt * -1;
		if(minCnt > rmndCnt){
			alert("잔여병상 수를 초과하였습니다.");
			return;
		}
	}
	$.ajax({
		url : '<%=request.getContextPath()%>/rest-ltct/sckbd-cnt-modify',
		data : {"sckbdCnt" : sckbdCnt},
		type: 'post',
		success : function(res){
			alert("병상이 성공적으로 등록되었습니다.");
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
		<div class="card-header" style="background-color: #1a4f72; color:white;">
			<h3 class="card-title">병상 등록</h3>
		</div>
		<div class="card-body ">
			  <div class="row">
          <div class="col-md-1"></div>
          <div class="col-md-6">
            <i class="fas fa-procedures fa-3x" style="color: #1a4f72;"></i> <span style="font-size: 36px; color: #6c757d;">&nbsp;&nbsp;${sckbdCountAndStats.rmndSckbdCnt }석</span>
          </div>
          <div class="input-group col-md-4 pr-0 pl-0" style="margin-top: 10px;">
            <input class="form-control" type="number" name="sckbdCnt" id="sckbdCnt" placeholder="" /> <span class="input-group-append col-sm-4 pl-0">
              <button type="button" class="btn btn-block btn-primary btn-sm" style="background: #1a4f72; color: #ffffff; border-color: #1a4f72; height: 31px;" onclick="submitbutton();">등록</button>
            </span>
          </div>
          <div class="col-md-1"></div>
        </div>
		</div>
		
		<div class="card-header" style="background-color: #1a4f72; color:white;">
			<h3 class="card-title">사용현황</h3>
		</div>
		
		<div class="card-body pl-0 pr-0">
			<div class="table-responsive">
                <table class="table table-bordered">
                  <thead>
                  	<tr>
                  		<th colspan="5" style="text-align:center;">현황</th>
                  	</tr>
                  </thead>
                  <tbody>
                    <tr style="text-align: center; font-weight: bold; background-color:#f5fafc ">
                      <th class="col-md-2">총 병상</th>
                      <th class="col-md-2">입소환자</th>
                      <th class="col-md-2">잔여병상</th>
                      <th class="col-md-2">승인대기</th>
                      <th class="col-md-2">가동률</th>
                    </tr>
                    <tr style="text-align: center">
                      <td>${sckbdCountAndStats.sckbdCnt }</td>
                      <td>${sckbdCountAndStats.isoptntCount }</td>
                      <td>${sckbdCountAndStats.rmndSckbdCnt }</td>
                      <td>${sckbdCountAndStats.sckbdreqCount }</td>
                      <td><span class="badge badge-success" style="background-color:${sckbdCountAndStats.color}; border-color: ${sckbdCountAndStats.color};">${sckbdCountAndStats.opRate }%</span></td>
                    </tr>
                  </tbody>
                </table>
                <table class="table table-bordered">
                  <thead>
					<tr>
						<th colspan="4" style="text-align:center;">전날 현황</th>
					</tr>
                  </thead>
                  <tbody>
                    <tr style="text-align: center; font-weight: bold; background-color:#f5fafc ">
                      <th class="col-md-3">진료요청</th>
                      <th class="col-md-3">격리인원</th>
                      <th class="col-md-3">이원인원</th>
                      <th class="col-md-3">퇴원인원</th>
                    </tr>
                    <tr style="text-align: center">
                      <td>${sckbdCountAndStats.reqDgnssCnt}</td>
                      <td>${sckbdCountAndStats.inIsoptntCnt }</td>
                      <td>${sckbdCountAndStats.outIsoptntCnt }</td>
                      <td>${sckbdCountAndStats.rlsedCnt }</td>
                    </tr>
                  </tbody>
                </table>
			</div>
		</div>
		
		
		<div class="col-md-3 float-right">
			<button type="button" onclick="Close();" class="btn btn-block btn-danger ">닫기</button>
		</div>
	</div>
	</div>
<input type="hidden" id="rmndCnt" value="${sckbdCountAndStats.rmndSckbdCnt }">
</body>