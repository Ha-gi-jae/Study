package kr.or.ddit.basic.wrapper;

public class MemberWrapper implements IMember{
	
	private IMember member;
	
	// 생성자
	public MemberWrapper(IMember member) { // 원본객체를 감싸주기위한 용도.
		this.member = member;
	}
	
	@Override
	public String getName() {
		return this.member.getName();
	}

	@Override
	public String getCompany() {
		return this.member.getCompany();
	}

}
