package kr.or.ddit.cl.service;

import java.sql.SQLException;

import kr.or.ddit.cl.dao.ClassDaoImpl;
import kr.or.ddit.cl.dao.IClassDao;
import kr.or.ddit.cl.vo.ClassVO;

public class ClassServiceImpl implements IClassService {
	
	private static IClassService service;
	private IClassDao dao;
	
	private ClassServiceImpl() {
		dao = ClassDaoImpl.getDao();
	}
	
	public static IClassService GetService() {
		if(service == null) service = new ClassServiceImpl();
		return service;
	}
	
	
	// 반 등록
	@Override
	public int insertClass(ClassVO vo) {
		int cnt = 0;
		try {
			cnt = dao.insertClass(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	// 반 수정
	@Override
	public int updateClass(ClassVO vo) {
		int cnt = 0;
		try {
			cnt = dao.updateClass(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	// 반 삭제
	@Override
	public int deleteClass(String classId) {
		int cnt = 0;
		try {
			cnt = dao.deleteClass(classId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

}
