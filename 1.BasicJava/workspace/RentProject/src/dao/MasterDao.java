package dao;

import java.util.List;
import java.util.Map;

import utill.JDBCUtill;

public class MasterDao {

	//싱글톤 패턴
	private MasterDao(){}
	private static MasterDao instance;
	public static MasterDao getInstance(){
		if(instance==null){
			instance= new MasterDao();
		}
		return instance;
	}
	
	private JDBCUtill jdbc = JDBCUtill.getInstance();
	
	public Map<String, Object> selectMaster(String id, String pass) {
		String sql="SELECT CEO_ID CEO_PASS"
				+ " FROM TBL_CEO"
				+ " WHERE CEO_ID = '"+id+"'"
				+ "   AND CEO_PASS = '"+pass+"'";
		
		return jdbc.selectOne(sql);
	}

	public Map<String, Object> placelist() {
		String sql="SELECT *"
				+ "   FROM TBL_CEO";
		
		return jdbc.selectOne(sql);
	}
	
	
	//결제금액
		public List<Map<String, Object>> saleprice(){
			String sql = "SELECT RES_PRICE"
					+ "     FROM TBL_RES";
			return jdbc.selectList(sql);
		}
		//추가결제금액
		public List<Map<String, Object>> paymentprice(){	
			String sql = "SELECT RES_PAYMENT"
					+ "     FROM TBL_RES"
					+ "    WHERE RES_PAYMENT IS NOT NULL";
			return jdbc.selectList(sql);
		}
		//결제정보
		public List<Map<String, Object>> priceinfo(){
			String sql = "SELECT A.RES_NO"
					+	"      , A.RES_CAR_NO"
					+	"      , B.CAR_MNAME"
					+	"      , A.RES_INSU"
					+	"      , A.RES_TIME"
					+	"      , A.RES_YBAN"
					+	"      , A.RES_RBAN"
					+	"      , NVL(A.RES_RTIME, 0)"
					+	"      , A.RES_PRICE"
					+	"      , NVL(A.RES_PAYMENT, 0)"
					+	"   FROM TBL_RES A"
					+	"   LEFT OUTER JOIN TBL_CAR B ON A.RES_CAR_NO = B.CAR_NO"
					+	"  ORDER BY 1";
			return jdbc.selectList(sql);
					
		}
	
}
