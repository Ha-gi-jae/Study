package kr.or.ddit.basic;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
/*
 * 전제조건 : 직렬화가 되어야함.
 */
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.lang.invoke.CallSite;

public class T15_ObjectStreamTest { // Object IO => 직렬화가 이루어져야함.
	
	// 직렬화 된 데이터를 거꾸로 [(연속적인데이터를 가지고 객체)] 바이트로 => 역직렬화
	
	public static void main(String[] args) {
		// Member 인스턴스 생성
		Member mem1 = new Member("홍길동", 20, "대전");
		Member mem2 = new Member("일지매", 30, "경기");
		Member mem3 = new Member("이몽룡", 40, "강원");
		Member mem4 = new Member("성춘향", 20, "광주");
		
		try {
			// 객체를 파일에 저장하기
			
			// 출력용 스트림 객체 생성 
			ObjectOutputStream oos = new ObjectOutputStream(new BufferedOutputStream(new FileOutputStream("d:/D_Other/memObj.bin")));
																		// 버퍼드로 기본 스트림 감싸주면 된다. 
			// 버퍼드 => 읽는데 한번에 여러 바이트를 읽어서 처리함!!
			// 텍스트가 아닌 오브젝트를 처리하려고한거임    ??>오브젝트 텍스트가 아닌 그냥 텍스트. 바이너리 데이터 이미지와 같이. 바이너리 데이터와 텍스트데이터가 있음.
			// 쓰기 작업
			oos.writeObject(mem1); // write 작업을 할 때 마다 직렬화가 일어 나고 있다.
			oos.writeObject(mem2);
			oos.writeObject(mem3);
			oos.writeObject(mem4);
			
			System.out.println("쓰기 작업 완료...");
			
			oos.close();
			
			//=========================================================================
			
			// 저장된 객체를 읽어와 출력하기
			
			// 입력용 스트림 객체 생성
			ObjectInputStream ois = new ObjectInputStream(new BufferedInputStream(new FileInputStream("d:/D_Other/memObj.bin")));
			
			Object obj = null;
			
			// 마지막에 다다르면 EOF Exception 발생함.
			// EOF : End Of File => 파일의 끝까지 다 읽었다.
			while((obj = ois.readObject()) != null) { // 이 부분이 역직렬화.
				// 읽어온 데이터를 원래의 객체형으로 변환 후 사용한다.
				Member mem = (Member) obj;
				System.out.println("이름 : " + mem.getName());
				System.out.println("나이 : " + mem.getAge());
				System.out.println("주소 : " + mem.getAddr());
				System.out.println("--------------------------");
			}
			
			ois.close();
			
		}catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		}catch (IOException ex) {
			//ex.printStackTrace(); // 보기싫으면 주석 걸면된다.
			System.out.println("출력 끝...");
		}
		
		
		
	}
}

/**
 * 회원정보 VO
 * @author PC-06
 *
 */
class Member implements Serializable { // 껍데기... 식별자 역할을 해준다. 어떤 타입인지 확인시켜줌(태그 => 인식 시켜줌).
	
	
	// 자바는 Serializable 인터페이스를 구현한 클래스만 직렬화 할 수 있도록 제한하고 있음.
	// 구현하지 않으면 직렬화 작업시 예외발생(NonSerializableException)
	
	// transient => 직렬화 되지 않을 멤버변수에 지정한다.
	//  - (static 필드도 직렬화가 되지 않는다.)
	//  - 직렬화가 되지 않는 멤버변수는 기본값으로 저장된다.
	//  - (참조변수 : null, 숫자형변수 : 0)
	
	// static 값의 변수는 객체가 아니기 때문에 직렬화 불가능.
	private String name;
	private transient int age; // transient : 일시적인. => 영원하지 않다.
	// 정보를 노출시키지 않음.
	private String addr;
	
	public Member(String name, int age, String addr) {
		super();
		this.name = name;
		this.age = age;
		this.addr = addr;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	
	
}









