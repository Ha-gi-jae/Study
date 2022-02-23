package kr.or.ddit.treeview.service;

public interface ITreeViewService {

	/**
	 * 클래스 아이디를 이용해 클래스의 이름을 가져오는 메서드
	 * @param class_id
	 * @return
	 */
	String getClassName(String class_id);

}
