package kr.or.ddit.board.vo;

import java.util.Date;

public class NoticeVO {
	// 전체 공지사항 vo
	private int notice_num;
	private int adminboard_id;
	private int adminboard_view;
	private String notice_title;
	private String notice_date;
	private String notice_content;

	public int getNotice_num() {
		return notice_num;
	}

	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}

	public int getAdminboard_view() {
		return adminboard_view;
	}

	public void setAdminboard_view(int adminboard_view) {
		this.adminboard_view = adminboard_view;
	}

	public int getAdminboard_id() {
		return adminboard_id;
	}

	public void setAdminboard_id(int adminboard_id) {
		this.adminboard_id = adminboard_id;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

}
