package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class BoardDaoImpl implements IBoardDao {

	private static IBoardDao dao;
	
	public BoardDaoImpl() {
		
	}
	
	public static IBoardDao GetDao() {
		if(dao == null) dao = new BoardDaoImpl();
		
		return dao;
	}
	
	private SqlMapClient client = SqlMapClientFactory.getInstance();

	@Override
	public int insertBoard(BoardVO bv) {
		int cnt = 0;
		try {
			BoardVO vo = (BoardVO) client.insert("boardTest.insertBoard", bv);
			if(vo == null) {
				cnt++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateBoard(BoardVO bv) {
		int cnt = 0;
		try {
			cnt = client.update("boardTest.updateBoard", bv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteBoard(int num) {
		int cnt = 0;
		try {
			cnt = client.update("boardTest.deleteBoard", num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<BoardVO> displayAllBoard() {
		List<BoardVO> list = null;
		
		try {
			list = client.queryForList("boardTest.displayAllBoard");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BoardVO selectBoard(BoardVO bv) {
		BoardVO vo = null;
		try {
			vo = (BoardVO) client.queryForObject("boardTest.selectBoard", bv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public BoardVO searchBoard(int num) {
		BoardVO vo = null;
		try {
			vo = (BoardVO) client.queryForObject("boardTest.searchBoard", num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
}
