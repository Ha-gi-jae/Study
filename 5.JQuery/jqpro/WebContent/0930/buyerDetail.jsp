<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
	BuyerVO vo = (BuyerVO) request.getAttribute("bid"); 
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