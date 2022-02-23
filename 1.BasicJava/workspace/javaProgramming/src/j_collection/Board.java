package j_collection;

import java.lang.invoke.SwitchPoint;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import e_oop.ScanUtil;

public class Board {

	public static void main(String[] args) {
		/*
		 * ArrayList와 HashMap을 사용해 게시판 테이블을 만들고,
		 * 조회, 등록, 수정, 삭제가 가능한 게시판을 만들어주세요.
		 * 
		 * 게시판 테이블 컬럼 : 번호(PK), 제목, 내용, 작성자, 작성일
		 * 
		 */ //목록에서 상세화면(수정,삭제) 조회  또는 등록    
		
		ArrayList<HashMap<String, Object>> board = new ArrayList<>();
		HashMap<String, Object> column = new HashMap<>();
		boolean flag = true;

		do {
			System.out.println("1.조회\t2.등록\t3.수정\t4.삭제\t0.나가기");
			int input = ScanUtil.nextInt();
			switch (input) {
			case 1:
				System.out.println("게시글번호\t\t제목\t\t작성자\t\t작성일");
				for (int i = 0; i < board.size(); i++) {
					System.out.println(board.get(i).get("번호") + "\t\t"
							+ board.get(i).get("제목") + "\t\t"
							+ board.get(i).get("작성자") + "\t\t"
							+ board.get(i).get("작성일"));
				}
				boolean flag2 = true;
				while (flag2) {
					System.out.println("조회할 게시글 번호입력>       0.돌아가기");
					int check_num = ScanUtil.nextInt();
					if (check_num == 0) {
						flag2 = false;
						break;
					}
					System.out.println("제목 : "
							+ board.get(check_num - 1).get("제목") + "\n내용\n"
							+ board.get(check_num - 1).get("내용"));
					flag2 = false;
				}

				break;

			case 2:
				column = new HashMap<>();
				column.put("번호", board.size() + 1);
				System.out.println("게시글 제목입력> ");
				String title = ScanUtil.nextLine();
				column.put("제목", title);
				System.out.println("내용 입력>");
				String content = ScanUtil.nextLine();
				column.put("내용", content);
				System.out.println("작성자 입력>");
				String name = ScanUtil.nextLine();
				column.put("작성자", name);
				column.put("작성일", new Date());
				board.add(column);
				break;

			case 3:// 수정
				System.out.println("게시글번호\t\t제목\t\t작성자");
				for (int i = 0; i < board.size(); i++) {
					System.out.println(board.get(i).get("번호") + "\t\t"
							+ board.get(i).get("제목") + "\t\t"
							+ board.get(i).get("작성자"));
				}
				boolean flag3 = true;
				while (flag3) {
					System.out.println("수정할 게시물 번호 입력 >        0.돌아가기");
					int modify_num = ScanUtil.nextInt();
					if (modify_num == 0) {
						flag3 = false;
						break;
					}
					System.out.println("수정할 제목 입력>");
					String modify_title = ScanUtil.nextLine();
					column.put("제목", modify_title);
					board.set(modify_num - 1, column);

					System.out.println("수정할 내용 입력>");
					String modify_content = ScanUtil.nextLine();
					column.put("내용", modify_content);
					board.set(modify_num - 1, column);
					flag3 = false;
				}
				break;

			case 4:// 삭제
				System.out.println("게시글번호\t\t제목");
				for (int i = 0; i < board.size(); i++) {
					System.out.println(board.get(i).get("번호") + "\t\t"
							+ board.get(i).get("제목"));
				}
				boolean flag4 = true;
				while (flag4) {
					System.out.println("삭제할 게시물 번호 입력>         0.돌아가기");
					int delete_num = ScanUtil.nextInt();
					if (delete_num == 0) {
						flag4 = false;
						break;
					}
					board.remove(delete_num - 1);
					column.put("번호", board.size());
					flag4 = false;
				}
				break;

			case 0:
				flag = false;
				break;
			}

		} while (flag);

	}
}

//class pro{
//	
//	ArrayList<HashMap<String, Object>> boardTable = new ArrayList<>(); //메인 메서드에서 만들었으므로 파라미터로 준다.
//	while(true){
//		System.out.println("---------------------");
//		System.out.println("번호\t제목\t작성자\t작성일");
//		System.out.println("---------------------");
//		for(int i = boardTable.size()-1; i >= 0; i--){
//			HashMap<String, Object> board = boardTable.get(i);
//			System.out.println(board.get("NO")
//					+ "\t" + board.get("TITLE")
//					+ "\t" + board.get("USER")
//					+ "\t" + board.get("REG_DATE"));
//			}
//		System.out.println("---------------------");
//		System.out.println("1.조회\t2.등록\t0.종료");
//		System.out.print("번호입력>");
//		int input = ScanUtil.nextInt();
//	
//		switch (input){
//		case 1: //조회
//			read(boardTable);
//			break;
//			
//		case 2: //등록
//			insert(boardTable);
//			break;
//			
//		case 0: //종료
//			System.out.println("프로그램이 종료되었습니다.");
//			System.exit(0);
//		}	
//	}
//	
//	static void read(ArrayList<HashMap<String, Object>> boardTable){
//		System.out.print("조회할 게시글 번호 입력>");
//		int no = ScanUtil.nextInt();
//		
//		HashMap<String, Object> board = null;
//		for(int i = 0; i < boardTable.size(); i++){
//			if((Integer)boardTable.get(i).get("NO") == no){ // 좌는 오브젝트타입 우는 인트타입임. 오브젝트타입을 인티저로 형변환해야 가능.
//				board = boardTable.get(i);
//				break;
//			}
//		}
//		System.out.println("------------------------");
//		System.out.println("번호\t " + board.get("NO"));
//		System.out.println("작성자\t " + board.get("USER"));
//		System.out.println("작성일\t " + board.get("REG_DATE"));
//		System.out.println("제목\t " + board.get("TITLE"));
//		System.out.println("내용\t " + board.get("CONTENT"));
//		System.out.println("------------------------");
//		System.out.println("1.수정\t2.삭제\t0.목록");
//		System.out.println("번호 입력>");
//		int input = ScanUtil.nextInt();
//		
//		switch (input){
//		case 1: //수정
//			update(board);
//			break;
//		case 2: //삭제
//			delete(boardTable, board);
//			break;
//			//목록을 안해도 다른거 입력하면 목록 가짐
//		}
//	}
//	
//	static void update(HashMap<String, Object> board){
//		System.out.println("제목>");
//		String title = ScanUtil.nextLine();
//		System.out.println("내용>");
//		String content = ScanUtil.nextLine();
//		
//		board.put("TITLE", title);
//		board.put("CONTENT", content);
//		
//		System.out.println("수정이 완료되었습니다.");
//	}
//	
//	static void delete(ArrayList<HashMap<String, Object>> boardTable, HashMap<String, Object> board){
//		for(int i = 0; i < boardTable.size(); i++){
//			if(boardTable.get(i).get("NO") == board.get("NO")){
//				boardTable.remove(i);
//				System.out.println("삭제가 완료되었습니다.");
//				break;
//			}
//		}
//		
//	}
//	
//	
//	
//	static void insert(ArrayList<HashMap<String, Object>> boardTable){
//		System.out.println("제목>");
//		String title = ScanUtil.nextLine();
//		System.out.println("내용>");
//		String content = ScanUtil.nextLine();
//		System.out.println("이름>");
//		String user = ScanUtil.nextLine();
//		
//		int maxNo = 0;
//		for(int i = 0; i < boardTable.size(); i++){
//			int no = (Integer)boardTable.get(i).get("NO");
//			if(maxNo < no){
//				maxNo = no;
//			}
//		}
//		
//		HashMap<String, Object> temp = new HashMap<>();
//		temp.put("NO", maxNo + 1);
//		temp.put("TITLE", title);
//		temp.put("CONTENT", content);
//		temp.put("USER", user);
//		temp.put("REG_DATE", new Date());
//		
//		boardTable.add(temp);
//		System.out.println("게시글이 등록이 완료되었습니다.");
//		
//		
//	}
//	
//	
//	
//}
//
//
//	
