package e_oop;

public class Aircon {

	boolean power;
	int tem = (int)(Math.random()*14)+17;
	
	 
	void power(){
		if(power) {
			power = true;
			System.out.println("에어컨을 켭니다.");
		}
		else{ 
			power = false;
			System.out.println("에어컨을 끕니다."); 
			}
	}
	
	void tem(String temp){
		
		if(temp.equals("UP")){
			tem++;
			System.out.println("에어컨 온도를 올립니다.");
		}
		else if(temp.equals("DOWN")){
			tem--;
			System.out.println("에어컨 온도를 내립니다.");
		}
		
	}
}
