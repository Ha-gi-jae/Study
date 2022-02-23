<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//서블릿에서 수행한 결과값.
	List<ProdVO> list = (List<ProdVO>) request.getAttribute("list");
	
	if(list != null && list.size() > 0){
	
	// 밑에 datas 하고 [ 얘가 온거임.
%>
		{
			"flag" : "ok",
			"datas" : 
			[

<%
				for(int i = 0; i < list.size(); i++){
					ProdVO vo = list.get(i);
					if(i > 0 ) out.println(",");
%>

					{
						"id" : "<%= vo.getProd_id() %>",
						"name" : "<%= vo.getProd_name() %>"		
					}

<%
				}
%>
			]
		}

<%
	}else {
%>
		
		{
			"flag" : "no"
		}		

<%
	}
%>