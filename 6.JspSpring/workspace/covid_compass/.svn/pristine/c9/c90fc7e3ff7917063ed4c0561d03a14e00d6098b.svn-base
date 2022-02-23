package com.spring.compass.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.compass.command.InspPstiRegistCommand;
import com.spring.compass.command.InspPstiSearchCommand;
import com.spring.compass.command.InspSmplRequestCommand;
import com.spring.compass.command.VInspPstiVO;
import com.spring.compass.vo.InspChckdVO;
import com.spring.compass.vo.InspPstiVO;
import com.spring.compass.vo.InspResultVO;
import com.spring.compass.vo.InspStatsVO;
import com.spring.compass.vo.InspVO;
import com.spring.compass.vo.KitHistVO;
import com.spring.compass.vo.PcrKitVO;
import com.spring.compass.vo.PstiVO;

public class InspDAOImpl implements InspDAO{

	private SqlSession sqlSession = null;
	private String nameSpace = "Insp-Mapper.";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public PstiVO selectPstiByPstiNo(String pstiNo) throws SQLException {
		PstiVO psti = sqlSession.selectOne(nameSpace + "selectPstiByPstiNo", pstiNo);
		return psti;
	}

	@Override
	public String selectPstiSeqNextval() throws SQLException {
		String pstiSeq =  sqlSession.selectOne(nameSpace + "selectPstiSeqNextval");
		return pstiSeq;
	}

	@Override
	public String selectPstiNo(String pstiSeq) throws SQLException {
		String pstiNo =  sqlSession.selectOne(nameSpace + "selectPstiNo", pstiSeq);
		return pstiNo;
	}

	@Override
	public void insertPsti(PstiVO psti) throws SQLException {
		sqlSession.update(nameSpace + "insertPsti", psti);
	}

	@Override
	public InspVO selectInspByInstNo(String instNo) throws SQLException {
		InspVO insp = sqlSession.selectOne(nameSpace + "selectInspByInstNo", instNo);
		return insp;
	}

	@Override
	public String selectInspNextval() throws SQLException {
		String insp_seq = sqlSession.selectOne(nameSpace+"selectInspNextval");
		return insp_seq;
	}

	@Override
	public String selectInspCityNo(String city) throws SQLException {
		String cityNo = sqlSession.selectOne(nameSpace+"selectInspCityNo", city);
		return cityNo;
	}

	@Override
	public String selectInstNextval() throws SQLException {
		String inst_seq = sqlSession.selectOne(nameSpace+"selectInstNextval");
		return inst_seq;
	}

	@Override
	public int insertInsp(InspVO insp) throws SQLException {
		int result = sqlSession.update(nameSpace+"insertInsp", insp);
		return result;
	}

	@Override
	public int insertInst(InspVO insp) throws SQLException {
		System.out.println("insertInst before");
		System.out.println();
		int result = sqlSession.update(nameSpace+"insertInst", insp);
		System.out.println("insertInst after");
		return result;
	}

	@Override
	public String selectResponsibleAgency(String responsible) throws SQLException {
		String responsi = sqlSession.selectOne(nameSpace+"selectResponsibleAgency", responsible);
				
		return responsi;
	}

	@Override
	public String selectJobByCode(String jobCode) throws SQLException {
		String job = sqlSession.selectOne(nameSpace+"selectJobByCode", jobCode);
		return job;
	}

	@Override
	public String selectVacByCode(String vacCode) throws SQLException {
		String vac = sqlSession.selectOne(nameSpace+"selectVacByCode", vacCode);
		return vac;
	}

	@Override
	public List<InspPstiVO> selectPstiList(InspPstiSearchCommand cri) throws SQLException {
		List<InspPstiVO> pstiList = sqlSession.selectList(nameSpace+"selectPstiList", cri);
		return pstiList;
	}

	@Override
	public int selectPstiListCount(InspPstiSearchCommand cri) throws SQLException {
		int pstiListCount = sqlSession.selectOne(nameSpace+"selectPstiListCount", cri);
		return pstiListCount;
	}

	@Override
	public List<InspChckdVO> selectChckdList(InspPstiSearchCommand cri) throws SQLException {
		List<InspChckdVO> ChckdList = sqlSession.selectList(nameSpace+"selectChckdList", cri);
		return ChckdList;
	}

	@Override
	public int selectChckdListCount(InspPstiSearchCommand cri) throws SQLException {
		int chckdListCount = sqlSession.selectOne(nameSpace+"selectChckdListCount", cri);
		return chckdListCount;
	}

	@Override
	public List<InspResultVO> selectResultList(InspPstiSearchCommand cri) throws SQLException {
		List<InspResultVO> resultList = sqlSession.selectList(nameSpace+"selectResultList", cri);
		return resultList;
	}

	@Override
	public int selectResultListCount(InspPstiSearchCommand cri) throws SQLException {
		int resultListCount = sqlSession.selectOne(nameSpace+"selectResultListCount", cri);
		return resultListCount;
	}

	@Override
	public InspPstiVO selectPstiDetail(String pstiNo) throws SQLException {
		InspPstiVO psti = sqlSession.selectOne(nameSpace+"selectPstiDetail", pstiNo);
		return psti;
	}
	
	@Override
	public InspChckdVO selectChckdDetail(String pstiNo) throws SQLException {
		InspChckdVO chckd = sqlSession.selectOne(nameSpace+"selectChckdDetail", pstiNo);
		return chckd;
	}

	@Override
	public InspResultVO selectResultDetail(String smplNo) throws SQLException {
		InspResultVO result = sqlSession.selectOne(nameSpace+"selectResultDetail", smplNo);
		return result;
	}

	@Override
	public List<PcrKitVO> selectPcrKitList(InspPstiSearchCommand cri) throws SQLException {
		List<PcrKitVO> pcrKitList = sqlSession.selectList(nameSpace+"selectPcrKitList", cri); 
		return pcrKitList;
	}

	@Override
	public int selectPcrKitCount(String inspNo) throws SQLException {
		int kitCount = sqlSession.selectOne(nameSpace+"selectPcrKitCount", inspNo);
		return kitCount;
	}

	@Override
	public int selectTotalKitCount(String inspNo) throws SQLException {
		int totalKitCount = sqlSession.selectOne(nameSpace+"selectTotalKitCount", inspNo);
		return totalKitCount;
	}

	@Override
	public void updatePstiInfo(InspPstiVO psti) throws SQLException {
		sqlSession.update(nameSpace+"updatePstiInfo", psti);
	}
	//문진표 등록
	@Override
	public void insertHtscQuestion(InspPstiRegistCommand pstiInfo) throws SQLException {
		sqlSession.update(nameSpace+"insertHtscQuestion", pstiInfo);
	}

	@Override
	public void insertPstiQuestion(String pstiNo) throws SQLException {
		sqlSession.update(nameSpace+"insertPstiQuestion", pstiNo);
	}

	@Override
	public void updateInspKit(InspPstiRegistCommand inspInfo) throws SQLException {
		sqlSession.update(nameSpace+"updateInspKit", inspInfo);
	}
	// 검사요청
	@Override
	public String selectSmplSeq() throws SQLException {
		String smplSeq = sqlSession.selectOne(nameSpace+"selectSmplSeq");
		return smplSeq;
	}

	@Override
	public String selectManageSeq() throws SQLException {
		String manageSeq = sqlSession.selectOne(nameSpace+"selectManageSeq"); 
		return manageSeq;
	}

	@Override
	public void insertSmplInfo(InspSmplRequestCommand smplInfo) throws SQLException {
		sqlSession.update(nameSpace+"insertSmplInfo", smplInfo);
	}

	@Override
	public void insertManageInfo(InspSmplRequestCommand manageInfo) throws SQLException {
		sqlSession.update(nameSpace+"insertManageInfo", manageInfo);
	}

	@Override
	public void updateManageInfo(InspSmplRequestCommand manageNo) throws SQLException {
		sqlSession.update(nameSpace+"updateManageInfo", manageNo);
	}

	@Override
	public String selectManageNoByPstiNo(String pstiNo) throws SQLException {
		String manageNo = sqlSession.selectOne(nameSpace+"selectManageNoByPstiNo", pstiNo);
		return manageNo;
	}

	@Override
	public String selectKitHistSeq() throws SQLException {
		String kithistNo = sqlSession.selectOne(nameSpace+"selectKitHistSeq");
		return kithistNo;
	}

	@Override
	public void insertKitHist(KitHistVO kitHist) throws SQLException {
		sqlSession.update(nameSpace+"insertKitHist", kitHist);
	}

	@Override
	public void updateManageInfoManage(InspSmplRequestCommand manageInfo) throws SQLException {
		sqlSession.update(nameSpace+"updateManageInfoManage", manageInfo);
		
	}

	@Override
	public void updatePstiReq(String pstiNo) throws SQLException {
		sqlSession.update(nameSpace+"updatePstiReq", pstiNo);
	}

	
	public List<String> selectInspAllInspNo() throws SQLException{
		List<String> inspNoList = sqlSession.selectList(nameSpace+"selectInspAllInspNo");
		
		return inspNoList;
	}
	
	@Override
	public String selectInspstatsSeq() throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectInspstatsSeq");
	}
	
	@Override
	public void insertInspStats(InspStatsVO inspstats) throws SQLException {
		sqlSession.update(nameSpace+"insertInspStats", inspstats);
	}

	@Override
	public String selectInspStatusNo(InspStatsVO inspStats) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectInspStatusNo", inspStats);
	}

	@Override
	public void updateInspStatus(InspStatsVO inspStats) throws SQLException {
		sqlSession.update(nameSpace+"updateInspStatus", inspStats);
	}

	@Override
	public List<InspVO> selectInspBackup() throws SQLException {
		List<InspVO> inspList = sqlSession.selectList(nameSpace+"selectInspBackup");
		return inspList;
	}

	@Override
	public InspResultVO selectPbhtInfoByPbhtNo(String pbhtNo) throws SQLException {
		InspResultVO pbht = sqlSession.selectOne(nameSpace+"selectPbhtInfoByPbhtNo",pbhtNo);
		return pbht;
	}

	@Override
	public InspVO selectInspByInspNo(String inspNo) throws SQLException {
		InspVO insp = sqlSession.selectOne(nameSpace + "selectInspByInspNo", inspNo);
		return insp;
	}
	@Override
	public int selectPcrKitListCount(InspPstiSearchCommand cri) throws SQLException {
		int pcrKitCount = sqlSession.selectOne(nameSpace+"selectPcrKitListCount", cri);
		return pcrKitCount;
	}

	@Override
	public List<InspStatsVO> selectInspStatsByInspNo(String inspNo) throws SQLException {
		List<InspStatsVO> statsList = sqlSession.selectList(nameSpace+"selectInspStatsByInspNo", inspNo);
		return statsList;
	}

	@Override
	public InspPstiVO selectModifyCancel(String pstiNo) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectModifyCancel", pstiNo);
	}

	@Override
	public InspPstiVO selectResultByManageNo(String manageNo) throws SQLException {
		InspPstiVO result = sqlSession.selectOne(nameSpace+"selectResultByManageNo", manageNo);
		return result;
	}

	@Override
	public String selectInspNm(String inspNo) throws SQLException {
		String inspNm = sqlSession.selectOne(nameSpace + "selectInspNm",inspNo); 
		return inspNm;
	}

	@Override
	public void deletePsti() throws SQLException {
		sqlSession.update(nameSpace+"deletePsti");
		
	}

	@Override
	public int selectHtscByPstiNo(String pstiNo) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectHtscByPstiNo", pstiNo);
	}

	@Override
	public void updateHtscQuestion(InspPstiRegistCommand pstiInfo) throws SQLException {
		sqlSession.update(nameSpace+"updateHtscQuestion", pstiInfo);
	}

	@Override
	public int selectSmplCountByManageNo(String manageNo) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectSmplCountByManageNo", manageNo);
	}

	@Override
	public int selectKitYnCount(String inspNo) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectKitYnCount", inspNo);
	}

	

}
