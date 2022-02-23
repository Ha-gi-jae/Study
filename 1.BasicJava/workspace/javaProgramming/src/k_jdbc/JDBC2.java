package k_jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class JDBC2 {

	public static void main(String[] args) {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "HGJ96";
		String password = "java";
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;		
		
		try {
			con = DriverManager.getConnection(url, user, password); //ctrl+ 1 해서 surround 해서 try catch. 
			
			String sql = "select *" 
					   + " from cart" //줄 바뀌고 나서 띄어쓰기 해줘야함.
					   + " where cart_member = ?"
					   + " and cart_qty > ?";
			ps = con.prepareStatement(sql);
			ps.setString(1,  "a001"); 		// 이런식으로 물음표에 있는 값을 세팅가능하다
			ps.setInt(2, 5); 				// 이런식으로 물음표에 있는 값을 세팅가능하다 ★ 값만 대체 가능하다. #컬럼명, 키워드는 대체 불가능하다.
			
			
			rs = ps.executeQuery();
			ResultSetMetaData metaData = rs.getMetaData(); //메타데이터 : 데이터에 대한 데이터
			
			int columnCount = metaData.getColumnCount(); // getColumnCount(); < 컬럼카운트를 알 수 있다.

			for(int i = 1; i <= columnCount; i++){
				System.out.print(metaData.getColumnName(i) + "\t"); // getColumName으로 컬럼이름 출력가능 Alias(별칭)으로 해도 아마 출력될 것임.
			}
			System.out.println();
			
			while(rs.next()){ //컬럼 하나하나 호출하는건 불편 몇개가 될지 모르니까. for문으로 할 수 있음. 근데 몇행인줄알고? > MetaData를 쓴다.
				for(int i = 1; i <= columnCount; i++){ //행은 1부터시작이니까 i는 1. 그리고 부등호 표시 잘 하기.
					Object value = rs.getObject(i); //타입을 모를때 Object를 쓰면 모든 타입을 가져올 수 있다.
					System.out.print(value + "\t");
				}
				System.out.println();
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch(Exception e) {}
			if(ps != null) try { ps.close(); } catch(Exception e) {}
			if(con != null) try { con.close(); } catch(Exception e) {}
		}
	}

}
