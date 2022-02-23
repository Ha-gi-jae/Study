package com.spring.compass.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.spring.compass.command.DgnssListSearchCommand;
import com.spring.compass.command.DgnssListVO;
import com.spring.compass.command.InptntListSearchCommand;
import com.spring.compass.command.InptntListVO;
import com.spring.compass.command.InstSearchCommand;
import com.spring.compass.command.LtctListToSckbdreqCommand;
import com.spring.compass.command.ReqInptntListCommand;
import com.spring.compass.command.SckbdreqHsptListCommand;
import com.spring.compass.command.SckbdreqLtctListCommand;
import com.spring.compass.vo.BookmarkVO;
import com.spring.compass.vo.DgnssResultVO;
import com.spring.compass.vo.DgnssVO;
import com.spring.compass.vo.HsptStatsVO;
import com.spring.compass.vo.HsptVO;
import com.spring.compass.vo.InptntVO;
import com.spring.compass.vo.InptntstatsVO;
import com.spring.compass.vo.InstVO;
import com.spring.compass.vo.IsoptntVO;
import com.spring.compass.vo.ManageVO;
import com.spring.compass.vo.PbhtVO;
import com.spring.compass.vo.PstiVO;
import com.spring.compass.vo.SckbdreqVO;
import com.spring.compass.vo.SlfptntVO;
import com.spring.compass.vo.SmplVO;

public interface HsptDAO {

	public HsptVO selectHsptByInstNo(String instNo) throws SQLException;

	public HsptVO selectHsptByHsptNo(String hsptNo) throws SQLException;

	public int selectInptntListCount(InptntListSearchCommand cri) throws SQLException;

	public List<InptntListVO> selectInptntList(InptntListSearchCommand cri) throws SQLException;

	public String selectHsptCityNo(String city) throws SQLException;

	public int selectHsptNextVal() throws SQLException;

	public int selectInstNextval() throws SQLException;

	public int insertHspt(HsptVO hspt) throws SQLException;

	public int insertInst(InstVO inst) throws SQLException;
	// 진료요청 목록을 보기 위한 메서드
	public List<DgnssListVO> selectDgnssList(DgnssListSearchCommand cri) throws SQLException;
	// 진료요청 목록을 보기 위한 메서드
	public int selectDgnssListCount(DgnssListSearchCommand cri) throws SQLException;

	// 승인대기 병상목록 개수
	public int selectReqInptntListCount(InptntListSearchCommand cri) throws SQLException;
	// 승인대기 병상목록
	public List<ReqInptntListCommand> selectReqInptntList(InptntListSearchCommand cri) throws SQLException;

	// 이원신청 목록
	public List<ReqInptntListCommand> selectSckbdReqHsptList(InptntListSearchCommand cri) throws SQLException;

	// 이원신청 수
	public int selectSckbdReqHsptListCount(InptntListSearchCommand cri) throws SQLException;

	// 입소신청 목록
	public List<SckbdreqLtctListCommand> selectSckbdReqLtctList(InptntListSearchCommand cri) throws SQLException;

	// 입소신청 수
	public int selectSckbdReqLtctListCount(InptntListSearchCommand cri) throws SQLException;

	// 북마크 한 기관번호 목록 가져오기
	// #{fromInstNo}
	public List<String> selectToInstNoListByFromInstNo(String fromInstNo) throws SQLException;
	
	// 북마크 한 병원목록
	public List<SckbdreqHsptListCommand> selectBookmarkHsptList(String hsptNo, InstSearchCommand cri) throws SQLException;

	// 북마크한 병원 수
	public int selectBookmarkHsptListCount(String hsptNo) throws SQLException;

	// 잔여병상수가 양수인 전체 병원목록
	public List<SckbdreqHsptListCommand> selectHsptListWithRmndSckbd(InstSearchCommand cri) throws SQLException;
	
	// 잔여병상수가 양수인 전체 병원 수
	public int selectHsptListWithRmndSckbdCount(InstSearchCommand cri) throws SQLException;

	// 북마크 한 생활치료센터목록
	public List<LtctListToSckbdreqCommand> selectBookmarkLtctList(String hsptNo, InstSearchCommand cri) throws SQLException;
	
	// 북마크한 생활치료센터 수
	public int selectBookmarkLtctListCount(String hsptNo) throws SQLException;
	
	// 잔여병상수가 양수인 전체 생활치료센터목록
	public List<LtctListToSckbdreqCommand> selectLtctListWithRmndSckbd(InstSearchCommand cri) throws SQLException;
	
	// 잔여병상수가 양수인 전체 생활치료센터 수
	public int selectLtctListWithRmndSckbdCount(InstSearchCommand cri) throws SQLException;
	
	// 병상수정
	public int updateSckbdModify(HsptVO hspt) throws SQLException;
	
	// 보건소 목록 지역번호 검색
	public List<PbhtVO> selectPbhtListByAreaNo(String areaNo) throws SQLException;
	
	// businsess logic
	
	// 소속기관, sttusCode 모두 변경
	// #{sttusCode} #{instNm} #{instNo} #{manageNo}
	public int updateManageChangeAll(ManageVO manage) throws SQLException;
	
	// sttusCode만 변경
	// #{sttusCode} #{manageNo}
	public int updateManageChangeStatus(ManageVO manage) throws SQLException;
	
	// 소속기관만 변경, 이원신청 승인시 호출
	// #{instNm} #{instNo} #{manageNo}
	public int updateManageChangeInst(ManageVO manage) throws SQLException;
	
	// 진료결과 등록
	// #{dgnssNo} #{dgnssResultCode} #{dgnssNote}
	public int insertDgnssResult(DgnssResultVO dgnssResult) throws SQLException;
	
	// 입원환자 등록
	// #{inpntNo} #{hsptNo} #{manageNo}
	public int insertInptnt(InptntVO inptnt) throws SQLException;
	
	// 진료 테이블의 진료코드를 진료완료를 나타내는 G102로 바꿈
	// #{dgnssNo}
	public int updateDgnssCodeChkd(String dgnssNo) throws SQLException;
	
	// 병상신청 등록 이원신청과 입소신청 모두 이 메서드를 이용함
	// #{sckbdreqNo} #{type} #{childNo} #{hsptNo} #{manageNo} #{requestCode} #{hsptNm}
	public int insertSckbdreq(SckbdreqVO sckbdreq) throws SQLException;
	
	// 잔여병상수 1만큼 증가
	// #{hsptNo}
	public int updateIncreaseRmndSckbdCntByHsptNo(String hsptNo) throws SQLException;
	
	// 잔여병상수 1만큼 감소
	// #{hsptNo}
	public int updateDecreaseRmndSckbdCntByHsptNo(String hsptNo) throws SQLException;
	
	// 잔여병상수 1만큼 증가
	// #{ltctNo}
	public int updateIncreaseRmndSckbdCntByLtctNo(String ltctNo) throws SQLException;
	
	// 잔여병상수 1만큼 감소
	// #{ltctNo}
	public int updateDecreaseRmndSckbdCntByLtctNo(String ltctNo) throws SQLException;
	
	// 자가격리 환자 등록
	// #{slfptntNo} #{pbhtNo} #{manageNo}
	public int insertSlfptnt(SlfptntVO slfptnt) throws SQLException;

	// 입소자 퇴원처리
	// #{hsptlzCode} #{isoptntNo}
	public int updateIsoptntExit(IsoptntVO inptnt) throws SQLException;
	
	// 입원환자 재검신청
	// #{smplNo} #{manageNo} #{pbhtNo} #{instNo}
	public int insertSmpl(SmplVO smpl) throws SQLException;
	
	// 입원환자 개인정보수정
	// #{pstiNm} #{pstiTelno} #{pstiAdres} #{symptms} #{areaNo} #{pstiNo}
	public int updateInptntInfo(PstiVO psti) throws SQLException;

	// 병상신청 신청상태구분코드 수정 (승인대기(취소가능), 승인대기(취소불가), 승인, 취소, 반려, 자가처리)만 수정
	// #{sckbdreqNo} #{sckbdreqCode}
	public int updateSckbdreqCodeOnly(SckbdreqVO sckbdreq) throws SQLException;

	// 병상신청 상태수정 입원결정 (신청상태구분 승인결정 및 병상신청승인날짜 갱신)
	// #{sckbdreqNo} #{sckbdreqCode} #{acceptYmd}
	public int updateSckbdreqAccept(SckbdreqVO sckbdreq) throws SQLException;
	
	// 입원환자 퇴원처리
	// #{hsptlzCode} #{inptntNo}
	public int updateInptntExit(InptntVO inptnt) throws SQLException;
	
	//병원통계 시퀀스
	//#{hsptstatsNo}
	public String selectHsptStatsSeq() throws SQLException;
	
	//병원 전체 고유번호
	//#{hsptNo}
	public List<String> selectAllHsptNo() throws SQLException;
	
	//병원통계 등록
	public void insertHsptStats(HsptStatsVO hsptStats) throws SQLException;
	
	// 북마크 등록
	// #{fromInstNo} #{toInstNo} #{fromInstCode} #{toInstCode}
	public int insertBookmark(BookmarkVO bookmark) throws SQLException;
	
	// 금일 퇴원(이원)자수
	public int selectOutCnt(InptntstatsVO inptnt) throws SQLException;
	
	// 금일 사망자수
	public int selectDeathCnt(InptntstatsVO inptnt) throws SQLException;

	// 금일 퇴원(완치)자 수
	public int selectRlsedCnt(InptntstatsVO inptnt) throws SQLException;
	
	// 금일 입원자수
	public int selectCurInptntCnt(InptntstatsVO inptnt) throws SQLException;
	
	// 현재 입원중인 환자수
	public int selectAllInptntCnt(String hsptNo) throws SQLException;
	
	// 잔여병상수
	public int selectRmndSckbdCnt(String hsptNo) throws SQLException;
	
	// 총병상수
	public int selectSckbdCnt(String hsptNo) throws SQLException;
	
	// 병원통계고유번호
	public String selectHsptStatusNo(HsptStatsVO hsptstats) throws SQLException;
	
	// 병원통계업데이트
	
	public void updateHsptStats(HsptStatsVO hsptstats) throws SQLException;
	
	// 쿼리를 통한 병원통계 업데이트
	public void updateHsptStatsByQuery(HsptStatsVO hsptstats) throws SQLException;
	
	// 진료수 업데이트
	public void updateHsptStatsDgnssCnt(HsptStatsVO hsptstats) throws SQLException;
	
	// 이원신청 업데이트
	public void updateHsptStatsReqSckbdCnt(HsptStatsVO hsptstats) throws SQLException;
	
	// 입원수 업데이트
	public void updateHsptStatsInptntCnt(HsptStatsVO hsptstats) throws SQLException;
	
	// 입소신청 업데이트
	public void updateHsptStatsGoLtctCnt(HsptStatsVO hsptstats) throws SQLException;
	
	// 자가격리수 업데이트
	public void updateHsptStatsGoSlfCnt(HsptStatsVO hsptstats) throws SQLException;
	
	// 퇴원(이원)수 업데이트
	public void updateHsptStatsOutCnt(HsptStatsVO hsptstats) throws SQLException;
	
	// 퇴원(사망)수 업데이트
	public void updateHsptStatsDeathCnt(HsptStatsVO hsptstats) throws SQLException;
	
	// 퇴원(완치)수 업데이트
	public void updateHsptStatsRlsedCnt(HsptStatsVO hsptstats) throws SQLException;
	
	// 퇴원(사망)
	// #{inptntNo}
	public int updateExpireExit(String inptntNo) throws SQLException;
	
	// 진료상태 수정
	// #{dgnssNo} #{dgnssCode}
	public int updateDgnss(DgnssVO dgnss) throws SQLException;
	
	//병원 데이터백업 리스트
	public List<HsptVO> selectHsptBackupList() throws SQLException;
	
	// 병상수 수정
	// #{hsptNo} #{rmndSckbdCnt} #{sckbdCnt}
	public int updateSckbdCnt(HsptVO hspt) throws SQLException;
	
	// 병원 메인 7일간 통계
	// DEATH_CNT ,OUT_CNT ,RLSED_CNT ,DGNSS_CNT
    // ,REQ_SCKBD_CNT ,INPTNT_CNT ,GO_LTCT_CNT
    // ,GO_SLF_CNT 
	// #{hsptNo}
	public HsptStatsVO selectHsptMainStatisticsByHsptNo(String hsptNo) throws SQLException;
	
	// 지난 7일간 병원 통계 List로 가져오기 
	// #{hsptNo}
	public List<HsptStatsVO> selectHsptMainChartDataByHsptNo(String hsptNo) throws SQLException;

	// 북마크 개수 가져오기
	// #{fromInstNo} #{toInstNo}
	public int selectBookmarkCount(BookmarkVO bookmark) throws SQLException;

	// 북마크 지우기
	// #{fromInstNo} #{toInstNo}
	public int deleteBookMark(BookmarkVO bookmark) throws SQLException;
	
	// 오늘 재검요청을 했는지 ?
	int selectSmplTodayByManageNo(Map<String, Object> data) throws SQLException;
	
	// 금일 신청한, 승인대기중인 입소자 재검신청이 있는지
	int selectSckbdreqTodayByManageNo(String manageNo) throws SQLException;
}
