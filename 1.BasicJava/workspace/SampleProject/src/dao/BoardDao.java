package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import util.ScanUtil;
import utill.JDBCUtil;
import controller.Controller;

public class BoardDao {
	
	private BoardDao(){}
	private static BoardDao instance;
	public static BoardDao getInstance(){
		if(instance == null){
			instance = new BoardDao();
		}
		return instance;
	}
	
	private JDBCUtil jdbc = JDBCUtil.getInstance();
	
	public List<Map<String, Object>> selectBoardList(){
		String sql = "SELECT A.BOARD_NO, A.TITLE, B.USER_NAME, A.REG_DATE"
				+ "     FROM TB_JDBC_BOARD A"
				+ "     LEFT OUTER JOIN TB_JDBC_USER B"
				+ "       ON A.USER_ID = B.USER_ID"
				+ "    ORDER BY A.BOARD_NO DESC";
				
		return jdbc.selectList(sql);
	}

	public Map<String, Object>boardRead(int boardNo) {
		String sql = "SELECT A.BOARD_NO"
				+ " ,        A.TITLE"
				+ " ,        A.CONTENT"
				+ " ,        B.USER_NAME AS USER_NAME"
				+ " ,        TO_CHAR(A.REG_DATE, 'MM/DD') AS REG_DATE"
				+ "     FROM TB_JDBC_BOARD A"
				+ "     LEFT OUTER JOIN TB_JDBC_USER B ON A.USER_ID = B.USER_ID"
				+ "    WHERE A.BOARD_NO = " + boardNo;
		return jdbc.selectOne(sql);
	}

	public void boardInsert(Map<String, Object> board) {
		String sql = "INSERT INTO TB_JDBC_BOARD"
				+ " VALUES((SELECT NVL(MAX(BOARD_NO),0) + 1 FROM TB_JDBC_BOARD)"
				+ ", '" + board.get("TITLE") + "'"
				+ ", '" + board.get("CONTENT")+ "'"
				+ ", '" + Controller.LoginUser.get("USER_ID") + "'"
				+ ", SYSDATE)";
		if(0 < jdbc.update(sql)){
			System.out.println("게시글 등록 성공");
		}
		else {
			System.out.println("게시글 등록 실패");
		}
		
	}

	public void boardUpdate(Map<String, Object> board) {
		String sql = "UPDATE TB_JDBC_BOARD"
				+    "   SET TITLE = '" + board.get("TITLE") + "'"
				+    "     , CONTENT = '" + board.get("CONTENT") + "'"
				+    " WHERE BOARD_NO = " + board.get("BOARD_NO") +
				     "   AND USER_ID = '" + Controller.LoginUser.get("USER_ID") + "'";
			if (0 < jdbc.update(sql)) {
				System.out.println("게시글 수정 완료");
			}
		else{
			System.out.println("게시글 수정 실패");
		}
	}
	
	
}
