package kr.or.ddit.treeview.service;

import java.sql.SQLException;

import kr.or.ddit.treeview.dao.ITreeViewDao;
import kr.or.ddit.treeview.dao.TreeViewDaoImpl;

public class TreeViewServiceImpl implements ITreeViewService {
	private static ITreeViewService service;
	private ITreeViewDao dao;

	private TreeViewServiceImpl() {
		dao = TreeViewDaoImpl.getInstance();
	}

	public static ITreeViewService getInstance() {
		if (service == null)
			service = new TreeViewServiceImpl();
		return service;
	}

	@Override
	public String getClassName(String class_id) {
		String className = null;
		try {
			className = dao.getClassName(class_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return className;
	}

}
