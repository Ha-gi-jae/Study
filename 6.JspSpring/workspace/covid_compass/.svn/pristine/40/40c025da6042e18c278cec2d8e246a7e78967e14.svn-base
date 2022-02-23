package com.spring.compass.service;

import java.util.Map;

import com.spring.compass.command.CnfrmDgnssReqDetailVO;
import com.spring.compass.command.CnfrmDgnssWaitDetailVO;
import com.spring.compass.command.CnfrmListDetailVO;
import com.spring.compass.command.DgnssHsptVO;
import com.spring.compass.command.PstiAdresVO;
import com.spring.compass.command.ResSmplDetailVO;
import com.spring.compass.command.SlfptntDetailVO;
import com.spring.compass.command.SmplListDetailVO;
import com.spring.compass.command.SmplSearchCommand;
import com.spring.compass.vo.PstiVO;

public interface PbhtServiceLMY extends PbhtService{

	public Map<String, Object> getSmplList(SmplSearchCommand cri)throws Exception;
	
	public Map<String, Object> getSmplResultList(SmplSearchCommand cri)throws Exception;
	
	public Map<String, Object> getCnfrmDgnssList(SmplSearchCommand cri, int displayPageNum)throws Exception;
	
	public Map<String, Object> getCnfrmManageList(SmplSearchCommand cri)throws Exception;
	
	public Map<String, Object> getDgnssHsptBookmarkList(SmplSearchCommand cri)throws Exception;
	
	public Map<String, Object> getDgnssHsptAllList(SmplSearchCommand cri, PstiAdresVO psti)throws Exception;
	public Map<String, Object> getHsptAllList(SmplSearchCommand cri, String areaNo)throws Exception;
	
	
	
	public SmplListDetailVO getSmplDetail(Map<String, Object> sldData)throws Exception;
	
	public CnfrmDgnssWaitDetailVO getCnfrmDgnssWaitDetail(Map<String, Object> cdwdData)throws Exception;
	
	public CnfrmDgnssReqDetailVO getCnfrmDgnssReqDetail(Map<String, Object> cdrdData)throws Exception;
	
	public CnfrmListDetailVO getCnfrmListDetail(String manageNo)throws Exception;
	
	public SlfptntDetailVO getSlfptntDetail(String manageNo)throws Exception;
	
	public ResSmplDetailVO getResSmplDetail(String manageNo, String typeCode, String smplNo)throws Exception;
						  
	public int setCheckSmplRegist(Map<String, Object> checkData)throws Exception;
	
	public int setHsptDgnssRegist(Map<String, Object> reqData)throws Exception;
	
	public DgnssHsptVO getHsptDetail(String hsptNo)throws Exception;
	
	public String setDgnssReqDelete(String dgnssNo, String manageNo, String hsptNo)throws Exception;
	
	public int setSelfModifyRegist(PstiVO pstiVo)throws Exception;
	
	public PstiAdresVO getPstiDatile(String manageNo)throws Exception;
	
	public int setBookMark(Map<String, Object> data)throws Exception;
	
	public int getBookMark(Map<String, Object> data)throws Exception;
	
	public int deleteBookMark(Map<String, Object> data)throws Exception;
	
	public Map<String, Object> getPbhtStats(String pbhtNo)throws Exception;
	
	public int getRmndSckbdCntCheck(String hsptNo)throws Exception;
	

	
}
