package kr.or.ddit.buyer.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.buyer.vo.BuyerVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

/**
 * mapper에 접근해서 sql문을 실행 - SqlMapClient 객체가 필요하다.
 * 싱글톤 처리 - service 클래스에서 사용하기위한 dao클래스 객체를 생성하여 return 한다.
 * @author PC-06
 */
public class BuyerDaoImpl implements IBuyerDao { // 클래스 뒤에 Impl은 implements를 의미함.
	
	private SqlMapClient client;
	private static IBuyerDao dao; // BuyerDaoImpl 와 IBuyerDao는 서로 대체할 수 있다.
	
	
	// 생성자 public이 아니고 private 인 이유 ? => 싱글톤이니까.
	// 다른곳에서 new 하는게아니니까. 다른곳(외부)에서 접근할 수 없게해야함 => new를 못하도록 강제한다.
	private BuyerDaoImpl() {
		client = SqlMapClientFactory.getInstance();
	}
	
	// dao를 만들어서 return할 거임.
	public static IBuyerDao getDao() {
		if(dao == null) dao = new BuyerDaoImpl(); // null은 dao가 생성이 아직 안된 상태. 그러니 만들겠다.
		return dao;
	}
	
	
	@Override
	public List<BuyerVO> selectByName() {
		List<BuyerVO> list = null;
		
		try {
			list = client.queryForList("buyer.selectByName");// id = 메서드명으로 했으니 그대로 적어준다.
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BuyerVO selectDetail(String buyer_id) {
		BuyerVO vo = null;
		
		try {															//★★★★★★★★★★ 파라미터!!!!!!!!!!!! 잊쥐마!!! 파라미터가 있으면 파라미터를 넣어줘야해!!
			vo = (BuyerVO) client.queryForObject("buyer.selectDetail", buyer_id); 		// BuyerVO로 캐스팅 ! 후 try catch
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo; // 안 고치고 null이면 nullpoint exception 나옴!!
	}

}
