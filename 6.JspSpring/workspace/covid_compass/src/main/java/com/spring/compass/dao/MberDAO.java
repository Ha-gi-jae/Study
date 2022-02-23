package com.spring.compass.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.compass.command.MberManageCommand;
import com.spring.compass.vo.MberVO;

public interface MberDAO {

	MberVO selectMberById(String mberId) throws SQLException;
	
	MberVO findByInfo(MberVO mber) throws SQLException; // 아이디찾기
	
	void updatePwd(MberVO mber) throws SQLException;
	
	public String selectMbserSeq() throws SQLException;
	
	public void insertMberRepresent(MberVO mber) throws SQLException;
	
	public void updateInfo(MberVO mber) throws SQLException;
	
	MberVO selectDetailByMberNo(String mberNo) throws SQLException;
	
	public List<MberVO> selectMberManageList(MberManageCommand cri) throws SQLException;
	
	public int selectMberManageCount(MberManageCommand cri) throws SQLException;
	
	public int insertMber(MberVO mber) throws SQLException;
	
	public int deleteMber(String mberNo) throws SQLException;
		
}
