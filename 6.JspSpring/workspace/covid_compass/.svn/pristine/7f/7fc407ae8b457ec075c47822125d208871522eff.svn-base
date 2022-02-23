package com.spring.compass.service;

import java.util.List;
import java.util.Map;

import com.spring.compass.command.SearchCriteria;
import com.spring.compass.command.SearchCriteriaGeon;
import com.spring.compass.vo.AttachVO;
import com.spring.compass.vo.InstVO;
import com.spring.compass.vo.LtctStatsVO;
import com.spring.compass.vo.MberVO;
import com.spring.compass.vo.NoticeVO;
import com.spring.compass.vo.PstiVO;

public interface AdminService {
	
	
	
	public MberVO getMberByMberId(String mberId) throws Exception;
	
	public Map<String, Object> getInstListPage(SearchCriteriaGeon cri) throws Exception;
	
	public void registInst(InstVO inst) throws Exception;
	
	public InstVO getInstDetail(String instNo) throws Exception;
	
	public MberVO getMberDetail(String instNo) throws Exception;
	
	public Map<String, Object> getAllInstDetail(String instNo) throws Exception;
	
	public int modifyInst(InstVO inst) throws Exception;
	
	public String getChildNoByInstNo(String instNo) throws Exception;
	
	public int removeMemberByInstNo(String instNo) throws Exception;
	
	public int removeInspByInspNo(String inspNo) throws Exception;
	
	public int removePbhtByPbhtNo(String pbhtNo) throws Exception;
	
	public int removeHsptByHsptNo(String hsptNo) throws Exception;
	
	public int removeLtctByLtctNo(String ltctNo) throws Exception;
	
	public int removeInstByInstNo(String instNo) throws Exception;
	
	public int removeInspByPbhtNo(String pbhtNo) throws Exception;
	
	public List<MberVO> getmberList(String instNo) throws Exception;
	
	public String getNoticeSeq() throws Exception;
	public int registNotice(NoticeVO notice) throws Exception;
	
	public String getAttachSeq() throws Exception;
	public int registAttach(AttachVO attach) throws Exception;
	
	public Map<String, Object> getNoticeList(SearchCriteria cri) throws Exception;
	
	public NoticeVO getNoticeByNoticeNo(String noticeNo) throws Exception;
	
	public AttachVO getAttachByNoticeNo(String noticeNo)throws Exception;
	
	public void removeNotice(String atchNo, String noticeNo) throws Exception;
	
	public void modifyNotice(NoticeVO notice) throws Exception;
	
	public void modifyAttach(AttachVO attach) throws Exception;
	
	public void removeAttachByfileName(String fileName) throws Exception;
	
	public String getInstNoByMberNo(String mberNo) throws Exception;
	
	public String getInstTelNoByInstNo(String instNo) throws Exception;
	
	public int modifyPasswordMber(MberVO mber) throws Exception;
	
	public MberVO getMberBymberNo(String mberNo) throws Exception;
	
	public Map<String, Object> getMainInspList(SearchCriteriaGeon cri) throws Exception;
	
	public Map<String, Object> getMainPbhtList(SearchCriteriaGeon cri) throws Exception;
	
	public Map<String, Object> getMainHsptList(SearchCriteriaGeon cri) throws Exception;
	
	public Map<String, Object> getMainLtctList(SearchCriteriaGeon cri) throws Exception;

	public void removeInspStatsByInspNo(String inspNo) throws Exception;
	
	public void removePbhtStatsByPbhtNo(String pbhtNo) throws Exception;
	
	public void removeHsptStatsByHsptNo(String hsptNo) throws Exception;
	
	public void removeLtctStatsByLtctNo(String ltctNo) throws Exception;
	
	public List<String> getInspNoByPbhtNo(String pbhtNo) throws Exception;
	
	public String getInstNoByInspNo(String inspNo) throws Exception;
	
	public String getPstiNoByInspNo(String inspNo) throws Exception;
	
	public void removeHtscByPstiNo(String pstiNo) throws Exception;
	
	public void removePstiByInspNo(String inspNo) throws Exception;
	
	public void removeInspEmpByInspNo(String inspNo) throws Exception;
	
	public void removeSmplByPbhtNo(String pbhtNo) throws Exception;
	
	public void removeCnfmByPbhtNo(String pbhtNo) throws Exception;
	
	public void removeSlfptntByPbhtNo(String pbhtNo) throws Exception;
	
	public void removePbhtEmp(String pbhtNo) throws Exception;
	
	public void removeHsptEmpByHsptNo(String hsptNo) throws Exception;
	
	public void removeInptntByHsptNo(String hsptNo) throws Exception;
	
	public void removeDgnssByHsptNo(String hsptNo) throws Exception;
	
	public void removeIsoptntByLtctNo(String ltctNo) throws Exception;
	
	public void removeLtctEmpByLtctNo(String ltctNo) throws Exception;
	
	public List<PstiVO> getPstiBackupList() throws Exception;
	
	public Map<String, Object> getNoticeListByInstNo(SearchCriteria cri) throws Exception;
	
	public int getSearchNoticeListByInstNoCount(SearchCriteria cri) throws Exception;
	
	public void modifyNoticeByInst(NoticeVO notice) throws Exception;
	
	public void registNoticeAdmin(NoticeVO notice) throws Exception;
	
	public List<NoticeVO> getPopupNoticeList() throws Exception;
	
	public void removeAttachByMberNo(String mberNo) throws Exception;
	
	public AttachVO getAttachByMberNo(String mberNo) throws Exception;
	
	
}











