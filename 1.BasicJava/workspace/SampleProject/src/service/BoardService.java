package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import util.ScanUtil;
import util.View;
import controller.Controller;
import dao.BoardDao;

public class BoardService {
	
	private BoardService(){}
	private static BoardService instance;
	public static BoardService getInstance(){
		if(instance == null){
			instance = new BoardService();
		}
		return instance;
	}
	
	private BoardDao boardDao = BoardDao.getInstance();
	
	public int boardList(){
		List<Map<String, Object>> boardList = boardDao.selectBoardList();
		
		System.out.println("=====================================");
		System.out.println("번호\t제목\t작성자\t작성일");
		System.out.println("-------------------------------------");
		for(Map<String, Object> board : boardList){
			System.out.println(board.get("BOARD_NO") + "\t"
					+ board.get("TITLE") + "\t"
					+ board.get("USER_NAME") + "\t"
					+ board.get("REG_DATE"));
		}
		System.out.println("=====================================");
		System.out.println("1.조회\t2.등록\t0.로그아웃");
		System.out.println("입력>");
		
		int input = ScanUtil.nextInt();
		
		switch (input) {
		case 1://조회
			read();
			break;
		case 2://등록
			insert();
			break;
		case 0://로그아웃
			Controller.LoginUser = null;
			return View.HOME;
	
		}
		return View.BOARD_LIST;
	}
	
	public int read(){
		System.out.print("조회할 게시물 번호 입력>");
		int boardNo = ScanUtil.nextInt();
		Map<String, Object> board = boardDao.boardRead(boardNo);
		System.out.println("-------------------------------");
		System.out.println("번호 \t: " + board.get("BOARD_NO"));
		System.out.println("작성자\t: " + board.get("USER_NAME"));
		System.out.println("작성일\t: " + board.get("REG_DATE"));
		System.out.println("제목\t: " + board.get("TITLE"));
		System.out.println("내용\t: " + board.get("CONTENT"));
		System.out.println("--------------------------------");
		System.out.println("1.수정\t2.삭제\t0.돌아가기");
		int input = ScanUtil.nextInt();
		switch (input) {
		case 1://수정
			update(boardNo);
			break;
			
		case 2://삭제
//			delete(boardNO);
			break;
		case 0://
			return View.BOARD_LIST;
		}
		return View.READ;
		//이따하고 돌아가기 수정삭제 오케
	}
	
	public int update(int boardNo) {
		Map<String, Object> board = new HashMap<>();
		System.out.println("제목>");
		String title = ScanUtil.nextLine();
		System.out.println("내용>");
		String content = ScanUtil.nextLine();
		board.put("TITLE", title);
		board.put("CONTENT", content);
		board.put("BOARD_NO", boardNo);
		board.put("USER_NAME", Controller.LoginUser.get("USER_ID"));
		boardDao.boardUpdate(board);
		return View.READ;
	}

	public int insert(){
		Map<String, Object> board = new HashMap<>();
		System.out.println("제목>");
		String title = ScanUtil.nextLine();
		System.out.println("내용>");
		String content = ScanUtil.nextLine();
		board.put("TITLE", title);
		board.put("CONTENT", content);
		board.put("USER_NAME", Controller.LoginUser.get("USER_ID"));
		boardDao.boardInsert(board);
		return View.BOARD_LIST;
	}
	
//	public int delete() {
//
//	}
	
}
