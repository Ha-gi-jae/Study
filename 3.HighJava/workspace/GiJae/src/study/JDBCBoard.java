package study;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.Scanner;

import kr.or.ddit.util.JDBCUtil;

public class JDBCBoard {
	Scanner scan = new Scanner(System.in);
	
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public static void main(String[] args) {

	}

	public void displayMenu() {
		System.out.println("------------------------------------------------------------");
		System.out.println("	1. 게시글 목록 출력");
		System.out.println("	2. 새    글    작    성");
		System.out.println("	3. 게  시  글   수  정");
		System.out.println("	4. 게  시  글   삭  제");
		System.out.println("	5. 게  시  글   검  색");
		System.out.println("	6. 나        가        기");
		System.out.println("------------------------------------------------------------");
	}

	public void start() {
		boolean flag = true;
		int choice;
		while (flag) {
			choice = scan.nextInt();
			switch (choice) {
			case 1:

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
				findBoard();
				break;

			case 6:
				System.out.println("작업을 마칩니다.");
				flag = false;
				break;
			default:
				System.out.println("잘못 입력하셨습니다. 다시 입력해주세요.");
			}
		}
	}

	private void findBoard() {
		
		System.out.println();
		System.out.println(" 검색하실 내용을 입력해 주세요. ");
		String search = scan.next();
		
		try {
			conn = JDBCUtil.getConnection();
			
			String sql = "select * from jdbc_board where ";
			
		} catch (SQLException ex) {
			ex.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}
		
	}

	private void updateBoard() {
		
		System.out.println();
		System.out.println(" 수정할 게시판 번호를 입력해주세요. ");
		System.out.print(" 게시글 번호>> ");
		String boardNo = scan.next();
		
		System.out.print(" 제목 >> ");
		String title = scan.next();
		System.out.print(" 내용 >> ");
		String content = scan.next();
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = " update jdbc_board "
					+ " set board_title = ? "
					+ "   , board_content = ? "
					+ "   , board_date = sysdate "
					+ "   , where board_no = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, boardNo);
			
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) {
				System.out.println(" 게시글 수정 완료 !!! ");
			}else {
				System.out.println(" 게시글 수정 실패... ");
			}
		}catch (SQLException ex) {
			System.out.println(" 게시글 수정 실패..... ");
			ex.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}
	}

	private void deleteBoard() {
		
		System.out.println();
		System.out.println(" 삭제할 게시글 번호를 입력해주세요. ");
		System.out.print(" 게시글 번호>> ");
		String boardNo = scan.next();
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = " delete jdbc_board where board_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardNo);
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt > 0) {
				System.out.println(" 게시글 삭제 성공!!! ");
			}else {
				System.out.println(" 게시글 삭제 실패... ");
			}
			
		} catch (SQLException ex) {
			System.out.println(" 게시글 삭제 실패..... ");
			ex.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}
		
	}

	private void insertBoard() {
		System.out.print(" 제목 입력>> ");
		String title = scan.next();
		System.out.print(" 작성자 입력>> ");
		String name = scan.next();
		
		scan.nextLine();
		System.out.print(" 내용 입력>> ");
		String content = scan.nextLine();
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = " insert into jdbc_board "
					+ " (board_no, board_title, board_writer, board_date, board_content) "
					+ " values (board_sqe.nextVal, ?, ?, sysdate, ? ) ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, name);
			pstmt.setString(3, content);
			
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) {
				System.out.println(" 게시글 작성 성공!!! ");
			}else {
				System.out.println(" 게시글 작성 실패... ");
			}
		} catch (SQLException ex) {
			System.out.println(" 게시글 작성 실패..... ");
			ex.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}
		

	}
}
