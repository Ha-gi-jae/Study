package kr.or.ddit.basic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

import kr.or.ddit.util.JDBCUtil;

public class BoardJDBC {
	
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Scanner s = new Scanner(System.in);
	
	public static void main(String[] args) {
		new BoardJDBC().start();
	}
	
	public void displayMenu() {
		System.out.println("-----------------게시판-----------------");
		System.out.println("1. 전체 목록 출력\t2. 새  글 작성\t3. 수정\t4. 삭제\t5. 검색\t0. 종료");
		System.out.print(">> ");
	}
	
	public void start() {
		while(true) {
			displayMenu();
			int input = Integer.parseInt(s.nextLine());
			switch(input) {
			case 1:
				boardInfo();
				break;
			case 2:
				boardInput();
				break;
			case 3:
				boardUpdate();
				break;
			case 4:
				boardDelete();
				break;
			case 5:
				boardSelect();
				break;
			case 0:
				System.out.println("프로그램을 종료합니다.");
				System.exit(0);
			}
		}
	}
	
	private void boardSelect() {
		boardInfo();
		System.out.println("조회하실 게시글 번호를 입력해주세요.");
		System.out.print(">> ");
		
		int num = Integer.parseInt(s.nextLine());
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM JDBC_BOARD WHERE BOARD_NO = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int boardnum = rs.getInt("BOARD_NO");
				String title = rs.getString("BOARD_TITLE");
				String content = rs.getString("BOARD_CONTENT");
				String user = rs.getString("BOARD_WRITER");
				Date date = rs.getDate("BOARD_DATE");
				
				System.out.println("게시글 번호: " + boardnum + "번");
				System.out.println("제목: " + title);
				System.out.println("내용: " + content);
				System.out.println("작성자: " + user);
				System.out.println("작성일자: " + date);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}
	}
	
	private void boardDelete() {
		boardInfo();
		System.out.println("삭제할 게시글 번호를 입력해주세요.");
		System.out.print(">> ");
		
		int num = Integer.parseInt(s.nextLine());
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "DELETE FROM JDBC_BOARD WHERE BOARD_NO = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) {
				System.out.println("삭제 성공");
			}else {
				System.out.println("삭제 실패");
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}
	}
	
	private void boardUpdate() {
		boardInfo();
		System.out.println("수정할 게시글 번호를 입력해주세요.");
		System.out.print(">> ");
		int num = Integer.parseInt(s.nextLine());
		System.out.println("-------------------------");
		System.out.println("게시글 제목을 입력해주세요.");
		System.out.print(">> ");
		String title = s.nextLine();
		
		System.out.println("게시글 내용을 입력해주세요.");
		System.out.print(">> ");
		String content = s.nextLine();
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "UPDATE JDBC_BOARD SET BOARD_TITLE = ?, BOARD_DATE = SYSDATE, BOARD_CONTENT = ? WHERE BOARD_NO = "+ num;
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) {
				System.out.println("수정 성공");
			}else {
				System.out.println("수정 실패");
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}
	}
	
	private void boardInfo() {
		SimpleDateFormat st = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("--------------------------------------------------------------");
		System.out.println("1.번호\t2.제목\t3.작성자\t4.작성일자");
		System.out.println("--------------------------------------------------------------");
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM JDBC_BOARD";
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int num = rs.getInt("BOARD_NO");
				String title = rs.getString("BOARD_TITLE");
				String user = rs.getString("BOARD_WRITER");
				Date date = rs.getDate("BOARD_DATE");
				
				System.out.println(num + "\t" + title + "\t" + user + "\t" + st.format(date));
			}
			System.out.println("---------------------------------------------------------");
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}
	}
	
	private void boardInput() {
		System.out.println("게시글 제목을 입력해주세요.");
		System.out.print(">> ");
		String title = s.nextLine();
		
		System.out.println("게시글 작성자를 입력해주세요.");
		System.out.print(">> ");
		String user = s.nextLine();
		
		System.out.println("게시글 내용을 입력해주세요.");
		System.out.print(">> ");
		String content = s.nextLine();
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "INSERT INTO JDBC BOARD(BAORD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_DATE,BAORD_CONTENT) VALUES(BOARD_SEQ.NEXTVAL,?,?,SYSDATE,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, user);
			pstmt.setString(3, content);
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt > 0) {
				System.out.println("등록 성공");
			}else {
				System.out.println("등록 실패");
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}
	}
}
