package kr.or.ddit.admin.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.admin.dao.AdminDaoImpl;
import kr.or.ddit.admin.dao.IAdminDao;
import kr.or.ddit.admin.vo.AdminVO;
import kr.or.ddit.board.vo.PagingVO;

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
	public AdminVO adCheck(AdminVO av) {
		
		AdminVO av2 = null;
		try {
			av2=dao.adCheck(av);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return av2;
	}
	// 회원 정보 전체 조회
	@Override
	public List<AdminVO> groupByAllMem(PagingVO pv) {
		List<AdminVO> list = null;
		try {
			list = dao.groupByAllMem(pv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	// 회원 정보 상세 조회
	@Override
	public AdminVO selectMemberDetail(String memId) {
		AdminVO vo = null;
		try {
			vo = dao.selectMemberDetail(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	// 회원 정보 수정
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
	// 회원 정보 삭제
	@Override
	public int deleteMember(String memId) {
		int cnt = 0;
		try {
			cnt = dao.deleteMember(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	// 비밀번호 초기화
	@Override
	public int passwordReset(String memId) {
		int cnt = 0;
		try {
			cnt = dao.passwordReset(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
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


	@Override
	public List<AdminVO> findClass(String class_id) {
		List<AdminVO> list = null;
		try {
			list = dao.findClass(class_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<AdminVO> findGroup(String mem_group) {
		List<AdminVO> list = null;
		try {
			list = dao.findGroup(mem_group);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<AdminVO> findName(String mem_name) {
		List<AdminVO> list = null;
		try {
			list = dao.findName(mem_name);
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
	public int findclasssize(String class_id) {
		int cnt = 0;
		try {
			cnt = dao.findclasssize(class_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	// 반 검색 페이징
	@Override
	public List<AdminVO> groupByFindCls(PagingVO pv) {
		List<AdminVO> list = null;
		try {
			list = dao.groupByFindCls(pv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	// 그룹 검색 페이징
	@Override
	public List<AdminVO> groupByFindGroup(PagingVO pv) {
		List<AdminVO> list = null;
		try {
			list = dao.groupByFindGroup(pv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	//이름 검색 페이징
	@Override
	public List<AdminVO> groupByFindName(PagingVO pv) {
		List<AdminVO> list = null;
		try {
			list =dao.groupByFindName(pv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	// 그룹검색 사이즈
	@Override
	public int findgroupsize(String mem_group) {
		int cnt = 0;
		try {
			cnt = dao.findgroupsize(mem_group);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	// 이름검색 사이즈
	@Override
	public int findnamesize(String mem_name) {
		int cnt = 0;
		try {
			cnt = dao.findnamesize(mem_name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

}
