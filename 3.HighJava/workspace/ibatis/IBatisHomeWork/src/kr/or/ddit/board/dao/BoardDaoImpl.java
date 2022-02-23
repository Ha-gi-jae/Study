package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.util.SqlMapClientPactory;

public class BoardDaoImpl implements IBoardDao {
	private static IBoardDao ibd;
	
	public BoardDaoImpl() {
	}
	
	public static IBoardDao getInstance() {
		if(ibd==null) {
			ibd = new BoardDaoImpl();
		}
		return ibd;
	}
	
	private SqlMapClient smc=SqlMapClientPactory.getInstance();
	
	
	//게시판 등록
	@Override
	public int insertBoard(BoardVO bv) {
		int count =0;
		try {
			BoardVO bv2=(BoardVO) smc.insert("boardTest.insertBoard", bv);
			if(bv2==null) {
				count++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return count;
	}
	
	//게시판 수정
	@Override
	public int updateBoard(BoardVO bv) {
		int result=0;
		
		try {
			result=smc.update("boardTest.updateBoard", bv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//게시판 삭제
	@Override
	public int deleteBoard(int num) {
		int result=0;
		
		try {
			result=smc.delete("boardTest.deleteBoard", num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//전체 게시판 조회
	@Override
	public List<BoardVO> displayAllBoard() {
		List<BoardVO> listBoard = new ArrayList<>();
		
		try {
			listBoard=smc.queryForList("boardTest.displayAllBoard");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return listBoard;
	}

	//특정 게시판 조회
	@Override
	public BoardVO selectBoard(BoardVO bv) {
		BoardVO bv2 = new BoardVO();
		
		try {
			bv2=(BoardVO) smc.queryForObject("boardTest.selectBoard", bv);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return bv2;
	}

	@Override
	public BoardVO searchBoard(int num) {
		BoardVO bv = new BoardVO();
		
		try {
			bv=(BoardVO) smc.queryForObject("boardTest.searchBoard", num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return bv;
	}

}
