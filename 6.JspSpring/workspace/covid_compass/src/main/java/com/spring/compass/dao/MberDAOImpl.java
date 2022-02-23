package com.spring.compass.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.compass.command.MberManageCommand;
import com.spring.compass.vo.MberVO;

public class MberDAOImpl implements MberDAO {

	private SqlSession sqlSession;
	
	private String nameSpace="Mber-Mapper.";
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public MberVO selectMberById(String mberId) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectMberById", mberId);
	}

	@Override
	public MberVO findByInfo(MberVO mber) throws SQLException {
		return sqlSession.selectOne(nameSpace+"findByInfo", mber);
	}

	@Override
	public void updatePwd(MberVO mber) throws SQLException {
		sqlSession.update(nameSpace+"updatePwd", mber);
	}

	@Override
	public String selectMbserSeq() throws SQLException {
		String mberSeq = sqlSession.selectOne(nameSpace+"selectMbserSeq");
		return mberSeq;
	}

	@Override
	public void insertMberRepresent(MberVO mber) throws SQLException {
		sqlSession.update(nameSpace+"insertMberRepresent", mber);
	}

	@Override
	public void updateInfo(MberVO mber) throws SQLException{
		sqlSession.update(nameSpace+"updateInfo", mber);
	}

	@Override
	public MberVO selectDetailByMberNo(String mberNo) throws SQLException {
		MberVO mber = sqlSession.selectOne(nameSpace+"selectDetailByMberNo", mberNo);
		return mber;
	}

	@Override
	public List<MberVO> selectMberManageList(MberManageCommand cri) throws SQLException {
		List<MberVO> mberManageList = sqlSession.selectList(nameSpace+"selectMberManageList",cri);
		return mberManageList;
	}

	@Override
	public int selectMberManageCount(MberManageCommand cri) throws SQLException {
		
		return sqlSession.selectOne(nameSpace+"selectMberManageCount",cri);
	}

	@Override
	public int insertMber(MberVO mber) throws SQLException {
		
		return sqlSession.update(nameSpace+"insertMber",mber);
	}

	@Override
	public int deleteMber(String mberNo) throws SQLException {
		
		return sqlSession.update(nameSpace+"deleteMber", mberNo);
	}


}
