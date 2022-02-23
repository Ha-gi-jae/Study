package kr.or.ddit.main.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.NoticeVO;
import kr.or.ddit.clboard.vo.ClBoardVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class MiniDao implements IMiniDao{

	private SqlMapClient smc;
	private static IMiniDao dao;
	
	private MiniDao() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IMiniDao getInstance() {
		if(dao == null) {
			dao = new MiniDao();
		}
		return dao;
	}
	
	@Override
	public List<NoticeVO> notiMini() throws SQLException {
		
		return smc.queryForList("main.notiMini");
	}

	@Override
	public List<BoardVO> freeMini() throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("main.freeMini");
	}

	@Override
	public List<ClBoardVO> clFreeMini() throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("main.clFreeMini");
	}

	@Override
	public List<ClBoardVO> clNotiMini() throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("main.clNotiMini");
	}

	@Override
	public List<ClBoardVO> clQnaMini() throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("main.clQnaMini");
	}

}
