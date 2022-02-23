package k_jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class jdbc_study {

	public static void main(String[] args) {
		//테이블을 하나 정해서 select insert delete 할거 각각 하나씩 만들기
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "HGJ96";
		String password = "java";
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		
		try {
			con = DriverManager.getConnection(url, user, password);
			//select
//			String sql = "select * from buyer"
//						+ " where buyer_id = ?";
//			ps = con.prepareStatement(sql);
//			ps.setString(1, "P10101");
//			rs = ps.executeQuery();			
//			ResultSetMetaData metaData = rs.getMetaData();
//			int columnCount = metaData.getColumnCount();
			
			//insert 참조 잘 봐야함 ...
			String sql = "insert into buyer"
					+ " values('P40101', '메가커피', 'P401', '카카오뱅크', '123-321-789789',"
						   + " '김카뱅', '306-787', '서울시 강남구', '2702호', '02-123-1234',"
						   + " '02-123-4567', 'kakaobank@kakao.com', '김카톡', '')";
			ps = con.prepareStatement(sql);
			int result = ps.executeUpdate(); 
			
			//delete
//			String sql = "delete buyer"
//						+ " where buyer_id = ?";
//			ps = con.prepareStatement(sql);
//			ps.setString(1, "P40101");
//			int result = ps.executeUpdate(); 			

			
//			while(rs.next()){
//				for(int i = 1; i <= columnCount; i++){
//					Object value = rs.getObject(i);
//					System.out.println(value + "\t");
//				}
//			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if(rs != null) try { rs.close();} catch(Exception e){}
			if(ps != null) try { ps.close();} catch(Exception e){}
			if(con != null) try { con.close();} catch(Exception e){}
		}
		
		
	}

}
