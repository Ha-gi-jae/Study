package dao;

import java.util.Map;

import utill.JDBCUtil;

public class UserDao {
	
	private UserDao(){}
	private static UserDao instance;
	public static UserDao getInstance(){
		if(instance == null){
			instance = new UserDao();
		}
		return instance;
	}
	
	private JDBCUtil jdbc = JDBCUtil.getInstance();
	
	public int insertUser(Map<String, Object> param){
		String sql = "INSERT INTO TB_JDBC_USER VALUES ("
				+ "'" + param.get("USER_ID") + "',"
				+ "'" + param.get("PASSWORD") + "',"
				+ "'" + param.get("USER_NAME") + "')";
		
		return jdbc.update(sql);
	}

	public Map<String, Object> selectUser(String userId, String password) {
		String sql = "SELECT USER_ID, PASSWORD, USER_NAME"
				+ "     FROM TB_JDBC_USER"
				+ "    WHERE USER_ID = '" + userId + "'"
				+ "      AND PASSWORD = '" + password + "'";
		
		return jdbc.selectOne(sql);
	}	
	
	
	
}
