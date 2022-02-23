<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<section class="content">
  <div style="height: 640px;">
    <div class="table-responsive">
      <table class="table table-hover text-nowrap"
        style="text-align: center;">
        <thead>
          <tr>
            <th style="width: 10%; "><input id="all" type="checkbox"
              onclick="checkAllBox()" name="all"></th>
            <th style="width: 10%;">이름</th>
            <th style="width: 10%;">나이</th>
            <th style="width: 10%;">성별</th>
            <th>연락처</th>
            <th>입원일자</th>
            <th>누적 음성수</th>
          </tr>
        </thead>
        <tbody id="inptnt-list-table-tbody">
          <tr class="each-inptnt-element">
            <td colspan="7" id="initialTd">페이지 로딩중 입니다.</td>
          </tr>
        </tbody>
      </table>
        <div id="inptnt-page-info-div" style="float: right;">
        </div>         
    </div>
  </div>
  <div class="card-footer clearfix" style="background-color: white;">
    <ul class="pagination justify-content-center m-0" id="inptnt-list-pagination-ul">
    </ul>
  </div>
<form id="jobForm">
  <input type='hidden' name="page" value="" />
  <input type='hidden' name="perPageNum" value=""/>
  <input type='hidden' name="searchType" value="" />
  <input type='hidden' name="keyword" value="" />
</form>
</section>

