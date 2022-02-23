package dao;

import java.util.List;
import java.util.Map;

import utill.JDBCUtill;
import controller.Controller;

public class UserDao {
	
	//싱글톤 패턴
			private UserDao(){}
			private static UserDao instance;
			public static UserDao getInstance(){
				if(instance==null){
					instance= new UserDao();
				}
				return instance;
			}
			
			private JDBCUtill jdbc = JDBCUtill.getInstance();
			
			public int insertUser(Map<String, Object> param) {
				String sql="INSERT INTO TBL_USER VALUES ("
						+ "'"+param.get("USER_ID")+"',"
						+ "'"+param.get("USER_PASS")+"',"
						+ "'"+param.get("USER_NAME")+"',"
						+ "TO_DATE('"+param.get("USER_BIRTH")+"'),"
						+ "'"+param.get("USER_GENDER")+"',"
						+ "'"+param.get("USER_TEL")+"')";
				return jdbc.Update(sql);
						
			
			}

			public Map<String, Object> selectUser(String id, String pass) {
				String sql="SELECT USER_ID,USER_PASS,USER_NAME"
						+ " FROM TBL_USER"
						+ " WHERE USER_ID = '"+id+"'"
						+ "   AND USER_PASS = '"+pass+"'";
				
				return jdbc.selectOne(sql);
				
			}

			public Map<String, Object> userinfo() {
				String sql="SELECT * FROM TBL_USER"
						+ "          WHERE USER_ID = '"+Controller.LoginUser.get("USER_ID")+"'";
				return jdbc.selectOne(sql);
			}

			public int userupdate(String id, String pass, String tel) {
				String sql="UPDATE TBL_USER"
						+ "    SET USER_ID= '"+id+"'"
						+ ",       USER_PASS= '"+pass+"'"
						+ ",       USER_TEL= '"+tel+"'"
						+ "    WHERE USER_ID = '"+Controller.LoginUser.get("USER_ID")+"'";
				return jdbc.Update(sql);
			}

			public int userdelete(String id, String pass) {
				String sql="DELETE TBL_USER"
						+ "   WHERE USER_ID ='"+Controller.LoginUser.get("USER_ID")+"'"
						+ "     AND USER_PASS ='"+Controller.LoginUser.get("USER_PASS")+"'";
				return jdbc.Update(sql);
			}
			
			//결제
			public Map<String, Object> userpayment(Map<String,Object> carimfo){
				String sql = " SELECT  " 
					+ " 	((RES_YBAN - RES_INSU) * 24) "
					+ "   * (SELECT CAR_PRICE FROM TBL_CAR WHERE CAR_NO = '" 
					+       carimfo.get("CAR_NO") + "') AS PRICE"
					+ "     FROM TBL_RES "
					+ " 	WHERE RES_CAR_NO = '" + carimfo.get("CAR_NO") + "'";
						return jdbc.selectOne(sql);
			}
			//결제 취소
			public int usercancel(Map<String,Object> resno){
				String sql = " DELETE TBL_RES  " 
					+ "         WHERE RES_NO = '" + resno.get("RES_NO") + "'";
						return jdbc.Update(sql);
			}
			
			
			
			
			//예약정보확인
			public List<Map<String, Object>> selectres (){
				String sql = " SELECT A.RES_NO, " 
						+ "      	  A.RES_CAR_NO, " 
						+ "			  B.CAR_MNAME " 
						+ "	     FROM TBL_RES A "
						+ " 	 LEFT OUTER JOIN TBL_CAR B ON A.RES_CAR_NO = B.CAR_NO "
						+ "  	 WHERE A.RES_USER_ID ='" + Controller.LoginUser.get("USER_ID") + "'"
						+ "      AND A.RES_RTIME IS NULL";
				return jdbc.selectList(sql);		
			}
			//예약정보 상세보기
			public Map<String, Object> rescheck(int input){
				String sql = "SELECT A.RES_NO, "
					+ "	             B.CAR_NO, "
					+ "       	     B.CAR_MNAME, "
					+ " 	         A.RES_INSU, "
					+ " 	         A.RES_RBAN, "
					+ " 	         A.RES_TIME, "
					+ " 	         A.RES_PRICE "
				    + "         FROM TBL_RES A "
				    + "         LEFT OUTER JOIN TBL_CAR B ON A.RES_CAR_NO = B.CAR_NO "
				    + "         WHERE A.RES_NO =" + input  ;
				return jdbc.selectOne(sql);
			}
			//추가금 조회
			public Map<String, Object> payment(int resno, int banyear, int bantime){
				String sql = " SELECT PAYMENT "
					 + " 	     FROM (SELECT (((TO_DATE("+banyear+") - RES_YBAN)*24) +"
					 + "		 ("+bantime+"- RES_TIME)) *"
					 + " 		 (SELECT A.CAR_PRICE FROM TBL_CAR A " 
					 + "         LEFT OUTER JOIN TBL_RES B ON B.RES_CAR_NO = A.CAR_NO "
					 + "          WHERE B.RES_NO ="+resno+") AS PAYMENT"
					 + "                 FROM TBL_RES"
					 + "        WHERE RES_NO ="+resno+") A"
					 + "        WHERE PAYMENT > 0"; 
				return jdbc.selectOne(sql);
			}
			//추가금 입력
			public int updatepayment(int resno, int banyear, int bantime, Map<String, Object> payment){
				String sql = " UPDATE TBL_RES"
				 	 + "          SET RES_RBAN = TO_DATE("+banyear+"),"
					 + "	          RES_RTIME = "+bantime+","
					 + "	          RES_PAYMENT = TO_NUMBER('"+payment.get("PAYMENT")+"')"
					 + " WHERE RES_NO = "+resno;
				return jdbc.Update(sql);
			}
			//과거 이력보기
			public List<Map<String, Object>> pasthistory (){
				String sql = " SELECT A.RES_NO, " 
						+ "      	  A.RES_CAR_NO, " 
						+ "			  B.CAR_MNAME " 
						+ "	     FROM TBL_RES A "
						+ " 	 LEFT OUTER JOIN TBL_CAR B ON A.RES_CAR_NO = B.CAR_NO "
						+ "  	 WHERE A.RES_USER_ID ='" + Controller.LoginUser.get("USER_ID") + "'"
						+ "      AND A.RES_RTIME IS NOT NULL";
				return jdbc.selectList(sql);		
			}
			//과거이력 상세보기
			public Map<String, Object> historycheck(int resno){
				String sql = "SELECT A.RES_NO, "
					+ "	             B.CAR_NO, "
					+ "       	     B.CAR_MNAME, "
					+ " 	         A.RES_INSU, "
					+ " 	         A.RES_RBAN, "
					+ " 	         A.RES_TIME, "
					+ " 	         A.RES_RTIME, "
					+ " 	         A.RES_PRICE + A.RES_PAYMENT AS PRICE "
				    + "         FROM TBL_RES A "
				    + "         LEFT OUTER JOIN TBL_CAR B ON A.RES_CAR_NO = B.CAR_NO "
				    + "         WHERE A.RES_NO =" + resno  ;
				return jdbc.selectOne(sql);
			}
			
			
			
			
			
		
	
			

}
