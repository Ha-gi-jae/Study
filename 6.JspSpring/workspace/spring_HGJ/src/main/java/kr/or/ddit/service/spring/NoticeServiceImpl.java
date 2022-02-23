package kr.or.ddit.service.spring;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jsp.command.PageMaker;
import com.jsp.command.SearchCriteria;
import com.jsp.dto.NoticeVO;
import com.jsp.service.NoticeService;

import kr.or.ddit.dao.spring.NoticeDAOBean;

public class NoticeServiceImpl implements NoticeService {

	private NoticeDAOBean noticeDAOBean;
	
	public void setNoticeDAOBean(NoticeDAOBean noticeDAOBean) {
		this.noticeDAOBean = noticeDAOBean;
	}

	@Override
	public NoticeVO getNotice(int nno) throws SQLException {
		NoticeVO notice = noticeDAOBean.selectNoticeByNno(nno);
		noticeDAOBean.increaseViewCount(nno);
		return notice;
	}

	@Override
	public NoticeVO getNoticeForModify(int nno) throws SQLException {
		NoticeVO notice = noticeDAOBean.selectNoticeByNno(nno);
		return notice;
	}

	@Override
	public Map<String, Object> getNoticeList(SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<NoticeVO> noticeList = noticeDAOBean.selectSearchNoticeList(cri);
		
		int totalCount = noticeDAOBean.selectSearchNoticeListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("noticeList", noticeList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public void modify(NoticeVO notice) throws SQLException {
		noticeDAOBean.updateNotice(notice);
	}

	@Override
	public void regist(NoticeVO notice) throws SQLException {
		int nno = noticeDAOBean.selectNoticeSequenceNextValue();
		notice.setNno(nno);
		noticeDAOBean.insertNotice(notice);
	}

	@Override
	public void remove(int nno) throws SQLException {
		noticeDAOBean.deleteNotice(nno);
	}
}
