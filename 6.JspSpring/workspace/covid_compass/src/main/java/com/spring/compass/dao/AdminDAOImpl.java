package com.spring.compass.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.compass.command.SearchCriteria;
import com.spring.compass.command.SearchCriteriaGeon;
import com.spring.compass.vo.AttachVO;
import com.spring.compass.vo.HsptVO;
import com.spring.compass.vo.InspVO;
import com.spring.compass.vo.InstVO;
import com.spring.compass.vo.LtctVO;
import com.spring.compass.vo.MberVO;
import com.spring.compass.vo.NoticeVO;
import com.spring.compass.vo.PbhtVO;
import com.spring.compass.vo.PstiVO;

public class AdminDAOImpl implements AdminDAO{
	
	private String namespace="Admin-Mapper.";
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession= sqlSession;
	}
	
	@Override
	public List<InspVO> selectAllInsp(SearchCriteriaGeon cri) throws SQLException {
		List<InspVO> inspList = sqlSession.selectList(namespace+"selectAllInsp", cri);
		return inspList;
	}

	@Override
	public List<PbhtVO> selectAllPbht(SearchCriteriaGeon cri) throws SQLException {
		List<PbhtVO> pbhtList = sqlSession.selectList(namespace+"selectAllPbht", cri);
		return pbhtList;
	}

	@Override
	public List<HsptVO> selectAllHspt(SearchCriteriaGeon cri) throws SQLException {
		List<HsptVO> hsptList = sqlSession.selectList(namespace+"selectAllHspt", cri);
		return hsptList;
	}

	@Override
	public List<LtctVO> selectAllLtct(SearchCriteriaGeon cri) throws SQLException {
		List<LtctVO> ltctList = sqlSession.selectList(namespace+"selectAllLtct", cri);
		return ltctList;
	}

	@Override
	public List<InstVO> selectAllInst(SearchCriteriaGeon cri) throws SQLException {
		List<InstVO> instList = sqlSession.selectList(namespace+"selectAllInst", cri);
		return instList;
	}

	@Override
	public void insertInst(InstVO inst) throws SQLException {
		sqlSession.update(namespace+"insertInst", inst);
	}

	@Override
	public int selectAllInstCount(SearchCriteriaGeon cri) throws SQLException {
		int count = sqlSession.selectOne(namespace+"selectAllInstCount", cri);
		return count;
	}

	@Override
	public InstVO selectInstDetail(String instNo) throws SQLException {
		InstVO inst = sqlSession.selectOne(namespace+"selectInstDetail", instNo);
		return inst;
	}

	@Override
	public List<MberVO> selectMeberByInstNo(String instNo) throws SQLException {
		List<MberVO> mberList = sqlSession.selectList(namespace+"selectMeberByInstNo", instNo);
		return mberList;
	}

	@Override
	public int updateInst(InstVO inst) throws SQLException {
		int result = sqlSession.update(namespace+"updateInst", inst);
		return result;
	}

	@Override
	public String selectChildNoByInstNo(String instNo) throws SQLException {
		String childNo = sqlSession.selectOne(namespace+"selectChildNoByInstNo", instNo);
		return childNo;
	}

	@Override
	public int deleteMemberByInstNo(String instNo) throws SQLException {
		return sqlSession.update(namespace+"deleteMemberByInstNo",instNo);
	}

	@Override
	public int deleteInspByInspNo(String inspNo) throws SQLException {
		return sqlSession.update(namespace+"deleteInspByInspNo",inspNo);
	}

	@Override
	public int deletePbhtByPbhtNo(String pbhtNo) throws SQLException {
		return sqlSession.update(namespace+"deletePbhtByPbhtNo", pbhtNo);
	}

	@Override
	public int deleteHsptByHsptNo(String hsptNo) throws SQLException {
		return sqlSession.update(namespace+"deleteHsptByHsptNo", hsptNo);
	}

	@Override
	public int deleteLtctByLtctNo(String ltctNo) throws SQLException {
		return sqlSession.update(namespace+"deleteLtctByLtctNo", ltctNo);
	}

	@Override
	public int deleteInstByInstNo(String instNo) throws SQLException {
		return sqlSession.update(namespace+"deleteInstByInstNo", instNo);
	}

	@Override
	public int deleteInspByPbhtNo(String pbhtNo) throws SQLException {
		return sqlSession.update(namespace+"deleteInspByPbhtNo", pbhtNo);
	}

	@Override
	public String selectNoticeSeq() throws SQLException {
		return sqlSession.selectOne(namespace+"selectNoticeSeq");
	}

	@Override
	public int registNotice(NoticeVO notice) throws SQLException {
		return sqlSession.update(namespace+"registNotice", notice);
	}

	@Override
	public String selectAttchSeq() throws SQLException {
		return sqlSession.selectOne(namespace+"selectAtchSeq");
	}

	@Override
	public int registAttach(AttachVO attach) throws SQLException {
		return sqlSession.update(namespace+"registAttach", attach);
	}

	@Override
	public List<NoticeVO> selectAllNotice(SearchCriteria cri) throws SQLException {
		int offset =cri.getStartRowNum() - 1;
		System.out.println("------------------------------------------offset:"+offset);
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<NoticeVO> noticeList = sqlSession.selectList(namespace+"selectAllNotice", cri, rowBounds);
		return noticeList;
	}

	@Override
	public int selectSearchNoticeListCount(SearchCriteria cri) throws SQLException {
		return sqlSession.selectOne(namespace+"selectSearchNoticeListCount", cri);
	}

	@Override
	public NoticeVO selectNoticeByNoticeNo(String noticeNo) throws SQLException {
		return sqlSession.selectOne(namespace+"selectNoticeByNoticeNo", noticeNo);
	}

	@Override
	public AttachVO selectAttachByNoticeNo(String noticeNo) throws SQLException {
		return sqlSession.selectOne(namespace+"selectAttachByNoticeNo", noticeNo);
	}

	@Override
	public void removeAttachByAtchNo(String atchNo) throws SQLException {
		sqlSession.update(namespace+"removeAttachByAtchNo", atchNo);
	}

	@Override
	public void removeNoticeByNoticeNo(String noticeNo) throws SQLException {
		sqlSession.update(namespace+"removeNoticeByNoticeNo",noticeNo);
	}

	@Override
	public void noticeModify(NoticeVO notice) throws SQLException {
		sqlSession.update(namespace+"noticeModify", notice);
	}

	@Override
	public void attachModify(AttachVO attach) throws SQLException {
		sqlSession.update(namespace+"attachModify",attach);
	}

	@Override
	public void deleteAttachByFileName(String fileName) throws SQLException {
		sqlSession.update(namespace+"deleteAttachByFileName", fileName);
	}

	@Override
	public String selectInstNoByMberNo(String mberNo) throws SQLException {
		return sqlSession.selectOne(namespace+"selectInstNoByMberNo", mberNo);
	}

	@Override
	public String selectInstTelNoByInstNo(String instNo) throws SQLException {
		return sqlSession.selectOne(namespace+"selectInstTelNoByInstNo", instNo);
	}

	@Override
	public int updatePasswordMber(MberVO mber) throws SQLException {
		return sqlSession.update(namespace+"updatePasswordMber", mber);
	}

	@Override
	public MberVO detailMberByMberNo(String mberNo) throws SQLException {
		MberVO mber = sqlSession.selectOne(namespace+"detailMberByMberNo", mberNo);
		return mber;
	}

	@Override
	public int selectInspTotalCount(SearchCriteriaGeon cri) throws SQLException {
		return sqlSession.selectOne(namespace+"selectInspTotalCount", cri);
	}

	@Override
	public int selectPbhtTotalCount(SearchCriteriaGeon cri) throws SQLException {
		return sqlSession.selectOne(namespace+"selectPbhtTotalCount", cri);
	}

	@Override
	public int selectHsptTotalCount(SearchCriteriaGeon cri) throws SQLException {
		return sqlSession.selectOne(namespace+"selectHsptTotalCount", cri);
	}

	@Override
	public int selectLtctTotalCount(SearchCriteriaGeon cri) throws SQLException {
		return sqlSession.selectOne(namespace+"selectLtctTotalCount", cri);
	}

	@Override
	public MberVO selectMeberDetailByMberId(String mberId) throws SQLException {
		MberVO mber = sqlSession.selectOne(namespace+"selectMeberDetailByMberId", mberId);
		return mber;
	}

	@Override
	public void deleteInspStatsByInspNo(String inspNo) throws SQLException {
		sqlSession.update(namespace+"deleteInspStatsByInspNo", inspNo);
	}

	@Override
	public void deletePbhtStatsByPbhtNo(String pbhtNo) throws SQLException {
		sqlSession.update(namespace+"deletePbhtStatsByPbhtNo", pbhtNo);
	}

	@Override
	public void deleteHsptStatsByHsptNo(String hsptNo) throws SQLException {
		sqlSession.update(namespace+"deleteHsptStatsByHsptNo", hsptNo);
	}

	@Override
	public void deleteLtctStatsByLtctNo(String ltctNo) throws SQLException {
		sqlSession.update(namespace+"deleteLtctStatsByLtctNo", ltctNo);
	}

	@Override
	public List<String> selectInspNoByPbhtNo(String pbhtNo) throws SQLException {
		return sqlSession.selectList(namespace+"selectInspNoByPbhtNo", pbhtNo);
	}

	@Override
	public String selectInstNoByInspNo(String inspNo) throws SQLException {
		return sqlSession.selectOne(namespace+"selectInstNoByInspNo", inspNo);
	}

	@Override
	public String selectPstiNoByInspNo(String inspNo) throws SQLException {
		return sqlSession.selectOne(namespace+"selectPstiNoByInspNo", inspNo);
	}

	@Override
	public void deleteHtscByPstiNo(String pstiNo) throws SQLException {
		sqlSession.update(namespace+"deleteHtscByPstiNo", pstiNo);
	}

	@Override
	public void deletePstiByInspNo(String inspNo) throws SQLException {
		sqlSession.update(namespace+"deletePstiByInspNo", inspNo);
	}

	@Override
	public void deleteInspEmpByInspNo(String inspNo) throws SQLException {
		sqlSession.update(namespace+"deleteInspEmpByInspNo", inspNo);
	}

	@Override
	public void deleteSmplByPbhtNo(String pbhtNo) throws SQLException {
		sqlSession.update(namespace+"deleteSmplByPbhtNo", pbhtNo);
	}

	@Override
	public void deleteCnfmByPbhtNo(String pbhtNo) throws SQLException {
		sqlSession.update(namespace+"deleteCnfmByPbhtNo", pbhtNo);
	}

	@Override
	public void deleteSlfptntByPbhtNo(String pbhtNo) throws SQLException {
		sqlSession.update(namespace+"deleteSlfptntByPbhtNo", pbhtNo);
	}

	@Override
	public void deletePbhtEmp(String pbhtNo) throws SQLException {
		sqlSession.update(namespace+"deletePbhtEmp", pbhtNo);
	}

	@Override
	public void deleteHsptEmpByHsptNo(String hsptNo) throws SQLException {
		sqlSession.update(namespace+"deleteHsptEmpByHsptNo", hsptNo);
	}

	@Override
	public void deleteInptntByHsptNo(String hsptNo) throws SQLException {
		sqlSession.update(namespace+"deleteInptntByHsptNo", hsptNo);		
	}

	@Override
	public void deleteDgnssByHsptNo(String hsptNo) throws SQLException {
		sqlSession.update(namespace+"deleteDgnssByHsptNo", hsptNo);		
	}

	@Override
	public void deleteIsoptntByLtctNo(String ltctNo) throws SQLException {
		sqlSession.update(namespace+"deleteIsoptntByLtctNo", ltctNo);
	}

	@Override
	public void deleteLtctEmpByLtctNo(String ltctNo) throws SQLException {
		sqlSession.update(namespace+"deleteLtctEmpByLtctNo", ltctNo);
	}

	@Override
	public List<PstiVO> selectPstiBackupList() throws SQLException {
		List<PstiVO> pstiBackupList = sqlSession.selectList(namespace+"selectPstiBackupList");
		return pstiBackupList;
	}

	@Override
	public List<NoticeVO> selectAllNoticeByInstNo(SearchCriteria cri) throws SQLException {
		int offset =cri.getStartRowNum() - 1;
		System.out.println("------------------------------------------offset:"+offset);
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<NoticeVO> noticeList = sqlSession.selectList(namespace+"selectAllNoticeByInstNo", cri, rowBounds);
		return noticeList;
	}

	@Override
	public int selectSearchNoticeListByInstNoCount(SearchCriteria cri) throws SQLException {
		return sqlSession.selectOne(namespace+"selectSearchNoticeListByInstNoCount", cri);
	}

	@Override
	public void noticeModifyByInst(NoticeVO notice) throws SQLException {
		sqlSession.update(namespace+"noticeModifyByInst", notice);
	}

	@Override
	public void registNoticeAdmin(NoticeVO notice) throws SQLException {
		sqlSession.update(namespace+"registNoticeAdmin", notice);
	}

	@Override
	public List<NoticeVO> selectPopupNotice() throws SQLException {
		return sqlSession.selectList(namespace+"selectPopupNotice");
	}

	@Override
	public String selectPbhtNoByInstNm(String instNm) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteAttachByMberNo(String mberNo) throws SQLException {
		sqlSession.update(namespace+"deleteAttachByMberNo", mberNo);
	}

	@Override
	public AttachVO selectAttachByMberNo(String mberNo) throws SQLException {
		return sqlSession.selectOne(namespace+"selectAttachByMberNo", mberNo);
	}


}
