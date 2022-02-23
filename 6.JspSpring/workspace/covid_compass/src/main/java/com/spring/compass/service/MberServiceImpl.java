package com.spring.compass.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.spring.compass.command.MberManageCommand;
import com.spring.compass.command.PageMaker;
import com.spring.compass.dao.MberDAO;
import com.spring.compass.vo.MberVO;

public class MberServiceImpl implements MberService{

	private MberDAO mberDAO;
	
	public void setMberDAO(MberDAO mberDAO) {
		this.mberDAO = mberDAO;
	}
	
	@Override
	public MberVO getMember(String mberId) throws Exception {
		return mberDAO.selectMberById(mberId);
	}

	@Override
	public MberVO getInfo(MberVO mber) throws Exception {
		return mberDAO.findByInfo(mber);
	}

	@Override
	public void modifyPwd(MberVO mber) throws Exception {
		mberDAO.updatePwd(mber);
	}

	@Override
	public String getMberSeq() throws Exception {
		return mberDAO.selectMbserSeq();
	}

	@Override
	public void registMberRepresent(MberVO mber) throws Exception {
		mberDAO.insertMberRepresent(mber);
	}
	
	@Override
	public void modifyInfo(MberVO mber) throws Exception{
		mberDAO.updateInfo(mber);
	}

	@Override
	public MberVO getDetailByMberNo(String mberNo) throws Exception {
		MberVO mber = mberDAO.selectDetailByMberNo(mberNo);
		return mber;
	}

	@Override
	public Map<String, Object> getManageList(MberManageCommand cri) throws Exception {
		Map<String, Object> dataMap = new HashMap<String,Object>();
		PageMaker pageMaker = null;
		
		pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		int totalCount = mberDAO.selectMberManageCount(cri);
		
		pageMaker.setTotalCount(totalCount);
		
		List<MberVO> mberManageList = mberDAO.selectMberManageList(cri);
		
		dataMap.put("mberManageList", mberManageList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public int registMber(MberVO mber) throws Exception {
		
		String mberNo = mberDAO.selectMbserSeq();
		
		mber.setMberNo(mberNo);
		
		int num = mberDAO.insertMber(mber);
		
		return num;
	}
	
	@Override
	public int removeMber(String mberNo) throws Exception{
		int result = mberDAO.deleteMber(mberNo);
		
		return result;
	}

}
