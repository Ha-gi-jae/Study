package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.board.vo.PagingVO;
import kr.or.ddit.member.vo.ClassVO;
import kr.or.ddit.member.vo.MemVO;
import kr.or.ddit.member.vo.MsgVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class MemberDaoImpl implements IMemberDao{
	
   private static IMemberDao dao;
	
	private SqlMapClient smc;
	
	private MemberDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IMemberDao getInstance() {
		if(dao == null) {
			dao = new MemberDaoImpl();
		}
		
		return dao;
	}
	
	
	@Override
	public MemVO idCheck(MemVO mv) throws SQLException {
		return  (MemVO) smc.queryForObject("member.idCheck", mv);
	}

	@Override
	public int memLock(MemVO mv) throws SQLException {
		return smc.update("member.memLock", mv);
	}

	@Override
	public int chkCheck(String mem_id) throws SQLException {
		return (int) smc.queryForObject("member.chkCheck", mem_id);
	}

	@Override
	public MemVO memAll(String mem_id) throws SQLException {
		return (MemVO) smc.queryForObject("member.memAll", mem_id);
	}

	@Override
	public ClassVO memClass(String class_id) throws SQLException {
		return  (ClassVO) smc.queryForObject("member.memClass", class_id);
	}

	@Override
	public int updateMem(MemVO mv) throws SQLException {
		return smc.update("member.updateMem", mv);
	}

	@Override
	public List<MsgVO> msgList(String msg_from) throws SQLException {
		
		return smc.queryForList("msg.msgList", msg_from);
	}

	@Override
	public int sendMsg(MsgVO mv) throws SQLException {
		return smc.update("msg.sendMsg", mv);
	}

	

	@Override
	public int deleteMsg(int msg_num) throws SQLException {
		return smc.delete("msg.deleteMsg", msg_num);
	}

	@Override
	public MsgVO selectMsg(int msg_num) throws SQLException {
		return (MsgVO) smc.queryForObject("msg.selectMsg", msg_num);
	}

	@Override
	public int memReset(MemVO mv) throws SQLException {
		return smc.update("member.memReset", mv);
	}

	@Override
	public int msgSize(String msg_from) throws SQLException {
		return (int) smc.queryForObject("msg.msgSize", msg_from);
	}

	@Override
	public List<MsgVO> groupByAllMsg(PagingVO pv) throws SQLException {
		return smc.queryForList("msg.groupByAllMsg", pv);
	}

	@Override
	public String memName(String mem_id) throws SQLException {
		
		return (String) smc.queryForObject("member.memName", mem_id);
	}

	@Override
	public String memGroup(String mem_id) throws SQLException {
		return (String) smc.queryForObject("member.memGroup", mem_id);
	}

	
}
