package kr.or.ddit.cal.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.cal.dao.CalDaoImpl;
import kr.or.ddit.cal.dao.ICalDao;
import kr.or.ddit.cal.vo.CalVO;
import kr.or.ddit.cal.vo.TtVO;

public class CalServiceImpl implements ICalService {
	private static ICalService service;
	private ICalDao dao;

	private CalServiceImpl() {
		dao = CalDaoImpl.getInstance();
	}

	public static ICalService getInstance() {
		if (service == null)
			service = new CalServiceImpl();
		return service;
	}

	@Override
	public List<CalVO> calenList() {
		List<CalVO> list = null;
		try {
			list = dao.calenList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<CalVO> calenListDetail(String day) {
		List<CalVO> list = null;
		try {
			list = dao.calenListDetail(day);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<TtVO> selectTt() {
		List<TtVO> list = null;
		try {
			list = dao.selectTt();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int calInsert(CalVO vo) {
		int cnt = 0;
		try {
			cnt = dao.calInsert(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}



	@Override
	public int calDelete(int id) {
		int cnt = 0;
		try {
			cnt = dao.calDelete(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int calUpdate(CalVO vo) {
		int cnt = 0;
		try {
			cnt = dao.calUpdate(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int ttInsert(TtVO vo) {
		int cnt = 0;
		try {
			cnt = dao.ttInsert(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int ttDelete(int id) {
		int cnt = 0;
		try {
			cnt = dao.ttDelete(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int ttUpdate(TtVO vo) {
		int cnt = 0;
		try {
			cnt = dao.ttUpdate(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int ttIdSelect(TtVO vo) {
		int tt_id = 0;
		try {
			tt_id = dao.ttIdSelect(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tt_id;
	}

	@Override
	public String mem_group(String mem_id) {
		String mem_group = null;
		try {
			mem_group = dao.mem_group(mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mem_group;
	}
}
