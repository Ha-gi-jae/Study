package kr.or.ddit.clboard.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.clboard.vo.PagingVO;
import kr.or.ddit.clboard.vo.ClBoardVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class BoardDaoImpl implements IBoardDao {
	private static IBoardDao dao;
	private SqlMapClient smc;

	private BoardDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}

	public static IBoardDao getInstance() {
		if (dao == null)
			dao = new BoardDaoImpl();
		return dao;
	}

	@Override
	public int selectTotalCnt(String group) throws SQLException {
		return (int) smc.queryForObject("clBoard.selectTotalCnt", group);
	}

	@Override
	public List<ClBoardVO> groupByAllBoard(PagingVO pv) throws SQLException {
		return smc.queryForList("clBoard.groupByAllBoard", pv);
	}

	@Override
	public String getBoardTitle(String group) throws SQLException {
		return (String) smc.queryForObject("clBoard.getBoardTitle", group);
	}

	@Override
	public ClBoardVO selectBoard(int adminboard_id) throws SQLException {
		return (ClBoardVO) smc.queryForObject("clBoard.selectBoard", adminboard_id);
	}

	@Override
	public int InsertBoard(ClBoardVO bv) throws SQLException {
		return (int) smc.insert("clBoard.insertBoard", bv);
	}

	@Override
	public int updateBoard(ClBoardVO bv) throws SQLException {
		return smc.update("clBoard.updateBoard", bv);
	}

	@Override
	public int deleteBoard(int adminboard_id) throws SQLException {
		return smc.delete("clBoard.deleteBoard", adminboard_id);
	}

	@Override
	public String getClassEndDate(String mem_id) throws SQLException {
		return (String) smc.queryForObject("clBoard.getClassEndDate", mem_id);
	}

	@Override
	public int countView(int adminboard_id) throws SQLException {
		return (int) smc.update("clBoard.countView", adminboard_id);
	}

	@Override
	public String selectClassId(String mem_id) throws SQLException {
		return (String) smc.queryForObject("clBoard.memClassId", mem_id);
	}

	@Override
	public List<ClBoardVO> findClTitle(PagingVO pv) throws SQLException {
		
		return smc.queryForList("clBoard.findClTitle", pv);
	}

	@Override
	public int findCltitleCount(String clboard_title) throws SQLException {
		return (int) smc.queryForObject("clBoard.findCltitleCount", clboard_title);
	}

	@Override
	public List<ClBoardVO> findClContent(PagingVO pv) throws SQLException {
		return smc.queryForList("clBoard.findClContent", pv);
	}

	@Override
	public int findclcontentCount(String clboard_content) throws SQLException {
		return (int) smc.queryForObject("clBoard.findclcontentCount", clboard_content);
	}
	
	

}
