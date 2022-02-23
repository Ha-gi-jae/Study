package kr.or.ddit.basic;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import kr.or.ddit.member.vo.MemberVO;

public class IbatisTest {
	public static void main(String[] args) {
		//iBatis를 이용하여 DB자료를 처리하는 작업순서
		//1.iBatis의 환경설정 파일을 읽어와 실행시킨다. 
		try {
			//1-1. xml설정문서 읽어오기
			//설정파일의 인코딩 설정
			Charset charset = Charset.forName("UTF-8");//한글이 있을 수 있기 때문에 utf-8로처리
			Resources.setCharset(charset);
			
			Reader rd= Resources.getResourceAsReader("SqlMapConfig.xml");
			
			//1-2. 위에서 읽어온 Reader객체를 이용하여 실제 작업을 진행할 객체를
			//     생성하기
			//iBatis를 사용한다는 것은 sqlMapClient객체를 만들어서 사용한다는 것이다.
			//SqlMapClient(인터페이스)타입의 객체 만들기
			SqlMapClient smc = SqlMapClientBuilder.buildSqlMapClient(rd);
			
			rd.close();//Reader 객체 닫기
			
			//2.실행할 SQL문에 맞는 쿼리문을 호출해서 원하는 작업을 수행한다.
			//2-1. insert작업 연습
			System.out.println("insert작업 시작....");
			
			// 1) 저장할 데이터를 VO에 담는다.
			MemberVO mv = new MemberVO();
			mv.setMemId("d002");
			mv.setMemName("강감찬");
			mv.setMemTel("333-3333");
			mv.setMemAddr("경남 진주시");
			
			/*
			// 2) SqlMapClient객체 변수를 이용하여 해당 쿼리문을 실행한다.
			//id값만으로는 중복이 되지 않는다는 확신을 가질 수 없기 때문에 namespace값도 설정해준다.
			// 형식) smc.insert("namespace값.id값", 파라미터클래스);
			//     반환값 : 성공하면 null이 반환된다.(리턴타입:Object)
			Object obj = smc.insert("memberTest.insertMember", mv);
			
			if(obj==null) {
				System.out.println("insert작업 성공!");
			}else {
				System.out.println("insert작업 실패!");
			}
			*/
			
			//update를 실행해도 insert작업을 실행할 수 있다.
		  /*int cnt = smc.update("memberTest.insertMember", mv);
			
			if(cnt>0) {
				System.out.println("insert작업 성공!");
			}else {
				System.out.println("insert작업 실패!");
			}*/
			
			System.out.println("----------------------------------");
			
			//2-2. update 연습
			System.out.println("update작업 시작...");
			
			MemberVO mv2 = new MemberVO();
			mv2.setMemId("d001");
			mv2.setMemName("강건");
			mv2.setMemTel("444-3333");
			mv2.setMemAddr("대전시 중구");
			
			//update()메스드이 반환값은 성공한 레코드 수이다.
			
			int result = smc.update("memberTest.updateMember", mv2);
			
			if(result>0) {
				System.out.println("update작업 성공!");
			}else {
				System.out.println("update작업 실패!!");
			}
			System.out.println("-----------------------------------------");
			
			//2-3. delete연습
			System.out.println("delete연습 시작....");
			
			//delete()메서드의 반환값 : 성공한 레코드 수
			
			result = smc.delete("memberTest.deleteMember", "d001");
			
			if(result>0) {
				System.out.println("delete작업 성공!");
			}else {
				System.out.println("delete작업 실패!");
			}
			
			//2-4. select 연습
			/*
		    //1) 응답의 결과가 여러개인 경우...
			System.out.println("select연습(결과가 여러개인 경우...)");
			
			//응답결과가 여러개일 경우에는 queryForList메서드 사용한다.
			//이 메서드는 여러개의 레코드를 VO에 담은 후 이 VO데이터를 List에 
			//추가해 주는 작업을 자동으로 수행한다.
			List<MemberVO> memList = 
					smc.queryForList("memberTest.selectAllMember");
			
			
			for(MemberVO memVO :memList) {
				System.out.println("ID: "+memVO.getMemId());
				System.out.println("이름: "+memVO.getMemName());
				System.out.println("전화: "+memVO.getMemTel());
				System.out.println("주소: "+memVO.getMemAddr());
			}
			System.out.println("출력끝....");
			*/
			
			// 2) 응답이 1개인 경우...
			System.out.println("select 연습 시작(응답이 1개일 경우...)");
			
			//응답 결과가 1개가 확실할 경우에는 queryForObject메서드를 이용한다.
			
			
			
			
			MemberVO mv3 = (MemberVO)
					smc.queryForObject("memberTest.getMember", "d002");
			
			System.out.println("ID: "+mv3.getMemId());
			System.out.println("이름: "+mv3.getMemName());
			System.out.println("전화번호: "+mv3.getMemTel());
			System.out.println("주소: "+mv3.getMemAddr());
			
			//매핑 하지 않았을 경우
			MemberVO mv4 = (MemberVO)
					smc.queryForObject("memberTest.getmember2", "a001");
			
			System.out.println("ID: "+mv4.getMemId());
			System.out.println("이름: "+mv4.getMemName());
			System.out.println("전화번호: "+mv4.getMemTel());
			System.out.println("주소: "+mv4.getMemAddr());
			
			
			
			
		}catch(IOException ex) {
			ex.printStackTrace();
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
		
		
		
	}
}
