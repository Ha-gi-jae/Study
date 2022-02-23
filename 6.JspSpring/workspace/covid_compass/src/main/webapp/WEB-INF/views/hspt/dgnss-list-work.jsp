<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

<style>
.pbht {
	color: #f56954;
}

.ltct {
	color: #3c8dbc
}

.on {
	background-color: rgb(236, 236, 236);
}

.hidden-element {
	display: none;
}

.show-element {
	display: inline-block;
}
</style>

</head>
<title></title>

<body>
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
                      <option value="" ${pageMaker.cri.searchType eq '' ? 'selected':''}>검색구분</option>
                      <option value="n" ${pageMaker.cri.searchType eq 'n' ? 'selected':''}>성명</option>
                      <option value="t" ${pageMaker.cri.searchType eq 't' ? 'selected':''}>연락처</option>
                    </select>

                    <!-- keyword -->
                    <input class="form-control" type="text" name="keyword" id="keyword" value="${pageMaker.cri.keyword }" style="width: 18%; display: inline-block;" /> <span class="input-group-append">
                      <button class="btn btn-primary" type="button" id="searchBtn" style="background: #1a4f72; color: #ffffff; border-color: #1a4f72; display: inline-block; margin-bottom: 4px; margin-left: -7px;" data-card-widget="search" onclick="list_go('1', '<%=request.getContextPath()%>/rest-hspt/dgnss-list');">
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
                  <%@ include file="./dgnss-list-module-work.jsp"%>
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
            <div class="card-body pb-0" style="padding-top: 8px;">
              <table class="table table-bordered" style="border-left-color: white; border-right-color: white;">
                <thead>
                
                  <tr>
                    <th colspan="4" style="font-size: 17px; padding: 7px;">
                    
                        <div class="row m-0" style="justify-content: space-between;">
                    		<label style="font-size: 17px; margin: 0px;">진료대기환자 상세</label>
                    		<button type="button" class="btn btn-success btn-sm" onclick="inputData('1');">중증</button>
                    		<button type="button" class="btn btn-success btn-sm" onclick="inputData('2');">미중증</button>
                    		<button type="button" class="btn btn-success btn-sm" onclick="inputData('3');">무증상</button>
                    		<button type="button" class="btn btn-sm btn-primary" id="enableReadRrn" onclick="enableReadRrn(this);" data-enable="N" data-rrn="" data-manageNo="">개인정보 열람</button>
                    	</div>
                    
                    </th>
                  </tr>
                </thead>
                <tbody id="dgnss-detail-info-module">
                  <tr class="ddoing dgnss-detail-info" style="height: 15px;"></tr>
                  <tr class="shittr dgnss-detail-info">
                    <th class="col-sm-3">성명</th>
                    <td class="col-sm-4"></td>
                    <th class="col-sm-2">국적</th>
                    <td class="col-sm-3"></td>
                  </tr>
                  <tr class="shittr dgnss-detail-info">
                    <th>진료요청일자</th>
                    <td></td>
                    <th>백신접종</th>
                    <td></td>
                  </tr>
                  <tr class="shittr dgnss-detail-info">
                    <th>성별</th>
                    <td></td>
                    <th>나이</th>
                    <td></td>
                  </tr>
                  <tr class="shittr dgnss-detail-info">
                    <th>확정일자</th>
                    <td></td>
                    <th>결과</th>
                    <td></td>
                  </tr>
                  <tr class="shittr dgnss-detail-info">
                    <th>발열여부</th>
                    <td></td>
                    <th>임신여부</th>
                    <td></td>
                  </tr>
                  <tr class="shittr dgnss-detail-info">
                    <th>주민/외국인등록번호</th>
                    <td></td>
                    <th>연락처</th>
                    <td></td>
                  </tr>
                  <tr class="shittr dgnss-detail-info">
                    <th>주소</th>
                    <td colspan="3"></td>
                  </tr>
                  <tr class="shittr dgnss-detail-info">
                    <th>증상</th>
                    <td colspan="3"></td>
                  </tr>
                </tbody>
              </table>
              </div>
              <div class="card-body pb-0 pt-0">
              <table class="table table-bordered">
                <tbody>
                  <tr class="shittr" style="text-align: center;">
                    <th class="col-sm-3">진료 결과</th>
                    <td class="col-sm-4" style="padding-top: 4px; padding-bottom: 0px;">
                    <select class="form-control col-sm-12" style="vertical-align: middle; padding: 0px;" name="statusCode" onchange="enableButton(this.value);">
                        <option value="">진단</option>
                        <option value="D101">중증 및 중등증</option>
                        <option value="D102">미중증 및 경증</option>
                        <option value="D103">무증상</option>
                    </select></td>
                    <th class="col-sm-2">요청기관</th>
                    <td class="col-sm-3" id="req-inst-nm"></td>
                  </tr>
                  <tr>
                    <td colspan="4" style="padding-bottom: 0px; text-align: center;">
                      <div class="form-group row">
                        <div class="col-sm-2">
                          <label for="inputPassword3" class="control-label text-center" style="padding-top: 7px;">진료 메모</label>
                        </div>
                        <div class="col-sm-10 row" style="margin-top: 5px;" align="right">
                          <!-- <button type="button" class="btn btn-success btn-sm" onclick="inputData('1');">중증</button> -->
                        </div>
                        </div>
                      <div class="form-group row">
                        <div class="col-sm-12">
                          <textarea name="dgnssNote" class="form-control" id="dgnssNoteId" style="height: 205px; width: 97%; margin: 10px; margin-top: 0; margin-bottom: 0;"></textarea>
                        </div>
                      </div>
                      <div class="col-sm-12 row" style="padding-bottom: 10px;" align="right">
                          <div class="col-md-3 show-element">
                            <!-- <button type="button" class="btn btn-success btn-sm" onclick="inputData('1');">중증</button> -->
                            <button style="background-color: #1a4f72; border-color: #1a4f72;" type="button" name="inptnt-button" class="btn btn-block btn-primary btn-sm" disabled onclick="process_go('1');">입원</button>
                          </div>
                          <div class="col-md-3 show-element">
                            <button style="background-color: #1a4f72; border-color: #1a4f72;" type="button" name="sckbdreq-inptnt-button" class="btn btn-block btn-primary btn-sm" disabled data-manage-no="" data-psti-nm="" onclick="openInptntGo(this, 'A');">이원신청</button>
                          </div>
                          <div class="col-md-3 show-element">
                            <button style="background-color: #1a4f72; border-color: #1a4f72;" type="button" name="sckbdreq-isoptnt-button" class="btn btn-block btn-primary btn-sm" disabled data-manage-no="" data-psti-nm="" onclick="openIsoptntGo(this, 'A');">입소신청</button>
                          </div>
                          <div class="col-md-3 show-element">
                            <button style="background-color: #1a4f72; border-color: #1a4f72;" type="button" name="slfptnt-button" class="btn btn-block btn-primary btn-sm" disabled onclick="process_go('4');">자가격리</button>
                          </div>
                          <div class="col-md-3 hidden-element"></div>
                          <div class="col-md-3 hidden-element">
                            <button style="background-color: #1a4f72; border-color: #1a4f72;" type="button" name="isoptnt-dgnss-button" class="btn btn-block btn-primary btn-sm" onclick="process_go('5');">진료완료</button>
                          </div>
                          <div class="col-md-3 hidden-element">
                            <button style="background-color: #1a4f72; border-color: #1a4f72;" type="button" name="isoptnt-inptnt-button" class="btn btn-block btn-primary btn-sm" onclick="process_go('1');">입원</button>
                          </div>
                          <div class="col-md-3 hidden-element">
                            <button style="background-color: #1a4f72; border-color: #1a4f72;" type="button" name="isoptnt-sckbdreq-inptnt-button" class="btn btn-block btn-primary btn-sm" onclick="OpenWindow('sckbdreq-inptnt', '병원 조회', 1250,724)">이원신청</button>
                          </div>
                        </div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
<form name="processForm" style="display: none;">
  childNo<input type="text" name="childNo">
  type<input type="text" name="type">
  dgnssResultCode<input type="text" name="dgnssResultCode">
  dgnssNote<input type="text" name="dgnssNote">
  manageNo<input type="text" name="manageNo">
  dgnssNo<input type="text" name="dgnssNo">
  toLtctNo<input type="text" name="toLtctNo">
  toHsptNo<input type="text" name="toHsptNo">
  closeWindow<input type="text" name="closeWindow">
</form>

            <!-- /.card -->
          </div>
          <!-- search bar -->
        </section>
      </div>


    </div>
    <!-- /.card-body -->
  </section>

<script type="text/x-handlebars-template" id="dgnss-detail-template">
    <tr class="ddoing dgnss-detail-info" style="height: 15px;"></tr>
      <tr class="shittr dgnss-detail-info">
        <th class="col-sm-3">성명</th>
        <td class="col-sm-4">{{pstiNm}}</td>
        <th class="col-sm-2">국적</th>
        <td class="col-sm-3">{{nlty}}</td>
      </tr>
      <tr class="shittr dgnss-detail-info" >
        <th>진료요청일자</th>
        <td>{{prettifyDate reqYmd}}</td>
        <th>백신접종</th>
        <td>{{vacType}}</td>
      </tr>
      <tr class="shittr dgnss-detail-info" >
        <th>성별</th>
        <td>{{gender}}</td>
        <th>나이</th>
        <td>{{age}}</td>
      </tr>
      <tr class="shittr dgnss-detail-info" >
        <th>확정일자</th>
        <td>{{prettifyDate resYmd}}</td>
        <th>결과</th>
        <td>{{pstvYn}}</td>
      </tr>
      <tr class="shittr dgnss-detail-info" >
        <th>발열여부</th>
        <td>{{feverYn}}</td>
        <th>임신여부</th>
        <td>{{pregnYn}}</td>
      </tr>
      <tr class="shittr dgnss-detail-info" >
        <th>주민/외국인등록번호</th>
        <td id="dataRrn">{{rrn}}</td>
        <th>연락처</th>
        <td>{{pstiTelno}}</td>
      </tr>
      <tr class="shittr dgnss-detail-info" >
        <th>주소</th>
        <td colspan="3">{{pstiAdres}}</td>
      </tr>
      <tr class="shittr dgnss-detail-info" >
        <th>증상</th>
        <td colspan="3">{{symptms}}</td>
      </tr>
</script>

<%@ include file="./dgnss-js.jsp" %>


</body>
