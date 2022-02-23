package e_oop;

public class Home {

	public static void main(String[] args) {
		Iot iot = new Iot();
		Light light = new Light();
		Speaker speaker = new Speaker();
		Tv tv = new Tv();
		
		int lpk = 0; // 조명 파워 킬
		int spk = 0; // 스피커 파워 킬
		int tvpk = 0; // 티비 파워 킬
		
		boolean remoteflag = true;
		System.out.println("리모콘 전원");
		iot.power();
		while(remoteflag){
			
			System.out.println("\t\t리모콘\n1.조명\t2.스피커\t3.티비\t4.종료");
			int input = ScanUtil.nextInt();
		
			switch (input) {
			
			case 1:
					boolean lightflag = true; // 조명 반복 차단
					while(lightflag){//조명
					System.out.println("\t\t조명\n1.전원\t2.밝기증가\t3.밝기감소\t4.뒤로가기");
					int a = ScanUtil.nextInt();	
						switch(a){
						
						case 1:
							light.power();
							lpk++;
							if(lpk == 2) { lpk=0; System.out.println("조명 종료"); lightflag = false;}
							break;
						
						case 2:
							light.brightup();
							break;
						
						case 3:
							light.brightdown();
							break;
						case 4:
							System.out.println("메인 리모콘으로 돌아갑니다.");
							lightflag = false;
							break;
						}
					
					}
					break;
			case 2:
					boolean speakerflag = true; // 스피커 반복 차단
					while(speakerflag){//스피커
					System.out.println("\t\t스피커\n1.전원\t2.소리증가\t3.소리감소\t4.일시정지/재생\t5.배터리확인\t6.뒤로가기");
					int b = ScanUtil.nextInt();
						switch(b){
						
						case 1:
							speaker.power();
							spk++;
							if(spk == 2) { spk=0; System.out.println("스피커 종료"); speakerflag = false;}
							break;
							
						case 2:
							speaker.volumeUp();
							break;
						
						case 3:
							speaker.volumeDown();
							break;
							
						case 4: 
							speaker.stop();
							break;
							
						case 5:	
							speaker.battery();
							break;
							
						case 6:
							System.out.println("메인 리모콘으로 돌아갑니다");
							speakerflag = false;
							break;
							}
						}
				
					break;	
			case 3:
				boolean tvflag = true; // 티비 반복 차단	
				while(tvflag){//티비
					System.out.println("\t\tTV\n1.전원2.채널↑\t3.채널↓\t4.채널수동\t5.소리증가\t6.소리감소\t7.뒤로가기");
					int c = ScanUtil.nextInt();
						switch(c){
						
						case 1:
							tv.power();
							tvpk++;
							if(tvpk == 2){ tvpk=0; System.out.println("TV종료"); tvflag= false;}
							break;
							
						case 2:
							tv.channelUp();
							break;
							
						case 3:
							tv.channelDown();
							break;
							
						case 4:
							tv.channelSelf();
							break;
							
						case 5:
							tv.volumeUp();
							break;
							
						case 6:
							tv.volumeDown();
							break;
							
						case 7:
							System.out.println("메인 리모콘으로 돌아갑니다.");
							tvflag = false;
							break;
						}
				}
					break;
					
			case 4:
				iot.power();
				remoteflag = false;
					break;
				
				
			}
		}
	
	}
}
