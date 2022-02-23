package e_oop.restaurant;

import java.util.Arrays;

public class Alba {
	//어떠한 기준으로 리턴타입과 파라미터 타입을 만들까?
	//일을 할 수 있는 메서드.
	// 주문, 서빙, 계산
	
	//메서드 : 알바가 할 일(보스가 알바한테 시킨 일)
	//파라미터 : 일을 하기 위해 필요한 것(보스가 알바에게 주는 것)
	//리턴타입 : 일을 하고 난 후 돌려주는 것(알바가 보스에게 주는 것)
	
	//주문받기위해서 필요한 것? 파라미터 없음 (보스가 알바한테 주는거.) 메뉴가 있으면 파라미터가 필요 없음
	//주문 받은 후 보스에게 줄 것? 주문서. 리턴 있음 (알바가 보스한테 주는거) 주문받은거 줘야함.
	
	String[] order(){// 여러개 주문할 수 있으므로 배열.
		System.out.println("주문 하시겠습니까?");
		return new String[]{"짜장면",	"탕수육"};
	}
	
	//서빙하기 위해 필요한 것? 음식(파라미터)
	//서빙한 후에 보스에게 줄 것? 없음(리턴)
	
	void serving(String[] foods){
		System.out.println(Arrays.toString(foods) + " 나왔습니다.");
		System.out.println("맛있게 드세요.");
	}
	
	//계산하기 위해 필요한 것? 주문서(파라미터)
	//계산 후 보스에게 줄 것? 없음(리턴)
	
	void pay(String[] order){
		System.out.println("2만원입니다. 안녕히가세요.");
	}
	
	
	
	
	
	
	
	
	
}
