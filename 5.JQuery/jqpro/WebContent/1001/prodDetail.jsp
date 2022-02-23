<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@page import="kr.or.ddit.ibatis.config.SqlMapClientFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ProdVO vo = (ProdVO) request.getAttribute("vo");
%>


{
	"id" : "<%= vo.getProd_id() %>",
	"name" : "<%= vo.getProd_name() %>",
	"lgu" : "<%= vo.getProd_lgu() %>",
	"buyer" : "<%= vo.getProd_buyer() %>",
	"cost" : "<%= vo.getProd_cost() %>",
	"price" : "<%= vo.getProd_price() %>",
	"sale" : "<%= vo.getProd_sale() %>",
	"size" : "<%= vo.getProd_size() %>",
	"color" : "<%= vo.getProd_color() %>"

}