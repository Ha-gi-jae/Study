<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>HeHe System</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="/covid/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/covid/resources/bootstrap/dist/css/adminlte.min.css">
   <!-- summernote -->
  <link rel="stylesheet" href="/covid/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">
  <style>
   *{
   		font-size:13px;
   }
  </style>
  </head>
<body class="hold-transition sidebar-mini">

<section class="content">
<div class="row" style="margin: 1px;">
  <div class="col-12 pl-0 pr-0" style="margin-top: 17px;">
    <div class="card">
      <div class="card-header p-0 t-1">
        <ul class="nav nav-pills ml-auto p-2" id="custom-tabs-two-tab" role="tablist">
          <li class="nav-item">
            <a class="nav-link active" id="custom-cnfrm-dgnss-regist-tab" data-toggle="pill" href="#custom-cnfrm-dgnss-regist" role="tab" aria-controls="custom-tabs-three-home-tab" aria-selected="true">진료요청 대기환자 목록</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="custom-cnfrm-dgnss-regist-list-tab" data-toggle="pill" href="#custom-cnfrm-dgnss-regist-list-detail" role="tab" aria-controls="custom-tabs-three-profile-tab" aria-selected="false">진료 요청 목록</a>
          </li>
          
          <li style="margin-left: 685px;">
					<!-- search bar -->
					<div class="input-group float-right" style="max-width: 600px; width:300px;">
								
						<!-- search bar -->
                    	
						<select class="form-control " name="searchType" id="searchType" >
							<option value="" >검색구분</option>
							<option value="n"
								>시료번호</option>
							<option value="p"
								>요청기관</option>
						</select>

						<!-- keyword -->
						<input class="form-control" type="text" name="keyword"
							value=""
							style="width: 18%; display: inline-block;" />
						<span class="input-group-append">
							<button class="btn btn-primary" type="button" id="searchBtn"
								style="background: #1a4f72; color: #ffffff; border-color: #1a4f72; display: inline-block; margin-bottom: 4px; margin-left: -7px;"
								data-card-widget="search" onclick="">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
						</div>
					</li>
        </ul>
      </div>
      <div class="card-body">
        <div class="tab-content" id="custom-tabs-two-tabContent">
          <div class="tab-pane fade show active" id="custom-cnfrm-dgnss-regist" role="tabpanel" aria-labelledby="custom-tabs-three-home-tab">
          	<!-- 진료 요청 대기환자 목록 -->
<div class="row" style="margin: 1px;">
<div class="col-md-6 pl-0">
  <div class="card">
			<!-- search bar -->
			<div class="card-body">
		<div class="table-responsive">
			<table class="table table-hover text-nowrap"
				style="text-align: center;">
				<thead>
					<tr role="row">
						<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
							aria-label="Browser: activate to sort column ascending">확진자코드</th>
						<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
							aria-label="Browser: activate to sort column ascending">성명</th>
						<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
							aria-sort="ascending"
							aria-label="Rendering engine: activate to sort column descending">연락처</th>
						<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
							aria-label="Platform(s): activate to sort column ascending">확정일자</th>
					</tr>
				</thead>
				<tbody>
					<tr onclick="OpenWindow('cnfrm-detail-dgnss-regist','확진자 진료 신청', 1260, 715)">
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>010-5678-1234</td>
						<td>2022-01-01</td>
					</tr>
					<tr onclick="OpenWindow('cnfrm-detail-dgnss-regist','확진자 진료 신청', 1260, 715)">
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>010-5678-1234</td>
						<td>2022-01-01</td>
					</tr>
					<tr onclick="OpenWindow('cnfrm-detail-dgnss-regist','확진자 진료 신청', 1260, 715)">
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>010-5678-1234</td>
						<td>2022-01-01</td>
					</tr>
					<tr onclick="OpenWindow('cnfrm-detail-dgnss-regist','확진자 진료 신청', 1260, 715)">
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>010-5678-1234</td>
						<td>2022-01-01</td>
					</tr>
					<tr onclick="OpenWindow('cnfrm-detail-dgnss-regist','확진자 진료 신청', 1260, 715)">
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>010-5678-1234</td>
						<td>2022-01-01</td>
					</tr>
					<tr onclick="OpenWindow('cnfrm-detail-dgnss-regist','확진자 진료 신청', 1260, 715)">
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>010-5678-1234</td>
						<td>2022-01-01</td>
					</tr>
					<tr onclick="OpenWindow('cnfrm-detail-dgnss-regist','확진자 진료 신청', 1260, 715)">
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>010-5678-1234</td>
						<td>2022-01-01</td>
					</tr>
					<tr onclick="OpenWindow('cnfrm-detail-dgnss-regist','확진자 진료 신청', 1260, 715)">
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>010-5678-1234</td>
						<td>2022-01-01</td>
					</tr>
					<tr onclick="OpenWindow('cnfrm-detail-dgnss-regist','확진자 진료 신청', 1260, 715)">
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>010-5678-1234</td>
						<td>2022-01-01</td>
					</tr>
					<tr onclick="OpenWindow('cnfrm-detail-dgnss-regist','확진자 진료 신청', 1260, 715)">
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>010-5678-1234</td>
						<td>2022-01-01</td>
					</tr>
					<tr onclick="OpenWindow('cnfrm-detail-dgnss-regist','확진자 진료 신청', 1260, 715)">
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>010-5678-1234</td>
						<td>2022-01-01</td>
					</tr>
					<tr onclick="OpenWindow('cnfrm-detail-dgnss-regist','확진자 진료 신청', 1260, 715)">
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>010-5678-1234</td>
						<td>2022-01-01</td>
					</tr>
					<tr onclick="OpenWindow('cnfrm-detail-dgnss-regist','확진자 진료 신청', 1260, 715)">
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>010-5678-1234</td>
						<td>2022-01-01</td>
					</tr>
					<tr onclick="OpenWindow('cnfrm-detail-dgnss-regist','확진자 진료 신청', 1260, 715)">
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>010-5678-1234</td>
						<td>2022-01-01</td>
					</tr>
					<tr onclick="OpenWindow('cnfrm-detail-dgnss-regist','확진자 진료 신청', 1260, 715)">
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>010-5678-1234</td>
						<td>2022-01-01</td>
					</tr>
				</tbody>
			</table>

		</div>
		<!-- /.table-responsive -->
		<div>
		<!-- <nav aria-label="Navigation"> -->
  <ul class="pagination justify-content-center m-0">
    <li class="page-item"><a class="page-link" href="javascript:list_go(1);"> <i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
    </a></li>
    <li class="page-item"><a class="page-link" href="javascript:list_go(1);"> <i class="fas fa-angle-left" style="color:#1a4f72;"></i>
    </a></li>

    <li class="page-item active" ><a class="page-link" href="javascript:list_go(1);" style="background:#1a4f72; border-color:#1a4f72;" >1</a></li>
    <li class="page-item"><a class="page-link" href="javascript:list_go(2);" style="color:#1a4f72;">2</a></li>
    <li class="page-item"><a class="page-link" href="javascript:list_go(3);" style="color:#1a4f72;">3</a></li>
    <li class="page-item"><a class="page-link" href="javascript:list_go(4);" style="color:#1a4f72;">4</a></li>
    <li class="page-item"><a class="page-link" href="javascript:list_go(5);" style="color:#1a4f72;">5</a></li>
    <li class="page-item"><a class="page-link" href="javascript:list_go(6);" style="color:#1a4f72;">6</a></li>
    <li class="page-item"><a class="page-link" href="javascript:list_go(7);" style="color:#1a4f72;">7</a></li>
    <li class="page-item"><a class="page-link" href="javascript:list_go(8);" style="color:#1a4f72;">8</a></li>
    <li class="page-item"><a class="page-link" href="javascript:list_go(9);" style="color:#1a4f72;">9</a></li>
    <li class="page-item"><a class="page-link" href="javascript:list_go(10);" style="color:#1a4f72;">10</a></li>

    <li class="page-item"><a class="page-link" href="javascript:list_go(11);"> <i class="fas fa-angle-right" style="color:#1a4f72;"></i>
    </a></li>
    <li class="page-item"><a class="page-link" href="javascript:list_go(57);"> <i class="fas fa-angle-double-right" style="color:#1a4f72;"></i>
    </a></li>
  </ul>
</nav></div>
	 </div>	
  </div>
</div>
<div class="col-md-6 pr-0">
	<!-- /.card-body -->
	<div class="card">
	 <div class="card-body">
				<table class="table table-bordered">
                  <thead>
                  	<tr>
                  		<th colspan="4">확진자 상세 정보</th>
                  	</tr>
                  </thead>
                  <tbody>
                    <tr style="text-align: center;">
                      <th>성명</th>
                      <td>홍길동</td>
                      <th>국적</th>
                      <td>KOREA</td>
                    </tr>
                    <tr class="shittr"  style="text-align: center;">
                      <th>검사경위</th>
                      <td>본인판단</td>
                      <th>백신접종</th>
                      <td>3차 이상</td>
                    </tr>
                    <tr class="shittr"  style="text-align: center;">
                      <th>성별</th>
                      <td>남</td>
                      <th>나이</th>
                      <td>27</td>
                    </tr>
                    <tr class="shittr"  style="text-align: center;">
                      <th>발열여부</th>
                      <td>Y</td>
                      <th>임신여부</th>
                      <td>N</td>
                    </tr>
                    <tr class="shittr"  style="text-align: center;">
                      <th>확정일자</th>
                      <td>2022-01-01</td>
                      <th>결과</th>
                      <td>양성</td>
                    </tr>
                    <tr class="shittr"  style="text-align: center;">
                      <th>확진자 코드</th>
                      <td colspan="3">CNFM202201061000005</td>
                    </tr>
                    <tr class="shittr"  style="text-align: center;">
                      <th>주민/외국인등록번호</th>
                      <td colspan="3">960101-1111111</td>
                    </tr>
                    <tr class="shittr"  style="text-align: center;">
                      <th>주소</th>
                      <td colspan="3">대전광역시 서구 둔산동 1032 708호</td>
                    </tr>
                    <tr class="shittr"  style="text-align: center;">
                      <th>연락처</th>
                      <td colspan="3">010-5678-1234</td>
                    </tr>
                    <tr class="shittr"  style="text-align: center;">
                      <th>증상</th>
                      <td colspan="3">기침, 두통, 복통, 어지러움</td>
                    </tr>
                  </tbody>
                </table>
                		<div style="text-align: center; margin-bottom: 20px; margin-top: 10px;">
	                      <button onclick="OpenWindow('cnfrm-detail-dgnss-regist', '진료 신청 정보', 1260, 715)" class="btn btn-success btn-sm" style="width: 50%; height: 35px; background: #1a4f72; border: #1a4f72;">진료요청</button>
                		</div>
                		<div style="margin-bottom: 198px;"></div>
                 </div>
                </div>
			</div>
</div></div>
          <div class="tab-pane fade" id="custom-cnfrm-dgnss-regist-list-detail" role="tabpanel" aria-labelledby="custom-tabs-three-profile-tab">
            <!-- 진료 신청 목록 -->
<div class="row" style="margin: 1px;">
<div class="col-md-6 pl-0">
  <div class="card">
  	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-hover text-nowrap"
				style="text-align: center;">
				<thead>
					<tr role="row">
						<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
							aria-label="Browser: activate to sort column ascending">확진자 코드</th>
						<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
							aria-label="Browser: activate to sort column ascending">성명</th>
						<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
							aria-sort="ascending"
							aria-label="Rendering engine: activate to sort column descending">진료 기관</th>
						<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
							aria-label="Platform(s): activate to sort column ascending">진료 요청시간</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>을지대학병원</td>
						<td>2022-01-01 13:57:21</td>
					</tr>
					<tr>
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>을지대학병원</td>
						<td>2022-01-01 13:57:21</td>
					</tr>
					<tr>
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>을지대학병원</td>
						<td>2022-01-01 13:57:21</td>
					</tr>
					<tr>
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>을지대학병원</td>
						<td>2022-01-01 13:57:21</td>
					</tr>
					<tr>
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>을지대학병원</td>
						<td>2022-01-01 13:57:21</td>
					</tr>
					<tr>
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>을지대학병원</td>
						<td>2022-01-01 13:57:21</td>
					</tr>
					<tr>
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>을지대학병원</td>
						<td>2022-01-01 13:57:21</td>
					</tr>
					<tr>
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>을지대학병원</td>
						<td>2022-01-01 13:57:21</td>
					</tr>
					<tr>
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>을지대학병원</td>
						<td>2022-01-01 13:57:21</td>
					</tr>
					<tr>
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>을지대학병원</td>
						<td>2022-01-01 13:57:21</td>
					</tr>
					<tr>
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>을지대학병원</td>
						<td>2022-01-01 13:57:21</td>
					</tr>
					<tr>
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>을지대학병원</td>
						<td>2022-01-01 13:57:21</td>
					</tr>
					<tr>
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>을지대학병원</td>
						<td>2022-01-01 13:57:21</td>
					</tr>
					<tr>
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>을지대학병원</td>
						<td>2022-01-01 13:57:21</td>
					</tr>
					<tr>
						<td>CNFM202201061000005</td>
						<td>강건</td>
						<td>을지대학병원</td>
						<td>2022-01-01 13:57:21</td>
					</tr>
				</tbody>
			</table>

		</div>
		<!-- /.table-responsive -->
		<div>
		<!-- <nav aria-label="Navigation"> -->
  <ul class="pagination justify-content-center m-0">
    <li class="page-item"><a class="page-link" href="javascript:list_go(1);"> <i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
    </a></li>
    <li class="page-item"><a class="page-link" href="javascript:list_go(1);"> <i class="fas fa-angle-left" style="color:#1a4f72;"></i>
    </a></li>

    <li class="page-item active" ><a class="page-link" href="javascript:list_go(1);" style="background:#1a4f72; border-color:#1a4f72;" >1</a></li>
    <li class="page-item"><a class="page-link" href="javascript:list_go(2);" style="color:#1a4f72;">2</a></li>
    <li class="page-item"><a class="page-link" href="javascript:list_go(3);" style="color:#1a4f72;">3</a></li>
    <li class="page-item"><a class="page-link" href="javascript:list_go(4);" style="color:#1a4f72;">4</a></li>
    <li class="page-item"><a class="page-link" href="javascript:list_go(5);" style="color:#1a4f72;">5</a></li>
    <li class="page-item"><a class="page-link" href="javascript:list_go(6);" style="color:#1a4f72;">6</a></li>
    <li class="page-item"><a class="page-link" href="javascript:list_go(7);" style="color:#1a4f72;">7</a></li>
    <li class="page-item"><a class="page-link" href="javascript:list_go(8);" style="color:#1a4f72;">8</a></li>
    <li class="page-item"><a class="page-link" href="javascript:list_go(9);" style="color:#1a4f72;">9</a></li>
    <li class="page-item"><a class="page-link" href="javascript:list_go(10);" style="color:#1a4f72;">10</a></li>

    <li class="page-item"><a class="page-link" href="javascript:list_go(11);"> <i class="fas fa-angle-right" style="color:#1a4f72;"></i>
    </a></li>
    <li class="page-item"><a class="page-link" href="javascript:list_go(57);"> <i class="fas fa-angle-double-right" style="color:#1a4f72;"></i>
    </a></li>
  </ul>
</nav></div>
	</div>
  </div>
</div>
<div class="col-md-6 pr-0">
	<!-- /.card-body -->
				<div class="card">
				<div class="card-body">
				<table class="table table-bordered">
                  <thead>
                  	<tr>
                  		<th colspan="4">확진자 진료 요청 정보</th>
                  	</tr>
                  </thead>
                  <tbody>
                    <tr style="text-align: center;">
                      <th>성명</th>
                      <td>홍길동</td>
                      <th>국적</th>
                      <td>KOREA</td>
                    </tr>
                    <tr class="shittr"  style="text-align: center;">
                      <th>검사경위</th>
                      <td>본인판단</td>
                      <th>백신접종</th>
                      <td>3차 이상</td>
                    </tr>
                    <tr class="shittr"  style="text-align: center;">
                      <th>성별</th>
                      <td>남</td>
                      <th>나이</th>
                      <td>27</td>
                    </tr>
                    <tr class="shittr"  style="text-align: center;">
                      <th>발열여부</th>
                      <td>Y</td>
                      <th>임신여부</th>
                      <td>N</td>
                    </tr>
                    <tr class="shittr"  style="text-align: center;">
                      <th>확정일자</th>
                      <td>2022-01-01</td>
                      <th>결과</th>
                      <td>양성</td>
                    </tr>
                    <tr class="shittr"  style="text-align: center;">
                      <th>확진자 코드</th>
                      <td>CNFM202201061000005</td>
                      <th>상태</th>
                      <td>진료병원지정대기</td>
                    </tr>
                    <tr class="shittr"  style="text-align: center;">
                      <th>주민/외국인등록번호</th>
                      <td colspan="3">960101-1111111</td>
                    </tr>
                    <tr class="shittr"  style="text-align: center;">
                      <th>주소</th>
                      <td colspan="3">대전광역시 서구 둔산동 1032 708호</td>
                    </tr>
                    <tr class="shittr"  style="text-align: center;">
                      <th>연락처</th>
                      <td colspan="3">010-5678-1234</td>
                    </tr>
                    <tr class="shittr"  style="text-align: center;">
                      <th>증상</th>
                      <td colspan="3">기침, 두통, 복통, 어지러움</td>
                    </tr>
                    <tr class="shittr"  style="text-align: center;">
                      <th>진료기관</th>
                      <td colspan=>을지대학병원</td>
                      <th>요청 상태</th>
                      <td colspan=>대기</td>
                    </tr>
                    <tr class="shittr"  style="text-align: center;">
                      <th>진료 기관주소</th>
                      <td colspan="3">대전광역시 서구 둔산동  1232 을지대학병원</td>
                    </tr>
                    <tr class="shittr"  style="text-align: center;">
                      <th>연락처</th>
                      <td>042-222-4568</td>
                      <th>요청 시간</th>
                      <td>2022-01-01 13:57:21</td>
                    </tr>
                  </tbody>
                </table>
                    <div style="text-align: center; margin-bottom: 24px; margin-top: 10px;">
	                      	<button class="btn btn-success btn-sm" style="width: 50%;  height: 35px; background: #1a4f72; border: #1a4f72;">진료 요청 취소</button>
                    </div>
                    <div style="margin-bottom: 78px;"></div>
              </div>
              
              </div>
                
			</div>
</div></div>
        </div>
      </div>
      <!-- /.card -->
    </div>
  </div>
</div>
</section>
<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="/covid/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<!-- Bootstrap 4 -->
<script src="/covid/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/covid/resources/bootstrap/dist/js/adminlte.min.js"></script>
<!-- Summernote -->
<script src="/covid/resources/bootstrap/plugins/summernote/summernote-bs4.min.js"></script>
<!-- common.jsa -->
<script src="/covid/resources/js/common.js"></script>


<!-- DataTables  & Plugins -->
<script src="/covid/resources/bootstrap/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="/covid/resources/bootstrap/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

<script src="/covid/resources/bootstrap/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="/covid/resources/bootstrap/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="/covid/resources/bootstrap/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="/covid/resources/bootstrap/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="/covid/resources/bootstrap/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="/covid/resources/bootstrap/plugins/jszip/jszip.min.js"></script>
<script src="/covid/resources/bootstrap/plugins/pdfmake/pdfmake.min.js"></script>
<script src="/covid/resources/bootstrap/plugins/pdfmake/vfs_fonts.js"></script>
<script src="/covid/resources/bootstrap/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="/covid/resources/bootstrap/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="/covid/resources/bootstrap/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>

</body>
</html>
