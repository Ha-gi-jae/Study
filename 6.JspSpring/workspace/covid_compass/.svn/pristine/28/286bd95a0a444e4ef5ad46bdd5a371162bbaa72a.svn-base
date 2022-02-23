<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!-- 진료 신청 목록 -->
<div class="row" style="margin: 1px;">
	<div class="col-md-6 pl-0">
		<div class="card">
			<div class="card-body">
				<div class="table-responsive">
					<div style="height: 662px;">
						<table class="table table-hover text-nowrap" style="text-align: center;">
							<thead>
								<tr role="row">
									<th style="width: 12%">성명</th>
									<th style="width: 10%">나이</th>
									<th style="width: 20%">연락처</th>
									<th                   >생활치료센터이름</th>
									<th style="width: 10%">신청시각</th>
									<th style="width: 10%">신청결과</th>
								</tr>
							</thead>
							<tbody id="req-sckbd-ltct-list-table-tbody">
								<tr class="each-sckbdreq-element">
									<td colspan="6" class="initialTd">데이터 로딩중 입니다.</td>
								</tr>
							</tbody>
						</table>
                      <div id="req-sckbd-ltct-page-info-div" style="float: right;">
                      </div>  

					</div>
					<!-- /.table-responsive -->
				</div>
				<div class="card-footer clearfix pb-0 pt-0" style="background-color: white;">
					<ul class="pagination justify-content-center m-0" id="inptnt-req-list-pagination-ul">
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-6 pr-0">
		<!-- /.card-body -->
		<div class="card">
      <div class="card-body pb-0">
        <table class="table table-bordered" style="border-left-color: white; border-right-color: white;">
          <thead>
            <tr>
              <th colspan="4" style="font-size: 17px; padding: 7px;">
              
                        <div class="row m-0" style="justify-content: space-between;">
                    		<label style="font-size: 17px; margin: 0px;">병상신청 환자상세</label>
                    		<button type="button" class="btn btn-sm btn-primary enableReadRrn" id="enableReadRrn" onclick="enableReadRrn(this);" data-enable="N" data-rrn="" data-manageNo="">개인정보 열람</button>
                    	</div>
              
              </th>
            </tr>
          </thead>
          <tbody id="dgnss-detail-info-module">
            <tr class="ddoing dgnss-detail-info" style="height: 15px;"></tr>
            <tr class="shittr dgnss-detail-info">
              <th class="col-sm-3">성명</th>
              <td id="ltct-tab-pstiNm" class="col-sm-4"></td>
              <th class="col-sm-2">국적</th>
              <td id="ltct-tab-nlty" class="col-sm-3"></td>
            </tr>
            <tr class="shittr dgnss-detail-info">
              <th>병상신청일자</th>
              <td id="ltct-tab-sckbdreqYmd"></td>
              <th>백신접종</th>
              <td id="ltct-tab-vacType"></td>
            </tr>
            <tr class="shittr dgnss-detail-info">
              <th>성별</th>
              <td id="ltct-tab-gender"></td>
              <th>나이</th>
              <td id="ltct-tab-age"></td>
            </tr>
            <tr class="shittr dgnss-detail-info">
              <th>확정일자</th>
              <td id="ltct-tab-resYmd"></td>
              <th>결과</th>
              <td id="ltct-tab-pstvYn"></td>
            </tr>
            <tr class="shittr dgnss-detail-info">
              <th>발열여부</th>
              <td id="ltct-tab-feverYn"></td>
              <th>임신여부</th>
              <td id="ltct-tab-pregnYn"></td>
            </tr>
            <tr class="shittr dgnss-detail-info">
              <th>주민/외국인등록번호</th>
              <td id="ltct-tab-rrn"></td>
              <th>연락처</th>
              <td id="ltct-tab-pstiTelno"></td>
            </tr>
            <tr class="shittr dgnss-detail-info">
              <th>주소</th>
              <td colspan="3" id="ltct-tab-pstiAdres"></td>
            </tr>
            <tr class="shittr dgnss-detail-info">
              <th>증상</th>
              <td colspan="3" id="ltct-tab-symptms"></td>
            </tr>
            <tr class="shittr dgnss-detail-info">
              <th>병상신청기관</th>
              <td id="ltct-tab-ltctNm"></td>
              <th>기관연락처</th>
              <td id="ltct-tab-ltctTelno"></td>
            </tr>
            <tr class="shittr dgnss-detail-info">
              <th>신청결과</th>
              <td colspan="3" id="ltct-tab-sckbdreqCode"></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="card-body pb-0" style="">
        <table class="table table-bordered">
          <tbody>
            <tr class="shittr">
              <th class="col-md-3">진료병원</th>
              <td class="col-md-4" id="ltct-tab-dgnssHsptNm"></td>
              <th class="col-md-2">진료결과</th>
              <td class="col-md-3" id="ltct-tab-dgnssResultCode"></td>
            </tr>
            <tr class="shittr">
              <th rowspan="4" style="vertical-align: middle;">진료메모</th>
              <td colspan="3" style="height: 111px; vertical-align: middle; text-align: left;" id="ltct-tab-dgnssNote"></td>
            </tr>
          </tbody>
        </table>
		<div class="form-group row" style="padding-top: 45px;">
			<div class="col-md-3">
				<button type="button" id="sckbdreq-isoptnt-button" name="sckbdreq-isoptnt-button"  class="btn btn-block btn-primary btn-sm" style="background-color: #1a4f72; border-color: #1a4f72;"
				 data-manage-no="" data-sckbdreq-no="" data-psti-nm="" onclick='isoptntGo(this, "C");'>입소신청</button>
			</div>
			<div class="col-md-6"></div>
			<div class="col-md-3">
				<button type="button" id="cancle-btn-iso" class="btn btn-block btn-danger btn-sm"
				        data-child-no="" data-sckbdreq-no="" data-type="" onclick='isoCancleGo(this);'>취소</button>
			</div>
		</div>

      </div>
    </div>

	</div>
</div>