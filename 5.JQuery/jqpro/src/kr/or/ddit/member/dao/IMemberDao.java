package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

public interface IMemberDao {
	
	public String selectById(String inputId) throws SQLException;
	// dao에서 try catch를 쓰면 트랜잭션이 이루어지지 않음. 
	// 1 2 3 이 있다면 1번성공 2번 실패 하게 되면 3번도 실행하지않고 초기로 돌아와야하는데 3으로 넘어가게된다.
	
	// 그렇기때문에 try catch가 아닌 여기서 오류나면 throws로 던져버림.
	
	// 즉 dao에서 try catch가 아닌 throws로 던지고
	
	// service에서 try catch로 잡아주면 된다.
	
	
	// 지금은 한개씩 만들어 썼기 때문에 상관없으나.
	// 프로젝트 처럼 규모가 커지면 service에서 잡아야한다.
	
	// 우편번호 찾기
	public List<ZipVO> selectZipCode(String dong) throws SQLException;
	
	// 가입하기
	public String insertMember(MemberVO vo) throws SQLException;
}
