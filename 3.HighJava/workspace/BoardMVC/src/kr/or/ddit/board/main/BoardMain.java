package kr.or.ddit.board.main;

import java.util.List;
import java.util.Scanner;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;

public class BoardMain {
	private IBoardService service = BoardServiceImpl.getService();
	Scanner s = new Scanner(System.in);
	
	public static void main(String[] args) {
		new BoardMain().start();
	}
	
	private void start() {
		int input = 0;
		do {
			System.out.println("1.전체 목록 출력\t2.새 글 작성\t3.수정\t4.삭제\t5.검색\t0.종료");
			System.out.print(">> ");
			input = Integer.parseInt(s.nextLine());
			switch(input) {
			case 1:
				displayAllBoard();
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
				System.out.println("------------------------------");
				System.out.println("프로그램을 종료합니다.");
				System.out.println("------------------------------");
				break;
			}
		}while(input != 6);
	}
	
	private void selectBoard() {
		BoardVO vo = new BoardVO();
		while(true) {
			displayAllBoard();
			System.out.println("검색할 정보를 입력해주세요/");
			
			System.out.print("게시글 제목 >> ");
			String title = s.nextLine();
			System.out.print("게시글 내용 >> ");
			String content = s.nextLine();
			System.out.print("작성자 >> ");
			String writer = s.nextLine();
			
			vo.setTitle(title);
			vo.setContent(content);
			vo.setWriter(writer);
			
			BoardVO vo2 = service.checkBoard(vo);
			
			if(vo2 == null) {
				System.out.println("등록된 게시글이 아닙니다.");
			}else {
				System.out.println("게시글 번호 : " + vo2.getNum());
				System.out.println("게시글 제목 : " + vo2.getTitle());
				System.out.println("게시글 내용 : " + vo2.getContent());
				System.out.println("작성자 : " + vo2.getWriter());
				System.out.println("작성일자 : " + vo2.getDay());
				
				break;
			}
		}
	}
	
	private void displayAllBoard() {
		System.out.println("1.번호\t2.제목\t3.작성자\t4.작성일자");
		List<BoardVO> list = null;
		
		list = service.displayAllBoard();
		
		for(BoardVO vo: list) {
			System.out.println(vo.getNum() + "\t" + vo.getTitle() + "\t" + vo.getWriter() + "\t" + vo.getDay());
		}
		System.out.println("--------------------------------------------------------");
		System.out.println("출력 끝");
	}
	
	private void deleteBoard() {
		System.out.println("삭제할 게시글 번호를 입력해주세요.");
		System.out.print(">> ");
		int num = Integer.parseInt(s.nextLine());
		
		int result = service.deleteBoard(num);
		
		if(result > 0) {
			System.out.println("게시글 삭제 완료");
		}else {
			System.out.println("게시글 삭제 실패");
		}
	}
	
	private void updateBoard() {
		System.out.println("수정할 게시글 번호를 입력해주세요.");
		System.out.print(">> ");
		int num = Integer.parseInt(s.nextLine());
		
		System.out.print("제목 : ");
		String title = s.nextLine();
		System.out.print("내용 : ");
		String content = s.nextLine();
		
		BoardVO vo = new BoardVO();
		
		vo.setTitle(title);
		vo.setContent(content);
		
		int result = service.updateBoard(num, vo);
		
		if(result > 0) {
			System.out.println("게시글 수정 완료");
		}else {
			System.out.println("게시글 수정 실패");
		}
	}
	
	private void insertBoard() {
		System.out.println("-----------------------------------");
		System.out.print("제목 : ");
		String title = s.nextLine();
		System.out.print("내용 : ");
		String content = s.nextLine();
		System.out.print("작성자 : ");
		String writer = s.nextLine();
		
		BoardVO vo = new BoardVO();
		
		vo.setTitle(title);
		vo.setContent(content);
		vo.setWriter(writer);
		
		int result = service.insertBoard(vo);
		if(result > 0) {
			System.out.println("게시글 등록 완료");
		}else {
			System.out.println("게시글 등록 실패");
		}
	}
}
