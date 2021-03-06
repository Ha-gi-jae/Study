package kr.or.ddit.board.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.board.dao.AdminreDaoImpl;
import kr.or.ddit.board.dao.IAdminreDao;
import kr.or.ddit.board.vo.AdminreVO;

public class AdminreServiceImpl implements IAdminreService{
	private static IAdminreService service;
	private IAdminreDao dao;
	
	private AdminreServiceImpl() {
		dao = AdminreDaoImpl.getInstance();
	}
	
	public static IAdminreService getInstance() {
		if(service==null) {
			service = new AdminreServiceImpl();
		}
		
		return service;
	}
	//답글 등록
	@Override
	public int insertAdminre(AdminreVO av) {
		int cnt =0;
		try {
			cnt =dao.insertAdminre(av);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	//답글 조회
	@Override
	public List<AdminreVO> selectResponse(int adminboard_id) {
		List<AdminreVO> list = null;
		
		try {
			list = dao.selectResponse(adminboard_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public String selectmemId(int adminboard_id) {
		String mem_id = null;
		
		try {
			mem_id = dao.selectmemId(adminboard_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mem_id;
	}

	@Override
	public int updateResponse(AdminreVO arv) {
		int cnt =0;
		try {
			cnt = dao.updateResponse(arv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteResponse(int adminre_num) {
		int cnt =0;
		try {
			cnt = dao.deleteResponse(adminre_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

}
