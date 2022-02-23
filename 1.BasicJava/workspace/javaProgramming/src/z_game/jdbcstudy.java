package z_game;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class jdbcstudy {

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
					   + " from cart"
					   + "where cart_member = ?" // ?에 a001 이런걸 직접쓰지않고 ?를 써준다.
					   + " and cart_qty > ?";
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch(Exception e) {}
			if(ps != null) try { ps.close(); } catch(Exception e) {}
			if(con != null) try { con.close(); } catch(Exception e) {}
		}

	}

}
