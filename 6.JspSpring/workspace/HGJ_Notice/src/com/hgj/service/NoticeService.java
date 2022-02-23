package com.hgj.service;

import java.util.List;
import java.util.Map;

import com.hgj.command.Criteria;
import com.hgj.dto.NoticeVO;

public interface NoticeService {

	public Map<String, Object> getNoticeListPage(Criteria cri) throws Exception;
	
	public List<NoticeVO> getPointNoticeList() throws Exception;
	
	public NoticeVO getNoticeDetail(int no) throws Exception;
}
