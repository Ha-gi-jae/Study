package utill;

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

public class JDBCUtill {

	//싱글톤 패턴: 인스턴스의 생성을 제한하여 하나의 인스턴스만 사용하는 디자인 패턴
	
	//객체생성을 막기 위한 생성자
	
	private JDBCUtill(){
		
	}
	
	//객체를 보관할 변수
	private static JDBCUtill instance;
	
	//객체를 생성해서 빌려주는 메서드
	public static JDBCUtill getInstance(){
		if(instance==null){
			instance = new JDBCUtill();
		}
		return instance;
	}
	
	private String url ="jdbc:oracle:thin:@localhost:1521:xe";//주소
	private String user ="rent";
	private String password ="java";
	
	//변수를 미리 생성
	private Connection con = null;
	private PreparedStatement ps =null;
	private ResultSet rs = null;
	
	/*
	 * Map<String, Object> selectOne(String sql) //조회의 결과가 한줄
	 * List<Map<String, Object>> selectList(String sql) //조회의 결과가 여러줄
	 * int Update(String sql)
	 */
	
	
	
	//selectList
	public List<Map<String, Object>> selectList(String sql){
		List<Map<String, Object>> list = new ArrayList<>();
		
		try {
			con=DriverManager.getConnection(url,user,password);
			
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			
			ResultSetMetaData metaData=rs.getMetaData();
			int columnCount =metaData.getColumnCount();
			
			while(rs.next()){
				HashMap<String, Object> map =new HashMap<>();
				for(int i=1; i<=columnCount; i++){
					map.put(metaData.getColumnName(i), rs.getObject(i));
				}
				list.add(map);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally{
			if(rs!=null)try{rs.close();}catch(Exception e){}
			if(ps!=null)try{ps.close();}catch(Exception e){}
			if(con!=null)try{con.close();}catch(Exception e){}
		}
		
		return list;
	}
	
	//selectOne
	public Map<String, Object> selectOne(String sql){
		Map<String,Object> map = null;
		try {
			con=DriverManager.getConnection(url,user,password);
			
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			
			ResultSetMetaData metaData=rs.getMetaData();
			int columnCount=metaData.getColumnCount();
			
			if(rs.next()){
				map=new HashMap<>();
				for(int i=1; i<=columnCount; i++){
					map.put(metaData.getColumnName(i), rs.getObject(i));
				}
						
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally{
			if(rs!=null)try{rs.close();}catch(Exception e){}
			if(ps!=null)try{ps.close();}catch(Exception e){}
			if(con!=null)try{con.close();}catch(Exception e){}

		}
		return map;
		
	}
	
	
	//Update
	public int Update(String sql){
		int result=0;
		try {
			
			con=DriverManager.getConnection(url,user,password);
			ps=con.prepareStatement(sql);
			
			result=ps.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally{
			if(rs!=null)try{rs.close();}catch(Exception e){}
			if(ps!=null)try{ps.close();}catch(Exception e){}
			if(con!=null)try{con.close();}catch(Exception e){}
		}
		
		return result;
	}
	
	
	
}


























