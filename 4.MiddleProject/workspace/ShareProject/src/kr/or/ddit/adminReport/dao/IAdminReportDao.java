package kr.or.ddit.adminReport.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.adminReport.vo.AdminReportVO;
import kr.or.ddit.board.vo.PagingVO;

public interface IAdminReportDao {
	public List<AdminReportVO> groupByAllReport(PagingVO pv) throws SQLException;
	
	public int reportSize() throws SQLException;
	
	public List<AdminReportVO> reportcontent() throws SQLException;
	
	public List<AdminReportVO> boardcontent() throws SQLException;
	
	public List<AdminReportVO> clboardcontent() throws SQLException;
	
	public int boardblind(String adminboard_id) throws SQLException;
	
	public int clboardblind(String adminboard_id) throws SQLException;
	
	public int blindchange(String adminboard_id) throws SQLException;
}
