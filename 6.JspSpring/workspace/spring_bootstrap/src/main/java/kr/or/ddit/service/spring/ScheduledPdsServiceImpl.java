package kr.or.ddit.service.spring;

import java.sql.SQLException;

import com.jsp.dto.PdsVO;

import kr.or.ddit.dao.spring.PdsDAOBean;

public class ScheduledPdsServiceImpl extends PdsServiceImpl implements ScheduledPdsService {

	private PdsDAOBean PdsDAOBeanChild;
	
	public void setPdsDAOBeanChild(PdsDAOBean PdsDAOBeanChild) {
		this.PdsDAOBeanChild = PdsDAOBeanChild;
	}
	
	@Override
	public PdsVO getPdsByImage(String imageFile) throws SQLException {
		PdsVO pds = PdsDAOBeanChild.selectPdsByImage(imageFile);
		return pds;
	}

}
