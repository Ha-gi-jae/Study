<%@page import="kr.or.ddit.lprod.vo.LprodVO"%>
<%@page import="kr.or.ddit.ibatis.config.SqlMapClientFactory"%>
<%@page import="java.util.List"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    	// 요청 전송시 데이터를 받는다. - 현재는 없다.


    // 데이터 처리 - DB의 CRUD처리

    // 1. SqlMapClient 객체를 얻어오기. 입력할때 직접씀녀 임포트 안되니까 단축키 이용하기.
    SqlMapClient client = SqlMapClientFactory.getInstance(); 

    // 2. sql mapper에 기술된 sql문장을 실행한다. - namespace이름.id이름 >> lprod.selectAllItem
    // queryForObject 와 queryForList 차이점
    // 결과값이 한줄이냐? 여러개냐?
    // Object는 Object로 List는 List로 받으면된다.
    // Object는 형변환해서 받으면 된다. (String, int, ...)
    // List는 <> 제네릭타입을 주면됨 MemberVO
    List<LprodVO> list = client.queryForList("lprod.selectAllItem");
    //Object Array
    // CRUD 처리 후, 응답데이터를 생성 - html, xml, json, text
    %>
[
<%
	for(int i = 0; i < list.size(); i++){
		LprodVO vo = list.get(i);
		
		if(i > 0){
			out.print(",");
		}
%>
			{
				"ID" : "<%= vo.getLprod_id() %>",
				"GU" : "<%= vo.getLprod_gu() %>",
				"NM" : "<%= vo.getLprod_nm() %>"
			}
		
		
<%
	}
%>		



]

