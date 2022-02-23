package com.spring.compass.dao;


import java.sql.SQLException;
import java.util.Date;

import com.spring.compass.command.HsptMainSckbdCommand;
import com.spring.compass.vo.HsptStatsVO;

public interface StatisticsDAO {

	public HsptStatsVO selectHsptStatsByStatsNo(String statsNo) throws SQLException;

	//병원메인통계에서 입퇴원 메서드
	public HsptMainSckbdCommand selectMainStatsSckbd(String hsptNo)throws SQLException;

}
