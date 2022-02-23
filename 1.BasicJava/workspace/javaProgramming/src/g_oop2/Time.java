package g_oop2;

public class Time {
	
	private int hour;
	private int minute;
	private int second;
	private int day;
	//겟터 셋터
	//메서드를 통해 변수에 간접적으로 접근할 수 있다.
	
	public int getHour() {//get : 변수 값 읽어오기
		return hour;
	}

	public void setHour(int hour) {//set : 변수 값 저장하기
		if(hour < 0) {}
		else if (23 < hour) { hour %=24;}
		this.hour =hour;
	}


	public int getMinute() {
		return minute;
	}


	public void setMinute(int minute) {
		if(minute < 0){}
		else if(59 < minute) {minute = minute%60; setHour(hour + minute/60); }
		this.minute =minute;
	}

	
	public int getSecond() {
		return second;
	}


	public void setSecond(int second) {
		if(second < 0){}
		else if(59 <second){second = second%60; setMinute(minute + second/60); }
		this.second =second;
	}


	String getTime(){
		return hour + ":" + minute + ":" + second;
	}
	
	void clock(){
		while(true){
			System.out.println(getTime());
			stop(1000);
			setSecond(second + 1);
		}
	}
	
	private void stop(int interval){//불필요하므로 숨김.
		try {
			Thread.sleep(interval); //1000분의 1초 
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// try catch 가 없으면 런타임 오류가 발생함.
		
	}
	
	
	
}
