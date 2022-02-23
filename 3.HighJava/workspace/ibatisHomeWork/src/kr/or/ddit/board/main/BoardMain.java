package kr.or.ddit.board.main;

import java.util.List;
import java.util.Scanner;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;

public class BoardMain {
	IBoardService service = BoardServiceImpl.getService();
	Scanner s = new Scanner(System.in);
	
	public static void main(String[] args) {
		new BoardMain().start();
	}
	
	private void menuDisplay() {
		System.out.println("1. 전체목록 출력");
		System.out.println("2. 새글작성");
		System.out.println("3. 수정");
		System.out.println("4. 삭제");
		System.out.println("5. 검색");
		System.out.println("6. 종료");
		System.out.println("--------------------");
	}

	private void start() {
		int input = 0 ;
		
		do {
			menuDisplay();
			
			System.out.println("메뉴를 선택해주세요.");
			System.out.print(">>");
			input = Integer.parseInt(s.nextLine());
			
			switch(input) {
			case 1:
				displayAll();
				break;
			case 2:
				insertBoard();
				break;
			case 3:
				updateBoard();
				break;
			case 4:
				deleteBoard();
				break;
			case 5:
				selectBoard();
				break;
			case 6:
				System.out.println("-----------------");
				System.out.println("프로그램을 종료합니다.");
				System.out.println("-----------------");
				System.exit(0);
				break;
			}
		}while(true);
	}
	
	private void selectBoard() {
		BoardVO vo = new BoardVO();
		displayAll();
		System.out.print("조회할 게시글 제목: ");
		String title = s.nextLine();
		System.out.print("조회할 게시글 내용: ");
		String content = s.nextLine();
		System.out.print("조회할 게시글 작성자: ");
		String writer = s.nextLine();
		
		vo.setTitle(title);
		vo.setContent(content);
		vo.setWriter(writer);
		
		BoardVO vo2 = new BoardVO();
		vo2 = service.selectBoard(vo);
		if(vo2 != null) {
			System.out.println("게시글 번호: " + vo2.getNum());
			System.out.println("게시글 제목: " + vo2.getTitle());
			System.out.println("게시글 내용: " + vo2.getContent());
			System.out.println("게시글 작성자: " + vo2.getWriter());
			System.out.println("게시글 작성일자: " + vo2.getDate());
		}
	}
	
	private void deleteBoard() {
		displayAll();
		System.out.println("삭제할 게시글 번호를 입력해주세요.");
		int num = Integer.parseInt(s.nextLine());
		
		int cnt = service.deleteBoard(num);
		if(cnt > 0) {
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제 실패");
		}
	}
	
	private void updateBoard() {
		BoardVO vo = new BoardVO();
		
		displayAll();
		System.out.println("수정할 게시글 번호를 입력해주세요.");
		int num = Integer.parseInt(s.nextLine());
		vo = service.searchBoard(num);
		if(vo != null) {
			System.out.print("제목> ");
			String title = s.nextLine();
			System.out.print("내용> ");
			String content = s.nextLine();
			
			vo.setTitle(title);
			vo.setContent(content);
			
			int cnt = service.updateBoard(vo);
			
			if(cnt > 0) {
				System.out.println("수정 성공");
			}else {
				System.out.println("수정 실패");
			}
		}else {
			System.out.println("등록되지 않은 게시글 입니다.");
		}
		
		service.updateBoard(vo);
	}
	
	private void insertBoard() {
		BoardVO vo = new BoardVO();
		System.out.println("----------게시판 등록-----------");
		System.out.print("제목: ");
		String title = s.nextLine();
		System.out.print("내용: ");
		String content = s.nextLine();
		System.out.print("작성자: ");
		String writer = s.nextLine();
		
		vo.setTitle(title);
		vo.setContent(content);
		vo.setWriter(writer);
		int cnt = service.insertBoard(vo);
		if(cnt > 0) {
			System.out.println("게시글 등록 성공");
		}else {
			System.out.println("게시글 등록 실패");
		}
	}
	
	private void displayAll() {
		System.out.println("1.번호\t2.제목\t3.작성자\t4.작성일자");
		List<BoardVO> list = service.displayAllBoard();
		for(BoardVO vo : list) {
			System.out.println(vo.getNum() + "\t" + vo.getTitle() + "\t" + vo.getWriter() + "\t" + vo.getDate());
		}
		System.out.println("---------------------------------------------------");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
