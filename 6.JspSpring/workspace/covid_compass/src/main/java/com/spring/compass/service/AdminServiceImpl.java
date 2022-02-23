package com.spring.compass.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.compass.command.PageMaker;
import com.spring.compass.command.SearchCriteria;
import com.spring.compass.command.SearchCriteriaGeon;
import com.spring.compass.dao.AdminDAO;
import com.spring.compass.vo.AttachVO;
import com.spring.compass.vo.HsptVO;
import com.spring.compass.vo.InspVO;
import com.spring.compass.vo.InstVO;
import com.spring.compass.vo.LtctStatsVO;
import com.spring.compass.vo.LtctVO;
import com.spring.compass.vo.MberVO;
import com.spring.compass.vo.NoticeVO;
import com.spring.compass.vo.PbhtVO;
import com.spring.compass.vo.PstiVO;



public class AdminServiceImpl implements AdminService{
	
	private AdminDAO adminDAO;
	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}
	
	


	@Override
	public void registInst(InstVO inst) throws Exception {
		adminDAO.insertInst(inst);
	}
	
	
	
	
	
	@Override
	public Map<String, Object> getMainInspList(SearchCriteriaGeon cri) throws Exception {
		Map<String, Object> inspMap = new HashMap<String, Object>();
		
		PageMaker inspPageMaker = new PageMaker();
		
		inspPageMaker.setCri(cri);
		
		int totalCount = adminDAO.selectInspTotalCount(cri);
		
		inspPageMaker.setTotalCount(totalCount);
		
		List<InspVO> inspList = adminDAO.selectAllInsp(cri);
		
		inspMap.put("inspList", inspList);
		inspMap.put("inspPageMaker", inspPageMaker);
		
		return inspMap;
	}




	@Override
	public Map<String, Object> getMainPbhtList(SearchCriteriaGeon cri) throws Exception {
		Map<String, Object> pbhtMap = new HashMap<String, Object>();
		List<PbhtVO> pbhtList = adminDAO.selectAllPbht(cri);
		
		PageMaker pbhtPageMaker = new PageMaker();
		
		pbhtPageMaker.setCri(cri);
		
		int totalCount = adminDAO.selectPbhtTotalCount(cri);
		
		pbhtPageMaker.setTotalCount(totalCount);
		
		pbhtMap.put("pbhtList", pbhtList);
		pbhtMap.put("pbhtPageMaker", pbhtPageMaker);
		
		
		return pbhtMap;
	}




	@Override
	public Map<String, Object> getMainHsptList(SearchCriteriaGeon cri) throws Exception {
		Map<String, Object> hsptMap = new HashMap<String, Object>();
		List<HsptVO> hsptList = adminDAO.selectAllHspt(cri);
		
		PageMaker hsptPageMaker = new PageMaker();
		
		hsptPageMaker.setCri(cri);
		
		int totalCount = adminDAO.selectHsptTotalCount(cri);
		
		hsptPageMaker.setTotalCount(totalCount);
		
		hsptMap.put("hsptList", hsptList);
		hsptMap.put("hsptPageMaker", hsptPageMaker);
		
		
		return hsptMap;
	}




	@Override
	public Map<String, Object> getMainLtctList(SearchCriteriaGeon cri) throws Exception {
		Map<String, Object> ltctMap = new HashMap<String, Object>();
		List<LtctVO> ltctList = adminDAO.selectAllLtct(cri);
		
		PageMaker ltctPageMaker = new PageMaker();
		
		ltctPageMaker.setCri(cri);
		
		int totalCount = adminDAO.selectLtctTotalCount(cri);
		
		ltctPageMaker.setTotalCount(totalCount);
		
		ltctMap.put("ltctList", ltctList);
		ltctMap.put("ltctPageMaker", ltctPageMaker);
		
		
		return ltctMap;
	}
	

	@Override
	public Map<String, Object> getInstListPage(SearchCriteriaGeon cri) throws Exception {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		PageMaker pageMaker = null;
		
		pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		int totalCount = adminDAO.selectAllInstCount(cri);
		
		pageMaker.setTotalCount(totalCount);
		
		List<InstVO> instList = adminDAO.selectAllInst(cri);
		
		for(int i=0; i<instList.size(); i++) {
			String checkDivision=instList.get(i).getChildNo();
			String check = checkDivision.substring(0, 4);
			//System.out.println("-----------------------------------------"+i+check);
			if(check.equals("INSP")) {
				System.out.println("insp---------------------------");
				instList.get(i).setDivision("검사소");
			}
			if(check.equals("PBHT")) {
				System.out.println("pbht---------------------------");
				instList.get(i).setDivision("보건소");
			}
			if(check.equals("HSPT")) {
				instList.get(i).setDivision("병원");
			}
			if(check.equals("LTCT")) {
				instList.get(i).setDivision("생활치료센터");
			}
		}
		dataMap.put("instList", instList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}




	@Override
	public InstVO getInstDetail(String instNo) throws Exception {
		InstVO inst = adminDAO.selectInstDetail(instNo);
		
		String childNo = inst.getChildNo();
		String checkDivision = childNo.substring(0, 4);
		
		if(checkDivision.equals("INSP")) {
			inst.setDivision("검사소");
		}
		if(checkDivision.equals("PBHT")) {
			inst.setDivision("보건소");
		}
		if(checkDivision.equals("HSPT")) {
			inst.setDivision("병원");
		}
		if(checkDivision.equals("LTCT")) {
			inst.setDivision("생활치료센터");
		}
		
		return inst;
	}




	@Override
	public MberVO getMberDetail(String instNo) throws Exception {
		return null;
	}




	@Override
	public Map<String, Object> getAllInstDetail(String instNo) throws Exception {
		Map<String, Object> instMap = new HashMap<String, Object>();
		InstVO inst = adminDAO.selectInstDetail(instNo);
		
		String childNo = inst.getChildNo();
		String checkDivision = childNo.substring(0, 4);
		
		if(checkDivision.equals("INSP")) {
			inst.setDivision("검사소");
		}
		if(checkDivision.equals("PBHT")) {
			inst.setDivision("보건소");
		}
		if(checkDivision.equals("HSPT")) {
			inst.setDivision("병원");
		}
		if(checkDivision.equals("LTCT")) {
			inst.setDivision("생활치료센터");
		}
		
		List<MberVO> mber = adminDAO.selectMeberByInstNo(instNo);
		
		instMap.put("inst", inst);
		instMap.put("mber", mber);
		
		return instMap;
	}
	

	@Override
	public List<MberVO> getmberList(String instNo) throws Exception {
		List<MberVO> mberList = adminDAO.selectMeberByInstNo(instNo);
		return mberList;
	}




	@Override
	public int modifyInst(InstVO inst) throws Exception {
		int result = adminDAO.updateInst(inst);
		return result;
	}




	@Override
	public String getChildNoByInstNo(String instNo) throws Exception {
		String childNo = adminDAO.selectChildNoByInstNo(instNo);
		return childNo;
	}




	@Override
	public int removeMemberByInstNo(String instNo) throws Exception {
		return adminDAO.deleteMemberByInstNo(instNo);
	}




	@Override
	public int removeInspByInspNo(String inspNo) throws Exception {
		return adminDAO.deleteInspByInspNo(inspNo);
	}




	@Override
	public int removePbhtByPbhtNo(String pbhtNo) throws Exception {
		return adminDAO.deletePbhtByPbhtNo(pbhtNo);
	}

	


	@Override
	public int removeLtctByLtctNo(String ltctNo) throws Exception {
		return adminDAO.deleteLtctByLtctNo(ltctNo);
	}




	@Override
	public int removeInstByInstNo(String instNo) throws Exception {
		return adminDAO.deleteInstByInstNo(instNo);
	}




	@Override
	public int removeHsptByHsptNo(String hsptNo) throws Exception {
		return adminDAO.deleteHsptByHsptNo(hsptNo);
	}




	@Override
	public int removeInspByPbhtNo(String pbhtNo) throws Exception {
		return adminDAO.deleteInspByPbhtNo(pbhtNo);
	}




	@Override
	public String getNoticeSeq() throws Exception {
		return adminDAO.selectNoticeSeq();
	}




	@Override
	public int registNotice(NoticeVO notice) throws Exception {
		return adminDAO.registNotice(notice);
	}
	
	public int registNotice(NoticeVO notice,AttachVO attach) throws Exception {
		int result=adminDAO.registNotice(notice);
		int result2=adminDAO.registAttach(attach);
		return result+result2;
	}




	@Override
	public String getAttachSeq() throws Exception {
		return adminDAO.selectAttchSeq();
	}




	@Override
	public int registAttach(AttachVO attach) throws Exception {
		return adminDAO.registAttach(attach);
	}




	@Override
	public Map<String, Object> getNoticeList(SearchCriteria cri) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<NoticeVO> noticeList = adminDAO.selectAllNotice(cri);
		
		int totalCount = adminDAO.selectSearchNoticeListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		dataMap.put("noticeList", noticeList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}




	@Override
	public NoticeVO getNoticeByNoticeNo(String noticeNo) throws Exception {
		return adminDAO.selectNoticeByNoticeNo(noticeNo);
	}




	@Override
	public AttachVO getAttachByNoticeNo(String noticeNo) throws Exception {
		return adminDAO.selectAttachByNoticeNo(noticeNo);
	}


	@Override
	public void removeNotice(String atchNo, String noticeNo) throws Exception {
		if(atchNo !=null) {
			adminDAO.removeAttachByAtchNo(atchNo);
		}
		adminDAO.removeNoticeByNoticeNo(noticeNo);
	}

	@Override
	public void modifyNotice(NoticeVO notice) throws Exception {
		adminDAO.noticeModify(notice);
	}


	@Override
	public void modifyAttach(AttachVO attach) throws Exception {
		adminDAO.attachModify(attach);
	}




	@Override
	public void removeAttachByfileName(String fileName) throws Exception {
		adminDAO.deleteAttachByFileName(fileName);
	}




	@Override
	public String getInstNoByMberNo(String mberNo) throws Exception {
		return adminDAO.selectInstNoByMberNo(mberNo);
	}




	@Override
	public String getInstTelNoByInstNo(String instNo) throws Exception {
		return adminDAO.selectInstTelNoByInstNo(instNo);
	}




	@Override
	public int modifyPasswordMber(MberVO mber) throws Exception {
		return adminDAO.updatePasswordMber(mber);
	}




	@Override
	public MberVO getMberBymberNo(String mberNo) throws Exception {
		MberVO mber = adminDAO.detailMberByMberNo(mberNo);
		return mber;
	}




	@Override
	public MberVO getMberByMberId(String mberId) throws Exception {
		MberVO mber = adminDAO.selectMeberDetailByMberId(mberId);
		return mber;
	}




	@Override
	public void removeInspStatsByInspNo(String inspNo) throws Exception {
		adminDAO.deleteInspStatsByInspNo(inspNo);
	}




	@Override
	public void removePbhtStatsByPbhtNo(String pbhtNo) throws Exception {
		adminDAO.deletePbhtStatsByPbhtNo(pbhtNo);
	}




	@Override
	public void removeHsptStatsByHsptNo(String hsptNo) throws Exception {
		adminDAO.deleteHsptStatsByHsptNo(hsptNo);
	}




	@Override
	public void removeLtctStatsByLtctNo(String ltctNo) throws Exception {
		adminDAO.deleteLtctStatsByLtctNo(ltctNo);
	}




	@Override
	public List<String> getInspNoByPbhtNo(String pbhtNo) throws Exception {
		return adminDAO.selectInspNoByPbhtNo(pbhtNo);
	}




	@Override
	public String getInstNoByInspNo(String inspNo) throws Exception {
		return adminDAO.selectInstNoByInspNo(inspNo);
	}




	@Override
	public String getPstiNoByInspNo(String inspNo) throws Exception {
		return adminDAO.selectPstiNoByInspNo(inspNo);
	}




	@Override
	public void removeHtscByPstiNo(String pstiNo) throws Exception {
		adminDAO.deleteHtscByPstiNo(pstiNo);
	}




	@Override
	public void removePstiByInspNo(String inspNo) throws Exception {
		adminDAO.deletePstiByInspNo(inspNo);
	}


	@Override
	public void removeInspEmpByInspNo(String inspNo) throws Exception {
		adminDAO.deleteInspEmpByInspNo(inspNo);
	}




	@Override
	public void removeSmplByPbhtNo(String pbhtNo) throws Exception {
		adminDAO.deleteSmplByPbhtNo(pbhtNo);
	}




	@Override
	public void removeCnfmByPbhtNo(String pbhtNo) throws Exception {
		adminDAO.deleteCnfmByPbhtNo(pbhtNo);
	}




	@Override
	public void removeSlfptntByPbhtNo(String pbhtNo) throws Exception {
		adminDAO.deleteSlfptntByPbhtNo(pbhtNo);
	}




	@Override
	public void removePbhtEmp(String pbhtNo) throws Exception {
		adminDAO.deletePbhtEmp(pbhtNo);
	}


	@Override
	public void removeHsptEmpByHsptNo(String hsptNo) throws Exception {
		adminDAO.deleteHsptEmpByHsptNo(hsptNo);
	}


	@Override
	public void removeInptntByHsptNo(String hsptNo) throws Exception {
		adminDAO.deleteInptntByHsptNo(hsptNo);
	}


	@Override
	public void removeDgnssByHsptNo(String hsptNo) throws Exception {
		adminDAO.deleteDgnssByHsptNo(hsptNo);
	}


	@Override
	public void removeIsoptntByLtctNo(String ltctNo) throws Exception {
		adminDAO.deleteIsoptntByLtctNo(ltctNo);
	}


	@Override
	public void removeLtctEmpByLtctNo(String ltctNo) throws Exception {
		adminDAO.deleteLtctEmpByLtctNo(ltctNo);
	}




	@Override
	public List<PstiVO> getPstiBackupList() throws Exception {
		List<PstiVO> pstiBackupList = adminDAO.selectPstiBackupList();
		return pstiBackupList;
	}




	@Override
	public Map<String, Object> getNoticeListByInstNo(SearchCriteria cri) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<NoticeVO> noticeList = adminDAO.selectAllNoticeByInstNo(cri);
		
		int totalCount = adminDAO.selectSearchNoticeListByInstNoCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		System.out.println("================totalCount:"+pageMaker.getTotalCount());
		System.out.println("=================endPage:"+pageMaker.getEndPage());
		
		
		
		dataMap.put("noticeList", noticeList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}




	@Override
	public int getSearchNoticeListByInstNoCount(SearchCriteria cri) throws Exception {
		return adminDAO.selectSearchNoticeListByInstNoCount(cri);
	}




	@Override
	public void modifyNoticeByInst(NoticeVO notice) throws Exception {
		adminDAO.noticeModifyByInst(notice);
	}




	@Override
	public void registNoticeAdmin(NoticeVO notice) throws Exception {
		adminDAO.registNoticeAdmin(notice);
	}




	@Override
	public List<NoticeVO> getPopupNoticeList() throws Exception {
		return adminDAO.selectPopupNotice();
	}




	@Override
	public void removeAttachByMberNo(String mberNo) throws Exception {
		adminDAO.deleteAttachByMberNo(mberNo);
	}




	@Override
	public AttachVO getAttachByMberNo(String mberNo) throws Exception {
		return adminDAO.selectAttachByMberNo(mberNo);
	}







}
