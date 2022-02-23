package kr.or.ddit.basic;

public class T15_SyncThreadTest {
	public static void main(String[] args) {
		ShareObject sObj = new ShareObject();
		
		WorkThread wth1 = new WorkThread(sObj);
		WorkThread wth2 = new WorkThread(sObj);

		wth1.start();
		wth2.start();
		
	}
}

// 공통으로 사용할 객체
class ShareObject {
	
	private int sum = 0;
	// 동기화 하는 방법 1 : 메서드 앞에 synchronized 넣기. -- 모든 영역이 동기화 되기 때문에 융통성이 좋지 않음. 전체적으로 필요하면 이렇게 쓰겠지만 그게 아니라면 동기화 블럭을 이용.
	synchronized public void add() { // 한번 실행될 때 마다 멤버변수에 값이 누적이된다.              크리티컬 섹션. synchronized = 한 스레드만 할 수 있게.
	// 동기화가 일어난다.
		
	// 동기화 처리하는 방법 2 : 동기화 블럭으로 설정하기
//		synchronized (this) { // 생성시 (mutex)로 생성됨. mutex = 공유객체.			
		for(int i = 0; i < 1000000000; i++) {} // 동기화전까지 시간벌기용.
		
		int n = sum;
		n += 10; // 10증가
		sum = n;
				
				System.out.println(Thread.currentThread().getName() + " 합계 : " + sum);
//		}
	}
	
	public int getSum() { // 누적된 값 확인하기 위한 게터!
		return sum;
	}
}

// 작업을 수행하는 스레드
class WorkThread extends Thread{
	ShareObject sObj;
	
	public WorkThread(ShareObject sObj) {
		this.sObj = sObj;
	}
	
	@Override
	public void run() { // add 10번 호출!
		for(int i = 1; i <= 10; i++) {
			synchronized (sObj) { // 이렇게 동기화 처리 할 수 도 있다. 메서드 자체를 동기화 처리하는것 이므로 방법 1과 같다.
				sObj.add();				
			}
		}
	}
}