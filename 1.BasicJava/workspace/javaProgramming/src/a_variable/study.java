package a_variable;



public class study {


	public static void main(String[] args) {
		

		


		
		String a = "20210801";
		for(int i = 0; i<a.length(); i++){
			System.out.print(a.charAt(i));
			if(i==3){System.out.print("년");}
			else if(i==5){System.out.print("월");}
			else if(i==7){System.out.print("일");}
		}
		
		System.out.println("오잉~신기하구만~");
	String b = "안녕하세요";
	
//	for(int i = a.length()-1; i >= 0; i--){
//		char k = a.charAt(i);
//		System.out.println(k);
		
		//뒤에서 2개 떼온게 
//	}
//	new study().start();	
//
//	}
//	JDBCUtil jdbc = JDBCUtil.getInstance();
//	
//	void start(){
//		while(true){
//			String sql = "SELECT A.BOARD_NO"
//					+ "		   , A.TITLE"
//					+ " 	   , B.MEM_NAME AS USER_NAME"
//					+ " 	   , TO_CHAR(A.REG_DATE, 'MM/DD') AS REG_DATE"
//					+ "		FROM TB_JDBC_BOARD A"
//					+ "     LEFT OUTER JOIN MEMBER B ON A.USER_ID = B.MEM_ID"
//					+ "    ORDER BY A.BOARD_NO DESC";
//			List<Map<String, Object>> boardList = jdbc.selectList(sql);
//			
//			System.out.println("-----------------------------------");
//			System.out.println("번호\t제목\t작성자\t작성일");
//			System.out.println("-----------------------------------");
//			for(Map<String, Object> board : boardList){
//				System.out.println(board.get("BOARD_NO")
//							+ "\t" + board.get("TITLE")
//							+ "\t" + board.get("USER_NAME")
//							+ "\t" + board.get("REG_DATE"));
//			}
//			System.out.println("-----------------------------------");
//			
//			System.out.println("1.조회\t2.등록\t0.종료");
//			System.out.println("번호 입력>");
//			int input = ScanUtil.nextInt();
//			switch (input){
//			case 1: read(); break;
//			case 2: insert(); break;
//			case 0:
//				System.out.println("프로그램이 종료되었습니다.");
//				System.exit(0);
//			}
//		}
//	}
//	
//	void read(){
//		System.out.println("조회할 게시글 번호 입력>");
//		int boardNo = ScanUtil.nextInt();
//		
//		String sql = "SELECT A.BOARD_NO"
//				+ "			, A.TITLE"
//				+ "			, A.CONTENT"
//				+ "			, B.MEM_NAME AS USER_NAME"
//				+ "			, TO_CHAR(A.REG_DATE, 'MM/DD') AS REG_DATE"
//				+ " 	FROM TB_JDBC_BOARD A"
//				+ " 	LEFT OUTER JOIN MEMBER B ON A.USER_ID = B.MEM_ID"
//				+ "		WHERE A.BOARD_NO = " + boardNo;
//		Map<String, Object> board = jdbc.selectOne(sql);
//		System.out.println("-----------------------------");
//		System.out.println("번호\t: " + board.get("BOARD_NO"));
//		System.out.println("작성자\t: " + board.get("USER_NAME"));
//		System.out.println("작성일\t: " + board.get("REG_DATE"));
//		System.out.println("제목\t: " + board.get("TITLE"));
//		System.out.println("내용\t: " + board.get("CONTENT"));
//		System.out.println("-----------------------------");
//		
//		System.out.println("1.수정\t2.삭제\t0.목록");
//		System.out.println("번호 입력>");
//		int input = ScanUtil.nextInt();
//		switch(input){
//		case 1: update(boardNo); break;
//		case 2: delete(boardNo); break;
//		}
//	}
//	
//	void insert(){
//		System.out.println("제목");
//		String title = ScanUtil.nextLine();
//		System.out.println("내용");
//		String content = ScanUtil.nextLine();
//		System.out.println("아이디");
//		String userId = ScanUtil.nextLine();
//		
//		String sql = "INSERT INTO TB_JDBC_BOARD"
//				+" VALUES ("
//				+ " (SELECT NVL(MAX(BOARD_NO),0) + 1 FROM TB_JDBC_BOARD)"
//				+ ", '" + title + "'"
//				+ ", '" + content + "'"
//				+ ", '" + userId + "'"
//				+ ", SYSDATE)";
//		if(0 < jdbc.update(sql)){
//			System.out.println("게시글 등록 완료");
//		}
//		else{
//			System.out.println("게시글 등록 실패");
//		}
//	}
//	void update(int boardNo){
//		System.out.println("제목");
//		String title = ScanUtil.nextLine();
//		System.out.println("내용");
//		String content = ScanUtil.nextLine();
//		
//		String sql = "UPDATE TB_JDBC_BOARD"
//				+ "    SET TITLE = '" + title + "'"
//				+ "    , CONTENT = '" + content + "'"
//				+ "   WHERE BOARD_NO =" + boardNo;
//		if(0 < jdbc.update(sql)){
//			System.out.println("수정 성공");
//		}
//		else {
//			System.out.println("수정 실패");
//		}
//	}
//	
//	void delete(int boardNo){
//		String sql = "DELETE FROM TB_JDBC_BOARD"
//					+ " WHERE BOARD_NO =" + boardNo;
//		if(0 < jdbc.update(sql)){
//			System.out.println("삭제  성공");
//		}
//		else {
//			System.out.println("삭제 실패");
//		}
	}
	
}
