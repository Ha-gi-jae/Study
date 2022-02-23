package kr.or.ddit.basic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import kr.or.ddit.util.JDBCUtil;

public class HotelJDBC {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public static void main(String[] args) {
		new HotelJDBC().start();
	}
	
	private void start() {
		Scanner s = new Scanner(System.in);
		System.out.println("=========================");
		System.out.println("호텔 문을 열었습니다.");
		System.out.println("=========================");
		System.out.println();
		while(true) {
			System.out.println("=========================");
			System.out.println("어떤 업무를 하시겠습니까?");
			System.out.println("1.체크인\t2.체크아웃\t3.객실상태\t4.업무종료");
			System.out.print(">> ");
			int input = Integer.parseInt(s.nextLine());
			
			switch(input) {
			case 1:
				checkIn();
				break;
			case 2:
				checkOut();
				break;
			case 3:
				roomInfo();
				break;
			case 4:
				System.out.println("=========================");
				System.out.println("호텔 문을 닫았습니다.");
				System.out.println("=========================");
				System.exit(0);
				break;
			}
			
		}
	}
	
	private void roomInfo() {
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM HOTEL_MNG";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int room = rs.getInt("ROOM_NUM");
				String name = rs.getString("GUEST_NAME");
				System.out.println("방 번호: " + room + ", 투숙객: " + name);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}
	}
	
	private void checkOut() {
		Scanner s = new Scanner(System.in);
		System.out.println("어느방을 체크아웃 하시겠습니까? ");
		System.out.print("방 번호 입력 >> ");
		int room = Integer.parseInt(s.nextLine());
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "DELETE FROM HOTEL_MNG WHERE ROOM_NUM = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, room);
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) {
				System.out.println("체크아웃 되었습니다.");
			}else {
				System.out.println(room + "방에는 체크인한 사람이 없습니다.");
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}
	}
	
	private void checkIn() {
		boolean chk = false;
		Scanner s = new Scanner(System.in);
		System.out.println("어느방에 체크인 하시겠습니까?");
		System.out.print("방 번호 입력 >> ");
		int room = Integer.parseInt(s.nextLine());
		
		chk = checkRoom(room);
		if(chk == true) {
			System.out.println(room + "방에는 이미 사람이 있습니다.");
		}else {
			System.out.println("누구를 체크인 하시겠습니까?");
			System.out.print("이름 입력 >> ");
			String name = s.nextLine();
			try {
				conn = JDBCUtil.getConnection();
				String sql = "INSERT INTO HOTEL_MNG(ROOM_NUM, GUEST_NAME) VALUES(?,?)";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, room);
				pstmt.setString(2, name);
				
				int cnt = pstmt.executeUpdate();
				if(cnt > 0) {
					System.out.println("체크인 되었습니다.");
				}else {
					System.out.println("체크인 실패");
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.disConnect(conn, stmt, pstmt, rs);
			}
		}
	}
		
	private boolean checkRoom(int room) {
		boolean chk = false;
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT COUNT(*) AS CNT FROM HOTEL_MNG WHERE ROOM_NUM = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, room);
			rs = pstmt.executeQuery();
			
			int cnt = 0;
			while(rs.next()) {
				cnt = rs.getInt("CNT");
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
}
