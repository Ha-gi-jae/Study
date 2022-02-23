<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div class="wrapper" style="max-width: 1280px; margin: 0 auto;">
			<div class="invoice p-3 mb-3">
				<strong>로고자리</strong>
			</div>
			
			<div class="row">
				<div class="col-10"></div>
					
			</div>
			
			<div id="keyword" class="card-tools" >
					<div class="input-group row" >
						<div class="col-1" >
							<button style="background:#5b6f90; color: #ffffff; border-color: #5b6f90; " type="button" onclick="OpenWindow('chart/agencyForm','기관등록','800','700')" class="btn btn-block btn-primary">기관등록</button>
						</div>6
						
						<div class="col-1" >
							<button style="background:#5b6f90; color: #ffffff; border-color: #5b6f90;" type="button" class="btn btn-block btn-danger">기관삭제</button>
						</div>
						<select style="margin-left: 500px;" class="form-control col-md-1" name="searchType" id="searchType">
							<option value="" ${cri.searchType eq '' ? 'selected':'' }>전 체</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>검사소</option>
							<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>보건소</option>
							<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>병원</option>
							<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>생활치료센터</option>
						</select>
						<input class="form-control col-md-4" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }" />
						
						<span class="input-group-append">
							<button class="btn btn-default" style="background-color: #5b6f90;" type="button" onclick="list_go(1);" data-card-widget="search">
								<i style="color: white;" class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
				
				</div>
			
		<div class="row" style="clear: both; margin-top: 20px;">
          <div class="col-12">
          
          
            <div class="card">
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table style="text-align: center;" class="table table-hover text-nowrap">
                  <thead>
                    <tr>
                      <th><input id="all" type="checkbox" onclick="checkAllBox()" name="all"></th>
                      <th>구분</th>
                      <th>기관코드</th>
                      <th>기관명</th>
                      <th>기관연락처</th>
                      <th>기관주소</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><input type="checkbox" name="checkSmple"></td>
                      <td><span class="badge badge-primary">검사소</span></td>
                      <td> 183</td>
                      <td>청동역 검사소</td>
                      <td>11-7-2014</td>
                      <td>서울 송파구 잠실동 10</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox" name="checkSmple"></td>
                      <td><span class="badge badge-primary">검사소</span></td>
                      <td>219</td>
                      <td>월드컵공원 검사소</td>
                      <td>11-7-2014</td>
                      <td>서울 마포구 성산동 390-1</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox" name="checkSmple"></td>
                      <td><span class="badge badge-success">보건소</span></td>
                      <td>657</td>
                      <td>곡성군보건의료원</td>
                      <td>11-7-2014</td>
                      <td>전라남도 곡성군 곡성읍 곡성로 854</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox" name="checkSmple"></td>
                      <td><span class="badge badge-success">보건소</span></td>
                      <td>175</td>
                      <td>산청군보건의료원</td>
                      <td>11-7-2014</td>
                      <td>전라남도 구례군 구례읍 동편제길 30</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox" name="checkSmple"></td>
                      <td><span class="badge badge-warning">생활치료센터</span></td>
                      <td>183</td>
                      <td>청동역 생활치료센터</td>
                      <td>11-7-2014</td>
                      <td>서울 송파구 잠실동 10</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox" name="checkSmple"></td>
                      <td><span class="badge badge-primary">검사소</span></td>
                      <td>183</td>
                      <td>청동역 검사소</td>
                      <td>11-7-2014</td>
                      <td>서울 송파구 잠실동 10</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox" name="checkSmple"></td>
                      <td><span class="badge badge-primary">검사소</span></td>
                      <td>219</td>
                      <td>월드컵공원 검사소</td>
                      <td>11-7-2014</td>
                      <td>서울 마포구 성산동 390-1</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox" name="checkSmple"></td>
                      <td><span class="badge badge-success">보건소</span></td>
                      <td>657</td>
                      <td>곡성군보건의료원</td>
                      <td>11-7-2014</td>
                      <td>전라남도 곡성군 곡성읍 곡성로 854</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox" name="checkSmple"></td>
                      <td><span class="badge badge-warning">생활치료센터</span></td>
                      <td>175</td>
                      <td>산청군생활치료센터</td>
                      <td>11-7-2014</td>
                      <td>전라남도 구례군 구례읍 동편제길 30</td>
                    </tr>
                    <tr>
                      <td><input type="checkbox" name="checkSmple"></td>
                      <td><span class="badge badge-primary">검사소</span></td>
                      <td>219</td>
                      <td>월드컵공원 검사소</td>
                      <td>11-7-2014</td>
                      <td>서울 마포구 성산동 390-1</td>
                    </tr>
                    
                  </tbody>
                </table>
              </div>
              
              
              <%@ include file="../template/list-footer.jsp" %>
              
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
		
	</div>
	<script>
		function checkAllBox(checkBox){
			var length = document.getElementsByName("checkSmple").length;
			if(document.getElementById('all').checked==true){
				for(var i=0; i<length; i++) document.getElementsByName("checkSmple")[i].checked=true;
			}
			
			if(document.getElementById('all').checked==false){
				for(var i=0; i<length; i++) document.getElementsByName("checkSmple")[i].checked=false;
			}
			
			
		}
	</script>
</body>
</html>