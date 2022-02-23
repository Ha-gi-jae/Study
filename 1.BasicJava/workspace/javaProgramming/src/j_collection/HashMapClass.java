package j_collection;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Set;

public class HashMapClass {

	public static void main(String[] args) {//테이블을 형태를 만들때 Map을 사용
											//key는 컬럼명..... 값은 컬럼 값.....
											//해쉬맵을 여러개 만들어서 그걸 ArrayList 에 담으면 테이블이 된다.
		
		
		/*
		 * Object put(Object key, Object value) : 지장된 키와 값을 저장한다.
		 * Object remove(Object key) : 지정된 키로 저장된 값을 제거한다.
		 * Object get(Object key) : 지정된 키의 값(없으면 null)을 반환한다.
		 * Set keySet() : 저장된 모든 키를 Set으로 반환한다.
		*/
		//모든 키를 리턴 셋 형태로.
		
		
		HashMap<String, Object> map = new HashMap<>();
		//키는 보통 String 타입. 값은 저장하고싶은 타입. 종종 Object로 사용함.
		//String에 Object를 넣는다면 이것저것 가능하지만 그런게 아니면 Integer String.
		map.put("age", 10);
		map.put("name", "홍길동");
		map.put("date", new Date());
		
		System.out.println(map);
		
		map.put("name", "이순신"); //하나의 키에는 하나의 데이터만 저장가능하다.
		System.out.println(map);
		
		map.remove("age");
		System.out.println(map);
		
		Object value = map.get("name"); // 제네릭으로 Object를 했기때문에 타입이 Object임. Integer 로 했다면 Integer 겠지?
		//Object타입의 변수에 저장. 객체는 String .. String 타입의 메서드를 쓰고 싶다면 형변환 시켜줘야한다. String 타입으로.
		System.out.println(value);
		
		System.out.println(((String)value).charAt(0)); // 괄호로 한번 더 감싼 후에 .을 찍어야 스트링 타입의 메서드를 호출 가능.
		
		// HashMap<String, Object> map = new HashMap<>(); <<< 여기서.
		Set<String> keys = map.keySet(); //저장된 모든 키 리턴. 타입은 Set 타입.
		//왜 스트링타입? 해쉬맵의 타입을 String 타입으로 했기때문에.
		//키를 모를때 사용해서 키를 알 수 있음.
		//Set은 값을 꺼낼 수 있는 메서드 존재 하지 않음 get 같은거.
		
		//간단한방법
		//keys에 String타입이 저장되있으니 String인거임. 
		//key 값을 구분하기 위한 구분자.
		for(String key : keys){//기존 for문과 다름. 콜론을 기준으로 뒤에 Array ArrayList Set 값이 여러개 담겨져있는 뭔가가.
							   //키를 하나씩 꺼내서 변수에 저장 후. 블럭안에 내용 실행. 반복함. 무조건 순서대로. 
			System.out.println(key + " : " + map.get(key)); //key 키.    map.get(key)가 값.
		}
		
		Object[] arr = map.values().toArray(); // 값만 따로 빼줌.
		System.out.println(Arrays.toString(arr));
		
		//회원 테이블
		/*
		 * 아이디		: admin
		 * 비밀번호 	: admin123
		 * 이름		: 관리자
		 * 전화번호	: 010-1234-5678
		*/
		
		HashMap<String, String> user = new HashMap<>();
		user.put("id", "admin");
		user.put("password", "admin123");
		user.put("name", "관리자");
		user.put("tel", "010-1234-5678");
		
		ArrayList<HashMap<String, String>> table = new ArrayList<>();
		table.add(user);
		
		
		HashMap<String, String> user2 = new HashMap<>();
		user2.put("id", "gijae");
		user2.put("password", "gijae123");
		user2.put("name", "사용자");
		user2.put("tel", "010-6254-4244");
		table.add(user2);
		System.out.println(table);
		
		user = new HashMap<>();
		user.put("id", "asdf");
		user.put("password", "asdf123");
		user.put("name", "홍길동");
		user.put("tel", "010-1234-1234");
		table.add(user);
		System.out.println(table);
		
		
		
		
		
	}

}
