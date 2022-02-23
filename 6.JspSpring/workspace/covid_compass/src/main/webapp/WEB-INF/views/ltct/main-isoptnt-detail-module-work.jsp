<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="reqsckbd" value="${sckbdreq}" />
  <section class="content">
	<div class="card" style="margin: 1px; height: 763px; margin-top: 13px;">
		<div class="card-body">
		            <table class="table table-bordered" style="border-left-color: white; border-right-color: white;">
	<thead>
		<tr>
			<th style="font-size: 17px;">
				<div class="row m-0" style="justify-content: space-between;">
                  		<label style="font-size: 17px; margin: 0px;">입소자 상세정보</label>
                  		<button type="button" class="btn btn-sm btn-primary" id="enableReadRrn" onclick="enableReadRrn(this);" data-enable="N" data-rrn="" data-manageNo="">개인정보 열람</button>
                  		<div id="hiddenRrn" style="display:none;">${sckbdreq.rrn }</div>
                  	</div>
			</th>
		</tr>
	</thead>
		<tr class="ddoing" style="height: 12px; border : 1px solid white;"></tr>
	</table>
	
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
										  <input name="pstiNm" type="text" class="form-control" id="pstiNm" value="${sckbdreq.pstiNm }" readonly="readonly">
										</div>
									  </div>
									</div>
								    <div class="form-group col-lg-4">
									  <div class="row">
										<label for="nlty" class="col-sm-6 control-label text-left" style="padding-top: 0px;">국적</label>
										  <div class="col-sm-12">
											<input name="nlty" type="text" class="form-control" id="slf_nlty" value="${sckbdreq.nlty }" readonly="">
										  </div>
										</div>
									  </div>
							 	      <div class="form-group col-lg-4">
										<div class="row">
										  <div class="col-lg-6">
											<label for="age" class="col-sm-12 control-label text-left">나이</label>
											  <div class="row">
												<div class="col-sm-12">
												  <input name="age" type="text" class="form-control" id="slf_age" value="${sckbdreq.age }" readonly="">
												</div>
											  </div>
										  </div>
										  <div class="col-lg-6">
											<label for="gender" class="col-sm-12 control-label text-left">성별</label>
											  <div class="row">
												<div class="col-sm-12">
												  <input name="gender" type="text" class="form-control" id="slf_gender" value="${sckbdreq.gender }" readonly="">
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
										    <input name="rrn" id="openRrn" type="text" class="form-control" value="${fn:substring(sckbdreq.rrn,0,8) }******" readonly="">
										  </div>
									    </div>
									  </div>
							        <div class="form-group col-lg-4">
									  <div class="row">
										<label for="pstiTelno" class="col-sm-4 control-label text-left">연락처</label>
										  <div class="col-sm-12">
											<input name="pstiTelno" type="text" class="form-control" id="pstiTelno" value="${sckbdreq.pstiTelno }" readonly="readonly">
										  </div>
										</div>
									</div>
							
									<div class="form-group col-lg-2">
									  <div class="row">
										<label for="feverYn" class="col-sm-12 control-label text-left" style="padding-top: 0px;">발열여부</label>
										  <div class="col-sm-12">
											<input name="feverYn" type="text" class="form-control" id="slf_feverYn" value="${sckbdreq.feverYn }" readonly="">
										  </div>
									  </div>
									</div>
									<div class="form-group col-lg-2">
									  <div class="row">
										<label for="pregnYn" class="col-sm-12 control-label text-left" style="padding-top: 0px;">임신여부</label>
										  <div class="col-sm-12">
											<input name="pregnYn" type="text" class="form-control" id="pregnYn" value="${sckbdreq.pregnYn }" readonly="readonly">
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
								    <input name="pstiAdres" type="text" class="form-control" id="pstiAdres" value="${sckbdreq.pstiAdres }" readonly="readonly">
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
												<input name="wrtYmd" type="text" class="form-control" id="slf_reqYmd" value="${sckbdreq.inYmd }" readonly="">
											</div>
										</div>
									</div>
							
									<div class="form-group col-lg-3">
										<div class="row">
											<label for="rechkdYn" class="col-sm-12 control-label text-left">입소일자</label>
											<div class="col-sm-12">
												<input name="rechkdYn" type="text" class="form-control" id="slf_rechkdYn" value="${sckbdreq.isoptntInYmd }" readonly="">
											</div>
										</div>
									</div>
							
							
									<div class="form-group col-lg-2">
										<div class="row">
											<label for="vacCode" class="col-sm-12 control-label text-left" style="padding-top: 0px;">백신접종</label>
											<div class="col-sm-12">
												<input name="vacCode" type="text" class="form-control" id="slf_vacCode" value="${sckbdreq.vac }" readonly="">
											</div>
										</div>
									</div>
							
									<div class="form-group col-lg-2">
										<div class="row">
											<label for="feverYn" class="col-sm-12 control-label text-left" style="padding-top: 0px;">검사결과</label>
											<div class="col-sm-12">
												<input name="feverYn" type="text" class="form-control" id="slf_pstvYn" value="${sckbdreq.inYmd }" readonly="">
											</div>
										</div>
									</div>
									<div class="form-group col-lg-2">
										<div class="row">
											<label for="ngtvCnt" class="col-sm-12 control-label text-left" style="padding-top: 0px;">누적음성횟수</label>
											<div class="col-sm-12">
												<input name="ngtvCnt" type="text" class="form-control" id="slf_ngtv_cnt" value="${sckbdreq.ngtvCnt }" readonly="readonly">
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
												<input name="symptms" type="text" class="form-control" id="slf_symptms" value="${sckbdreq.symptms }" readonly="">
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
											<td class="col-md-4" id="slf_inst_nm">${sckbdreq.instNm }</td>
											<th class="col-md-2" style="text-align:center;">진료결과</th>
											<td class="col-md-4" id="slf_dgnss_result_code">${sckbdreq.dgnssResultCode }</td>
										</tr>
										<tr class="shittr" style="text-align: center;">
											<th rowspan="4" style="vertical-align: middle;">진료메모</th>
											<td colspan="3" style="height: 111px; vertical-align: middle; text-align: left;" id="slf_dgnss_note">${sckbdreq.dgnssNote }</td>
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
		</div>
		<!-- /.card -->
	</div>
	<!-- search bar -->
</section>