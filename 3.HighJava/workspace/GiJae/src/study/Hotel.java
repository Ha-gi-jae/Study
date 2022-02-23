package study;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;

public class Hotel {
	private Scanner scan; 
	private Map<String, Info> InfoMap;
	
	public  Hotel() {
		scan = new Scanner(System.in);
		InfoMap = new HashMap<>();
	}

	public static void main(String[] args) {
		new Hotel().hotelStart(); //시작!
	}
	
	public void displayMenu() {	//화면구성
		System.out.println("*******************************************");
		System.out.println("어떤 업무를 하시겠습니까?");
		System.out.println("1.체크인  2.체크아웃  3.객실상태  4.업무종료");
		System.out.println("*******************************************");
		System.out.print("메뉴선택 =>");
	}
	
	public void hotelStart() { //시작메서드
		boolean flag = true; // 업무종료시 while 조건에 있는 flag가 false로 되면서 반복을 멈추게 하기 위해서 사용. 
		System.out.println("**************************");
		System.out.println("호텔 문을 열었습니다.");
		System.out.println("**************************");
		System.out.println();
		
		while(flag) {
			
			displayMenu(); // 호출해서 메뉴 보여주기.
			
			int menuNum = scan.nextInt(); // 메뉴 구성도 번호 받기
			
			switch (menuNum) { // 위에서 입력한 번호로 구성도에 맞는  메서드 실행!
			case 1:
				checkIn(); // 체크인 메서드
				break;

			case 2:
				checkOut(); // 체크아웃 메서드
				break;
			case 3:
				report(); // 객실상태 메서드
				break;
			case 4:
				System.out.println("**************************");
				System.out.println("호텔 문을 닫았습니다.");
				System.out.println("**************************");
				flag = false; // while 종료. System.Exit(0);   
				break;
			}
		}
	}

	private void report() {// 객실상태
		Set<String> keySet = InfoMap.keySet();
		//keySet()은 키 값을 가져와준다. InfoMap의 키 값들이 keySet 변수에 모두 저장 
		if(keySet.size() == 0) {
			//key의 데이터 개수 체크! 0이면 데이터가 없다. 
			System.out.println("체크인한 사람이 없습니다.");
		}else { // 데이터가 있을경우
			Iterator<String> it = keySet.iterator();
			// Iterator => 반복자. 모든 키의 값을 it에 저장. 왜 Iterator을 쓰냐? > Set데이터는 인덱스가 없기때문에  
			while(it.hasNext()) { // hasNext는 다음 자료가 있는지 검사하는 역할. it의 다음 위치에 자료가 존재하는지 확인.
				String roomnumber = it.next(); // next는 위에서 이동한 위치의 키값을 roomnumber에 반환해주는 역할
				Info i = InfoMap.get(roomnumber); // 위 it가 roomnumber로 넘겨준 키값에 해당하는 value를 가져와 Info i에 넘겨준다. 
				System.out.println("방번호 : " + i.getRoomnumber()+", 투숙객 : " + i.getName());
			}
		}
	}

	private void checkOut() {
		System.out.println("어느방을 체크아웃 하시겠습니까?");
		System.out.print("방번호 입력 =>");
		String roomnumber = scan.next();
		System.out.println();
		if(InfoMap.remove(roomnumber) == null) { // null이라는건  Key가 존재하지 않는다. 
			System.out.println(roomnumber + "방에는 체크인한 사람이 없습니다.");
		}else {
			System.out.println("체크아웃 되었습니다.");
		}
	}

	private void checkIn() {
		System.out.println("어느방에 체크인 하시겠습니까?");
		System.out.print("방번호 입력 =>");
		String roomnumber = scan.next();
		System.out.println("누구를 체크인 하시겠습니까?");
		System.out.print("이름 입력 =>");
		String name = scan.next();
		System.out.println();
		if(InfoMap.get(roomnumber) != null) { // null이 아니라는 것은 이미 Key가 존재한다는거임.
			System.out.println(roomnumber + "방에는 이미 사람이 있습니다.");
			return;
		}
		InfoMap.put(roomnumber, new Info(roomnumber, name)); // 앞의 roomnumber(key)에 roomnumber(value)와 name(value)를 넣어준다. 
		System.out.println("체크인 되었습니다.");
		System.out.println();
	}
	
}



class Info {
	
	private String roomnumber; //방번호
	private String name; // 사람이름
	
	public Info(String roomnumber, String name) {
		super();
		this.roomnumber = roomnumber;
		this.name = name;
	}

	public String getRoomnumber() {
		return roomnumber;
	}

	public void setRoomnumber(String roomnumber) {
		this.roomnumber = roomnumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Info [roomnumber=" + roomnumber + ", name=" + name + "]";
	}
	
	
	
}