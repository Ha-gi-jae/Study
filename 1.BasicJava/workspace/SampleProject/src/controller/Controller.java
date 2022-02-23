package controller;

import java.util.Map;

import service.BoardService;
import service.UserService;
import util.ScanUtil;
import util.View;

public class Controller {

	public static void main(String[] args) {
		/*
		 * 발표순서 : 조 소개 > 주제 소개 > 주제 선정 배경 > 메뉴 구조 > 시연 > 프로젝트 후기
		 * 발표인원 : 발표자 1명, ppt 및 시연 도우미 1명
		 * 
		 * Controller : 화면 이동 
		 * Service : 화면 기능 (내용)
		 * Dao : 쿼리작성  -  글 등록, 목록가져올때
		 * 
		 */
		
		new Controller().start();
	}
	
	public static Map<String, Object> LoginUser;	
	
	private UserService userService = UserService.getInstance();
	private BoardService boardService = BoardService.getInstance();
	
	private void start(){//시작 화면 이동 시켜주는 내용
		int view = View.HOME;
		
		while (true){
			switch (view) {
			case View.HOME:	view = home(); break;
			case View.LOGIN: view = userService.login(); break;
			case View.JOIN: view = userService.join(); break;
			case View.BOARD_LIST: view = boardService.boardList(); break;
			
			case View.INSERT: view = boardService.insert(); break;
			case View.READ: view = boardService.read(); break;
//			case View.UPDATE: view = boardService.Update(); break;
//			case View.DELETE: view = boardService.Delete(); break;
			}
		}
	}//start
	
	private int home(){
		System.out.println("--------------------------------------");
		System.out.println("1.로그인\t2.회원가입\t0.프로그램 종료");
		System.out.println("--------------------------------------");
		System.out.print("번호 입력>");
		
		int input = ScanUtil.nextInt();
				
		switch (input) {
		case 1: return View.LOGIN; //메서드 호출로 화면을 이동하는게 아니라 스타트 메서드로 다시 돌아가서 와일문 돌면서 화면 이동시켜줘야함.
		case 2: return View.JOIN;
		case 0: 
			System.out.println("프로그램이 종료되었습니다.");
			System.exit(0);
		}
		return View.HOME; //잘못눌렀을경우 home으로 돌아가게.
	}
	

}
