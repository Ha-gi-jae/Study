package com.spring.compass.service;


import java.util.Date;
import java.util.List;
import java.util.Map;

import com.spring.compass.command.DgnssHsptVO;
import com.spring.compass.command.LtctIsoptntHighTempCardListVO;
import com.spring.compass.command.LtctRequestSmplVO;
import com.spring.compass.command.LtctSckbdCountAndStats;
import com.spring.compass.command.LtctSckbdreqOkCommand;
import com.spring.compass.command.LtctSearchCommand;
import com.spring.compass.command.LtctUpdateSckbdCntCommand;
import com.spring.compass.command.PstiAdresVO;
import com.spring.compass.vo.InspPstiVO;
import com.spring.compass.vo.InstVO;
import com.spring.compass.vo.IsoptntVO;
import com.spring.compass.vo.LtctBasicDetailVO;
import com.spring.compass.vo.LtctStatsVO;
import com.spring.compass.vo.LtctVO;
import com.spring.compass.vo.PbhtVO;

public interface LtctService {

	public LtctVO getLtctByInstNo(String instNo) throws Exception;
	
	public String getLtctCityNo(String city) throws Exception;
	
	public int getLtctSeqNo() throws Exception;
	
	public int getInstSeqNo() throws Exception;
	
	public void registLtct(LtctVO ltct) throws Exception;
	
	public void registInst(InstVO inst) throws Exception;
	
	public Map<String, Object> getIsoptntListPage(LtctSearchCommand cri) throws Exception;
	
	LtctBasicDetailVO getBasicDetail(String manageNo) throws Exception;
	
	public Map<String, Object> getResListPage(LtctSearchCommand cri) throws Exception;
	
	public Map<String, Object> getSckbdListPage(LtctSearchCommand cri) throws Exception;
	
	LtctBasicDetailVO getSckbdreqYmd(String manageNo) throws Exception;
	
	LtctSckbdCountAndStats getSckbdCountAndStats(String ltctNo) throws Exception;
	
	List<LtctIsoptntHighTempCardListVO> getIsoptntHighTempCardList(String ltctNo) throws Exception;
	
	void modifySckbdCnt(LtctUpdateSckbdCntCommand sckbd) throws Exception;
	
	public Map<String, Object> getBookmarkListPage(LtctSearchCommand cri) throws Exception;
	
	public Map<String, Object> getPbhtListPage(LtctSearchCommand cri) throws Exception;
	
	void modifySckbdreqReturn(String manageNo, String ltctNo) throws Exception;
	
	void registSckbdreqOk(LtctSckbdreqOkCommand sckbdreq) throws Exception;
	
	List<PbhtVO> getPbhtListByAreaNo(String areaNo) throws Exception;
	
	void registSmplByLtct(LtctRequestSmplVO smpl) throws Exception;
	
	public Map<String, Object> getHsptBookmarkList(LtctSearchCommand cri) throws Exception;
	public Map<String, Object> getHsptAllList(LtctSearchCommand cri, PstiAdresVO psti) throws Exception;
	
	public int setHsptDgnssRegist(Map<String, Object>reqData) throws Exception;
	public DgnssHsptVO getHsptDetail(String hsptNo) throws Exception;
	
	public List<LtctVO> getLtctBackupList() throws Exception;
	
	public List<String> getIsoptntNoList() throws Exception;
	
	public void modifyIsoptntBdtempByIsoptntNo(IsoptntVO isoptnt) throws Exception;
	
	public String getLtctStatsSeq() throws Exception;
	
	public List<String> getAllLtctNo() throws Exception;
	
	public void registLtctStats(LtctStatsVO ltctStats) throws Exception;
	
	Date getLtctInYmdByManageNo(String manageNo) throws Exception;
	
	InspPstiVO getModifyCancel(String pstiNo) throws Exception;
	
	void modifyPstiInfo(InspPstiVO psti) throws Exception;
	
	PstiAdresVO getPstiDetail(String manageNo) throws Exception;
	
	int setBookMark(Map<String, Object> data) throws Exception;
	
	int getBookMark(Map<String, Object> data) throws Exception;
	
	int removeBookMark(Map<String, Object> data) throws Exception;
	
	String getRmndSckbdCntByHsptNo(String hsptNo) throws Exception;
	
	int getDgnssTodayByManageNo(String manageNo) throws Exception;
	
	String getNgtvCntByManageNo(String manageNo) throws Exception;
	
}
