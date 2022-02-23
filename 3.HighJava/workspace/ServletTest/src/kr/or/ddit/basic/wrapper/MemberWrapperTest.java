package kr.or.ddit.basic.wrapper;

public class MemberWrapperTest {
	public static void main(String[] args) { // Wrapper Class를 이용하면 기능 확장이 쉬워진다.
		
		// 기본 객체 생성하기(익명클래스를 이용한 생성방법)
		IMember member = new IMember() {

			@Override
			public String getName() { // request객체라고 보면 된다.
				return "홍길동";
			}

			@Override
			public String getCompany() {
				return "대덕인재개발원";
			}
			
		};
		
		System.out.println("안녕하세요. 제 이름은 " + member.getName() + "이고, " + member.getCompany() + "에 소속되어 있습니다.");
		
		// 래퍼클래스를 이용한 객체 생성하기
		member = new MemberWrapper(member);

		System.out.println("안녕하세요. 제 이름은 " + member.getName() + "이고, " + member.getCompany() + "에 소속되어 있습니다.");
		
		// 기본래퍼클래스에 기능확장한 래퍼클래스를 이용한 객체 생성하기
		member = new MyMemberWrapper(member, true); // 스파이가 아니라고 하면 홍길동이 나옴. 
		System.out.println("안녕하세요. 제 이름은 " + member.getName() + "이고, " + member.getCompany() + "에 소속되어 있습니다.");
		
		
	}
}
