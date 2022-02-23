package com.spring.compass.service;




import com.spring.compass.command.HsptMainSckbdCommand;
import com.spring.compass.dao.StatisticsDAO;
import com.spring.compass.vo.HsptStatsVO;


public class StatisticsServiceImpl implements StatisticsService {

	private StatisticsDAO statisticsDAO;
	public void setStatisticsDAO(StatisticsDAO statisticsDAO) {
		this.statisticsDAO = statisticsDAO;
	}

	@Override
	public HsptMainSckbdCommand getMainStatsByStatsYmd(String hsptNo) throws Exception {
		HsptMainSckbdCommand mainStats = statisticsDAO.selectMainStatsSckbd(hsptNo);
		return mainStats;
	}

	@Override
	public HsptStatsVO getHsptStatsByStatsNo(String statsNo) throws Exception {
		HsptStatsVO stats = statisticsDAO.selectHsptStatsByStatsNo(statsNo);
		return stats;
	}



}
