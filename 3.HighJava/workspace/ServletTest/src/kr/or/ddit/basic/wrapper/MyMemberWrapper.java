package kr.or.ddit.basic.wrapper;

public class MyMemberWrapper extends MemberWrapper {
	
	private boolean isSpy; // 첩자 여부
	private String name = "steve";
	private String company = "NASA";
	
	
	public MyMemberWrapper(IMember member) {
		super(member);
	}
	
	
	public MyMemberWrapper(IMember member, boolean isSpy) {
		super(member);
		this.isSpy = isSpy;
	}


	public String getName() { // 스파이가 아니면 원래 자신의 이름을 가져오고.
		if(!isSpy) {
			return super.getName();
		}else {
			return name; // 스파이면 steve를 리턴
		}
	}


	public String getCompany() {
		if(!isSpy) {
			return super.getCompany(); // super => Wrapper class
		}else {
			return company;
		}
	}
	
	
	
}
