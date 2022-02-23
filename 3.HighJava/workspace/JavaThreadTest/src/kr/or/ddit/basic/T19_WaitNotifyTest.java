package kr.or.ddit.basic;
// 이후론 동기화가 되어있다는 생각으로 봐야함.
public class T19_WaitNotifyTest {
/*										//동기화영역일때,    Waiting 상태..
	wait() 메서드 => 동기화 영역에서 락을 풀고 Wait-Set영역(공유객체별 존재)으로 이동시킨다.
	notify() 또는   notifyAll() 메서드 => Wait-Set영역에 있는 스레드(들)을 깨워서 실행 될 수 있도록 한다.
	 - (notify()는 하나, notifyAll()은 Wait-Set에 있는 전부를 깨운다.)
	
	=> wait()와 notify(), notifyAll()메서드는 동기화 영역에서만 실행 할 수 있고, Object클래스에서 제공하는 메서드이다.
 */
	public static void main(String[] args) {
		WorkObject workObj = new WorkObject();
		
		Thread thA = new ThreadA(workObj);
		Thread thB = new ThreadB(workObj);
		
		thA.start();
		thB.start();
		
	}
}

// 공통으로 사용할 객체
class WorkObject {
	public synchronized void methodA() {
		System.out.println("methodA() 메서드 작업 중...");
		
		notify(); // 다른사람 깨우고
		
		try {
			wait(1000); // 내가 잠   // wait()일때는 그냥 wait 상태인데 wait(시간) 시간을 넣어주면 time wait임.
		}catch(InterruptedException ex) {
			ex.printStackTrace();
		}
	}
	
	public synchronized void methodB() {
		System.out.println("methodB() 메서드 작업 중...");
		
		notify(); // 다른사람 깨우고
		
		try {
			wait(1000); // 내가 잠
		}catch(InterruptedException ex) {
			ex.printStackTrace();
		}
	}
	
}

// WorkObject의 methodA()메서드만 호출하는 스레드
class ThreadA extends Thread {
	private WorkObject workObj;
	
	public ThreadA(WorkObject workObj) {
		this.workObj = workObj;
	}
	
	@Override
	public void run() {
		for(int i = 1; i <= 10; i++) {
			workObj.methodA(); // 10 번 부름.
		}
		System.out.println("ThreadA 종료.");
	}
	
}

// WorkObject의 methodB()메서드만 호출하는 스레드
class ThreadB extends Thread {
	private WorkObject workObj;
	
	public ThreadB(WorkObject workObj) {
		this.workObj = workObj;
	}
	
	@Override
	public void run() {
		for(int i = 1; i <= 10; i++) {
			workObj.methodB(); // 얘도 10번 부름.
		}
		System.out.println("ThreadB 종료.");
	}
	
}