package kr.or.ddit.Service;

import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jsp.command.SearchCriteria;
import com.jsp.dto.MemberVO;
import com.jsp.service.MemberServiceForModify;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:kr/or/ddit/context/root-context.xml")
public class TestMemberServiceImpl {

	@Autowired
	private MemberServiceForModify memberService;
	
	@Before
	public void init() {
		// memberService.setMemberDAO(new MockMemberDAO());
		// MockDAO가 있다면 이렇게 해주면 된다.
	}
	
	@Test
	public void testGetList() throws Exception{
		
		SearchCriteria cri = new SearchCriteria();
		
		List<MemberVO> memberList = (List<MemberVO>)memberService.getMemberListPage(cri).get("memberList");
		
		Assert.assertEquals(10, memberList.size());
		// 리스트 페이지는 10개씩 끊어서 가져오기때문에 10임.
	}
	
	
}
