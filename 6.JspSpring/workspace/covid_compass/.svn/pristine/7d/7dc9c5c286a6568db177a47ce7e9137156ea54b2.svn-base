package com.spring.compass.dao;


import java.sql.SQLException;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;

import com.spring.compass.command.HsptMainSckbdCommand;
import com.spring.compass.vo.HsptStatsVO;

public class StatisticsDAOImpl implements StatisticsDAO {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	private String nameSpace = "Stats-Mapper.";


	@Override
	public HsptMainSckbdCommand selectMainStatsSckbd(String hsptNo) throws SQLException {
		HsptMainSckbdCommand mainStats = sqlSession.selectOne(nameSpace+"selectHsptMainStatsBySysdate",hsptNo);
		return mainStats;
	}


	@Override
	public HsptStatsVO selectHsptStatsByStatsNo(String statsNo) throws SQLException {
		HsptStatsVO stats = sqlSession.selectOne(nameSpace+"selectHstpStatsByStatsNo",statsNo);
		return stats;
	}


}
