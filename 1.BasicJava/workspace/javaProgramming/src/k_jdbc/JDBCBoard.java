package k_jdbc;

import java.util.ArrayList;
import java.util.Map;

import e_oop.ScanUtil;

public class JDBCBoard {

	public static void main(String[] args) {
		new JDBCBoard().start();
	}
	
	void start(){
		
	}
	
	void insert(){
		System.out.println("제목>");
		String title = ScanUtil.nextLine();
		System.out.println("내용>");
		String content = ScanUtil.nextLine();
		System.out.println("아이디>");
		String userId = ScanUtil.nextLine();
		
		String sql = "INSERT INTO TB_JDBC_BOARD"
				+ " VALUES ("
				+ "(SELECT NVL(MAX(BOARD_NO),0) + 1 FROM TB_JDBC_BOARD)"
				+ ", '" + title + "'"
				+ ", '" + content + "'"
				+ ", '" + userId + "'"
				+ ", SYSDATE)";
		if(0 < jdbc.update(sql)){
			System.out.println("게시글 등록이 완료되었습니다.");
		}
		else{
			System.out.println("게시글 등록에 실패하였습니다.");
		}
	}
	
	void update(int boardNo){
		System.out.println("제목>");
		String title = ScanUtil.nextLine();
		System.out.println("내용>");
		String content = ScanUtil.nextLine();
		
		String sql = ""
	}
	
	
	
}
