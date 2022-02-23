package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

public class MemberServiceImpl implements IMemberService {
	
	private IMemberDao dao;
	private static IMemberService service;
	
	
	// 생성자
	
	public MemberServiceImpl() {
		dao = MemberDaoImpl.getDao();
	}

	public static IMemberService getService() {
		if(service ==null) service = new MemberServiceImpl();
		
		return service;
	}
	
	@Override
	public String selectById(String inputId) {
		//1
		String id = null; // 리턴할 변수 선언
		
		//4
		try {
			//2
			id =  dao.selectById(inputId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//3
		return id;
	}

	@Override
	public List<ZipVO> selectZipCode(String dong) {
		List<ZipVO> list = null;
		
		try {
			list = dao.selectZipCode(dong);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public String insertMember(MemberVO vo) {
		String mem_id = null;
		
		try {
			mem_id = dao.insertMember(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mem_id;
	}



}
