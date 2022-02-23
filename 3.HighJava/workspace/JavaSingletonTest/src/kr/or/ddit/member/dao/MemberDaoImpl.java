package kr.or.ddit.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.util.JDBCUtil;
import kr.or.ddit.util.JDBCUtil3;

public class MemberDaoImpl implements IMemberDao {	
	
	private static IMemberDao memDao;
	
	private MemberDaoImpl() {
		
	}
	
	public static IMemberDao getInstance() {
		if(memDao ==null) {
			memDao = new MemberDaoImpl();
		}
		
		return memDao;
	}
	
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	@Override
	public int insertMember(MemberVO mv) {
		int cnt=0;
		try {
			conn = JDBCUtil.getConnection();
			String sql ="INSERT INTO MYMEMBER" 
		 	       + "(MEM_ID, MEM_NAME, MEM_TEL, MEM_ADDR)"  
				   + "VALUES(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mv.getMemId());
			pstmt.setString(2, mv.getMemName());
			pstmt.setString(3, mv.getMemTel());
			pstmt.setString(4, mv.getMemAddr());
			
			cnt=pstmt.executeUpdate();
			
		}catch(SQLException ex) {
			ex.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);			
		}
		return cnt;
	}

	@Override
	public boolean chkMember(String memId) {
	   
		boolean chk=false;
		
		try {	
			conn = JDBCUtil.getConnection();
			String sql="select count(*) as cnt from mymember"
					   + " where mem_id = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			
			rs=pstmt.executeQuery();
			
			int cnt=0;
			while(rs.next()) {
				cnt=rs.getInt("cnt");
			}
			
			if(cnt>0) {
				chk=true;
			}
		}catch(SQLException ex) {
			ex.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}
		
		return chk;
	}

	@Override
	public List<MemberVO> getAllMemberList() {
		
		List<MemberVO> memList = new ArrayList<MemberVO>();
		
		try {
			conn = JDBCUtil3.getConnection();
			String sql ="SELECT * FROM MYMEMBER";
			
			stmt = conn.createStatement();
						
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				String memId = rs.getString("mem_id");
				String memName = rs.getString("mem_name");
				String memTel = rs.getString("mem_tel");
				String memAddr = rs.getString("mem_addr");
				
				MemberVO mv = new MemberVO();
				mv.setMemId(memId);
				mv.setMemName(memName);
				mv.setMemTel(memTel);
				mv.setMemAddr(memAddr);
				
				memList.add(mv);
			}
			
		}catch(SQLException ex) {
			ex.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}
		
		
		return memList;
	}

	@Override
	public int updateMember(MemberVO mv) {
		
		int cnt=0;
		
		try {
			conn =JDBCUtil.getConnection();
			String sql=" update mymember " 
					+ " set mem_name= ? "  
					+ " ,mem_tel= ? "  
					+ " ,mem_addr= ? "  
					+ " where mem_id = ?" ;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mv.getMemName());
			pstmt.setString(2, mv.getMemTel());
			pstmt.setString(3, mv.getMemAddr());
			pstmt.setString(4, mv.getMemId());
			
			cnt =pstmt.executeUpdate();
			
		}catch(SQLException ex) {
			ex.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}
		
		return cnt;
	}

	@Override
	public int deleteMember(String memId) {
		
		int cnt=0;
		
		try {
			conn=JDBCUtil.getConnection();
			
			String sql="DELETE FROM MYMEMBER WHERE MEM_ID= ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			
			cnt=pstmt.executeUpdate();
			
		}catch(SQLException ex) {
			ex.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}
		
		return cnt;
	}

	@Override
	public List<MemberVO> getSearchMember(MemberVO mv) {
		
		List<MemberVO> memList = new ArrayList<>();
		
		try {
			conn=JDBCUtil.getConnection();
			
			//1=1를 붙인순간 그다음부터는 AND를 무조건 넣어야 한다.(뒤에 AND를 넣어야 할지 말아야할지
			//신경쓰지 않아도 된다.)
			String sql ="SELECT * FROM MYMEMBER WHERE 1=1";
			
			//아이디 값이 있는 경우 체크
			//null도아니고 빈값도 아닐때(null이 먼저 체크되어야 한다.)
			if(mv.getMemId() !=null&&!mv.getMemId().equals("")) {
				//기존 sql에서 누적
				sql+=" AND MEM_ID= ? ";
			}
			if(mv.getMemName() !=null&&!mv.getMemName().equals("")) {
				//기존 sql에서 누적
				sql+=" AND MEM_NAME= ? ";
			}
			if(mv.getMemTel() !=null&&!mv.getMemTel().equals("")) {
				//기존 sql에서 누적
				sql+=" AND MEM_Tel= ? ";
			}
			if(mv.getMemAddr() !=null&&!mv.getMemAddr().equals("")) {
				//기존 sql에서 누적
				//해당 단어만 들어가면 검색될 수 있게 LIKE사용
				sql+=" AND MEM_ADDR LIKE '%' || ? || '%' ";
			}
			
			pstmt = conn.prepareStatement(sql);
			
			//index값(?위치)을 사용하기 위해서 변수 선언
			int index=1;
			
			if(mv.getMemId() !=null&&!mv.getMemId().equals("")) {
				//후위연산자로 index값 누적
				pstmt.setString(index++, mv.getMemId());
			}
			
			if(mv.getMemName() !=null&&!mv.getMemName().equals("")) {
				//후위연산자로 index값 누적
				pstmt.setString(index++, mv.getMemName());
			}
			
			if(mv.getMemTel() !=null&&!mv.getMemTel().equals("")) {
				//후위연산자로 index값 누적
				pstmt.setString(index++, mv.getMemTel());
			}
			
			if(mv.getMemAddr() !=null&&!mv.getMemAddr().equals("")) {
				//후위연산자로 index값 누적
				pstmt.setString(index++, mv.getMemAddr());
			}
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				MemberVO mv2 = new MemberVO();
				
				mv2.setMemId(rs.getString("mem_id"));
				mv2.setMemName(rs.getString("mem_name"));
				mv2.setMemTel(rs.getString("mem_tel"));
				mv2.setMemAddr(rs.getString("mem_addr"));
				
				memList.add(mv2);
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.disConnect(conn, stmt, pstmt, rs);
		}
		
		
		
		return memList;
	}

}
