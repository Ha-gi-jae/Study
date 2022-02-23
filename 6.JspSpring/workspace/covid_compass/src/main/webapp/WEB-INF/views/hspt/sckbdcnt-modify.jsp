<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<head></head>

<title></title>

<body>
		<form action="<%=request.getContextPath() %>/hspt/sckbdcnt-modify-success" role="form" method="post">
	<div class="card card-success">
		<div class="register-card-body">
			<div class="card-header"
				style="background-color: #1a4f72; color: white;">
				<h3 class="card-title">병상 등록</h3>
			</div>
			<div class="card-body ">
				<div class="row">
					<input class="form-control form-control-lg col-md-4" type="number" name="inputSckbd" id="inputSckbd" value="" placeholder="bed input" />
					<button type="submit"
						class="btn btn-block btn-primary btn-sm col-md-1"
						style="height: 48px; background: #5b6f90; color: #ffffff; border-color: #1a4f72;" onclick="modify()">등록</button>
					<i class="fas fa-procedures fa-3x"
						style="margin-left: 130px; color: #c2c7d0;"></i> <span
						class="col-md-2" style="font-size: 36px; color: #6c757d;">&nbsp;&nbsp;${hspt.rmndSckbdCnt+inputSckbd}석</span>
				
				</div>

			</div>

			<div class="card-header" style="background-color: #1a4f72; color: white;">
				<h3 class="card-title">사용현황</h3>
			</div>

			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered">
						<thead>
							<tr style="text-align: center; font-weight: bold; background-color: #f5fafc">
								<th style="text-align: center;" colspan="4">현황</th>
							</tr>
						</thead>
						<tbody>
							<tr style="text-align: center; font-weight: bold; background-color: #f5fafc">
								<th>잔여병상수</th>
								<th>입원환자수</th>
								<th>총 병상수</th>
								<th>가동률</th>
							</tr>
							<tr style="text-align: center">
								<td><input type="text" id="rmndSckbdCnt" name="rmndSckbdCnt" value="${hspt.rmndSckbdCnt+inputSckbd}" disabled="disabled" style="border: none; text-align: center;"></td>
								<td>${cmd.curInptntCnt }</td>
								<td><input type="text" id="sckbdCnt" name="sckbdCnt" value="${hspt.sckbdCnt+inputSckbd}" disabled="disabled" style="border: none; text-align: center;"></td>
								<td><span class="badge badge-warning"><fmt:formatNumber value="${hspt.capacity }" pattern="0"/>%</span></td>
								
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
							<tr
								style="text-align: center; font-weight: bold; background-color: #f5fafc">
								<th>입원수</th>
								<th>퇴원수(완치)</th>
								<th>퇴원수(이원)</th>
								<th>퇴원수(사망)</th>
							</tr>
							<tr style="text-align: center">
								<td>${cmd.inptntCnt }</td>
								<td>${cmd.rlsedCnt }</td>
								<td>${cmd.goCnt }</td>
								<td>${cmd.deathCnt }</td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>


		</div>
	</div>
	</form>
 <script>
  function modify(){
	  $('form[role="form"]').submit();
  }
 </script>
</body>