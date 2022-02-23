package kr.or.ddit.adminReport.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.adminReport.vo.AdminReportVO;
import kr.or.ddit.board.vo.PagingVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class AdminReportDaoImpl implements IAdminReportDao {
	
	private SqlMapClient client;
	private static IAdminReportDao dao;
	
	public AdminReportDaoImpl() {
		this.client = SqlMapClientFactory.getInstance();
	}
	
	public static IAdminReportDao getDao() {
		if(dao == null) dao = new AdminReportDaoImpl();
		return dao;
	}

	@Override
	public List<AdminReportVO> groupByAllReport(PagingVO pv) throws SQLException {
		return client.queryForList("adminreport.groupByAllReport", pv);
	}

	@Override
	public int reportSize() throws SQLException {
		return (int) client.queryForObject("adminreport.reportSize");
	}

	@Override
	public List<AdminReportVO> reportcontent() throws SQLException {
		return client.queryForList("adminreport.reportcontent");
	}

	@Override
	public List<AdminReportVO> boardcontent() throws SQLException {
		return client.queryForList("adminreport.boardcontent");
	}

	@Override
	public List<AdminReportVO> clboardcontent() throws SQLException {
		return client.queryForList("adminreport.clboardcontent");
	}

	@Override
	public int boardblind(String adminboard_id) throws SQLException {
		return client.update("adminreport.boardblind", adminboard_id);
	}

	@Override
	public int clboardblind(String adminboard_id) throws SQLException {
		return client.update("adminreport.clboardblind", adminboard_id);
	}

	@Override
	public int blindchange(String adminboard_id) throws SQLException {
		return client.update("adminreport.blindchange", adminboard_id);
	}
}
