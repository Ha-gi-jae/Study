package kr.or.ddit.at.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.at.vo.AtVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class AtchFileDaoImpl implements IAtchFileDao{

	private static IAtchFileDao dao;
	private SqlMapClient smc;
	
	private AtchFileDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IAtchFileDao getInstnace() {
		if(dao == null) {
			dao = new AtchFileDaoImpl();
		}
		return dao;
	}

	@Override
	public int insertAtchFile(AtVO atVO) {
		int cnt = 0;
		try {
			Object obj = smc.insert("atch_file.inserAtchFile", atVO);
			if(obj == null) cnt = 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int insertAtchFileDetail(AtVO atVO) {
		int cnt = 0;
		try {
			Object obj = smc.insert("atch_file.insertAtchFileDetail",atVO);
			if(obj == null) cnt = 1;
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<AtVO> getAtchFileList(AtVO atVO) {
		List<AtVO> list = new ArrayList<>();
		try {
			list = smc.queryForList("atch_file.getAtchFileList", atVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public AtVO getAtchFileDetail(AtVO atVO) {
		AtVO vo = null;
		try {
			vo = (AtVO) smc.queryForObject("atch_file.getAtchFileDetail", atVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public int selectAtchId(int adminId) {
		int atch_file_id = 0;
		try {
			atch_file_id = (int) smc.queryForObject("atch_file.selectAtchId", adminId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return atch_file_id;
	}

	@Override
	public int updateAtchFileDetail(AtVO vo) {
		int cnt = 0;
		try {
			Object obj = smc.insert("atch_file.updateAtchFileDetail",vo);
			if(obj == null) cnt = 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int chkAtch(int adminboard_id) {
		int num =0;
		try {
			num = (int) smc.queryForObject("atch_file.chkAtch", adminboard_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}

	@Override
	public int uploadHWFile(AtVO atVO) {
		int num = 0;
		try {
			num = (int) smc.insert("atch_file.uploadHWFile", atVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}

	@Override
	public int inserAtchHWFile(AtVO atVO) {
		int num = 0;
		try {
			num = (int) smc.insert("atch_file.inserAtchHWFile", atVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}
}
