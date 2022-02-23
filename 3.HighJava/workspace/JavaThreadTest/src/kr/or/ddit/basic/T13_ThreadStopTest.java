package kr.or.ddit.basic;

public class T13_ThreadStopTest {
/*
	Thread의 stop()메서드를 호출하면 스레드가 바로 멈춘다.
	이 때 사용하던 자원을 정리하지 못하고 프로그램이 종료되어서 나중에 실행되는 프로그램에 영향을 줄 수 있다.
	그래서 현재는 stop()메서드는 비추천으로 되어있다.
 */
	public static void main(String[] args) {
//		ThreadStopEx1 th = new ThreadStopEx1();
//		th.start();
//		
//		try {
//			Thread.sleep(1000);
//		} catch (InterruptedException ex) {
//			ex.printStackTrace();
//		}
//		th.setStop(true);
////		th.stop(); // 데이터 손실남
		// interrupt()메서드를 이용한 스레드 멈추기
		ThreadStopEx2 th2 = new ThreadStopEx2();
		th2.start();
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException ex) {
			ex.printStackTrace();
		}
		th2.interrupt(); // 인터럽트 걸기      // 거는 순간 sleep순간(Thread.sleep(1))에 예외에 걸리면서 { } 로 빠져나감.
	}
}

class ThreadStopEx1 extends Thread {
	private boolean stop;
	
	public void setStop(boolean stop) { // setStop 메서드를 통해 boolean값을 바꿔줌.
		this.stop = stop;
	}
	
	@Override
	public void run() {
		while(!stop) {
			System.out.println("스레드 처리 중...");
		}
		
		System.out.println("자원 정리 중..."); // JDBC쓸 때, 자원 정리 => 커넥션 => 스테이먼트 프리스테이먼트 CRUD날리고 작업 다 끝나고 종료하면 finally close 작업과 비슷
		System.out.println("실행 종료.");
	}
}

// interrupt() 이용하여 스레드를 멈추게 하는 방법
class ThreadStopEx2 extends Thread {
	@Override
	public void run() {
		// 방법1 : sleep() 메서드나 join()메서드 등을 사용할 때 interrupt() 메서드를 호출하면
		// interruptedException이 발생한다.

//		try {
//			while (true) {
//				System.out.println("스레드 처리 중...");
//				Thread.sleep(1); // sleep 할때 예외가 발생.
//			}
//		} catch (InterruptedException ex) { // 여기로옴 } // 감싸든 쓰로우를 하든. 자는동안 방해를 어떻게 할 것인가.
//			// InterruptedException ? Interrupted : 중단 된
//			System.out.println("자원 정리 중...");
//			System.out.println("실행 종료.");
//		}
		
		// 방법2 => interrupt()메서드가 호출되었는지 검사하기
		while(true) {
			System.out.println("스레드 처리중...");
			
			// 검사방법1 : 스레드의 인스턴스 객체용 메서드를 이용하는 방법       인스턴스 메서드인 is
			if(isInterrupted()) { // 인트럽트가 걸렸냐?  네 => true 아니요 => false		두개중 보통 이걸 쓴다.
				System.out.println("인스턴스용 isInterrupted()");
				System.out.println(isInterrupted()); // 걸린거 유지 하고 있어서 true 반환 
				break;
			}
			
			// 검사방법2 : 스레드의 정적 메서드로 이용하는 방법
//			if(Thread.interrupted()) { // Thread 안에 있는 스태틱 메서드	정적 메서드인 Thread.
//				System.out.println("정적 메서드 interrupted()");
//				System.out.println(Thread.interrupted()); // 호출한 시점에 interrupted가 걸렸다면 true. 하지만, 지금 걸려있지않아서 false 반환.
//				break;
//			}
		}
		System.out.println("자원 정리중...");
		System.out.println("실행 종료.");
	}
}