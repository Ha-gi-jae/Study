package com.spring.compass.service;

import java.util.List;
import java.util.Map;

import com.spring.compass.command.DgnssListSearchCommand;
import com.spring.compass.command.InptntListSearchCommand;
import com.spring.compass.command.InstSearchCommand;
import com.spring.compass.vo.BookmarkVO;
import com.spring.compass.vo.DgnssResultVO;
import com.spring.compass.vo.HsptStatsVO;
import com.spring.compass.vo.HsptVO;
import com.spring.compass.vo.PbhtVO;
import com.spring.compass.vo.PstiVO;

public interface HsptSerivceLKH extends HsptService{

	public HsptVO getHsptByHsptNo(String hsptNo) throws Exception;
	
	// 진료환자 목록
	public  Map<String, Object> getDgnssList(DgnssListSearchCommand cri) throws Exception;
	
	// 입원환자 목록
	public Map<String, Object> getInptntList(InptntListSearchCommand cri) throws Exception;
	
	// 승인대기 병상목록
	public Map<String, Object> getReqInptntList(InptntListSearchCommand cri) throws Exception;
	
	// 이원신청 목록
	public Map<String, Object> getSckbdreqHsptList(InptntListSearchCommand cri) throws Exception;
	
	// 입소신청 목록
	public Map<String, Object> getSckbdreqLtctList(InptntListSearchCommand cri) throws Exception;
	
	// 북마크 병원목록
	public Map<String, Object> getBookmardHsptList(InstSearchCommand cri, String hsptNo) throws Exception;
	
	// 전체 병원목록 (잔여병상수 > 0)
	public Map<String, Object> getAllHsptList(InstSearchCommand cri) throws Exception;

	// 북마크 생활치료센터목록
	public Map<String, Object> getBookmardLtctList(InstSearchCommand cri, String hsptNo) throws Exception;
	
	// 전체 생활치료센터목록 (잔여병상수 > 0)
	public Map<String, Object> getAllLtctList(InstSearchCommand cri) throws Exception;
	
	// 북마크 한 모든 기관번호목록
	public List<String> getToInstNoListByFromInstNo(String fromInstNo) throws Exception;
	
	// 지역번호가 같은 보건소 목록 조회
	public List<PbhtVO> getPbhtListByAreaNo(String areaNo) throws Exception;
	
	// 메인화면 차트 모듈에서 사용할 데이터 구성하여 보내기
	public Map<String, Object> getMainChartDataMap(String hsptNo) throws Exception;
	
	/**
	 *  입원환자 사망처리                                                                 
	 * -------------------------------------------------                          
	 *  update	manage				|	#{sttusCode} #{manageNo}                 
	 * 			inptnt				|	#{inptntNo}	                             
	 * --------------------------------------------------	                     
	 * 
	 * @param manageNo
	 * @return
	 * @throws Exception
	 */
	public String modifyInptntExpired(String manageNo) throws Exception;
	
	/**
	 *  병상 등록                                                                          
	 * -------------------------------------------------                               
	 *  update	hspt				|	#{hsptNo} #{rmndSckbdCnt} #{sckbdCnt}         
	 * --------------------------------------------------	                          
	 * 
	 * @param hspt
	 * @return
	 * @throws Exception
	 */
	public String modifySckbdCntLKH(HsptVO hspt) throws Exception;
	
	// 메인 7일간 합계
	public HsptStatsVO getHsptMainStatisticsByHspt(HsptVO loginHspt) throws Exception;
	
	/**
	 * # : 컨트롤러 단에서 넘어오는 파라미터
	 * regist - 접두사
	 * ByDgnss : 신규환자
	 * ByInptnt : 입원환자
	 * ByIsoptnt : 입소환자
	 * ByAll : 모든 환자
	 * SckbdreqInptnt : 병원에서 병원으로 병상신청함
	 * SckbdreqIsoptnt : 병원에서 생활치료센터로 병상신청함
	 * ToInptnt : 병원에서 병원으로 병상신청
	 * ToIsoptnt : 병원에서 생활치료센터로 병상신청
	 * Cancle : 병상신청 취소
	 * Accept : 병상신청 승인
	 * Reject : 병상신청 반려
	 * regist 뒤에 붙는 단어 : 테이블명
	 * 
	 * ---------------------------------------------------------------
	 * update	manage				|	#{sttusCode} #{instNm} #{instNo} #{manageNo} 								: 소속기관 및 상태수정
	 * update	manage				|	#{instNm} #{instNo} #{manageNo}												: 소속기관만 수정
	 * update	manage				|	#{sttusCode} #{manageNo}													: 상태만 수정
	 * update	dgnss				|	#{dgnssNo}																	: 검사완료 상태로 수정
	 * update	hspt				|	#{hsptNo}																	: 잔여병상수 수정 (증가 혹은 감소)
	 * update	ltct				|	#{ltctNo}																	: 잔여병상수 수정 (증가 혹은 감소)
	 * update	inptnt				|	#{hsptlzCode} #{inptntNo}													: 입원상태 변경(퇴원)
	 * update	isoptnt				|	#{hsptlzCode} #{isoptntNo}													: 입소상태 변경(퇴원)
	 * update	psti				|	#{pstiNm} #{pstiTelno} #{pstiAdres} #{symptms} #{areaNo} #{pstiNo}			: 입원환자 정보수정
	 * update	sckbdreq			|	#{sckbdreqNo} #{sckbdreqCode} #{acceptYmd}									: 병상신청 상태변경(승인)
	 * update	sckbdreq			|	#{sckbdreqNo} #{sckbdreqCode} 												: 병상신청 상태변경(취소 혹은 반려)
	 * insert	inptnt				|	#{inpntNo} #{hsptNo} #{manageNo}											: 입원환자 등록
	 * insert	dgnss_result		|	#{dgnssNo} #{dgnssResultCode} #{dgnssNote}									: 진료결과 등록
	 * insert	sckbdreq			|	#{sckbdreqNo} #{type} #{childNo} #{hsptNo} #{manageNo} #{requestCode}		: 병상신청 등록
	 * insert	slfptnt				|	#{slfptntNo} #{pbhtNo} #{manageNo}											: 자가격리자 등록
	 * insert	smpl				|	#{smplNo} #{manageNo} #{pbhtNo} #{instNo}									: 재검신청 등록
	 * ---------------------------------------------------------------
	 */
	
	
	
	/*
	 *	읽기 예 : 입원환자를 등록하고 진료결과를 등록한다. 소속기관을 진료완료 병원으로 바꾸고 검사레코드를 검사완료 상태로 수정한다. 
	 */

	/**
	 *  보건소에서 요청한 신규환자를 진료하고 바로 입원시키는 메서드                                                   
	 * -------------------------------------------------                                    
	 *  insert	inptnt				|	#{inpntNo} #{hsptNo} #{manageNo}                   
	 * 			dgnss_result		|	#{dgnssNo} #{dgnssResultCode} #{dgnssNote}         
	 *  update	manage				|	#{sttusCode} #{instNm} #{instNo} #{manageNo}       
	 * 			dgnss				|	#{dgnssNo}                                         
	 * --------------------------------------------------                                   
	 * 
	 * @param dgnssResult
	 * @param loginHspt
	 * @return
	 * @throws Exception
	 */
	public String registInptntByDgnss(DgnssResultVO dgnssResult, HsptVO loginHspt) throws Exception;
	
	/**
	 *  보건소에서 요청한 신규환자를 진료하고 이원신청하는 메서드                                                                          
	 * -------------------------------------------------                                                         
	 *  insert	sckbdreq			|	#{sckbdreqNo} #{type} #{childNo} #{hsptNo} #{manageNo} #{requestCode}   
	 * 			dgnss_result		|	#{dgnssNo} #{dgnssResultCode} #{dgnssNote}                              
	 *  update	manage				|	#{sttusCode} #{instNm} #{instNo} #{manageNo}                            
	 * 			dgnss				|	#{dgnssNo}                                                              
	 * 			hspt				|	#{hsptNo}                                                               
	 * --------------------------------------------------                                                        
	 * 
	 * @param dgnssResult
	 * @param loginHspt
	 * @param toHsptNo
	 * @return
	 * @throws Exception
	 */
	public String registSckbdreqInptntByDgnss(DgnssResultVO dgnssResult, HsptVO loginHspt, String toHsptNo) throws Exception;
	
	/**
	 *  보건소에서 요청한 신규환자를 진료하고 입소신청하는 메서드                                                                            
	 * -------------------------------------------------                                                           
	 *  insert	sckbdreq			|	#{sckbdreqNo} #{type} #{childNo} #{hsptNo} #{manageNo} #{requestCode}     
	 * 			dgnss_result		|	#{dgnssNo} #{dgnssResultCode} #{dgnssNote}                                
	 *  update	manage				|	#{sttusCode} #{instNm} #{instNo} #{manageNo}                              
	 * 			dgnss				|	#{dgnssNo}                                                                
	 * 			ltct				|	#{ltctNo}                                                                 
	 * --------------------------------------------------	                                                      
	 * 
	 * @param dgnssResult
	 * @param loginHspt
	 * @param toLtctNo
	 * @return
	 * @throws Exception
	 */
	public String registSckbdreqIsoptntByDgnss(DgnssResultVO dgnssResult, HsptVO loginHspt, String toLtctNo) throws Exception;
	
	/**
	 *  보건소에서 요청한 신규환자를 진료하고 자가격리처리하는 메서드                                                      
	 * -------------------------------------------------                                       
	 *  insert	slfptnt				|	#{slfptntNo} #{pbhtNo} #{manageNo}                    
	 * 			dgnss_result		|	#{dgnssNo} #{dgnssResultCode} #{dgnssNote}            
	 *  update	manage				|	#{sttusCode} #{manageNo}                              
	 * 			dgnss				|	#{dgnssNo}                                            
	 * 			hspt				|	#{hsptNo}	                                          
	 * --------------------------------------------------	                                  
	 * 
	 * @param dgnssResult
	 * @param loginHspt
	 * @return
	 * @throws Exception
	 */
	public String registSlfptntByDgnss(DgnssResultVO dgnssResult, HsptVO loginHspt) throws Exception;
	
	/**
	 *  생활치료센터에서 요청한 환자를 진료하고 별도의 사후처리를 하지 않는 메서드                                                   
	 * -------------------------------------------------                                            
	 *  insert	dgnss_result		|	#{dgnssNo} #{dgnssResultCode} #{dgnssNote}                 
	 *  update	dgnss				|	#{dgnssNo}                                                 
	 * 			hspt				|	#{hsptNo}	                                               
	 * --------------------------------------------------	                                       
	 * 
	 * @param dgnssResult
	 * @param loginHspt
	 * @return
	 * @throws Exception
	 */
	public String registDgnssResultByIsoptnt(DgnssResultVO dgnssResult, HsptVO loginHspt) throws Exception;
	
	/**
	 *  생활치료센터에서 요청한 환자를 진료하고 이원신청하는 메서드                                                                               
	 * -------------------------------------------------                                                               
	 *  insert	sckbdreq			|	#{sckbdreqNo} #{type} #{childNo} #{hsptNo} #{manageNo} #{requestCode}         
	 * 			dgnss_result		|	#{dgnssNo} #{dgnssResultCode} #{dgnssNote}                                    
	 *  update	manage				|	#{sttusCode} #{instNm} #{instNo} #{manageNo}                                  
	 * 			dgnss				|	#{dgnssNo}                                                                    
	 * 			ltct				|	#{ltctNo}                                                                     
	 * 			isoptnt				|	#{hsptlzCode} #{isoptntNo}                                                    
	 * 			hspt				|	#{hsptNo}                                                                     
	 * --------------------------------------------------                                                              
	 * 
	 * @param dgnssResult
	 * @param loginHspt
	 * @param toHsptNo
	 * @param fromLtctNo
	 * @return
	 * @throws Exception
	 */
	public String registSckbdreqInptntByIsoptnt(DgnssResultVO dgnssResult, HsptVO loginHspt,  String toHsptNo,  String fromLtctNo) throws Exception;
	
	/**
	 *  생활치료센터에서 진료요청한 환자를 진료하고 입원처리하는 메서드                                                                 
	 * -------------------------------------------------                                                   
	 *  insert	inptnt				|	#{inpntNo} #{hsptNo} #{manageNo}                                  
	 * 			dgnss_result		|	#{dgnssNo} #{dgnssResultCode} #{dgnssNote}                        
	 *  update	manage				|	#{sttusCode} #{instNm} #{instNo} #{manageNo}                      
	 * 			dgnss				|	#{dgnssNo}                                                        
	 * 			ltct				|	#{ltctNo}                                                         
	 * 			isoptnt				|	#{hsptlzCode} #{isoptntNo}                                        
	 * --------------------------------------------------                                                  
	 * 
	 * @param dgnssResult
	 * @param loginHspt
	 * @param fromLtctNo
	 * @return
	 * @throws Exception
	 */
	public String registInptntByIsoptnt(DgnssResultVO dgnssResult, HsptVO loginHspt, String fromLtctNo) throws Exception;

	/**
	 *  입원환자를 재검신청하는 메서드                                                                            
	 * -------------------------------------------------                                            
	 *  insert	smpl				|	#{smplNo} #{manageNo} #{pbhtNo} #{instNo}                  
	 * --------------------------------------------------	                                       
	 * 
	 * @param hsptNo
	 * @param pbhtNo
	 * @param manageNo
	 * @return
	 * @throws Exception
	 */
	public String registSmplByInptnt(String hsptNo, String pbhtNo, String manageNo) throws Exception;
	public String registSmplByInptnt(String hsptNo, String pbhtNo, String[] manageNoList) throws Exception;
	
	/**
	 *  입원환자를 수정하는 메서드, Controller단에서 필요한 모든 내용을 받아서(InptntUpdateCommand -> toPsti()) PstiVO를 생성하여 서비스에 넘겨준다.                                          
	 * -------------------------------------------------                                                                                               
	 *  update	psti				|	#{pstiNm} #{pstiTelno} #{pstiAdres} #{symptms} #{areaNo} #{pstiNo}                                            
	 * --------------------------------------------------	                                                                                          
	 * 
	 * @param psti
	 * @return
	 * @throws Exception
	 */
	public String modifyInptntInfo(PstiVO psti) throws Exception;
	
	/**
	 *  입원중 환자를 이원신청하는 메서드                                                                                                  
	 * -------------------------------------------------                                                                    
	 *  insert	sckbdreq			|	#{sckbdreqNo} #{type} #{childNo} #{hsptNo} #{manageNo} #{requestCode}              
	 *  update	hspt				|	#{hsptNo}                                                                          
	 * --------------------------------------------------	    
	 *                                                            
	 * @param toHsptNo
	 * @param loginHspt
	 * @param manageNo
	 * @return
	 * @throws Exception
	 */
	public String registSckbdreqInptntByInptnt(String toHsptNo, HsptVO loginHspt, String manageNo) throws Exception;
	
	/**
	 *  입원중이나 입소중이 아닌 확진자의 (보건소 - 진료완료 - 이원신청 flow) 병상신청을 승인하는 메서드                                           
	 * -------------------------------------------------                                                     
	 *  insert	inptnt				|	#{inpntNo} #{hsptNo} #{manageNo}                                    
	 *  update	manage				|	#{sttusCode} #{instNm} #{instNo} #{manageNo}                        
	 * 			sckbdreq			|	#{sckbdreqNo} #{sckbdreqCode} #{acceptYmd}                          
	 *  			hspt				|	#{hsptNo}	                                                        
	 * --------------------------------------------------	                                                
	 * 
	 * @param manageNo
	 * @param sckbdreqNo
	 * @param loginHspt
	 * @return
	 * @throws Exception
	 */
	public String registInptntAcceptedByDgnss(String manageNo, String sckbdreqNo, HsptVO loginHspt) throws Exception;

	/**
	 *  입원환자의 이원신청을 승인하는 메서드                                                                    
	 * -------------------------------------------------                                        
	 *  insert	inptnt				|	#{inpntNo} #{hsptNo} #{manageNo}                       
	 *  update	manage				|	#{instNm} #{instNo} #{manageNo}                        
	 * 			sckbdreq			|	#{sckbdreqNo} #{sckbdreqCode} #{acceptYmd}             
	 * 			inptnt				|	#{hsptlzCode} #{inptntNo}                              
	 * 			hspt				|	#{hsptNo}	                                           
	 * --------------------------------------------------                                       
	 * 
	 * @param manageNo
	 * @param sckbdreqNo
	 * @param loginHspt
	 * @return
	 * @throws Exception
	 */
	public String registInptntAcceptedByInptnt(String manageNo, String sckbdreqNo, HsptVO loginHspt) throws Exception;
	
	/**
	 *  입소중환자의 이원신청을 승인하는 메서드, (생활치료센터 - 진료 - 진료완료 후 이원신청 - 이원대상병원 입원처리 flow)                                              
	 * -------------------------------------------------                                                                   
	 *  insert	inptnt				|	#{inpntNo} #{hsptNo} #{manageNo}                                                  
	 *  update	manage				|	#{instNm} #{instNo} #{manageNo}                                                   
	 * 			sckbdreq			|	#{sckbdreqNo} #{sckbdreqCode} #{acceptYmd}                                        
	 * 			isoptnt				|	#{hsptlzCode} #{isoptntNo}                                                        
	 * 			hspt				|	#{hsptNo}	                                                                      
	 * 			ltct				|	#{ltctNo}	                                                                      
	 * --------------------------------------------------                                                                  
	 * 
	 * @param manageNo
	 * @param sckbdreqNo
	 * @param loginHspt
	 * @param fromLtctNo
	 * @return
	 * @throws Exception
	 */
	public String registInptntAccetedByIsoptnt(String manageNo, String sckbdreqNo, HsptVO loginHspt, String fromLtctNo) throws Exception;
	
	/**
	 *  이원신청을 반려하는 메서드                                                
	 *  (보건소 - 진료 - 진료완료 후 이원신청 - 반려 flow)                            
	 *  (생활치료센터 - 진료 - 진료완료 후 이원신청 - 반려 flow)                         
	 *  (입원환자 - 이원신청 - 반려 flow)                                       
	 * -------------------------------------------------              
	 *  update	sckbdreq			|	#{sckbdreqNo} #{sckbdreqCode}
	 * 			hspt				|	#{hsptNo}	                 
	 * --------------------------------------------------             
	 * 
	 * @param sckbdreqNo
	 * @param loginHspt
	 * @return
	 * @throws Exception
	 */
	public String updateSckbdreqRejectByInptnt(String sckbdreqNo, HsptVO loginHspt) throws Exception;
	
	/**
	 *  병원으로 신청한 이원신청을 취소하는 메서드                                        
	 * -------------------------------------------------               
	 *  update	sckbdreq			|	#{sckbdreqNo} #{sckbdreqCode} 
	 * 			hspt				|	#{hsptNo}	                  
	 * --------------------------------------------------              
	 * 
	 * @param sckbdreqNo
	 * @param toHsptNo
	 * @return
	 * @throws Exception
	 */
	public String updateSckbdreqCancleToInptnt(String sckbdreqNo, String toHsptNo) throws Exception;
	
	/**
	 *  생활치료센터로 신청한 입소신청을 취소하는 메서드                                      
	 * -------------------------------------------------                
	 *  update	sckbdreq			|	#{sckbdreqNo} #{sckbdreqCode}  
	 * 			ltct				|	#{ltctNo}	                   
	 * --------------------------------------------------               
	 * @param sckbdreqNo
	 * @param toLtctNo
	 * @return
	 * @throws Exception
	 */
	public String updateSckbdreqCancleToIsoptnt(String sckbdreqNo, String toLtctNo) throws Exception;
	
	/**
	 *  연계기관을 등록하는 메서드                                                                             
	 * -------------------------------------------------                                           
	 *  insert	bookmark			|	#{fromInstNo} #{toInstNo} #{fromInstCode} #{toInstCode}   
	 * --------------------------------------------------                                          
	 * 
	 * @param bookmark
	 * @return
	 * @throws Exception
	 */
	public String registBookmark(BookmarkVO bookmark) throws Exception;
	
	/**
	 *  이원신청이 반려된 환자 혹은 이원신청을 취소한 환자를 입원처리하는 메서드                                      
	 *  보건소 -> 병원(진료완료) -> 이원신청 -> 반려 -> 입원처리 flow                                    
	 *  생활치료센터 -> 병원(진료완료) -> 이원신청 -> 반려 -> 입원처리 flow                                 
	 * -------------------------------------------------                              
	 *  insert	inptnt				|	#{sckbdreqNo} #{sckbdreqCode}                
	 *  update	manage				|	#{sttusCode} #{instNm} #{instNo} #{manageNo} 
	 *  			sckbdreq			|	#{sckbdreqNo} #{sckbdreqCode}                
	 * --------------------------------------------------                             
	 * @param sckbdreqNo
	 * @param manageNo
	 * @param loginHspt
	 * @return
	 * @throws Exception
	 */
	public String registInptntByRejectedOrCancledDgnssOrIsoPtnt(String sckbdreqNo, String manageNo, HsptVO loginHspt) throws Exception;
	
	/**
	 *  반려 혹은 취소된 이원신청을 다시 이원신청하는 메서드                                                                                                            
	 *  보건소 -> 병원(진료완료) -> 이원신청 -> 반려 -> 이원신청 flow                                                                                  
	 *  입원환자 -> 이원신청 -> 반려 -> 이원신청 flow                                                                                                
	 *  생활치료센터 -> 병원(진료완료) -> 이원신청 -> 반려 -> 이원신청 flow                                                            
	 *  보건소 -> 병원(진료완료) -> 이원신청 -> 취소 -> 이원신청 flow                                                              
	 *  입원환자 -> 이원신청 -> 취소 -> 이원신청 flow                                                                         
	 *  생활치료센터 -> 병원(진료완료) -> 이원신청 -> 취소 -> 이원신청 flow                                                           
	 * -------------------------------------------------                                                        
	 *  insert	sckbdreq			|	#{sckbdreqNo} #{type} #{childNo} #{hsptNo} #{manageNo} #{requestCode}  
	 *  update	hspt				|	#{hsptNo}                                                              
	 * --------------------------------------------------                                                       

	 * @param sckbdreqNo
	 * @param manageNo
	 * @param loginHspt
	 * @param toHsptNo
	 * @return
	 * @throws Exception
	 */
	public String registSckbdreqInptntByRejectedOrCancledAll(String sckbdreqNo, String manageNo, HsptVO loginHspt, String toHsptNo) throws Exception;
	
	/**
	 *  반려 혹은 취소된 입소신청을 다시 입소신청하는 메서드                                                                             
	 *  보건소 -> 병원(진료완료) -> 입소신청 -> 반려 -> 입소신청 flow                                                                
	 *  보건소 -> 병원(진료완료) -> 입소신청 -> 취소 -> 입소신청 flow                                                                
	 * -------------------------------------------------                                                          
	 *  insert	sckbdreq			|	#{sckbdreqNo} #{type} #{childNo} #{hsptNo} #{manageNo} #{requestCode}    
	 *  update	ltct				|	#{ltctNo}                                                                
	 * --------------------------------------------------                                                         
	 * 
	 * @param sckbdreqNo
	 * @param manageNo
	 * @param loginHspt
	 * @param toLtctNo
	 * @return
	 * @throws Exception
	 */
	public String registSckbdreqIsoptntByRejectedOrCancledDgnss(String sckbdreqNo, String manageNo, HsptVO loginHspt, String toLtctNo) throws Exception;

	
	/**
	 * 북마크의 fromInstNo와 toInstNo을 받아서 해당하는 북마크의 개수를 리턴하는 메서드            
	 * select	bookmark			|	#{fromInstNo}	#{toInstNo}     
	 * @param bookmark
	 * @return
	 * @throws Exception
	 */
	public int getBookmarkCount(BookmarkVO bookmark) throws Exception;

	// 북마크를 해제하는 메서드
	public int removeBookMark(BookmarkVO bookmark) throws Exception;

	// 금일 신청한, 승인대기 병상의 개수
	public int getSckbdreqTodayByManageNo(String manageNo) throws Exception;
	
}
