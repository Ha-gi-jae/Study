package kr.or.ddit.service.spring;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jsp.command.PageMaker;
import com.jsp.command.SearchCriteria;
import com.jsp.dto.BoardVO;
import com.jsp.service.BoardService;

import kr.or.ddit.dao.spring.BoardDAOBean;
import kr.or.ddit.dao.spring.ReplyDAOBean;

public class BoardServiceImpl implements BoardService {

	private BoardDAOBean boardDAOBean;
	
	public void setBoardDAOBean(BoardDAOBean boardDAOBean) {
		this.boardDAOBean = boardDAOBean;
	}
	
	private ReplyDAOBean replyDAOBean;
	
	public void setReplyDAOBean(ReplyDAOBean replyDAOBean) {
		this.replyDAOBean = replyDAOBean;
	}

	@Override
	public BoardVO getBoard(int bno) throws SQLException {
		BoardVO board = boardDAOBean.selectBoardByBno(bno);
		boardDAOBean.increaseViewCnt(bno);
		return board;
	}

	@Override
	public BoardVO getBoardForModify(int bno) throws SQLException {
		BoardVO board = boardDAOBean.selectBoardByBno(bno);
		return board;
	}

	@Override
	public Map<String, Object> getBoardList(SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<BoardVO> boardList = boardDAOBean.selectSearchBoardList(cri);
		
		for(BoardVO board : boardList) {
			int replycnt = replyDAOBean.countReply(board.getBno());
			board.setReplycnt(replycnt);
		}
		
		int totalCount = boardDAOBean.selectBoardCriteriaTotalCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("boardList", boardList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public void modify(BoardVO board) throws SQLException {
		boardDAOBean.updateBoard(board);
	}

	@Override
	public void regist(BoardVO board) throws SQLException {
		int bno = boardDAOBean.selectBoardSeqNext();
		board.setBno(bno);
		boardDAOBean.insertBoard(board);
	}

	@Override
	public void remove(int bno) throws SQLException {
		boardDAOBean.deleteBoard(bno);
	}
}
