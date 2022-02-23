package kr.or.ddit.basic;

public class T03_ThreadTest {
	public static void main(String[] args) {
		// 스레드의 수행시간 체크해 보기
		Thread th = new Thread(new MyRunner());

		// UTC(Universal Time Coordinated 협정 세계 표준시)를 사용하여
		// 1970년 1월 1일 0시 0분 0초를 기준으로 경과한 시간을 밀리세컨드 단위로
		// 나타낸다. => 유닉스 타임스탬프
		long startTime = System.currentTimeMillis();

		th.start();

		try { // main 쓰레드가 th.join 호출하면 ? th의Thread가 끝날때까지 main Thread가 기다림. 특정  시간을 알고싶으면 위의 current와 join을 이용.
			th.join(); // 현재 실행 중인 스레드에서 작업 중인 스레드
   					   // (지금은 th스레드)가 종료 될때까지 기다린다.
		} catch (InterruptedException ex) {
			ex.printStackTrace();
		}
		long endTime = System.currentTimeMillis(); // 정확하지 않음.(대략적인 값)
		System.out.println("경과 시간 : " + (endTime - startTime) + "(ms)");
	}
}

/**
 * 1~1000000000 까지의 합계를 구하는 스레드
 */
class MyRunner implements Runnable { // 두번째 방법

	@Override
	public void run() {
		long sum = 0;
		for (long i = 1L; i <= 1000000000; i++) {
			sum += i;
		}
		System.out.println("합계 : " + sum);
	}
}
