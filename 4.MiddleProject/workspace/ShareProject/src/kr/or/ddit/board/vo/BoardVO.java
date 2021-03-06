package kr.or.ddit.board.vo;

public class BoardVO {
	// 글 작성시 필요
	private String board_title;
	private String board_content;
	private String mem_id;
	private String board_title_id;

	// list 불러오기 사용시 필요
	private int board_num;
	private int adminboard_id;
	private int adminboard_view;
	private int reply_count;
	private String board_date;
	private String mem_name;
	private String board_title_name;
	private String adminboard_blind;

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
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

	public String getBoard_date() {
		return board_date;
	}

	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

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
