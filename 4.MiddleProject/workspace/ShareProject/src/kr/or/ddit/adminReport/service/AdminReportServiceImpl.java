package kr.or.ddit.adminReport.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.adminReport.dao.AdminReportDaoImpl;
import kr.or.ddit.adminReport.dao.IAdminReportDao;
import kr.or.ddit.adminReport.vo.AdminReportVO;
import kr.or.ddit.board.vo.PagingVO;

public class AdminReportServiceImpl implements IAdminReportService {

	private static IAdminReportService service;
	private IAdminReportDao dao;
	
	private AdminReportServiceImpl() {
		dao = AdminReportDaoImpl.getDao();
	}
	
	public static IAdminReportService GetService() {
		if(service == null) service = new AdminReportServiceImpl();
		return service;
	}

	@Override
	public List<AdminReportVO> groupByAllReport(PagingVO pv) {
		List<AdminReportVO> list = null;
		try {
			list = dao.groupByAllReport(pv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int reportSize() {
		int cnt = 0;
		try {
			cnt = dao.reportSize();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<AdminReportVO> reportcontent() {
		List<AdminReportVO> list = null;
		try {
			list = dao.reportcontent();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<AdminReportVO> boardcontent() {
		List<AdminReportVO> list = null;
		try {
			list = dao.boardcontent();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<AdminReportVO> clboardcontent() {
		List<AdminReportVO> list = null;
		try {
			list= dao.clboardcontent();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int boardblind(String adminboard_id) {
		int cnt = 0;
		try {
			cnt = dao.boardblind(adminboard_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int clboardblind(String adminboard_id) {
		int cnt = 0;
		try {
			cnt = dao.clboardblind(adminboard_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int blindchange(String adminboard_id) {
		int cnt = 0;
		try {
			cnt = dao.blindchange(adminboard_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

}
