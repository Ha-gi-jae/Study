<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/resources/DataTables/datatables.css">
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="../resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- DataTables -->
<link rel="stylesheet"
	href="../resources/bootstrap/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="../resources/bootstrap/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet"
	href="../resources/bootstrap/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="../resources/bootstrap/dist/css/adminlte.min.css">
</head>
<title>Insert title here</title>

<body>

	<div class="container body">
		<div class="main_container">
			<!-- 메에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에에인  -->

			<!-- page content -->
			<div class="right_col" role="main">
				<!-- 내 작업 바디 시작 -->
				<div class="x_panel">
					<div class="x_title">
						<h2>
							<i class="fa fa-edit"></i> 프로젝트 <small>* 커스터 마이징 해주세요.</small>
						</h2>

						<div class="clearfix"></div>
					</div>

					<div class="x_content">
						<ul class="nav nav-tabs bar_tabs" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="home-tab" data-toggle="tab" href="#home" role="tab"
								aria-controls="home" aria-selected="true">프로젝트
									리스트</a></li>
						</ul>
						<!-- 테이블 데이터 리스트 -->
						<div class="x_content">
							<div class="row">
								<div class="col-sm-12">
									<div class="card-box table-responsive">
										<p class="text-muted font-13 m-b-30">모든 프로젝트 리스트를 출력합니다.</p>
										<div id="test-all" class="row">
											<div id="test" class="row"></div>
											<div id="test2" class="row" style="display: flexbox;"></div>
										</div>
										<table id="example" class="table table-striped table-bordered"
											style="width: 100%"></table>
									</div>
								</div>
							</div>
						</div>
						<!-- 리스트 종료 -->
					</div>
				</div>
				<!-- 내 작업 바디 끝 -->
			</div>

			<!-- /page content -->

			<!-- footer content -->
			<footer>
				<div class="pull-right">
					Copyright © 2022 <a
						href="<%=request.getContextPath()%>/probada.com/index"
						style="color: #73879c">probada</a> App Company.
					All Rights Reserved.
				</div>
				<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->
		</div>
	</div>

	<!-- jQuery -->
	<script
		src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="../resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- DataTables  & Plugins -->
	<script
		src="../resources/bootstrap/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="../resources/bootstrap/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="../resources/bootstrap/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="../resources/bootstrap/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script
		src="../resources/bootstrap/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="../resources/bootstrap/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
	<script src="../resources/bootstrap/plugins/jszip/jszip.min.js"></script>
	<script src="../resources/bootstrap/plugins/pdfmake/pdfmake.min.js"></script>
	<script src="../resources/bootstrap/plugins/pdfmake/vfs_fonts.js"></script>
	<script
		src="../resources/bootstrap/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
	<script
		src="../resources/bootstrap/plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script
		src="../resources/bootstrap/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../resources/bootstrap/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../resources/bootstrap/dist/js/demo.js"></script>
	<script type="text/javascript" charset="utf8"
		src="<%=request.getContextPath() %>/resources/DataTables/datatables.js"></script>

	<!-- Page specific script -->

    <!-- dataTable 설정구간 여기에요 -->
    <script>
      // 데이터 입력받는 곳
      var dataSet = [
        [
          '<a class="project-name" href="./my-project.html">남양(주) 사이트 유지보수<a> <i class="fa fa-globe fa-lg"></i>',
          "mimi2022",
          "2011-04-25",
          '<i class="fa fa-spinner fa-pulse"></i> 진행중',
          ],
          [
          '테슬라 자율주행 렌더링 <i class="fa fa-shield fa-lg"></i>',
          "StoneEnergyTA",
          "2021-08-21",
          '<i class="fa fa-check-circle-o fa-lg"></i> 완료',
          ],
          [
          '현대자동차 배터리 용접 <i class="fa fa-lock fa-lg"></i>',
          "SpearWaterDA",
          "2020-03-11",
          '<i class="fa fa-spinner fa-pulse"></i> 진행중',
          ],
          [
          '구글 자연어 DB 프로젝트 <i class="fa fa-shield fa-lg"></i>',
          "BronzeRootUA",
          "2021-01-07",
          '<i class="fa fa fa-exclamation-triangle" style="color:red"></i> 파기요청',
          ],
          [
          '하나은행 공식홈페이지 <i class="fa fa-globe fa-lg"></i>',
          "EnergyWookAA",
          "2020-01-11",
          '<i class="fa fa-spinner fa-pulse"></i> 진행중',
          ],
          [
          '대한항공 키오스크 보수 <i class="fa fa-lock fa-lg"></i>',
          "RealHyeokPL",
          "2021-01-11",
          '<i class="fa fa-spinner fa-pulse"></i> 진행중',
        ],
      ];
      // 컬럼명 입력받는 곳
      var col_title = [
        { title: "프로젝트명" },
        { title: "담당자" },
        { title: "시작일" },
        { title: "진행상태" },
      ];

      // 소트용 데이터
      var sort_data = [
        { title: '진행상태'},
        { title: '진행중' },
        { title: "파기요청" },
        { title: "완료" },
      ];
      // Korean
      var lang_kor = {
        decimal: "",
        emptyTable: "데이터가 없습니다.",
        info: "_START_ - _END_ (총 _TOTAL_ 개)",
        infoEmpty: "0개",
        infoFiltered: "(전체 _MAX_ 개 중 검색결과)",
        infoPostFix: "",
        thousands: ",",
        lengthMenu: "_MENU_ 개씩 보기",
        loadingRecords: "로딩중...",
        processing: "처리중...",
        search: "검색 : ",
        zeroRecords: "검색된 데이터가 없습니다.",
        paginate: {
          first: "첫 페이지",
          last: "마지막 페이지",
          next: "다음",
          previous: "이전",
        },
        aria: {
          sortAscending: " :  오름차순 정렬",
          sortDescending: " :  내림차순 정렬",
        },
      };

      $(document).ready(function () {
//         var table = $("#example").DataTable({
//           data: dataSet,
//           columns: col_title,
//           language: lang_kor,
//           dom: 'B<"clear">lfrtip',
//           buttons: [
//           "pdf",
//           "copy",
//           "excel",
//           {
//             text: "프로젝트 추가",
//             action: function () {
//               alert("추가 페이지로 이동");
//             },
//           },
//           ]
//         });
        var table = new DataTable("#example", {
          data: dataSet,
          columns: col_title,
          language: lang_kor,
          dom: 'B<"clear">lfrtip',
          buttons: [
          "pdf",
          "copy",
          "excel",
          {
            text: "프로젝트 추가",
            action: function () {
              alert("추가 페이지로 이동");
            },
          },
          ]
        });

        table.buttons().container().appendTo($('#test'));
        
        $('#example_length').appendTo($('#test'));
        $('#example_filter').appendTo($('#test'));
        /* Column별 검색기능 추가 */ 
        $('.dataTables_wrapper .row div').removeClass('col-sm-6').addClass('filter-bar-probada')
        $("#example_filter").prepend(
        '<select id="select" name="status" class="form-control input-lg dataTables_filter"></select>'
        );
        $.each(sort_data, function (index, item) {
          $("#select").append("<option name='option_status'>" + item.title + "</option>");
        });

         $('#select').on('change', function () {
          var colName = $('#select option:selected').val();
          table.column(3).search(colName).draw();
          if(colName=="진행상황") table.column().search().draw();
        }); 
    
      });
    </script>
</script>
</body>
