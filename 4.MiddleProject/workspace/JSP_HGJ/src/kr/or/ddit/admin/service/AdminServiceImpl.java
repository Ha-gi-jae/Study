package kr.or.ddit.admin.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.admin.dao.AdminDaoImpl;
import kr.or.ddit.admin.dao.IAdminDao;
import kr.or.ddit.admin.vo.AdminVO;
import kr.or.ddit.admin.vo.PagingVO;

public class AdminServiceImpl implements IAdminService {
	
	private static IAdminService service;
	private IAdminDao dao;
	
	private AdminServiceImpl() {
		dao = AdminDaoImpl.getDao();
	}
	
	public static IAdminService GetService() {
		if(service == null) service = new AdminServiceImpl();
		return service;
	}

	@Override
	public List<AdminVO> selectList(PagingVO pv) {
		List<AdminVO> list = null;
		try {
			list = dao.selectList(pv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public AdminVO selectDetail(String id) {
		AdminVO vo = null;
		try {
			vo = dao.selectDetail(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public List<AdminVO> selectName(String name) {
		List<AdminVO> list = null;
		try {
			list = dao.selectName(name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<AdminVO> selectId(String id) {
		List<AdminVO> list = null;
		try {
			list = dao.selectId(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<AdminVO> selectPhone(String phone) {
		List<AdminVO> list = null;
		try {
			list = dao.selectPhone(phone);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<AdminVO> selectEmail(String email) {
		List<AdminVO> list = null;
		try {
			list = dao.selectEmail(email);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertMember(AdminVO vo) {
		int cnt = 0;
		try {
			cnt = dao.insertMember(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateMember(AdminVO vo) {
		int cnt = 0;
		try {
			cnt = dao.updateMember(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteMember(String id) {
		int cnt = 0;
		try {
			cnt = dao.deleteMember(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public AdminVO idCheck(String id) {
		AdminVO vo = null;
		try {
			vo = dao.idCheck(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public int memSize() {
		int cnt = 0;
		try {
			cnt = dao.memSize();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
}
