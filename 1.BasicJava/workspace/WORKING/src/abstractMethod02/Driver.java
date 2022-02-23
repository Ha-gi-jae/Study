package abstractMethod02;

public class Driver {
	public static void main(String[] args) {
		동물[] 동물들 = new 동물[5];
		
		동물들[0] = new 고양이();
		동물들[1] = new 강아지();
		동물들[2] = new 병아리();
		동물들[3] = new 송아지();
		동물들[4] = new 쥐();
		
		for(int i = 0; i < 동물들.length; i++){
			동물들[i].울어보세요();
		}
		
//		동물 짐승 = new 동물(); 
//		객체 불가능 참조변수 가능
//		double akakak = Math.floor(((Math.random() + 36) + (Math.random() * 2) * 10)) / 10.0;
		double ak = (Math.floor(((Math.random()+36) + (Math.random()*2))* 10) ) / 10;
		System.out.println(ak);
	}
}
