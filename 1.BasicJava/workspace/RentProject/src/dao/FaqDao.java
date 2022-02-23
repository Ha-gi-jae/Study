package dao;

import java.util.List;
import java.util.Map;

import utill.JDBCUtill;

public class FaqDao {
JDBCUtill jdbc = JDBCUtill.getInstance();
	
	private FaqDao(){}
	private static FaqDao instance;
	public static FaqDao getInstance(){
		if(instance==null){
			instance= new FaqDao();
		}
		return instance;
	}
	
	//faq리스트
	public List<Map<String, Object>> faqlist() {
		String sql="SELECT A.FAQ_NO"
				+ ",       B.CEO_NAME AS NAME"
				+ ",       A.FAQ_TITLE"
				+ ",       A.FAQ_DATE"
				+ "        FROM TBL_FAQ A"
				+ "        LEFT OUTER JOIN TBL_CEO B ON A.FAQ_CEO_ID=B.CEO_ID";
			
		return jdbc.selectList(sql);
	}
	
	
	//조회할게시판상세정보
	public Map<String, Object> faqselect(int check) {
		String sql="SELECT * FROM TBL_FAQ"
				+ "    WHERE FAQ_NO = "+check;
		return jdbc.selectOne(sql);
	}
	
	//게시판수정
	public int faqupdate(String title, String content,int check) {
		String sql="UPDATE TBL_FAQ"
				+ "    SET FAQ_TITLE = '"+title
				+"',"+"    FAQ_CONTENT= '"+content
				+"',       FAQ_DATE=SYSDATE"
				+ "     WHERE FAQ_NO= "+check;
		return jdbc.Update(sql);
	}
	
	//게시판삭제
	public int faqdelte(int check) {
		String sql="DELETE TBL_FAQ"
				+ "   WHERE FAQ_NO= "+check;
		
	    return jdbc.Update(sql);
	}
	
	//게시판등록
	public int faqinsert(String title, String content) {
		String sql="INSERT INTO TBL_FAQ "
				+ "      VALUES((SELECT NVL(MAX(FAQ_NO),0)+1 FROM TBL_FAQ)"
				+ " , '" + title  + "'"
				+ " , '" + content + "'"
				+ " , SYSDATE"
				+ " , (SELECT CEO_ID FROM TBL_CEO))";
		
		return jdbc.Update(sql);
	}
	
	
}
