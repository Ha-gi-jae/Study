package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.PagingVO;

public class MemberServiceImpl implements IMemberService {
	private static IMemberService service;
	private IMemberDao dao;
	
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getDao();
	}
	
	public static IMemberService getService() {
		if(service == null) service = new MemberServiceImpl();
		return service;
	}

	@Override
	public MemberVO idCheck(String id) {
		MemberVO vo = null;
		try {
			vo = dao.idCheck(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public List<MemberVO> listMember(PagingVO pv) {
		List<MemberVO> list = null;
		try {
			list = dao.listMember(pv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int memSize(PagingVO pv) {
		int cnt = 0;
		try {
			cnt = dao.memSize(pv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public MemberVO detailMember(String id) {
		MemberVO vo = null;
		try {
			vo = dao.detailMember(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public List<MemberVO> selectName(String name) {
		List<MemberVO> list = null;
		try {
			list = dao.selectName(name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<MemberVO> selectId(String id) {
		List<MemberVO> list = null;
		try {
			list =dao.selectId(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<MemberVO> selectPhone(String phone) {
		List<MemberVO> list = null;
		try {
			list = dao.selectPhone(phone);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<MemberVO> selectEmail(String email) {
		List<MemberVO> list = null;
		try {
			list =dao.selectEmail(email);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertMember(MemberVO vo) {
		int cnt = 0;
		try {
			cnt = dao.insertMember(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateMember(MemberVO vo) {
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
}
