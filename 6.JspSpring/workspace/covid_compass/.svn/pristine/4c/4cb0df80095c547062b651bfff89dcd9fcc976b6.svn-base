package com.spring.compass.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.compass.command.InspPstiRegistCommand;
import com.spring.compass.command.InspPstiSearchCommand;
import com.spring.compass.command.InspSmplRequestCommand;
import com.spring.compass.command.PageMaker;
import com.spring.compass.command.VInspPstiResultVO;
import com.spring.compass.command.VInspPstiVO;
import com.spring.compass.dao.InspDAO;
import com.spring.compass.vo.InspChckdVO;
import com.spring.compass.vo.InspPstiVO;
import com.spring.compass.vo.InspResultVO;
import com.spring.compass.vo.InspStatsVO;
import com.spring.compass.vo.InspVO;
import com.spring.compass.vo.KitHistVO;
import com.spring.compass.vo.PcrKitVO;

public class InspServiceImpl implements InspService{

	private InspDAO inspDAO = null;

	public void setInspDAO(InspDAO inspDAO) {
		this.inspDAO = inspDAO;
	}
	
	
	
	@Override
	public InspVO getInspByInstNo(String instNo) throws Exception {
		InspVO insp = inspDAO.selectInspByInstNo(instNo);
		return insp;
	}

	@Override
	public String getInspCityNo(String city) throws Exception {
		String cityNo = inspDAO.selectInspCityNo(city);
		return cityNo;
	}

	@Override
	public String getInspSeqNo() throws Exception {
		String inspSeqNo = inspDAO.selectInspNextval();
		return inspSeqNo;
	}

	@Override
	public String getInstSeqNo() throws Exception {
		String instSeqNo = inspDAO.selectInstNextval();
		return instSeqNo;
	}

	@Override
	public int registInsp(InspVO insp) throws Exception {
		int result = inspDAO.insertInsp(insp);
		return result;
	}

	@Override
	public int registInst(InspVO insp) throws Exception {
		System.out.println("registInst before");
		System.out.println(insp);
		int result = inspDAO.insertInst(insp);
		System.out.println("registInst after");
		return result;
	}

	@Override
	public String getResponsibleAgency(String responsible) throws Exception {
		String responsi = inspDAO.selectResponsibleAgency(responsible);
		return responsi;
	}

	@Override
	public Map<String, Object> getPstiListPage(InspPstiSearchCommand cri) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = null;
		
		pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		int totalCount = inspDAO.selectPstiListCount(cri);
		
		pageMaker.setTotalCount(totalCount);
		
		List<InspPstiVO> pstiList = inspDAO.selectPstiList(cri);
		
		if(!pstiList.isEmpty()) {
			for(int i = 0; i < pstiList.size(); i++) {
				String manageNo = pstiList.get(i).getManageNo();
				if(manageNo != null) {
					InspPstiVO result = inspDAO.selectResultByManageNo(manageNo);
					pstiList.get(i).setPstvYn(result.getPstvYn());
					pstiList.get(i).setResYmd(result.getResYmd());
				}
			}
		}
		dataMap.put("pstiList", pstiList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getChckdListPage(InspPstiSearchCommand cri) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = null;
		
		pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		int totalCount = inspDAO.selectChckdListCount(cri);
		
		pageMaker.setTotalCount(totalCount);
		
		List<InspChckdVO> chckdList = inspDAO.selectChckdList(cri);
		
		if(!chckdList.isEmpty()) {
			for(int i = 0; i < chckdList.size(); i++) {
				String manageNo = chckdList.get(i).getManageNo();
				if(manageNo != null) {
					InspPstiVO result = inspDAO.selectResultByManageNo(manageNo);
					if(result != null) {
						chckdList.get(i).setPstvYn(result.getPstvYn());
						chckdList.get(i).setResYmd(result.getResYmd());
					}
					
				}
			}
		}
		
		
		dataMap.put("chckdList", chckdList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> getPcrKitList(InspPstiSearchCommand cri) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = null;
		pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int totalCount = inspDAO.selectPcrKitListCount(cri);
		
		pageMaker.setTotalCount(totalCount);

		List<PcrKitVO> pcrKitList = inspDAO.selectPcrKitList(cri);
		dataMap.put("pcrKitList", pcrKitList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public Map<String, Object> getResultListPage(InspPstiSearchCommand cri) throws Exception {
		Map<String, Object> dataMap = new HashMap<String , Object>();
		PageMaker pageMaker = null;
		
		pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		int totalCount = inspDAO.selectResultListCount(cri);
		
		pageMaker.setTotalCount(totalCount);
		
		List<InspResultVO> resultList = inspDAO.selectResultList(cri);
		
		for(int i = 0; i < resultList.size(); i++) {
			
			String manageNo = resultList.get(i).getManageNo();
			
			int smplCnt = inspDAO.selectSmplCountByManageNo(manageNo);
			
			resultList.get(i).setSmplCnt(smplCnt);
			
		}
		
		dataMap.put("resultList", resultList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public InspPstiVO getPstiDetail(String pstiNo) throws Exception {
		InspPstiVO psti = inspDAO.selectPstiDetail(pstiNo);
		return psti;
	}
	
	@Override
	public InspChckdVO getChckdDetail(String pstiNo) throws Exception {
		InspChckdVO Chckd = inspDAO.selectChckdDetail(pstiNo);
		return Chckd;
	}

	@Override
	public InspResultVO getResultDetail(String smplNo) throws Exception {
		InspResultVO result = inspDAO.selectResultDetail(smplNo);
		return result;
	}

	@Override
	public int getPcrKitCount(String inspNo) throws Exception {
		int kitCount = inspDAO.selectPcrKitCount(inspNo);
		return kitCount;
	}

	@Override
	public int getTotalKitCount(String inspNo) throws Exception {
		
		int result = inspDAO.selectKitYnCount(inspNo);
		
		int totalKitCount = 0;

		if(result > 0) {
			totalKitCount = inspDAO.selectTotalKitCount(inspNo);
		}
		
		return totalKitCount;
	}

	@Override
	public void modifyPstiInfo(InspPstiVO psti) throws Exception {
		inspDAO.updatePstiInfo(psti);
	}
	
	// 문진표 등록
	@Override
	public void registQuestion(InspPstiRegistCommand questionInfo) throws Exception{
			
			// 기초검사 있는지 select
			String pstiNo = questionInfo.getPstiNo();
			int result = inspDAO.selectHtscByPstiNo(pstiNo);
			
			// 있으면 update 없으면 insert
			if(result == 0) {
				inspDAO.insertHtscQuestion(questionInfo);
			}else {
				inspDAO.updateHtscQuestion(questionInfo);
			}
			
			inspDAO.insertPstiQuestion(pstiNo);
			inspDAO.updateInspKit(questionInfo);
	}
	
	// 시료검사요청
	@Override
	public void registRequestSmpl(InspSmplRequestCommand smplRequestInfo) throws Exception {
		String smplSeq = inspDAO.selectSmplSeq(); // 시료 시퀀스
		smplRequestInfo.setSmplNo(smplSeq); // 시료 시퀀스 세팅
		
		//ManageNo 있는지 없는지. pstiNo로 가져오기.
		String manageNo = smplRequestInfo.getManageNo();
		
		if(manageNo == null || manageNo.isEmpty() || manageNo == "") {// manageNo 없으면 Seq생성.
			manageNo = inspDAO.selectManageSeq(); // seq 받아오기
			
			smplRequestInfo.setManageNo(manageNo); // manageNo 세팅
			inspDAO.insertManageInfo(smplRequestInfo); // 매니지 테이블에 등록
			inspDAO.updateManageInfo(smplRequestInfo); // psti에 manageNo 심어줌.
		}
//		else {
//			inspDAO.updateManageInfoManage(smplRequestInfo); // 매니저No가 존재하면 업데이트 처리.
//		}
		
		inspDAO.updatePstiReq(smplRequestInfo.getPstiNo());
		
		
		inspDAO.insertSmplInfo(smplRequestInfo); // 시료테이블에 시료 등록
		
	}

	@Override
	public String getManageNoByPstiNo(String pstiNo) throws Exception {
		String manageNo = inspDAO.selectManageNoByPstiNo(pstiNo);
		return manageNo;
	}

	@Override
	public void registKitHist(KitHistVO kitHist) throws Exception {
		
		//키트 계산
		int kitCount = inspDAO.selectPcrKitCount(kitHist.getInspNo());
		kitCount = kitCount + kitHist.getInputCnt();
		InspPstiRegistCommand inspKit = new InspPstiRegistCommand();
		inspKit.setInspNo(kitHist.getInspNo());
		inspKit.setRmndKitCnt(kitCount);
		inspDAO.updateInspKit(inspKit); // 검사소 키트 업데이트
		
		String kithistNo = inspDAO.selectKitHistSeq(); // 시퀀스
		kitHist.setKithistNo(kithistNo);
		inspDAO.insertKitHist(kitHist); // 키트히스토리 등록
	}

	@Override
	public void registInspStats(InspStatsVO inspstats) throws Exception {
		inspDAO.insertInspStats(inspstats);
	}

	@Override
	public List<String> inspNoList() throws Exception {
		List<String> inspNoList = inspDAO.selectInspAllInspNo();
		return inspNoList;
	}
	
	@Override
	public String getInspStatsSeq() throws Exception {
		return inspDAO.selectInspstatsSeq();
	}



	@Override
	public String getInspStatsNo(InspStatsVO inspstats) throws Exception {
		return inspDAO.selectInspStatusNo(inspstats);
	}



	@Override
	public void modifyInspStats(InspStatsVO inspstats) throws Exception {
		inspDAO.updateInspStatus(inspstats);
	}



	@Override
	public List<InspVO> getInspListBackup() throws Exception {
		List<InspVO> inspList = inspDAO.selectInspBackup();
		return inspList;
	}



	@Override
	public InspResultVO getPbhtInfoByPbhtNo(String pbhtNo) throws Exception {
		InspResultVO pbht = inspDAO.selectPbhtInfoByPbhtNo(pbhtNo);
		return pbht;
	}
	@Override
	public InspVO getInspByInspNo(String inspNo) throws Exception {
		InspVO insp = inspDAO.selectInspByInspNo(inspNo);
		return insp;
	}



	@Override
	public List<InspStatsVO> getInspStatsByInspNo(String inspNo) throws Exception {
		List<InspStatsVO> statsList = inspDAO.selectInspStatsByInspNo(inspNo);
		return statsList;
	}



	@Override
	public InspPstiVO getModifyCancel(String pstiNo) throws Exception {
		return inspDAO.selectModifyCancel(pstiNo);
	}



	@Override
	public InspPstiVO getResultByManageNo(String manageNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public String getSelectInspNm(String inspNo) throws Exception {
		String inspNm = inspDAO.selectInspNm(inspNo);
		return inspNm;
	}



	@Override
	public void removePsti() throws Exception {
		inspDAO.deletePsti();
	}






}
