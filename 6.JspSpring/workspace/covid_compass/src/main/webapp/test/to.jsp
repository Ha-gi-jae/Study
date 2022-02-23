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
    <div class="row" style="margin: 1px; margin-top: 7px;">
      <div class="col-lg-6 pl-0">
        <section class="content">
          <div class="card" style="margin: 1px; height: 763px; margin-top: 13px;">
            <div class="card-header d-flex p-0">
              <ul class="nav nav-pills ml-auto p-2" role="tablist">
                <li class="nav-item"><div class="input-group float-right" style="max-width: 600px; width: 300px;">
                    <!-- search bar -->
                    <select class="form-control " name="searchType" id="searchType">
                      <option value="" >검색구분</option>
                      <option value="n" >성 명</option>
                      <option value="p" >전화번호</option>
                    </select>

                    <!-- keyword -->
                    <input class="form-control" type="text" name="keyword" value="" style="width: 18%; display: inline-block;" /> <span class="input-group-append">
                      <button class="btn btn-primary" type="button" id="searchBtn" style="background: #1a4f72; color: #ffffff; border-color: #1a4f72; display: inline-block; margin-bottom: 4px; margin-left: -7px;" data-card-widget="search" onclick="">
                        <i class="fa fa-fw fa-search"></i>
                      </button>
                    </span>
                    <!-- end : search bar -->
                  </div></li>
              </ul>
            </div>
            <div class="card-body">
              <div class="tab-content" id="custom-tabs-three-tabContent">
                <div class="tab-pane fade show active" id="custom-psti-detail" role="tabpanel" aria-labelledby="custom-tabs-three-home-tab">
                  <section class="content">
  <div style="height: 640px;">
    <div class="table-responsive">
      <table class="table table-hover text-nowrap" style="text-align: center;">
        <thead>
              <tr role="row">
                <th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">환자이름</th>
                <th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">연락처</th>
                <th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">병원이름</th>
                <th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">신청시각</th>
                <th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="">신청결과</th>
              </tr>
        </thead>
         <tbody>
              <tr>
                <td><a href="pages/examples/invoice.html">하기재</a></td>
                <td>010-7777-7777</td>
                <td>기재병원</td>
                <td>01/12 00:11</td>
                <td><span class="badge badge-success">승인</span></td>
                
              </tr>
              <tr>
                <td><a href="pages/examples/invoice.html">하기재</a></td>
                <td>010-7777-7777</td>
                <td>기재병원</td>
                <td>01/12 00:11</td>
                <td><span class="badge badge-success">승인</span></td>
                
              </tr>
              <tr>
                <td><a href="pages/examples/invoice.html">하기재</a></td>
                <td>010-7777-7777</td>
                <td>기재병원</td>
                <td>01/12 00:11</td>
                <td><span class="badge badge-warning">반려</span></td>
                
              </tr>
              <tr>
                <td><a href="pages/examples/invoice.html">하기재</a></td>
                <td>010-7777-7777</td>
                <td>기재병원</td>
                <td>01/12 00:11</td>
                <td><span class="badge badge-success">승인</span></td>
                
              </tr>
              <tr>
                <td><a href="pages/examples/invoice.html">하기재</a></td>
                <td>010-7777-7777</td>
                <td>기재병원</td>
                <td>01/12 00:11</td>
                <td><span class="badge badge-success">승인</span></td>
                
              </tr>
              <tr>
                <td><a href="pages/examples/invoice.html">하기재</a></td>
                <td>010-7777-7777</td>
                <td>기재병원</td>
                <td>01/12 00:11</td>
                <td><span class="badge badge-success">승인</span></td>
                
              </tr>
              <tr>
                <td><a href="pages/examples/invoice.html">하기재</a></td>
                <td>010-7777-7777</td>
                <td>기재병원</td>
                <td>01/12 00:11</td>
                <td><span class="badge badge-success">승인</span></td>
                
              </tr>
              <tr>
                <td><a href="pages/examples/invoice.html">하기재</a></td>
                <td>010-7777-7777</td>
                <td>기재병원</td>
                <td>01/12 00:11</td>
                <td><span class="badge badge-info">승인대기</span></td>
                
              </tr>
              <tr>
                <td><a href="pages/examples/invoice.html">하기재</a></td>
                <td>010-7777-7777</td>
                <td>기재병원</td>
                <td>01/12 00:11</td>
                <td><span class="badge badge-info">승인대기</span></td>
                
              </tr>
              <tr>
                <td><a href="pages/examples/invoice.html">하기재</a></td>
                <td>010-7777-7777</td>
                <td>기재병원</td>
                <td>01/12 00:11</td>
                <td><span class="badge badge-secondary">취소</span></td>
                
              </tr>
              <tr>
                <td><a href="pages/examples/invoice.html">하기재</a></td>
                <td>010-7777-7777</td>
                <td>기재병원</td>
                <td>01/12 00:11</td>
                <td><span class="badge badge-secondary">취소</span></td>
                
              </tr>
              <tr>
                <td><a href="pages/examples/invoice.html">하기재</a></td>
                <td>010-7777-7777</td>
                <td>기재병원</td>
                <td>01/12 00:11</td>
                <td><span class="badge badge-success">승인</span></td>
                
              </tr>
              <tr>
                <td><a href="pages/examples/invoice.html">하기재</a></td>
                <td>010-7777-7777</td>
                <td>기재병원</td>
                <td>01/12 00:11</td>
                <td><span class="badge badge-success">승인</span></td>
                
              </tr>
              <tr>
                <td><a href="pages/examples/invoice.html">하기재</a></td>
                <td>010-7777-7777</td>
                <td>기재병원</td>
                <td>01/12 00:11</td>
                <td><span class="badge badge-info">승인대기</span></td>
                
              </tr>
              <tr>
                <td><a href="pages/examples/invoice.html">하기재</a></td>
                <td>010-7777-7777</td>
                <td>기재병원</td>
                <td>01/12 00:11</td>
                <td><span class="badge badge-info">승인대기</span></td>
                
              </tr>
            </tbody>

      </table>
    </div>
  </div>
  <div class="card-footer clearfix" style="background-color: white;">
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
</section>

</div>
              </div>
            </div>
            <!-- /.card -->
          </div>

        </section>

      </div>
<div class="col-lg-6 pr-0">
        <section class="content">
          <div class="card" style="margin: 1px; height: 763px; margin-top: 13px;">
            <div class="card-header d-flex p-0">
              <ul class="nav nav-pills ml-auto p-2" role="tablist">
                <li class="nav-item"><a class="nav-link active" id="psti-detail-tab" data-toggle="pill" href="#custom-dgnss-detail" role="tab" aria-controls="custom-tabs-three-home" aria-selected="true" style="cursor: default; background-color: #1a4f72;">환자 상세</a></li>
              </ul>
            </div>
            <div class="card-body">
              <div class="tab-content" id="custom-tabs-three-tabContent">
                <div class="tab-pane fade show active" id="custom-req-sckbd-detail" role="tabpanel" aria-labelledby="custom-tabs-three-home-tab">
                  <div class="" id="psti-detail-info-module">
  <table class="table table-bordered">
    <thead>
      <tr style="text-align: center;">
        <th>성명</th>
        <td>홍길동</td>
        <th>국적</th>
        <td>KOR</td>
      </tr>
    </thead>
    <tbody>
      <tr class="shittr" style="text-align: center;">
        <th>신청일자</th>
        <td>2021-01-12</td>
        <th>백신접종</th>
        <td>3차 이상</td>
      </tr>
      <tr class="shittr" style="text-align: center;">
        <th>성별</th>
        <td>남</td>
        <th>나이</th>
        <td>27</td>
      </tr>
      <tr class="shittr" style="text-align: center;">
        <th>확정일자</th>
        <td>2022-01-01</td>
        <th>결과</th>
        <td>양성</td>
      </tr>
      <tr class="shittr" style="text-align: center;">
        <th>발열여부</th>
        <td>Y</td>
        <th>임신여부</th>
        <td>N</td>
      </tr>
      <tr class="shittr" style="text-align: center;">
        <th>주민/외국인등록번호</th>
        <td>960101-1111111</td>
        <th>연락처</th>
        <td>010-5678-1234</td>
      </tr>
      <tr class="shittr" style="text-align: center;">
        <th>환자주소</th>
        <td colspan="3">대전광역시 서구 둔산동 1032 70호8</td>
      </tr>
      <tr class="shittr" style="text-align: center;">
        <th>증상</th>
        <td colspan="3">기침, 두통, 복통, 어지러움</td>
      </tr>
      <tr class="shittr" style="text-align: center;">
        <th>병상신청기관</th>
        <td>기재병원</td>
        <th>기관연락처</th>
        <td>010-5678-1234</td>
      </tr>
      <tr class="shittr" style="text-align: center;">
        <th>신청기관 주소</th>
        <td colspan="3">대전광역시 서구 둔산동 1032 70호8</td>
      </tr>
      <tr class="shittr" style="text-align: center;">
        <th>신청결과</th>
        <td colspan="3">승인</td>
      </tr>
    </tbody>
  </table>
  <table class="table table-bordered">
    <tr>
      <td colspan="4">
        <div class="form-group row">
          <label for="inputPassword3" class="col-sm-12 control-label text-center" style="padding-top: 7px;">진료 메모</label>
        </div>
        <div class="form-group row">
          <div class="col-sm-12">
            <div style="border: 1px solid #e9e9e9; width: 520px; height: 100px; overFlow: auto; margin-left: 23px;">
              <span>진료결과</span>
            </div>
          </div>
        </div>
      </td>
    </tr>
  </table>
  <div class="form-group row" style="padding-top: 6px;">
    <div class="col-md-9"></div>
    <div class="col-md-3">
      <button style="background-color: #1a4f72; border-color: #1a4f72;" type="button" class="btn btn-block btn-primary btn-sm">취소</button>
    </div>
  </div>
</div>
</div>
              </div>
            </div>
            <!-- /.card -->
          </div>
          <!-- search bar -->
        </section>
      </div> 
      <!-- /.card-body -->
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
