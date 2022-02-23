package kr.or.ddit.basic;

/**
 * 은행의 입출금을 스레드로 처리하는 예제
 * (Synchronized를 이용한 동기화 처리)
 * @author PC-06
 *
 */
public class T16_SyncAccountTest {
	public static void main(String[] args) {
		SyncAccount sAcc = new SyncAccount();
		
		sAcc.setBalance(10000); // 입금처리

		BankThread bth1 = new BankThread(sAcc);
		BankThread bth2 = new BankThread(sAcc);
		
		bth1.start();
		bth2.start();
	}
}

// 은행의 입출금을 관리하는 클래스 정의
class SyncAccount{
	
	private int balance; // 잔액이 저장될 변수

	public synchronized int getBalance() { // 호출하는 메서드 안까지 동기화 된다고 볼 수 없다. 그러니까 호출하는 곳도 해줘야함.
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}
	
	// 입금 처리를 수행하는 메서드 
	public void deposit(int money) {
		balance += money;
	}
	
	// 출금을 처리하는 메서드 (출금 성공 : true, 출금 실패 : false 반환)
	// 동기화 영역에서 호출하는 메서드도 동기화 처리를 해 주어야 한다.
	public synchronized boolean withdraw(int money) {
		// 동기화 처리 해야함. 이미 계산중일때 또 들어오면 같은 값을 가지고 오기때문에. 이 부분이 임계영역이니까!
		if(balance >= money) { // 잔액이 많을 경우...
			for(int i = 1; i <= 1000000000; i++) {} // 시간 때우기용
			
			balance -= money; // 출금하기
			
			System.out.println("메서드 안에서 balance = " + getBalance());
			
			return true; //  출금성공
		}else {
			return false; // 출금 실패
		}
	}
}

// 은행 업무를 처리하는 스레드
class BankThread extends Thread{
	private SyncAccount sAcc; // 공유객체 멤버 변수!
	
	public BankThread(SyncAccount sAcc) { // 저장!
		this.sAcc = sAcc;
	}
	
	@Override
	public void run() {
		boolean result = sAcc.withdraw(6000); // 6000원 인출
		System.out.println("스레드 안에서 result = " + result + ", balance = " + sAcc.getBalance());
																			// 현재 잔액.
	}
	
}

















