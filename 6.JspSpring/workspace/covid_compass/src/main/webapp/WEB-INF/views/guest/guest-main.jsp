<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title></title>
</head>
<body>

<div class="wrapper" style="max-width: 1280px; margin: 0 auto;">
	<div class="row pr-0 pl-0 m-0" style="background: black;">
	<div class="col-md-4 invoice p-3" style="background: black;">
		<div style="width: 200px;height: 80px; background-image: url(<%=request.getContextPath()%>/resources/image/logoWhite.png);background-size: cover;"></div>
	</div>
	<div class="col-md-5 align-self-center" style="text-align: center;">
		<h1 style="color: white;"><b>코로나-19 가이드 시스템</b></h1>
	</div>
	<div class="col-md-3">
	</div>
	
	</div>
	<div class="invoice p-3 mb-3">
              <!-- title row -->
              <div class="row">
                <div class="row col-12">
                  <p  style="margin-left: 2%;">
                       <h4><strong style="margin-left: 5px;">전체현황</strong></h4>
                       <div>
                       <p>(단위: &nbsp;%,&nbsp;명)</p>
                       </div>
                  <p>
                  
                </div>
              </div>
              <table class="table table-bordered">
                  <thead>
                    <tr style="text-align:center; font-weight: bold; background-color:#f5fafc ">
                      <th style="width: 120px">확진자</th>
                      <th style="width: 120px">사망자</th>
                      <th style="width: 120px">치명률</th>
                      <th style="width: 120px">국내발생현황</th>
                      <th style="width: 120px">해외유입현황</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr style="text-align:center; font-weight: bold; ">
                      <td>${wholeCovidVO.confirm}</td>
                      <td style="color: red;">${wholeCovidVO.wholedeath}</td>
                      <td style="color: red;">${wholeCovidVO.lethality}%</td>
                      <td>${wholeCovidVO.domestic }</td>
                      <td>${wholeCovidVO.overseas}</td>
                    </tr>
                  </tbody>
                </table>
              
                <div class="row col-12">
                  <p  style="margin-left: 2%;">
                       <h4><strong>백신접종현황</strong></h4>
                       <div>
                       <p>(단위: &nbsp;%,&nbsp;명)</p>
                       </div>
                  <p>
                 
                </div>
              
              <table class="table table-bordered">
                  <thead>
                    <tr style="text-align: center; font-weight: bold; background-color:#f5fafc ">
                      <th style="width: 120px">1차접종</th>
                      <th style="width: 120px">2차접종</th>
                      <th style="width: 120px">3차접종</th>
                      <th style="width: 120px">1차 접종률</th>
                      <th style="width: 120px">2차 접종률</th>
                      <th style="width: 120px">3차 접종률</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr style="text-align: center; font-weight: bold; ">
                      <td>${covidInoculation.firstCnt}</td>
                      <td>${covidInoculation.secondCnt}</td>
                      <td>${covidInoculation.thirdCnt}</td>
                      <td style="color: blue;">${covidInoculation.firstCntPrStr}%</td>
                      <td style="color: blue;">${covidInoculation.secondCntPrStr}%</td>
                      <td style="color: blue;">${covidInoculation.thirdCntPrStr}%</td>
                    </tr>
                  </tbody>
                </table>
                
              <div class="row col-12">
                  <p  style="margin-left: 2%;">
                       <h4><strong>시도별 현황</strong></h4>
                       <div>
                       <p>(단위: &nbsp;명)</p>
                       </div>
                  <p>
                 
                </div>
              <table class="table table-bordered">
                  <thead>
                    <tr style="text-align: center; font-weight: bold; background-color:#f5fafc ">
                      <th style="width: 120px">서울</th>
                      <th style="width: 120px">부산</th>
                      <th style="width: 120px">대구</th>
                      <th style="width: 120px">인천</th>
                      <th style="width: 120px">광주</th>
                      <th style="width: 120px">대전</th>
                      <th style="width: 120px">울산</th>
                      <th style="width: 120px">세종</th>
                      <th style="width: 120px">경기</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr style="text-align: center; font-weight: bold; ">
                      <td>${cityVO.seoul}</td>
                      <td>${cityVO.busan}</td>
                      <td>${cityVO.daegu}</td>
                      <td>${cityVO.incheon}</td>
                      <td>${cityVO.gwangju}</td>
                      <td>${cityVO.daegeon}</td>
                      <td>${cityVO.ulsan}</td>
                      <td>${cityVO.sejong}</td>
                      <td>${cityVO.gyeonggi}</td>
                    </tr>
                  </tbody>
                  <thead>
                    <tr style="text-align: center; font-weight: bold; background-color:#f5fafc ">
                      <th style="width: 120px">강원</th>
                      <th style="width: 120px">충북</th>
                      <th style="width: 120px">충남</th>
                      <th style="width: 120px">전북</th>
                      <th style="width: 120px">전남</th>
                      <th style="width: 120px">경북</th>
                      <th style="width: 120px">경남</th>
                      <th style="width: 120px">제주</th>
                      <th style="width: 120px">검역</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr style="text-align: center; font-weight: bold; ">
                      <td>${cityVO.gangwon}</td>
                      <td>${cityVO.chungbuk}</td>
                      <td>${cityVO.chungnam}</td>
                      <td>${cityVO.jeonbuk}</td>
                      <td>${cityVO.jeonnam}</td>
                      <td>${cityVO.gyeongbuk}</td>
                      <td>${cityVO.gyeongnam}</td>
                      <td>${cityVO.jeju}</td>
                      <td>${cityVO.gumyeok}</td>
                    </tr>
                  </tbody>
               </table>
              
              <div class="col-1" style="margin-left: 93%;">
              <button type="button" onclick="location.href='<%=request.getContextPath()%>/guest/chart'" class="btn btn-block btn-primary btn-sm ">상세현황</button>
              </div>
              

      </div>
              <!-- this row will not appear when printing -->
              <div class="row no-print">
                <div class="col-12">
                  <button type="button" class="btn btn-success"><i class="fas fa-bookmark" onclick="location.href='<%=request.getContextPath()%>/guest/question'">문진표작성</i></button>
                  <button type="button" class="btn btn-primary" style="margin-right: 5px;"><i class="fas fa-download" onclick="OpenWindow('testResultCheckForm?backPage=lookup', '확진결과 조회', 500,305)">검사결과조회</i></button>
                  <button type="button" class="btn btn-info" style="margin-right: 5px;"><i class="fas fa-download" onclick="OpenWindow('testResultCheckForm?backPage=confirmation', '확진결과 조회', 500,305)">확인서발급</i></button>
                  <button type="button" class="btn btn-warning" style="margin-right: 5px;"><i class="fas fa-bus" onclick="location.href='<%=request.getContextPath()%>/guest/insp-list'">검사소찾기</i></button>
                  
                </div>
              </div>
        	
            
 </div>
</body>
</html>