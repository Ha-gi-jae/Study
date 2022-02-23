package kr.or.ddit.adminReport.service;

import java.sql.SQLException;

import kr.or.ddit.adminReport.dao.IReportDao;
import kr.or.ddit.adminReport.dao.ReportDao;
import kr.or.ddit.adminReport.vo.ReportVO;

public class ReportService implements IReportService{
	private static IReportService reportService;
	private IReportDao reportdao;
	
	private ReportService() {
		reportdao = ReportDao.getInstance();
	}
	
	public static IReportService getInstance() {
		if(reportService == null) {
			reportService = new ReportService();
		}
		return reportService;
	}
	
	@Override
	public int insertReport(ReportVO vo) {
		int cnt = 0;
		try {
			cnt = reportdao.insertReport(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
}
