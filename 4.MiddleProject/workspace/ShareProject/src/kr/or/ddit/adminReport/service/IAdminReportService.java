package kr.or.ddit.adminReport.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.adminReport.vo.AdminReportVO;
import kr.or.ddit.board.vo.PagingVO;

public interface IAdminReportService {
	//페이징
	public List<AdminReportVO> groupByAllReport(PagingVO pv);
	
	public int reportSize();
	
	public List<AdminReportVO> reportcontent();
	
	public List<AdminReportVO> boardcontent();
	
	public List<AdminReportVO> clboardcontent();
	
	public int boardblind(String adminboard_id);
	
	public int clboardblind(String adminboard_id);
	
	public int blindchange(String adminboard_id);
}
