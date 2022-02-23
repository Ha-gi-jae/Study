package kr.or.ddit.basic;

public class T20_WaitNotifyTest {
	public static void main(String[] args) {
		DataBox dataBox = new DataBox();
		
		ProducerThread pth = new ProducerThread(dataBox);
		
		ConsumerThread cth = new ConsumerThread(dataBox);
		
		pth.start();
		cth.start();
		
		
		
		
	}
}

// 데이터를 공통으로 사용하는 클래스
class DataBox {
	private String data;
	
	// data가 null이 아닐때 data값을 반환하는 메서드
	public synchronized String getData() { // 데이터를 가져오는거임. 
		if(data == null) { // 데이터가 없다면 => 빵을 가지러 갔는데 없으면
			try {
				wait(); // wait 하고있겠다.
			}catch(InterruptedException ex) {
				ex.printStackTrace();
			}
		}
		
		String returnData = data;
		System.out.println("읽어온 데이터 : " + returnData + " - get");
		data = null;
		System.out.println(Thread.currentThread().getName() + " notify() 호출 - get");
		notify();
		
		return returnData;
	}
	
	// data가 null일 경우에만 자료를 세팅하는 메서드
	public synchronized void setData(String data) { 
		if(this.data != null) { // 값이 있으면 세팅할 필요가 없으니까 => 빵이 있으니까 
			try {
				wait(); // 기다림.
			}catch(InterruptedException ex){
				ex.printStackTrace();
			}
		}
		this.data = data; // 현재데이터가 null이면 파라미터로 받은 data를 넣어줌.
		System.out.println("세팅한 데이터 : " + this.data + " - set");
		System.out.println(Thread.currentThread().getName() + " notify() 호출 - set");
		notify();
	}
}

// 데이터를 세팅만 하는 스레드
class ProducerThread extends Thread {
	private DataBox dataBox;
	
	public ProducerThread(DataBox dataBox) {
		super("ProducerThread");
		this.dataBox = dataBox;
	}
	
	@Override
	public void run() {
		for(int i = 1; i <= 10; i++) {
			String data ="Data-" + i; // 데이터 생성.
			System.out.println("dataBox.setData(" + data + ") 호출" + " - pro");
			
			dataBox.setData(data); // 공유객체 세터이용해서 데이터를 생성한거로 바꿔줌.
		}
	}
}

// 데이터를 읽어만 오는 스레드
class ConsumerThread extends Thread { // 데이터를 소비(꺼내오기만) 함.
	private DataBox dataBox;
	
	public ConsumerThread(DataBox dataBox) {
		super("ConsumerThread"); // 이름.
		this.dataBox = dataBox;
	}
	
	@Override
	public void run() {
		for(int i = 1; i <= 10; i++) {
			String data = dataBox.getData(); // 데이터를 가져오기만 함.
			System.out.println("dataBox.getData() : " + data + " - con"); // 가져온 데이터를 출력해줌.
		}
	}
}
