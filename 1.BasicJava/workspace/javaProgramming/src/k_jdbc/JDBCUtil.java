package k_jdbc;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class JDBCUtil {
	
	//싱글톤 패턴 : 인스턴스의 생성을 제한하여 하나의 인스턴스만 사용하는 디자인 패턴
	
	//객체생성을 막기 위한 생성자
	private JDBCUtil(){
		
	}
	
	//객체를 보관할 변수
	private static JDBCUtil instance;
	
	//객체를 생성해서 빌려주는 메서드
	public static JDBCUtil getInstance(){
		if(instance == null){
			instance = new JDBCUtil();
		}
		return instance;
	}
	
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "HGJ96";
	private String password = "java";
	
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;	
	
	/*
	 * Map<String, Object> selectOne(String sql)
	 * 조회를 하는데 조회의 결과가 한 줄. 그 결과를 맵을 돌려줌.
	 * List<Map<String, Object>> selectList(String sql)
	 * 조회를 하는데 조회의 결과가 여러줄. 쿼리로 날려주고 그결과를 리스트에 맵이 들어가 있는 형태로 돌려줌  맵에 여러개 가 있고 그걸 하나의 리스트로
	 * int update(String sql)
	 * 몇개의 행이 영향을 받았는지 돌려줌.
	 */
	
	public Map<String, Object> selectOne(String sql){
		Map<String, Object> map = null;
		try {
			con = DriverManager.getConnection(url, user, password);
			
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			ResultSetMetaData metaData = rs.getMetaData();
			
			int columnCount = metaData.getColumnCount();
			
			if(rs.next()){
				map = new HashMap<>();
				for(int i = 1; i <= columnCount; i++){
					map.put(metaData.getColumnName(i), rs.getObject(i));
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if(rs != null) try { rs.close(); } catch(Exception e) {}
			if(ps != null) try { ps.close(); } catch(Exception e) {}
			if(con != null) try { con.close(); } catch(Exception e) {}
		}
		return map;
	}
	
	
	
	
	
	public int update(String sql){
		int update = 0;
		
		try {
			con = DriverManager.getConnection(url, user, password);
			
			ps = con.prepareStatement(sql);
			
			update = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch(Exception e) {}
			if(ps != null) try { ps.close(); } catch(Exception e) {}
			if(con != null) try { con.close(); } catch(Exception e) {}
		}
		return update;
	}
	
	
	
	
	
	public List<Map<String, Object>> selectList(String sql){
		List<Map<String, Object>> list = new ArrayList<>();
		
		try {
			con = DriverManager.getConnection(url, user, password);
			
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			ResultSetMetaData metaData = rs.getMetaData();
			
			int columnCount = metaData.getColumnCount();
			
			while(rs.next()){
				HashMap<String, Object> map = new HashMap<>();
				for(int i = 1; i <= columnCount; i++){
					map.put(metaData.getColumnName(i), rs.getObject(i));
				}
				list.add(map);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch(Exception e) {}
			if(ps != null) try { ps.close(); } catch(Exception e) {}
			if(con != null) try { con.close(); } catch(Exception e) {}
		}
		return list;
	}
	
	Object convertValue(Object value){
		if(value instanceof BigDecimal){
			value = ((BigDecimal)value).intValue();
		}
		
		return value;
	}
	
}
