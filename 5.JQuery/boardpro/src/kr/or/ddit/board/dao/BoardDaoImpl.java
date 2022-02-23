package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.ReplyVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class BoardDaoImpl implements IBoardDao {
	
	private SqlMapClient client;
	private static IBoardDao dao;
	
	public BoardDaoImpl() {
		this.client = SqlMapClientFactory.getInstance();
	}
	
	public static IBoardDao getDao() {
		if(dao == null) dao = new BoardDaoImpl();
		return dao;
	}
	
	@Override
	public List<BoardVO> selectAll() throws SQLException {
		
		return client.queryForList("board.selectAll");
	}

	@Override
	public List<BoardVO> selectByPage(Map<String, Integer> map) throws SQLException {
		
		return client.queryForList("board.selectByPage", map);
	}

	@Override
	public int listCount() throws SQLException {
		
		return (Integer) client.queryForObject("board.listCount");
	}

	@Override
	public int insertBoard(BoardVO vo) throws SQLException {
		
		return (Integer) client.insert("board.insertBoard", vo);
	}

	@Override
	public int insertReply(ReplyVO vo) throws SQLException {
		
		return  (Integer) client.insert("reply.insertReply", vo);
	}

	@Override
	public List<ReplyVO> selectReply(int bonum) throws SQLException {
		
		return client.queryForList("reply.selectReply", bonum);
	}

	@Override
	public int deleteReply(int renum) throws SQLException {
		return client.delete("reply.deleteReply", renum);
	}

	@Override
	public int updateReply(ReplyVO vo) throws SQLException {
		
		return client.update("reply.updateReply", vo);
	}

	@Override
	public int updateHit(int num) throws SQLException {
		
		return client.update("board.updateHit", num);
	}

	@Override
	public int deleteBoard(int num) throws SQLException {
		
		return client.delete("board.deleteBoard", num);
	}

	@Override
	public int updateBoard(BoardVO vo) throws SQLException {
		
		return client.update("board.updateBoard", vo);
	}

	
	
	
}
