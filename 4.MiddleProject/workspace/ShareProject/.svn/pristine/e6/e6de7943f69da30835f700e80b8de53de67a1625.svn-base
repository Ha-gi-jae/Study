package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.board.vo.PagingVO;
import kr.or.ddit.member.vo.ClassVO;
import kr.or.ddit.member.vo.MemVO;
import kr.or.ddit.member.vo.MsgVO;

public interface IMemberService {

	public MemVO idCheck(MemVO mv); 
	
	public int memLock(MemVO mv);
	
	public int memReset(MemVO mv);
	
	public int chkCheck(String mem_id);
	
	public MemVO memAll(String mem_id);
	
	public ClassVO memClass(String class_id);
	
	public int updateMem(MemVO mv);
	
	public List<MsgVO> msgList(String msg_from);
	
	public int senMsg(MsgVO mv);
	
	
	public int deleteMsg(int msg_num);
	
	public MsgVO selectMsg(int msg_num);
	
	public String memName(String mem_id);
	
	//mem_group 조회
	public String memGroup(String mem_id);
	
	//페이징 처리
	
	public int msgSize(String msg_from);
	
	public List<MsgVO> groupByAllMsg(PagingVO pv);
}
