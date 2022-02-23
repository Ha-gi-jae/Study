<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@page import="kr.or.ddit.ibatis.config.SqlMapClientFactory"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 요청 전송시 데이터를 받는다. - id값을 받는다.
String buyer_id = request.getParameter("id");

//데이터 처리 - DB의 CRUD처리
//1. SqlMapClient 객체를 얻어오기. 입력할때 직접쓰면 임포트 안되니까 단축키 이용하기.
SqlMapClient client = SqlMapClientFactory.getInstance();

//2. sql mapper에 기술된 sql문장을 실행한다.
BuyerVO vo = (BuyerVO) client.queryForObject("buyer.selectDetail", buyer_id);
%>

{
	"id" : "<%= vo.getBuyer_id() %>",
	"name" : "<%= vo.getBuyer_name() %>",
	"lgu" : "<%= vo.getBuyer_lgu() %>",
	"mail" : "<%= vo.getBuyer_mail() %>",
	"bank" : "<%= vo.getBuyer_bank() %>",
	"bno" : "<%= vo.getBuyer_bankno() %>",
	"bname" : "<%= vo.getBuyer_bankname() %>",
	"zip" : "<%= vo.getBuyer_zip() %>",
	"add1" : "<%= vo.getBuyer_add1() %>",
	"add2" : "<%= vo.getBuyer_add2() %>"
}