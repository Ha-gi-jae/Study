package kr.or.ddit.basic;

/**
 * 스레드 상태를 출력하는 예제
 * 
 * @author PC-06
 *
 */
public class T10_ThreadStateTest {
	/*
	  < 스레드 상태 >
	  
		 - NEW : 스레드가 생성되고 아직 start()가 호출되지 않은 상태 
		 - RUNNABLE : 실행 중 또는 실행 가능한 상태
		 - BLOCKED : 동기화블럭에 의해 일시정지한 상태(Lock이 풀릴때까지 기다리는 상태) 
		 - WAITING, TIMED WAITING : 스레드의 작업이 종료되지는 않았지만 실행가능하지않은 일시정지 상태.
		                             TIMED_WATING은 일시정지 시간이 지정된 경우임
		 - TERMINATED : 스레드의 작업이 종료된 상태
	 */
	public static void main(String[] args) {
		StatePrintThread spt = new StatePrintThread(new TargetThread());
		
		spt.start();
		
		
		
		
	}
}

// 스레드의 상태를 출력하는 클래스(이 클래스도 스레드로 작성)
class StatePrintThread extends Thread {
	private Thread targetThread; // 상태를 출력할 스레드가 저장될 변수

	public StatePrintThread(Thread targetThread) {
		this.targetThread = targetThread;
	}

	@Override
	public void run() {
		while (true) {
			// Thread의 상태 구하기 (getState() 이용)
			Thread.State state = targetThread.getState();
			System.out.println("타겟 스레드의 상태값 : " + state);

			// NEW 상태인지 검사
			if (state == Thread.State.NEW) {
				targetThread.start(); // 스레드 구동시킴.
			}

			// 타겟 스레드가 종료 상태인지 검사
			if (state == Thread.State.TERMINATED) {
				break;
			}

			try {
				Thread.sleep(100);
			} catch (InterruptedException ex) {
				ex.printStackTrace();
			}
		}
	}
}
// Target용 스레드
class TargetThread extends Thread {
	
	@Override
	public void run() {
		for(long i = 1; i <= 1000000000; i++) {} // 시간지연용
		try {
			Thread.sleep(1500);
		} catch (InterruptedException ex) {
			ex.printStackTrace();
		}
		for(long i = 1; i <= 1000000000; i++) {} // 시간지연용
	}
}