package k_jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBC {

	public static void main(String[] args) {
		/*
		 * JDBC(Java Database Connectivity)
		 *  - 자바의 데이터베이스를 연결해주는 라이브러리
		 *  - ojdbc : 오라클 JDBC
		 *  
		 * JDBC 작성 단계
		 *  1. Connection 생성(DB 연결)
		 *  2. Statement 생성(쿼리 작성)
		 *  3. Query 실행                                                                  select라면 resultSet(결과값)이 넘어옴 
		 *  4. ResultSet에서 결과 추출(select인 경우)          insert delete update..의 경우 ResultSet이 없음
		 *  5. ResultSet, Statement, Connection 닫기
		 */
		
		//데이터베이스 접속 정보
		String url = "jdbc:oracle:thin:@localhost:1521:xe"; //골뱅이 기준 왼쪽 접속할때 사용할 드라이버. 오른쪽 아이피주소:포트:SID(서비스아이디)
		String user = "HGJ96"; //계정
		String password = "java"; //비밀번호
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		//변수를 미리 만들어 놔야함.
		
		try {
			con = DriverManager.getConnection(url, user, password);
			//ㄴ연결하는 코드. 드라이버매니저: 서로다른얘(자바, 오라클)를 연결시켜주는 중간 다리.  알아서 정보에 맞는걸 연결시켜줌. 예외처리를안해서 컴파일러임. 하면 컴파일러 사라짐.
			
			String sql = "select * from member"; //쿼리는 문자열로 작성.    jdbc에서 작성할때는 ""안에 세미클론을 넣으면 안된다. // * => all
			ps = con.prepareStatement(sql); //prepareStatement라는 객체를 리턴. 쿼리의 정보를 가지고 있음.
			//쿼리의 정보를 넘겨준다.
			
			//select
			rs = ps.executeQuery(); //셀렉트에만 사용하는거임. 리턴타입이 resultSet 타입
				//실행종류 가 2개임 executeQuery, executeUpdate => 리턴타입이 다르다.
			//insert, update, delete                         몇개의 행을 딜리트 받았는지 업데이트해줌
//			int result = ps.executeUpdate();     //리턴타입이 인트 타입
			int i = 0;
			while(rs.next()){ //결과를 뽑을땐 와일문           첫번째 행을 바라봄. 존재하는지 안하는지 여부를 리턴. 행이 있으면 true 행이 없으면 false를 반환
				i++;
				String memId = rs.getString(8);		// 쿼리 데이터 타입에따라 get뒤에 타입이 달라짐. 메서드로 존재함. string = varchar 1은 컬럼의 인덱스
				String memPass = rs.getString(9); //컬럼명을 직접 설정 해도되고 숫자로 부여해도됨 행!!
				System.out.println(i + " MEM_ID : " + memId + " / MEM_PASS : " + memPass);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { //마지막에 닫아주기.          닫는 순서 잘 알아두기.
			if(rs != null) try { rs.close(); } catch(Exception e) {} //null이 아닌경우 에만.
			if(ps != null) try { ps.close(); } catch(Exception e) {}
			if(con != null) try { con.close(); } catch(Exception e) {}
		}
		
		
	}

}
