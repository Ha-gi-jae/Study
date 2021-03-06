package kr.or.ddit.cal.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;


import kr.or.ddit.cal.vo.CalVO;
import kr.or.ddit.cal.vo.TtVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class CalDaoImpl implements ICalDao{

	private SqlMapClient smc;
	private static ICalDao dao;
	
	private CalDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static ICalDao getInstance() {
		if(dao == null) {
			dao = new CalDaoImpl();
		}
		return dao;
	}
	
	@Override
	public List<CalVO> calenList() throws SQLException {
		return smc.queryForList("itt.selectItt");
	}

	@Override
	public List<CalVO> calenListDetail(String day) throws SQLException {
		return smc.queryForList("itt.selectIttDetail", day);
	}

	@Override
	public List<TtVO> selectTt() throws SQLException {
		return smc.queryForList("itt.selectTt");
	}

	@Override
	public int calInsert(CalVO vo) throws SQLException  {
		return (Integer) smc.insert("itt.insertItt", vo);
	}

	@Override
	public int calDelete(int id) throws SQLException {
		return smc.delete("itt.calDelete", id);
	}

	@Override
	public int calUpdate(CalVO vo) throws SQLException {
		return smc.update("itt.calUpdate",vo);
	}

	@Override
	public int ttInsert(TtVO vo) throws SQLException {
		return (Integer) smc.insert("itt.insertTt", vo);
	}

	@Override
	public int ttDelete(int id) throws SQLException {

		return smc.delete("itt.ttDelete", id);
	}

	@Override
	public int ttUpdate(TtVO vo) throws SQLException {
		
		return smc.update("itt.ttUpdate", vo);
	}

	@Override
	public int ttIdSelect(TtVO vo) throws SQLException {
		
		return (int) smc.queryForObject("itt.selectTtId", vo);
	}

	@Override
	public String mem_group(String mem_id) throws SQLException {
		
		return (String) smc.queryForObject("itt.selectMemGroup", mem_id);
	}
}
