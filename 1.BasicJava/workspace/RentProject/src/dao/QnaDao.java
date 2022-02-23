package dao;

import java.util.List;
import java.util.Map;

import utill.JDBCUtill;
import controller.Controller;

public class QnaDao {

	JDBCUtill jdbc = JDBCUtill.getInstance();
	
	private QnaDao(){}
	private static QnaDao instance;
	public static QnaDao getInstance(){
		if(instance==null){
			instance= new QnaDao();
		}
		return instance;
	}
	public List<Map<String, Object>> qnalist() {
		String sql="SELECT * FROM TBL_QNA";
		return jdbc.selectList(sql);
	}
	
	//마스터조회할 qna내용
	public Map<String, Object> qnarelist(int input) {
		String sql="SELECT * FROM TBL_QNA"
				+ "   WHERE QNA_NO ="+input;
		return jdbc.selectOne(sql);
	}
	
	//user에서조회할 qna내용
		public Map<String, Object> usqnarelist(int check) {
			String sql="SELECT * FROM TBL_QNA"
					+ "   WHERE QNA_NO ="+check;
			return jdbc.selectOne(sql);
		}
	
	
	
	//qna답변처리
	public int qnaans(Map<String,Object> list,String content) {
		String sql="UPDATE TBL_QNA"
				+ "    SET QNA_COMMENT = '"+ content
				+"'    WHERE QNA_NO='"+list.get("QNA_NO")+"'";
		int result=jdbc.Update(sql);
		
		return result;
		
	}
	
	//사용자본인 qna수정
	public int qnaupdate(int check, String title, String content) {
		String sql="UPDATE TBL_QNA"
				+ "    SET QNA_TITLE= '"+title+"'"
				+ ",       QNA_CONTENT= '"+content+"'"
				+ "  WHERE QNA_NO= "+check;
		return jdbc.Update(sql);
	}
	//사용자본인 qna삭제
	public int qnadelete(int check) {
		String sql="DELETE TBL_QNA"
				+ "   WHERE QNA_NO= "+check;
		
		return jdbc.Update(sql);
	}
	//사용자 qna등록
	public int qnainsert(String title, String content) {
		String sql="INSERT INTO TBL_QNA(QNA_NO,QNA_TITLE,QNA_CONTENT,QNA_CONTENT_DATE,QNA_USER_ID)"
				+ "   VALUES((SELECT NVL(MAX(QNA_NO),0)+1 FROM TBL_QNA)"
				+ ",'"+title+"'"
				+ ",'"+content+"'"
				+ ",SYSDATE"
				+ ",'"+Controller.LoginUser.get("USER_ID")+"')";
		return jdbc.Update(sql);
	}
	
	
	
	
}
