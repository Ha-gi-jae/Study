package kr.or.ddit.basic;

import java.util.ArrayList;
import java.util.List;

public class T01_ArraylistTest {
	//클래스이름 : 
	//언더바 원래 잘 안씀. 수업 하려고 쓴거임.
	// T02_ ... T03.... 복습할때 보기 쉽게 하려고 해준거임. 명명규칙에 좋은게 아님.
	// 숙제 제출할때는 이렇게하면 안된다.
	public static void main(String[] args) {
		
		
		// DEFAULT_CAPACITY = 10   기본사이즈
		List list1 = new ArrayList(); // LinkedList      ArrayList 인터페이스 기반으로 코딩하면 적은 노력으로 대체하기 편하다.(유지보수 쉬워진다.)
		
		// add()메서드를 사용해서 데이터를 추가한다.
		list1.add("aaa");
		list1.add("bbb");
		list1.add(111);
		// List1.add(new Integer(111)); 원래는 이렇게 넣어야하는데 컴파일러가 알아서 해주기때문에 이렇게 하지 않고 위 처럼 한다.
		list1.add('k');
		list1.add(true);
		list1.add(12.34);
		list1.add(0); // 이 0을 지우려면 ?
		
		// size() => 데이터 개수
		System.out.println("size => " + list1.size());
		System.out.println("list1 " + list1);
		
		// get()으로 데이터 꺼내오기
		System.out.println("1번째 자료 : " + list1.get(0));
		
		// 데이터 끼워 넣기도 같다.
		list1.add(0, "zzz");
		System.out.println("list1 " + list1);
		
		// 데이터 변경하기(set메서드)
		String temp = (String) list1.set(0, "yyy");
		System.out.println("temp => " + temp);
		System.out.println("list1 =>" + list1);
		
		// 삭제하기
		list1.remove(0); // removeall 여러개  clear 전부다 
		System.out.println("삭제 후 : " + list1);
		
		list1.remove("bbb"); // 인덱스 번호로도 지울 수 있고, 값으로도 지울 수 있다.
		list1.remove(new Integer(0));  // 0을 지우려면  이렇게 해야함. 0을 쓰면 인덱스로 인식하기 때문에 리스트 첫번째 자료가 삭제된다.
		System.out.println("bbb 삭제 후 : " + list1);
		System.out.println("list1 =>" + list1);
		System.out.println("========================");
		
		// 제너릭을 지정하여 선언할 수 있다.
		List<String> list2 = new ArrayList<String>();
		list2.add("AAA");
		list2.add("BBB");
		list2.add("CCC");
		list2.add("DDD");
		list2.add("EEE");
		// list2.add(2222); String타입이여야만 하는데 Integer 타입이라 컴파일러를 하지 못한다.
		
		for(int i = 0; i < list2.size(); i++) {
			System.out.println(i + " : " + list2.get(i));
		}
		System.out.println("---------------------------------");
		
		// contains(비교 객체) => 리스트에 '비교객체'가 있으면 true
		// 						그렇지 않으면 false
		System.out.println(list2.contains("DDD")); // 리스트에 DDD가 포함되어있냐 ? 있으면 true
		System.out.println(list2.contains("ZZZ")); // 없으면 false
		
		// indexOf(비교객체) => 리스트에 '비교객체'를 찾아 '비교객체'가 있는
		//					  index값을 반환한다.
		//				 	    리스트에 '비교객체'가 없으면 -1을 반환한다.
		System.out.println("DDD의 index값 : " + list2.indexOf("DDD"));        // DDD가 몇번째 인덱스에 있니?
		System.out.println("ZZZ의 index값 : " + list2.indexOf("ZZZ"));		// ZZZ가 몇번쨰 인덱스에 있니? > 없으니까 -1
		System.out.println("----------------------------------");
		
		// toArray() => 리스트 안의 데이터들을 배열로 변환하여 반환한다.
		//				기본적으로 Object형 배열로 반환한다.
		Object[] strArr = list2.toArray();				//toArray()로 형변환 해서 넣음.. 
		System.out.println("배열의 개수 : " + strArr.length);
		
		// ArrayList 순차적으로 지우기
		for(int i = list2.size()-1; i >= 0; i--) {
			list2.remove(i);
		}
		System.out.println("삭제 후 크기 => " + list2.size());
		// 삭제 후 크기 2 임. 왜 ? 
		// 땡겨지기 때문에 . 즉 큰수에서부터 지워와야함.
		
		
		
		
		
		
	}
}