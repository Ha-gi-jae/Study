package kr.or.ddit.adminReport.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.adminReport.vo.ReportVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class ReportDao implements IReportDao{
	private SqlMapClient smc;
	private static IReportDao reportDao;
	
	private ReportDao() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IReportDao getInstance() {
		if(reportDao == null) {
			reportDao = new ReportDao();
		}
		return reportDao;
	}

	@Override
	public int insertReport(ReportVO vo) throws SQLException {
		int cnt = 0;
		
		ReportVO reportVo = (ReportVO) smc.insert("report.insertReport", vo);
		
		if(reportVo == null) {
			cnt = 1;
		}
		return cnt;
	}
	
}
