package com.spring.compass.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionException;

import com.spring.compass.command.CnfrmDgnssHsptVO;
import com.spring.compass.command.CnfrmDgnssListVO;
import com.spring.compass.command.CnfrmDgnssReqDetailVO;
import com.spring.compass.command.CnfrmDgnssWaitDetailVO;
import com.spring.compass.command.CnfrmListDetailManageInstVO;
import com.spring.compass.command.CnfrmManageListVO;
import com.spring.compass.command.DgnssHsptVO;
import com.spring.compass.command.PbhtStatsCommand;
import com.spring.compass.command.PbhtStatsDateCommand;
import com.spring.compass.command.PbhtStatsWeekCommand;
import com.spring.compass.command.PstiAdresVO;
import com.spring.compass.command.ResSmplDetailNegativeSmplInstVO;
import com.spring.compass.command.ResSmplDetailPstiHtscVO;
import com.spring.compass.command.ResSmplDetailSmplCnfmInstVO;
import com.spring.compass.command.SlfptntDetailDgnssHsptVO;
import com.spring.compass.command.SlfptntDetailSmplCnfmVO;
import com.spring.compass.command.SmplListDetailVO;
import com.spring.compass.command.SmplResultCheckVO;
import com.spring.compass.command.SmplSearchCommand;
import com.spring.compass.command.VPstiCommand;
import com.spring.compass.vo.CnfmVO;
import com.spring.compass.vo.DgnssVO;
import com.spring.compass.vo.InstVO;
import com.spring.compass.vo.PbhtStatsVO;
import com.spring.compass.vo.PbhtVO;
import com.spring.compass.vo.PstiVO;
import com.spring.compass.vo.SmplResultVO;
import com.spring.compass.vo.SmplVO;

public interface PbhtDAO {
	
	/**
	 * 인풋 : 기관번호
	 * 아웃풋 : 해당기관번호를 가지는 보건소 vo
	 * @param instNo
	 * @return
	 * @throws SQLException
	 */
	public PbhtVO selectPbhtByInstNo(String instNo) throws SQLException;
	
	/**
	 * 인풋 : 없음
	 * 아웃풋: 해당보건소 지역번호
	 * @param 
	 * @return String
	 * @throws SQLException
	 * 
	 */
	public String selectPbhtCityNo(String city) throws SQLException;
	
	/**
	 * 인풋 : 없음
	 * 아웃풋: 보건소 시퀀스번호
	 * @param 
	 * @return String
	 * @throws SQLException
	 * 
	 */
	public int selectPbhtNextVal() throws SQLException;
	
	/**
	 * 인풋 : 없음
	 * 아웃풋: 기관 시퀀스번호
	 * @param 
	 * @return String
	 * @throws SQLException
	 * 
	 */
	public int selectInstNextval() throws SQLException;
	
	/**
	 * 인풋 : pbhtvo
	 * 아웃풋: int
	 * @param 
	 * @return int
	 * @throws SQLException
	 * 
	 */
	public int insertPbht(PbhtVO pbht) throws SQLException;
	
	/**
	 * 인풋 : pbhtvo
	 * 아웃풋: int
	 * @param 
	 * @return int
	 * @throws SQLException
	 * 
	 */
	public int insertInst(PbhtVO pbht) throws SQLException;
	
	
	public PbhtVO selectPbhtByPbhtNo(String pbhtNo) throws SQLException;
	// 요청시료
	public List<SmplVO> selectSmplList(SmplSearchCommand cri)throws SQLException;
	public int selectSearchSemplListCount(SmplSearchCommand cri)throws SQLException;
	public SmplListDetailVO selectSmplDetail(Map<String, Object> sldData) throws SQLException;
	
	
	// 결과조회
	public List<SmplResultCheckVO> selectSearchSmplResultList(SmplSearchCommand cri)throws SQLException;
	public int selectSearchSemplResultListCount(SmplSearchCommand cri)throws SQLException;
	
	// 결과조회 디테일
	public ResSmplDetailPstiHtscVO selectResSmplDetailPstiHtsc(String manageNo)throws SQLException;
	public ResSmplDetailSmplCnfmInstVO selectResSmplDetailSmplCnfmInst(Map<String, Object> checkData)throws SQLException;
	
	
	// 진료요청 리스트
	public List<CnfrmDgnssListVO> selectCnfrmDgnssList(SmplSearchCommand cri)throws SQLException;
	public int selectCnfrmDgnssListCount(SmplSearchCommand cri)throws SQLException;
	public CnfrmDgnssWaitDetailVO selectCnfrmDgnssWaitDetail(Map<String, Object> cdwdData)throws SQLException;
	public CnfrmDgnssReqDetailVO selectCnfrmDgnssReqDetail(Map<String, Object> cdrdData)throws SQLException;
	
	
	// 확진자 및 자가격리자 리스트
	public List<CnfrmManageListVO> selectCnfrmManageList(SmplSearchCommand cri)throws SQLException;
	public int selectCnfrmManageListCount(SmplSearchCommand cri)throws SQLException;
	public int selectSlfManageListCount(SmplSearchCommand cri)throws SQLException;
	
	// 확진자 디테일
	public VPstiCommand selectCnfrmListDetailPsti(String manageNo)throws SQLException;
	public CnfmVO selectCnfrmListDetailCnfm(String manageNo)throws SQLException;
	public CnfrmListDetailManageInstVO selectCnfrmListDetailManage(String manageNo)throws SQLException;
	public SmplResultVO selectCnfrmListDetailSmpl(String manageNo)throws SQLException;
	public DgnssVO selectCnfrmListDetailDgnss(String manageNo)throws SQLException;
	// 음성환자 디테일
	public ResSmplDetailNegativeSmplInstVO selectResSmplDetailNegativeSmplInst(Map<String, Object> checkData)throws SQLException;
	
	
	// 자가격리자 디테일
	public VPstiCommand selectSlfptntDetailPsti(String manageNo)throws SQLException; 		
	public SlfptntDetailSmplCnfmVO selectSlfptntDetailSmplCnfm(String manageNo)throws SQLException; 		
	public SlfptntDetailDgnssHsptVO selectSlfptntDetailDgnssHspt(String manageNo)throws SQLException; 
	
	// 자가격리자 수정
	public int selfModifyRegist(PstiVO pstiVo)throws SQLException;
	
	
	// 시료 재검여부 확인
	public int selectCheckNewSmpl(Map<String, Object> checkData)throws SQLException;
	
	// 시료 결과 등록
	public int newSmplResultRegist(Map<String, Object> checkData)throws SQLException;
	// 신규 확진자 등록
	public int newCnfmResultRegist(Map<String, Object> checkData)throws SQLException;
	// 시료정보 업데이트
	public int smplUpdate(Map<String, Object> checkData)throws SQLException;
	// 기관정보 가져오기
	public InstVO selectInstData(String pbhtNo)throws SQLException;
	// manage - inst 업데이트
	public int updateManageInst(Map<String, Object> checkData)throws SQLException;
	// 양성 확진자 업데이트(신규X)
	public int cnfmUpdateY(Map<String, Object> checkData)throws SQLException;
	
	// 확진자 음성 count 확인
	public int selectCnfmNgtv(Map<String, Object> checkData)throws SQLException;
	
	// 확진자 음성 count 증가
	public int cnfmUpdateN(Map<String, Object> checkData)throws SQLException;
	// 확진자 완치처리
	public int cnfmCureUpdate(Map<String, Object> checkData)throws SQLException;
	public int manageSttusCodeUpdate(Map<String, Object> checkData)throws SQLException;
	public int slfptntCureUpdate(Map<String, Object> checkData)throws SQLException;
	public int inptntCureUpdate(Map<String, Object> checkData)throws SQLException;
	public int isoptntCureUpdate(Map<String, Object> checkData)throws SQLException;
	public String selectInstCode(Map<String, Object> checkData)throws SQLException;
	
	public String selectInstNo(Map<String, Object> checkData)throws SQLException;
	public int hsptRmndSckbdCntCheck(Map<String, Object> checkData)throws SQLException;
	public int ltctRmndSckbdCntCheck(Map<String, Object> checkData)throws SQLException;
	
	
	
	// 병원 북마크 리스트
	public List<DgnssHsptVO> selectDgnssHsptBookmarkList(SmplSearchCommand cri)throws SQLException;
	public int selectSerchDgnssHsptBookmarkListCount(SmplSearchCommand cri)throws SQLException;
	// 병원 디테일
	public DgnssHsptVO selectHsptDetail(String hsptNo)throws SQLException;
	// 나의 지역을 가져온다
	public String selectMyArea(String pbhtNo)throws SQLException;
	// 병원 전체 리스트
	public List<DgnssHsptVO> selectDgnssHsptAllList(SmplSearchCommand cri)throws SQLException;
	public int selectDgnssHsptAllListCount(SmplSearchCommand cri)throws SQLException;
	// 환자의 주소정보
	public PstiAdresVO selectPstiAdres(String manageNo)throws SQLException;
	
	// 진료요청을 위한 dgnss 시퀀스 넘버
	public String selectDgnssStatsSeq()throws SQLException;
	// 잔여병상 확인
	public int selectRmndSckbdCntCheck(String hsptNo)throws SQLException;
	// insert 진행
	public int hsptDgnssRegist(Map<String, Object> reqData)throws SQLException;
	public int hsptRmndSckbdCntMinus(Map<String, Object> reqData)throws SQLException;
	
	// 진료 요청리스트 목록
	public int dgnssReqListCount(SmplSearchCommand cri)throws SQLException;
	public List<CnfrmDgnssListVO> dgnssReqList(SmplSearchCommand cri)throws SQLException;
	// 진료 요청 디테일 (cnfrm, psti 정보는 재활용)
	public CnfrmDgnssHsptVO selectCnfrmDgnssHspt(String manageNo)throws SQLException;
	// 진료요청 취소 
	public int deleteDgnssReq(String dgnssNo)throws SQLException;
	public int manageSttusCodeUpdate(String manageNo)throws SQLException;
	public int hsptRmndSckbdCntPlus(String hsptNo)throws SQLException;
	
	// 연계기관 등록
	public int insertBookMarkRegist(Map<String, Object> data)throws SQLException;
	// 연계기관 등록 체크
	public int selectBookMark(Map<String, Object> data)throws SQLException;
	// 연계기관 삭제
	public int deleteBookMark(Map<String, Object> data)throws SQLException;
	
	// 보건소 통계(일주일 건수)
	public PbhtStatsCommand selectOneWeekPbhtStats(String pbhtNo)throws SQLException;  	
	// 보건소 통계(누적 건수)
	public PbhtStatsCommand selectAllPbhtStats(String pbhtNo)throws SQLException;
	// 통계 일자 가져오기(key값)
	public PbhtStatsDateCommand selectStatsDate(String pbhtNo)throws SQLException;
	// 통계 데이터 가져오기(양성 일주일 단위)
	public List<PbhtStatsWeekCommand> selectStatsWeek(String pbhtNo)throws SQLException;
	// 통계 데이터 가져오기(음성 일주일 단위)
	public List<PbhtStatsWeekCommand> selectStatsNegativeWeek(String pbhtNo)throws SQLException;
	
	
	
	
	// 신규 확진자 시퀀스넘버
	public int selectCnfmNextVal()throws SQLException;
	
	// 보건소통계시퀀스
	public String selectPbhtStatsSeq() throws SQLException;
	
	// 보건소고유번호리스트
	public List<String> selectAllPbhtNo() throws SQLException;
	
	// 보건소통계등록
	public void insertPbhtStats(PbhtStatsVO pbhtStats) throws SQLException;
	
	//보건소통계고유번호
	public String selectPbhtStatsNo(PbhtStatsVO pbhtStats) throws SQLException;
	
	//보건소통계업데이트
	public void updatePbhtStats(PbhtStatsVO pbhtStats) throws SQLException;
	
	//보건소 데이터백업 리스트
	public List<PbhtVO> selectPbhtBackup() throws SQLException;
	
	//매니지번호로 psti 이름 연락처 가져옴
	VPstiCommand selectPstiByManageNo(String manageNo) throws SQLException;
	
	
	
	
	
	
	
	
	
	
	
}











