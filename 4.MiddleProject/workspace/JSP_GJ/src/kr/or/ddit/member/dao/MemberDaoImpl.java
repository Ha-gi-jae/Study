package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.PagingVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class MemberDaoImpl implements IMemberDao {
	
	private SqlMapClient client;
	private static IMemberDao dao;
	
	public MemberDaoImpl() {
		this.client = SqlMapClientFactory.getInstance();
	}
	
	public static IMemberDao getDao() {
		if(dao == null) dao = new MemberDaoImpl();
		return dao;
	}

	@Override
	public MemberVO idCheck(String id) throws SQLException {
		return (MemberVO) client.queryForObject("member.idCheck", id);
	}

	@Override
	public List<MemberVO> listMember(PagingVO pv) throws SQLException {
		return client.queryForList("member.listMember", pv);
	}

	@Override
	public int memSize(PagingVO pv) throws SQLException {
		return (int) client.queryForObject("member.memSize", pv);
	}

	@Override
	public MemberVO detailMember(String id) throws SQLException {
		return (MemberVO) client.queryForObject("member.detailMember", id);
	}

	@Override
	public List<MemberVO> selectName(String name) throws SQLException {
		return client.queryForList("member.selectName", name);
	}

	@Override
	public List<MemberVO> selectId(String id) throws SQLException {
		return client.queryForList("member.selectId", id);
	}

	@Override
	public List<MemberVO> selectPhone(String phone) throws SQLException {
		return client.queryForList("member.selectPhone", phone);
	}

	@Override
	public List<MemberVO> selectEmail(String email) throws SQLException {
		return client.queryForList("member.selectEmail", email);
	}

	@Override
	public int insertMember(MemberVO vo) throws SQLException {
		int cnt = 0;
		Object obj = client.insert("member.insertMember", vo);
		if(obj == null) {
			cnt = 1;
			return cnt;
		}else {
			return cnt;
		}
	}

	@Override
	public int updateMember(MemberVO vo) throws SQLException {
		return client.update("member.updateMember", vo);
	}

	@Override
	public int deleteMember(String id) throws SQLException {
		return client.delete("member.deleteMember", id);
	}
}
