package e_oop;

public class Iot {
	boolean power;
	int sp_volume = 60;
	int tv_volume = 60;
	

	
	int bright = 70;
	static final int MAX = 100;
	static final int MIN = 0;
	
	 int battery = (int)(Math.random()*25)+55;
	 int batterydie = 3;


	
	void power(){ // 리모컨 전원
		power = !power;
				System.out.println(power ? "시작" : "종료" );
	}


}

class Light{//조명 클래스 완성
	boolean power;
	Iot iot = new Iot();
	
	
	void power(){ // 조명 전원
		power = !power;
				System.out.println(power ? "반짝반짝" : "어둡어둡" );
	}
	
	void brightup(){//조명 밝기 증가
		if(power){ 
		iot.bright += 5;
		if(iot.bright <= iot.MAX){
			System.out.println("현재 밝기는" + iot.bright + " 입니다.");
		}		
		else if(iot.bright >= 100){ 
			iot.bright = 100;
			System.out.println("최대 밝기입니다.");
		}
		}
		else System.out.println("조명 전원을 켜주십시오.");
	}
	
	
	void brightdown(){//조명 밝기 감소
		if(power){
		iot.bright -= 5;
		if(iot.MIN < iot.bright){
			System.out.println("현재 밝기는" + iot.bright + " 입니다.");
		}
		else if(iot.bright <= 0){ 
			System.out.println("밝기가 0이기 때문에 조명을 끕니다.");
			iot.bright = 0;
			power = true; power(); 
		}
		}
		else System.out.println("조명 전원을 켜주십시오.");
	}
}






class Speaker{//스피커
	boolean power;
	Iot iot = new Iot();
	void power(){ //스피커 전원
		power = !power; 
				System.out.println(power ? "스피커 재생" : "스피커 종료" );
	}
	
	void volumeUp(){ //스피커 볼륨 업
		if(power){
		iot.sp_volume += 5;				
		iot.battery -= iot.batterydie;
		if(iot.sp_volume < iot.MAX){
				System.out.println("현재 소리크기는" + iot.sp_volume + " 입니다.");
						if(iot.battery <= 0){ 
							System.out.println("배터리 소모로 인한 스피커 종료");
							power = true;			
							power();
						}
		}		
		else if(iot.sp_volume >= 100){
			iot.sp_volume = 100;
			iot.battery -= iot.batterydie;
			System.out.println("소리가 최대치입니다.");
					if(iot.battery <= 0){ 
						System.out.println("배터리 소모로 인한 스피커 종료");
						power = true;			
						power();
					}
		}
		}
		else System.out.println("스피커 전원을 켜주십시오.");
		
	}
	
	void volumeDown(){ // 스피커 볼륨 다운
		if(power){
		iot.sp_volume -= 5;	
		if(iot.MIN < iot.sp_volume){
			if(iot.sp_volume <=0){ 
				iot.sp_volume = 0;
				System.out.println("소리크기가 0입니다. 볼륨을 높여주세요.");
			}	
			else { 
				System.out.println("현재 소리크기는" + iot.sp_volume + " 입니다"); 
			}
			iot.battery -= iot.batterydie;
				if(iot.battery <= 0){ 
					System.out.println("배터리 소모로 인한 스피커 종료");
					power = true;			
					power();
				}
		}
		}
		else System.out.println("스피커 전원을 켜주십시오.");
	}
	
	
	void battery(){ // 스피커 배터리
		if(power){
		iot.battery -= iot.batterydie;

		if(iot.battery <= 0){ 
			System.out.println("배터리 소모로 인한 스피커 종료");
			power = false;
			power();
		}
		else System.out.println("현재 스피커 배터리: " + iot.battery + "% 입니다.");
		}
		else System.out.println("스피커 전원을 켜주십시오.");
	}
		
			
	void stop(){ // 일시정지
		if(power){
	
		System.out.println("일시 정지");
		
		System.out.println("다시 재생: Enter입력");
		
		String a = ScanUtil.nextLine();
		
		play();
		}
		else System.out.println("스피커 전원을 켜주십시오.");
	}
	
	
	void play(){ // 일시정지 해제
		if(power){
		iot.battery -= iot.batterydie; // 재생하니까 배터리 소모
		if(iot.battery <= 0){ //배터리 가 꺼졌으니 종료
			System.out.println("배터리 소모로 인한 스피커 종료");
			power = true;
			power();
		}
		else System.out.println("다시 재생");	
		}
		else System.out.println("스피커 전원을 켜주십시오.");
	}
}


//-------------------위 까지 완료
class Tv{
	boolean power;
	Iot iot = new Iot();
	int ch = (int)(Math.random()*100)+1;
	
	
	
	void power(){
		power = !power;
				System.out.println(power ? "TV 시청" : "TV 종료" );
	}
	
	void channelUp(){
		if(power){
			ch++;
			if(ch >100) {ch = 1;}
			System.out.println(ch + "번 입니다.");
		}
		else System.out.println("TV 전원을 켜주십시오.");
	}
	
	void channelDown(){
		if(power){
		ch--;
		if(ch < 1) { ch = 100;}
		System.out.println(ch + "번 입니다.");
		}
		else System.out.println("TV 전원을 켜주십시오.");
	}
	
	void channelSelf(){
		if(power){
			System.out.println("채널을 입력하세요.");
		ch = ScanUtil.nextInt();
		if(ch < 1){ 
			System.out.println("채널을 잘못 입력하셨습니다.");
			ch = (int)(Math.random()*100)+1;
		}
		else if(ch > 100){ 
			System.out.println("채널을 잘못 입력하셨습니다.");
			ch = (int)(Math.random()*100)+1;
		}
		else System.out.println(ch + "번 입니다.");
		}
		else System.out.println("TV 전원을 켜주십시오.");
	}
	
	void volumeUp(){
		if(power){
		if(iot.tv_volume < iot.MAX){
				iot.tv_volume += 5;				
				System.out.println("현재 소리크기는" + iot.tv_volume + " 입니다.");
		}		
		else if(iot.tv_volume >= 100){
			System.out.println("소리가 최대치입니다.");
		}
		}
		else System.out.println("TV 전원을 켜주십시오.");
	}
	
	void volumeDown(){ 
		if(power){
	
		if(iot.MIN < iot.tv_volume){
			iot.tv_volume -= 5;	
			
			if(iot.tv_volume <=0){ 
				iot.tv_volume = 0;
				System.out.println("소리크기가 0입니다. 볼륨을 높여주세요.");
			}	
			else { 
				System.out.println("현재 소리크기는" + iot.tv_volume + " 입니다"); 
			}
		}	
		}
		else System.out.println("TV 전원을 켜주십시오.");
	}
	
}