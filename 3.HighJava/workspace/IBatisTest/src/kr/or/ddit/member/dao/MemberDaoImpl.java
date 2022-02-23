package kr.or.ddit.member.dao;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.util.SqlMapClientPactory;

public class MemberDaoImpl implements IMemberDao {	
	
	private static SqlMapClient smc;
	
	
	private static IMemberDao memDao;
	
	private MemberDaoImpl() {
		smc =SqlMapClientPactory.getInstance();
	}
	
	public static IMemberDao getInstance() {
		if(memDao ==null) {
			memDao = new MemberDaoImpl();
		}
		
		return memDao;
	}
	
	
	
	@Override
	public int insertMember(MemberVO mv) {
		int cnt=0;
		
		try {
			cnt = smc.update("member.insertMember", mv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public boolean chkMember(String memId) {
	   
		boolean chk=false;
		
		int cnt = 0;
		
		
		try {	
			
			cnt= (int)smc.queryForObject("member.checkMember", memId);
			
			if(cnt>0) {
				chk=true;
			}
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
		return chk;
	}

	@Override
	public List<MemberVO> getAllMemberList() {
		
		List<MemberVO> memList = new ArrayList<MemberVO>();
		
		try {
			memList = smc.queryForList("member.selectAllMember");
			
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
		
		
		return memList;
	}

	@Override
	public int updateMember(MemberVO mv) {
		
		int cnt=0;
		
		try {
			cnt = smc.update("member.updateMember", mv);
			
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int deleteMember(String memId) {
		
		int cnt=0;
		
		try {
			
			cnt = smc.delete("member.deleteMember", memId);
			
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public List<MemberVO> getSearchMember(MemberVO mv) {
		
		List<MemberVO> memList = new ArrayList<>();
		
		try {
			
			memList = smc.queryForList("member.searchMember", mv);
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return memList;
	}

}
