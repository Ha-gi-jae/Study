package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import kr.or.ddit.board.vo.PagingVO;
import kr.or.ddit.member.vo.ClassVO;
import kr.or.ddit.member.vo.MemVO;
import kr.or.ddit.member.vo.MsgVO;

public interface IMemberDao {

	public MemVO idCheck(MemVO mv) throws SQLException;
	
	public int memLock(MemVO mv) throws SQLException;
	
	public int memReset(MemVO mv) throws SQLException;
	
	public int chkCheck(String mem_id) throws SQLException;
	
	public MemVO memAll(String mem_id) throws SQLException;
	
	public ClassVO memClass(String class_id) throws SQLException;
	
	public int updateMem(MemVO mv) throws SQLException;
	
	public List<MsgVO> msgList(String msg_from) throws SQLException;
	
	public int sendMsg(MsgVO mv) throws SQLException;
	
	
	public int deleteMsg(int msg_num) throws SQLException; 
	
	public MsgVO selectMsg(int msg_num) throws SQLException;
	
	//개인 이름조회
	public String memName(String mem_id) throws SQLException;
	
	//mem_group 조회
	public String memGroup(String mem_id) throws SQLException;
	
	
	
	//페이징처리
	
	public int msgSize(String msg_from) throws SQLException;
	
	public List<MsgVO> groupByAllMsg(PagingVO pv) throws SQLException;
	
}
