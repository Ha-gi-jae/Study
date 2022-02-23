package dao;

import java.util.List;
import java.util.Map;

import utill.JDBCUtill;

public class NoticeDao {

JDBCUtill jdbc = JDBCUtill.getInstance();
	
	private NoticeDao(){}
	private static NoticeDao instance;
	public static NoticeDao getInstance(){
		if(instance==null){
			instance= new NoticeDao();
		}
		return instance;
	}
	
	//notice리스트
		public List<Map<String, Object>> noticelist() {
			String sql="SELECT A.NOTICE_NO"
					+ ",       B.CEO_NAME AS NAME"
					+ ",       A.NOTICE_TITLE"
					+ ",       A.NOTICE_DATE"
					+ "        FROM TBL_NOTICE A"
					+ "        LEFT OUTER JOIN TBL_CEO B ON A.NOTICE_CEO_ID=B.CEO_ID";
				
			return jdbc.selectList(sql);
		}
		//조회할게시판상세정보
		public Map<String, Object> noticeselect(int check) {
			String sql="SELECT * FROM TBL_NOTICE"
					+ "    WHERE NOTICE_NO = "+check;
			return jdbc.selectOne(sql);
		}
		
		//게시판수정
		public int noticeupdate(String title, String content,int check) {
			String sql="UPDATE TBL_NOTICE"
					+ "    SET NOTICE_TITLE = '"+title
					+"',"+"    NOTICE_CONTENT= '"+content
					+"',       NOTICE_DATE=SYSDATE"
					+ "     WHERE NOTICE_NO= "+check;
			return jdbc.Update(sql);
		}
		
		//게시판삭제
		public int noticedelte(int check) {
			String sql="DELETE TBL_NOTICE"
					+ "   WHERE NOTICE_NO= "+check;
			
		    return jdbc.Update(sql);
		}
		
		//게시판등록
		public int noticeinsert(String title, String content) {
			String sql="INSERT INTO TBL_NOTICE "
					+ "      VALUES((SELECT NVL(MAX(NOTICE_NO),0)+1 FROM TBL_NOTICE)"
					+ " , '" + title  + "'"
					+ " , '" + content + "'"
					+ " , SYSDATE"
					+ " , (SELECT CEO_ID FROM TBL_CEO))";
			
			return jdbc.Update(sql);
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
