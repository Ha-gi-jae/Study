package dao;

import java.util.List;
import java.util.Map;

import utill.JDBCUtill;
import controller.Controller;

public class CarDao {

	private CarDao(){}
	private static CarDao instance;
	public static CarDao getInstance(){
		if(instance==null){
			instance= new CarDao();
		}
		return instance;
	}
	
	
	private JDBCUtill jdbc=JDBCUtill.getInstance();
	
	public List<Map<String, Object>> carlist() {
	
		return null;
	}
	
	
	
	
	//차량등록
	public int carinsert(Map<String, Object> carin) {
		String sql="INSERT INTO TBL_CAR "
				+ "         VALUES("
				+ "'"+carin.get("CAR_NO")+"'"
				+ ",'"+carin.get("CAR_MNO")+"'"
				+ ",'"+carin.get("CAR_MNAME")+"'"
				+ ",'"+carin.get("CAR_AIR")+"'"
				+ ",'"+carin.get("CAR_SUN")+"'"
				+ ",'"+carin.get("CAR_BACK")+"'"
				+ ",'"+carin.get("CAR_NAVI")+"'"
				+ ",'"+carin.get("CAR_NSMOKE")+"'"
				+ ",'"+carin.get("CAR_OPEN")+"'"
				+ ",'"+carin.get("CAR_FUEL")+"'"
				+ ",'"+carin.get("CAR_PEO")+"'"
				+ ",'"+carin.get("CAR_PRICE")+"'"
				+ ",(SELECT NVL(MAX(CAR_COUNT),0)+1 FROM TBL_CAR))";
		return jdbc.Update(sql);
	}




//소형차리스트
	public List<Map<String, Object>> scarlist() {
		
		String sql = "SELECT CAR_COUNT"
				+ " ,      CAR_MNAME"
				+ " ,      CAR_PEO"
				+ " ,      CAR_FUEL"
				+ "   FROM TBL_CAR"
				+ "   WHERE CAR_MNO = '소형' ";
		
		return jdbc.selectList(sql);
	}
//준중형차리스트
	public List<Map<String, Object>> mcarlist() {
			
		String sql = "SELECT CAR_COUNT"
					+ " ,      CAR_MNAME"
					+ " ,      CAR_PEO"
					+ " ,      CAR_FUEL"
					+ "   FROM TBL_CAR"
					+ "   WHERE CAR_MNO = '준중형' ";
			
		return jdbc.selectList(sql);
	}
//소형차리스트
	public List<Map<String, Object>> lcarlist() {	
			String sql = "SELECT CAR_COUNT"
					+ " ,      CAR_MNAME"
					+ " ,      CAR_PEO"
					+ " ,      CAR_FUEL"
					+ "   FROM TBL_CAR"
					+ "   WHERE CAR_MNO = '준대형' ";
			
			return jdbc.selectList(sql);
		}
//대형차리스트
	public List<Map<String, Object>> xlcarlist() {	
		String sql = "SELECT CAR_COUNT"
					+ " ,      CAR_MNAME"
					+ " ,      CAR_PEO"
					+ " ,      CAR_FUEL"
					+ "   FROM TBL_CAR"
					+ "   WHERE CAR_MNO = '대형' ";
			
			return jdbc.selectList(sql);
		}
	
   //조회에 맞는 차리스트 뽑아주는 메소드
	public List<Map<String, Object>> carlist(String name) {
		String sql = "SELECT CAR_COUNT"
				+ " ,      CAR_MNAME"
				+ " ,      CAR_PEO"
				+ " ,      CAR_FUEL"
				+ "   FROM TBL_CAR"
				+ "   WHERE CAR_MNO = '"+name+"'";
		return jdbc.selectList(sql);
	}




	//차량삭제
	public int cardelete(int select) {
		String sql = "DELETE TBL_CAR"
				+ "    WHERE CAR_COUNT= "+select;
		return jdbc.Update(sql);
	}


	//선택차량 세부정보
	public Map<String, Object> carimport(int select) {
		String sql="SELECT * FROM TBL_CAR"
				+ "          WHERE CAR_COUNT= "+select;
		return jdbc.selectOne(sql);
	}


	//예약인수일
	public int carinsu(String insu) {
		String sql="INSERT INTO TBL_RES(RES_NO,RES_INSU)"
				+ "        VALUES((SELECT NVL(MAX(RES_NO),0)+1 FROM TBL_RES)"
				+ ",       '"+insu+"')";
		//System.out.println(sql);
		return jdbc.Update(sql);
	}

	//차량금액수정
	public int update(int pay,int select) {
		String sql="UPDATE TBL_CAR"
				+ "    SET CAR_PRICE = "+pay
				+ "    WHERE CAR_COUNT= "+select;
		return jdbc.Update(sql);
	}
	
//	//인수일목록 가져오기
//	public List<Map<String, Object>> Sdate(rescarno){
//		String sql = "SELECT RES_INSU FROM TBL_RES WHERE RES_CAR_NO = '" + rescarno + "'";
//		return jdbc.selectList(sql);
//	}
//	//반납일목록 가져오기
//	public List<Map<String, Object>> Edate(rescarno){
//		String sql = "SELECT RES_YBAN FROM TBL_RES WHERE RES_CAR_NO = '" + resacrno + "'";
//		return jdbc.selectList(sql);
//	}
	
	
	//인수 비교
		public Map<String,Object> carcompare(String year, Map<String,Object> carimfo ){
			String sql = "SELECT RES_INSU," //인수일
			          + "  RES_YBAN," // 반납일
			          + "  RES_CAR_NO" //차량 번호(20오3080)
			+ "  FROM TBL_RES"
			+ "  WHERE RES_CAR_NO = '" + carimfo.get("CAR_NO") + "'"
			+ "  AND TO_DATE (" + year +") BETWEEN RES_INSU-1 AND RES_YBAN+1" ;
			
			
		   return jdbc.selectOne(sql);
		}
	
		//반납 비교
		public Map<String,Object> carcompare1(String banyear, Map<String,Object> carimfo ){
			String sql = "SELECT RES_INSU," //인수일
			          + "  RES_YBAN," // 반납일
			          + "  RES_CAR_NO" //차량 번호(20오3080)
			+ "  FROM TBL_RES"
			+ "  WHERE RES_CAR_NO = '" + carimfo.get("CAR_NO") + "'"
			+ "  AND TO_DATE (" + banyear +") BETWEEN RES_INSU-1 AND RES_YBAN+1" ;
			
			
		   return jdbc.selectOne(sql);
		}
	
		//예약
		public int carinsu(String year, String ban, Map<String,Object> carimfo, int time) {
			String sql= " INSERT INTO TBL_RES(RES_NO, RES_INSU, RES_YBAN, RES_RBAN, RES_USER_ID, RES_CAR_NO, RES_TIME)"
			  + "              VALUES((SELECT NVL(MAX(RES_NO),0)+1 FROM TBL_RES),"
			  + "               TO_DATE('"+year+"'),"
		      + "               TO_DATE('" + ban + "'),"
		       + "               TO_DATE('" + ban + "'),"
		      + "               '" + Controller.LoginUser.get("USER_ID") + "', '" + carimfo.get("CAR_NO") + "',"
		      + "               '" + time + "')";
			return jdbc.Update(sql);
		}
		
		
		//금액 입력
		public int carprice(Map<String,Object> carimfo){
			String sql = " UPDATE TBL_RES " 
					+ " 	SET RES_PRICE = ((RES_YBAN - RES_INSU) * 24) * (SELECT CAR_PRICE FROM TBL_CAR WHERE CAR_NO = '" 
					+       carimfo.get("CAR_NO") + "')"
					+ " 	WHERE RES_CAR_NO = '" + carimfo.get("CAR_NO") + "'";
			
				return jdbc.Update(sql);
		}
		
		//인수테이블조회
		public Map<String,Object> insuselect(String year, Map<String,Object> carimfo){
			String sql="SELECT RES_NO"
				+ "       FROM TBL_RES "
				+ "       WHERE RES_INSU = '" + year + "'"
				+ "       AND RES_CAR_NO = '" + carimfo.get("CAR_NO") + "'";
			
			return jdbc.selectOne(sql);
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
