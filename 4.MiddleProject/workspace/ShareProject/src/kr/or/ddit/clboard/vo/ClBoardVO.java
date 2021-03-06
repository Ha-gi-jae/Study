package kr.or.ddit.clboard.vo;

public class ClBoardVO {
	// 글 작성시 필요
	private String clboard_title;
	private String clboard_content;
	private String mem_id;
	private String board_title_id;

	// list 불러오기 사용시 필요
	private int board_num;
	private int adminboard_id;
	private int adminboard_view;
	private int reply_count;
	private String clboard_date;
	private String mem_name;
	private String class_id;
	private String board_title_name;
	private String adminboard_blind;

	//=========================================================
	
	public String getclBoard_title() {
		return clboard_title;
	}

	public String getClboard_title() {
		return clboard_title;
	}

	public void setClboard_title(String clboard_title) {
		this.clboard_title = clboard_title;
	}

	public String getClboard_content() {
		return clboard_content;
	}

	public void setClboard_content(String clboard_content) {
		this.clboard_content = clboard_content;
	}

	public String getClboard_date() {
		return clboard_date;
	}

	public void setClboard_date(String clboard_date) {
		this.clboard_date = clboard_date;
	}

	public String getClass_id() {
		return class_id;
	}

	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}

	public void setclBoard_title(String board_title) {
		this.clboard_title = board_title;
	}

	public String getclBoard_content() {
		return clboard_content;
	}

	public void setclBoard_content(String board_content) {
		this.clboard_content = board_content;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getBoard_title_id() {
		return board_title_id;
	}

	public void setBoard_title_id(String board_title_id) {
		this.board_title_id = board_title_id;
	}
	
	//===================================================
	
	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public int getAdminboard_id() {
		return adminboard_id;
	}

	public void setAdminboard_id(int adminboard_id) {
		this.adminboard_id = adminboard_id;
	}

	public int getAdminboard_view() {
		return adminboard_view;
	}

	public void setAdminboard_view(int adminboard_view) {
		this.adminboard_view = adminboard_view;
	}

	public int getReply_count() {
		return reply_count;
	}

	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}

	public String getclBoard_date() {
		return clboard_date;
	}

	public void setclBoard_date(String board_date) {
		this.clboard_date = board_date;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	//==========================================================
	
	public String getBoard_title_name() {
		return board_title_name;
	}

	public void setBoard_title_name(String board_title_name) {
		this.board_title_name = board_title_name;
	}

	public String getAdminboard_blind() {
		return adminboard_blind;
	}

	public void setAdminboard_blind(String adminboard_blind) {
		this.adminboard_blind = adminboard_blind;
	}

}
