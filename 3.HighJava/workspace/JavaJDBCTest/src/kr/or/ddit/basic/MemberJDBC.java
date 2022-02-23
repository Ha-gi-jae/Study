package kr.or.ddit.basic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import kr.or.ddit.util.JDBCUtil;
import kr.or.ddit.util.JDBCUtil3;

public class MemberJDBC {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Scanner scan = new Scanner(System.in);
	
	/**
	 * 메뉴를 출력하는 메서드
	 */
	public void displayMenu() {
		System.out.println();
		System.out.println("-----------------------");
		System.out.println("1. 자료 입력");
		System.out.println("2. 자료 삭제");
		System.out.println("3. 자료 수정");
		System.out.println("4. 전체 자료 출력");
		System.out.println("5. 작업 끝");
		System.out.println("-----------------------");
		System.out.print("원하는 작업 선택>>");
	}
	
	public void start() {
		int choice;
		do {
			displayMenu();
			choice = scan.nextInt();
			switch(choice) {
			case 1:
				insertMember();
				break;
			case 2:
				deleteMember();
				break;
			case 3:
				updateMember();
				break;
			case 4:
				displayMemberAll();
				break;
			case 5:
				System.out.println("작업을 마칩니다.");
				break;
			default:
				System.out.println("번호를 잘못 입력하셨습니다. 다시 입력해주세요.");
			}
		}while(choice != 5);
	}
	
	private void displayMemberAll() {
		System.out.println();
		System.out.println("---------------------------------------------");
		System.out.println("ID\t이름\t전화번호\t주소");
		System.out.println("---------------------------------------------");
		
		
		
		try{
			conn = JDBCUtil3.getConnection();
			String sql = "SELECT * FROM MYMEMBER";
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				String memId = rs.getString("mem_id");
				String memName = rs.getString("mem_name");
				String memTel = rs.getString("mem_tel");
				String memAddr = rs.getString("mem_addr");
				
				
				
				
				System.out.println(memId + "\t" + memName + "\t" + memTel + "\t" + memAddr);
			}
			System.out.println("---------------------------------------------");
			System.out.println("출력 작업 끝");
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}

	}
	
	private void deleteMember() {
		System.out.println();
		System.out.println("삭제할 회원 정보를 입력하세요.");
		System.out.print("회원 ID >> ");
		
		String memId = scan.next();
		
		try {
			conn = JDBCUtil.getConnection();
			
			String sql = "DELETE FROM MYMEMBER WHERE MEM_ID = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) {
				System.out.println(memId + "회원 삭제 성공");
			}else {
				System.out.println(memId + "회원 삭제 실패");
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}
	}
	
	private void updateMember() {
		boolean chk = false;
		String memId = "";
		
		do {
			System.out.println();
			System.out.println("수정할 회원 정보를 입력하세요.");
			System.out.print("회원 ID >> ");
			
			memId = scan.next();
			
			chk = checkMember(memId);
			
			if(chk == false) {
				System.out.println("회원 ID가 " + memId + "인 회원은 존재하지 않습니다.");
				System.out.println("다시 입력해주세요.");
			}
		}while(chk == false);
		
		System.out.print("회원 이름 >> ");
		String memName = scan.next();
		
		System.out.print("회원 전화번호 >> ");
		String memTel = scan.next();
		
		scan.nextLine();
		System.out.print("회원 주소 >> ");
		String memAddr = scan.nextLine();
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "UPDATE MYMEMBER"
					+ "      SET MEM_NAME = ?"	
					+ "	 	    ,MEM_TEL = ?" 
					+ "	 	    ,MEM_ADDR = ?" 
					+ "	   WHERE MEM_ID =  ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memName);
			pstmt.setString(2, memTel);
			pstmt.setString(3, memAddr);
			pstmt.setString(4, memId);
			
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) {
				System.out.println(memId + "회원의 정보를 수정했습니다.");
			}else {
				System.out.println(memId + "회원정보 수정 실패");
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}
	}
	
	private void insertMember() {
		boolean chk = false;
		String memId = "";
		
		do {
			System.out.println();
			System.out.println("추가할 회원 정보를 입력하세요.");
			System.out.print("회원 ID >> ");
			
			memId = scan.next();
			
			chk = checkMember(memId);
			
			if(chk == true) {
				System.out.println("회원 ID가 " + memId + "인 회원은 이미 존재합니다.");
				System.out.println("다시 입력해주세요.");
			}
		}while(chk == true);
		
		System.out.print("회원 이름 >> ");
		String memName = scan.next();
		
		System.out.print("회원 전화번호 >> ");
		String memTel = scan.next();
		
		scan.nextLine();
		System.out.print("회원 주소 >> ");
		String memAddr = scan.nextLine();
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "INSERT INTO MYMEMBER "
					+" (MEM_ID, MEM_NAME, MEM_TEL, MEM_ADDR)"
					+" VALUES(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memId);
			pstmt.setString(2, memName);
			pstmt.setString(3, memTel);
			pstmt.setString(4, memAddr);
			
			int cnt = pstmt.executeUpdate();
			
			if (cnt > 0) {
				System.out.println(memId + "회원 추가 작업 성공");
			}else {
				System.out.println(memId+"회원 추가 작업 실패");
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}
	}
	
	private boolean checkMember(String memId) {
		boolean chk = false;
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT COUNT(*) AS cnt FROM MYMEMBER WHERE MEM_ID = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			while(rs.next()) {
				cnt = rs.getInt("cnt");
			}
			
			if(cnt > 0) {
				chk = true;
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}
		return chk;
	}
	
	public static void main(String[] args) {
		MemberJDBC memObj = new MemberJDBC();
		memObj.start();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
			
}
