package kr.or.ddit.admin.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.admin.vo.AdminVO;
import kr.or.ddit.adminClass.vo.AdminClassVO;
import kr.or.ddit.board.vo.PagingVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class AdminDaoImpl implements IAdminDao {
	
	private SqlMapClient client;
	private static IAdminDao dao;
	
	public AdminDaoImpl() {
		this.client = SqlMapClientFactory.getInstance();
	}
	
	public static IAdminDao getDao() {
		if(dao == null) dao = new AdminDaoImpl();
		return dao;
	}

	@Override
	public AdminVO adCheck(AdminVO av) throws SQLException {
		return (AdminVO) client.queryForObject("admin.adCheck", av);
	}
	
	// 회원 정보 전체 조회
	@Override
	public List<AdminVO> groupByAllMem(PagingVO pv) throws SQLException {
		return client.queryForList("admin.groupByAllMem", pv);
	}
	// 회원 정보 상세 조회
	@Override
	public AdminVO selectMemberDetail(String memId) throws SQLException {
		return (AdminVO) client.queryForObject("admin.selectMemberDetail", memId);
	}
	// 회원 정보 수정
	@Override
	public int updateMember(AdminVO vo) throws SQLException {
		return client.update("admin.updateMember", vo);
	}
	// 회원 정보 삭제
	@Override
	public int deleteMember(String memId) throws SQLException {
		return client.delete("admin.deleteMember", memId);
	}
	// 비밀번호 초기화
	@Override
	public int passwordReset(String memId) throws SQLException {
		return client.update("admin.passwordReset", memId);
	}

	@Override
	public int memSize() throws SQLException {
		return (Integer) client.queryForObject("admin.memSize");
	}

	@Override
	public List<AdminVO> findClass(String class_id) throws SQLException {
		return client.queryForList("admin.findClass", class_id);
	}

	@Override
	public List<AdminVO> findGroup(String mem_group) throws SQLException {
		return client.queryForList("admin.findGroup", mem_group);
	}

	@Override
	public List<AdminVO> findName(String mem_name) throws SQLException {
		return client.queryForList("admin.findName", mem_name);
	}

	@Override
	public int insertMember(AdminVO vo) throws SQLException {
		Object obj = client.insert("admin.insertMember", vo);
		if(obj == null)
			return 1;
		else
			return 0;
	}

	@Override
	public int findclasssize(String class_id) throws SQLException {
		return (int) client.queryForObject("admin.findclasssize", class_id);
	}

	@Override
	public List<AdminVO> groupByFindCls(PagingVO pv) throws SQLException {
		return client.queryForList("admin.groupByFindCls", pv);
	}

	@Override
	public List<AdminVO> groupByFindGroup(PagingVO pv) throws SQLException {
		return client.queryForList("admin.groupByFindGroup", pv);
	}

	@Override
	public List<AdminVO> groupByFindName(PagingVO pv) throws SQLException {
		return client.queryForList("admin.groupByFindName", pv);
	}

	@Override
	public int findgroupsize(String mem_group) throws SQLException {
		return (int) client.queryForObject("admin.findgroupsize", mem_group);
	}

	@Override
	public int findnamesize(String mem_name) throws SQLException {
		return (int) client.queryForObject("admin.findnamesize", mem_name);
	}

}
