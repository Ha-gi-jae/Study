package k_jdbc;

import java.util.List;
import java.util.Map;

public class JDBCTest {

	public static void main(String[] args) {
		JDBCUtil jdbc = JDBCUtil.getInstance();
		
		int map = jdbc.update("");
		
		System.out.println(map);

	}

}
