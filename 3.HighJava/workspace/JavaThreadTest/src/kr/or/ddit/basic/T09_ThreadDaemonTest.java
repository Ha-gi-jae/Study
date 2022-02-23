package kr.or.ddit.basic;

public class T09_ThreadDaemonTest {
	public static void main(String[] args) {
		
		AutoSaveThread autoSave = new AutoSaveThread();
		
		// 데몬스레드로 설정하기 ( start()메서드 호출하기 전에 설정한다.)
		autoSave.setDaemon(true); // 메인 스레드가 사라지면 데몬 혼자남음. 혼자서는 의미가 없으므로 종료함.
		// setDaemon이 데몬스레드로 지정해주는 것임. 일반 스레드를 보조해주는 역할이다.
		autoSave.start(); // 스타트
		
		try {
			for(int i = 1; i <= 20; i++) {
				System.out.println("작업 " + i); // 작업하는 거 보여주려고 찍음.
				Thread.sleep(1000); // 1초 마다 자렴  작업 20 될때까지.
			}
		} catch (InterruptedException ex) {
			ex.printStackTrace();
		}
		System.out.println("메인 스레드 종료..."); // 작업 20되면 출력
	}// 끄읕
}


class AutoSaveThread extends Thread{
	
	/**
	 * 데이터 저장기능
	 */
	private void save() {
		System.out.println("작업 내용을 저장합니다...");
	}
	
	@Override
	public void run() {
		while(true) { // 무한 반복..  false로 바꿔주질 않으니까!
			try {
				Thread.sleep(3000); // 3초간 잠듬
			} catch (InterruptedException ex) {
				ex.printStackTrace();
			}
			
			save(); // 저장기능 호출
		}
	}
}