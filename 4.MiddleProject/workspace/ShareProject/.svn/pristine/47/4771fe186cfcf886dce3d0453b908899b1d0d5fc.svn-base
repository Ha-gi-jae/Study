package kr.or.ddit.comp.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.comp.dao.CompDaoImpl;
import kr.or.ddit.comp.dao.ICompDao;
import kr.or.ddit.comp.vo.CompPagingVO;
import kr.or.ddit.comp.vo.CompVO;

public class CompServiceImpl implements ICompService{
	
	private ICompDao dao;
	private static ICompService service;
	
	private CompServiceImpl() {
		dao = CompDaoImpl.getInstance();
	}
	
	public static ICompService getInstance() {
		if(service == null) {
			service =  new CompServiceImpl();
		}
		return service;
	}

	@Override
	public List<CompVO> selectAll() {
		
		List<CompVO> list = null;
		try {
			list = dao.selectAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public CompVO selectOne(int adminboard_id) {
		CompVO vo = null;
		try {
			vo = dao.selectOne(adminboard_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public int countComp() {
		int cnt = 0;
		try {
			cnt = dao.countComp();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int insertComp(CompVO vo) {
		int cnt = 0;
		try {
			cnt = dao.insertComp(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateComp(CompVO vo) {
		int cnt = 0;
		try {
			cnt = dao.updateComp(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int delteComp(int adminboard_id) {
		int cnt = 0;
		try {
			cnt = dao.delteComp(adminboard_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<CompVO> selectPage(CompPagingVO vo) {
		List<CompVO> list = null;
		
		try {
			list = dao.selectPage(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<CompVO> findCmTitle(CompPagingVO cv) {
		List<CompVO> list = null;
		try {
			list = dao.findCmTitle(cv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int findCmtitleCount(String comp_name) {
		int cnt =0;
		try {
			cnt = dao.findCmtitleCount(comp_name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int countView(int adminboard_id) {
		int chk = 0;
		try {
			chk = dao.countView(adminboard_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chk;
	}

}
