<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.ibatis.config.SqlMapClientFactory"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    	// 요청 전송시 데이터를 받는다. - 현재는 없다.


    // 데이터 처리 - DB의 CRUD처리

    // 1. SqlMapClient 객체를 얻어오기. 입력할때 직접씀녀 임포트 안되니까 단축키 이용하기.
    SqlMapClient client = SqlMapClientFactory.getInstance(); 

    // 2. sql mapper에 기술된 sql문장을 실행한다. - namespace이름.id이름 >> member.selectAllMember
    // queryForObject 와 queryForList 차이점
    // 결과값이 한줄이냐? 여러개냐?
    // Object는 Object로 List는 List로 받으면된다.
    // Object는 형변환해서 받으면 된다. (String, int, ...)
    // List는 <> 제네릭타입을 주면됨 MemberVO
    List<MemberVO> list = client.queryForList("member.selectAllMember");
    //Object Array
    // CRUD 처리 후, 응답데이터를 생성 - html, xml, json, text
    %>
	[
	<% 
	// 자바 문장은 <%가 있어야함.
	
	// MVC나오게 된 계기 : 하나의 JSP 파일에 자바프로세스로직과 디자인요소가 한군데에 있었다. 코드가 복잡해보인다. 분리작업도 안된다.
	// 유지보수가 어렵다.
	// View - Controller 사이에 왔다갔다하는게 MoldelVO
	
		for(int i = 0; i<list.size(); i++){
			MemberVO vo = list.get(i);
			
			// out도 내장객체라 별도로 선언하지 않고 쓸 수 있다. printwriter 객체.
			if(i > 0) out.print(",");
			
			// "id " 이렇게 공백이 있으면안됨.
	%>
				
			{
			"id" : "<%= vo.getMem_id() %>",
			"name" : "<%= vo.getMem_name() %>",
			"hp" : "<%= vo.getMem_hp() %>",
			"mail" : "<%= vo.getMem_mail() %>",
			"zip" : "<%= vo.getMem_zip() %>",
			"add1" : "<%= vo.getMem_add1() %>",
			"add2" : "<%= vo.getMem_add2() %>",
			"bir" : "<%= vo.getMem_bir() %>"
			}
	<%  // 자바코드만 따로 <% %\> 를 해줘야함. 가운데는 json이기 때문에 . json, html이 올 수 있다.		
		}
	%>
	]
	
	
	
	
	
	