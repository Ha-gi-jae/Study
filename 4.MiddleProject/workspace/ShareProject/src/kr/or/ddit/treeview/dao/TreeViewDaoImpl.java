package kr.or.ddit.treeview.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.util.SqlMapClientFactory;

public class TreeViewDaoImpl implements ITreeViewDao {
	private static ITreeViewDao dao;
	private SqlMapClient smc;

	private TreeViewDaoImpl() {
		smc = SqlMapClientFactory.getInstance();
	}

	public static ITreeViewDao getInstance() {
		if (dao == null)
			dao = new TreeViewDaoImpl();
		return dao;
	}

	@Override
	public String getClassName(String class_id) throws SQLException {
		return (String) smc.queryForObject("treeview.getClassName", class_id);
	}
}
