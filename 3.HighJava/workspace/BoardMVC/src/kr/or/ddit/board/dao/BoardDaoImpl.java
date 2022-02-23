package kr.or.ddit.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.List;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.util.JDBCUtil;

public class BoardDaoImpl implements IBoardDao {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	private static IBoardDao dao;
	
	private BoardDaoImpl() {
		
	}
	
	public static IBoardDao getDao() {
		if(dao == null) dao = new BoardDaoImpl();
		return dao;
	}

	@Override
	public int insertBaord(BoardVO vo) {
		int result = 0;
		try {
			conn = JDBCUtil.getConnection();
			String sql = "INSERT INTO JDBC_BOARD(BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_DATE,BOARD_CONTENT) VALUES(BOARD_SEQ.NEXTVAL,?,?,SYSDATE,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getContent());
			
			result = pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}
		return result;
	}

	@Override
	public int updateBoard(int num, BoardVO vo) {
		int result = 0;
		try {
			conn = JDBCUtil.getConnection();
			String sql = "UPDATE JDBC_BOARD SET BOARD_TITLE = ?, BOARD_CONTENT = ?, BOARD_DATE = SYSDATE WHERE BOARD_NO = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, num);
			
			result = pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}
		return result;
	}

	@Override
	public int deleteBoard(int num) {
		int result = 0;
		try {
			conn = JDBCUtil.getConnection();
			String sql = "DELETE FROM JDBC_BOARD WHERE BOARD_NO = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}
		return result;
	}

	@Override
	public List<BoardVO> displayAllBoard() {
		List<BoardVO> list = null;
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM JDBC_BOARD";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("BOARD_NO");
				String title = rs.getString("BOARD_TITLE");
				String content = rs.getString("BOARD_CONTENT");
				String writer = rs.getString("BOARD_WRITER");
				Date day = rs.getDate("BOARD_DATE");
				
				BoardVO vo = new BoardVO();
				vo.setNum(num);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setWriter(writer);
				vo.setDay(day);
				list.add(vo);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}
		
		return list;
	}

	@Override
	public BoardVO checkBoard(BoardVO vo) {
		int cnt = 0;
		
		try {
			conn = JDBCUtil.getConnection();
			String sql="SELECT * FROM JDBC_BOARD WHERE 1 = 1";
			
			if(vo.getTitle() != null && vo.getTitle().equals("")) {
				sql +=" AND BOARD_TITLE LIKE '%' || ? || '%'";
			}
			if(vo.getContent() != null && vo.getContent().equals("")) {
				sql +=" AND BOARD_CONTENT LIKE '%' || ? || '%'";
			}
			if(vo.getWriter() != null && vo.getWriter().equals("")) {
				sql +=" AND BOARD_WRITER LIKE '%' || ? || '%'";
			}
			
			pstmt = conn.prepareStatement(sql);
			
			int index = 1;
			if(vo.getTitle() != null && vo.getTitle().equals("")) {
				pstmt.setString(index++, vo.getTitle());
			}
			if(vo.getContent() != null && vo.getContent().equals("")) {
				pstmt.setString(index++, vo.getContent());
			}
			if(vo.getWriter() != null && vo.getWriter().equals("")) {
				pstmt.setString(index++, vo.getWriter());
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				cnt++;
				vo.setNum(rs.getInt("BOARD_NO"));
				vo.setTitle(rs.getString("BOARD_TITLE"));
				vo.setContent(rs.getString("BOARD_CONTENT"));
				vo.setWriter(rs.getString("BOARD_WRITER"));
				vo.setDay(rs.getDate("BOARD_DATE"));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}
		if(cnt == 0) {
			vo = null;
		}
		
		return vo;
	}
	
	
}
