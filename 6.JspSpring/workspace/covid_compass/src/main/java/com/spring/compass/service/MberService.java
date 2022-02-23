package com.spring.compass.service;

import java.util.Map;

import com.spring.compass.command.MberManageCommand;
import com.spring.compass.vo.MberVO;

public interface MberService {

	MberVO getMember(String mberId) throws Exception;
	
	MberVO getInfo(MberVO mber) throws Exception;
	
	void modifyPwd(MberVO mber) throws Exception;
	
	public String getMberSeq() throws Exception;
	
	public void registMberRepresent(MberVO mber) throws Exception;
	
	public void modifyInfo(MberVO mber) throws Exception;
	
	MberVO getDetailByMberNo(String mberNo) throws Exception;
	
	public Map<String, Object> getManageList(MberManageCommand cri) throws Exception;
	
	public int registMber(MberVO mber) throws Exception;
	
	public int removeMber(String mberNo) throws Exception;
}
