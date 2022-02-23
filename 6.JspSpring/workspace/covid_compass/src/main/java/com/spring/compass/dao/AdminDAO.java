package com.spring.compass.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.compass.command.SearchCriteria;
import com.spring.compass.command.SearchCriteriaGeon;
import com.spring.compass.vo.AttachVO;
import com.spring.compass.vo.HsptVO;
import com.spring.compass.vo.InspVO;
import com.spring.compass.vo.InstVO;
import com.spring.compass.vo.LtctVO;
import com.spring.compass.vo.MberVO;
import com.spring.compass.vo.NoticeVO;
import com.spring.compass.vo.PbhtVO;
import com.spring.compass.vo.PstiVO;

public interface AdminDAO {
	
	public MberVO selectMeberDetailByMberId(String mberId) throws SQLException;
	
	public List<InspVO> selectAllInsp(SearchCriteriaGeon cri) throws SQLException;
	
	public List<PbhtVO> selectAllPbht(SearchCriteriaGeon cri) throws SQLException;
	
	public List<HsptVO> selectAllHspt(SearchCriteriaGeon cri) throws SQLException;
	
	public List<LtctVO> selectAllLtct(SearchCriteriaGeon cri) throws SQLException;
	
	public int selectInspTotalCount(SearchCriteriaGeon cri) throws SQLException;
	public int selectPbhtTotalCount(SearchCriteriaGeon cri) throws SQLException;
	public int selectHsptTotalCount(SearchCriteriaGeon cri) throws SQLException;
	public int selectLtctTotalCount(SearchCriteriaGeon cri) throws SQLException;
	
	public int selectAllInstCount(SearchCriteriaGeon cri) throws SQLException;
	
	public List<InstVO> selectAllInst(SearchCriteriaGeon cri) throws SQLException;
	
	public void insertInst(InstVO inst) throws SQLException;
	
	public InstVO selectInstDetail(String instNo) throws SQLException;
	
	public List<MberVO> selectMeberByInstNo(String instNo) throws SQLException;
	
	public int updateInst(InstVO inst) throws SQLException;
	
	public String selectChildNoByInstNo(String instNo) throws SQLException;
	
	public int deleteMemberByInstNo(String instNo) throws SQLException;
	
	public int deleteInspByInspNo(String inspNo) throws SQLException;
	
	public int deletePbhtByPbhtNo(String pbhtNo) throws SQLException;
	
	public int deleteHsptByHsptNo(String hsptNo) throws SQLException;
	
	public int deleteLtctByLtctNo(String ltctNo) throws SQLException;
	
	public int deleteInstByInstNo(String instNo) throws SQLException;
	
	public int deleteInspByPbhtNo(String pbhtNo) throws SQLException;
	
	public String selectNoticeSeq() throws SQLException;
	
	public int registNotice(NoticeVO notice) throws SQLException;
	
	public String selectAttchSeq() throws SQLException;
	
	public int registAttach(AttachVO attach) throws SQLException;
	
	public List<NoticeVO> selectAllNotice(SearchCriteria cri) throws SQLException;
	
	public int selectSearchNoticeListCount(SearchCriteria cri) throws SQLException;
	
	public NoticeVO selectNoticeByNoticeNo(String noticeNo) throws SQLException;
	
	public AttachVO selectAttachByNoticeNo(String noticeNo) throws SQLException;
	
	public void removeAttachByAtchNo(String atchNo) throws SQLException;
	
	public void removeNoticeByNoticeNo(String noticeNo) throws SQLException;
	
	public void noticeModify(NoticeVO notice) throws SQLException;
	
	public void attachModify(AttachVO attach) throws SQLException;
	
	public void deleteAttachByFileName(String fileName) throws SQLException;
	
	public String selectInstNoByMberNo(String mberNo) throws SQLException;
	
	public String selectInstTelNoByInstNo(String instNo) throws SQLException;
	
	public int updatePasswordMber(MberVO mber) throws SQLException;
	
	public MberVO detailMberByMberNo(String mberNo) throws SQLException;

	public void deleteInspStatsByInspNo(String inspNo) throws SQLException;
	
	public void deletePbhtStatsByPbhtNo(String pbhtNo) throws SQLException;
	
	public void deleteHsptStatsByHsptNo(String hsptNo) throws SQLException;
	
	public void deleteLtctStatsByLtctNo(String ltctNo) throws SQLException;
	
	public List<String> selectInspNoByPbhtNo(String pbhtNo) throws SQLException;
	
	public String selectInstNoByInspNo(String inspNo) throws SQLException;
	
	public String selectPstiNoByInspNo(String inspNo) throws SQLException;
	
	public void deleteHtscByPstiNo(String pstiNo) throws SQLException;
	
	public void deletePstiByInspNo(String inspNo) throws SQLException;
	
	public void deleteInspEmpByInspNo(String inspNo) throws SQLException;
	
	public void deleteSmplByPbhtNo(String pbhtNo) throws SQLException;
	
	public void deleteCnfmByPbhtNo(String pbhtNo) throws SQLException;
	
	public void deleteSlfptntByPbhtNo(String pbhtNo) throws SQLException;
	
	public void deletePbhtEmp(String pbhtNo) throws SQLException;
	
	public void deleteHsptEmpByHsptNo(String hsptNo) throws SQLException;
	
	public void deleteInptntByHsptNo(String hsptNo) throws SQLException;
	
	public void deleteDgnssByHsptNo(String hsptNo) throws SQLException;
	
	public void deleteIsoptntByLtctNo(String ltctNo) throws SQLException;
	
	public void deleteLtctEmpByLtctNo(String ltctNo) throws SQLException;
	
	public List<PstiVO> selectPstiBackupList() throws SQLException;
	
	public List<NoticeVO> selectAllNoticeByInstNo(SearchCriteria cri) throws SQLException;
	
	public int selectSearchNoticeListByInstNoCount(SearchCriteria cri) throws SQLException;
	
	public void noticeModifyByInst(NoticeVO notice) throws SQLException;
	
	public void registNoticeAdmin(NoticeVO notice) throws SQLException;
	
	public List<NoticeVO> selectPopupNotice() throws SQLException;
	
	public String selectPbhtNoByInstNm(String instNm) throws SQLException;
	
	public void deleteAttachByMberNo(String mberNo) throws SQLException;
	
	public AttachVO selectAttachByMberNo(String mberNo) throws SQLException;
}




