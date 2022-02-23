package j_collection;

import java.util.ArrayList;

public class ArrayListClass {

	public static void main(String[] args) {
		/*
		 * List      <인터페이스   배열과 구조가 비슷 인덱스에 값을 저장 [인덱스가 있다 = 순서가있다]
		 * Map		 <인터페이스   값을 저장할때 인덱스가아닌 키에 저장한다. 키는 저장할 사람이 직접 설정. 키와 값을 같이 저장 [순서가 없음]
		 * Set		 <인터페이스   값을 저장하는데, 중복된 값은 저장되지 않는다.
		 * List - ArrayList/ map - HashMap / set - 잘 사용 안함. 그 외는 고급자바때...
		 * 
		 * boolean add(Object obj) : 마지막 위치에 객체를 추가 후 성공여부를 반환한다. [길이가 능동적으로 늘어남]
		 * void add(int index, Object obj) : 지정된 위치에 객체를 추가한다. [인덱스를 지정해서 값을 넣음. 기존의 값은 한칸 뒤로 밀려남. 해당 인덱스 뒤의 모든 값이 밀려남.]
		 * Object set(int index, Object obj) : 지정된 위치에 객체를 저장 후 기존 객체를 반환한다. [수정하는 메서드. 기존의 저장된 값을 리턴해주고 새로운 값을 저장.]
		 * Object get(int index) : 지정된 위치의 객체를 반환한다. 
		 * int size() : 저장된 객체의 수를 반환한다. [collection은 length가 아닌 size]
		 * Object remove(int index) : 지정된 위치의 객체를 제거 후 반환한다. [인덱스를 넣어주면 해당 인덱스의 값을 삭제하고 리턴.]
		 */
		
		ArrayList sample = new ArrayList();
		
		sample.add("abc"); // 0번 인덱스
		sample.add(100); // 1번 인덱스    * 타입에 상관없이 저장이 가능하다.
		
		//제네릭을 지정하지 않으면 넣을때는 편하나 꺼낼때는 타입을 예측하기 힘들다.
		//따라서 제네릭의 사용이 권장된다.
		
		ArrayList<Integer> list = new ArrayList();
		//제네릭 : 저장할 수 있는 타입을 지정해준다.
		// <타입> : 앞의 타입의 데이터만 저장하겠다.
		list.add(10);
//		list.add("abc"); 컴파일에러가 뜬다.
		list.add(20);
		System.out.println(list.add(30)); //add 라는 메서드는 리턴 타입이 있음. 저장 성공여부를 리턴해준다.
		System.out.println(list); // 안에 저장된 값을 볼 수 있다.
		// [10, 20, 30] 이 저장되어있음.
		
		list.add(1, 40);
		// [10, 40, 20, 30]이렇게 저장이된다.
		
		System.out.println(list);
		// list.add(10, 40) 이런거는 되질 않는다 이미 지정한 범위 내에서만 가능!!
		
		/*
		 * 기본형타입:객체타입  서로 자동으로 형변환이 된다.
		 * byte : Byte
		 * shor : Short
		 * int : Intger
		 * long : Long
		 * float : Float
		 * double : Double
		 * char : Character
		 * boolean : Boolean
		*/             // 원래는 new Integer(50) 이렇게 해야하는데 자동으로 형변환이 되서 안써주는 것임.
		Integer before = list.set(2, 50); //컬렉션은 객체만 저장가능 기본형타입 ㄴㄴ  기존 인덱스 2에 있던 값을 반환해주고 나서, 50을 넣어주는것임.
		System.out.println("before : " + before);
		System.out.println("after : " + list.get(2));
		System.out.println(list);
		
//		for(int i = 0; i < list.size(); i++){ // 사이즈 만큼 도는데  밑에서 삭제해주니까 사이즈가 계속 줄어든다.
//			System.out.println(i + " : " + list.get(i));
//			list.remove(i);
//		}
//		System.out.println(list); 
		
		
		//값을 지워주려면 뒤에서부터 지워줘야한다.
		for(int i = list.size() - 1; i >= 0; i--){
			System.out.println(i + " : " + list.remove(i));
		}
		System.out.println(list);
		//앞으로 array는 쓰지 않음. 쓸 거면  list 를 써라.
		
		//list 1-~100사이의 랜덤값을 10개 저장해주세요.
		for(int i = 0; i < 10; i++){
			list.add((int)(Math.random()*100)+1);
		}
		System.out.println(list);
		
		//list에 저장된 값의 합계와 평균을 구해주세요.
//		int sum = 0;
//		double avg = 0;
//		for(int i = 0; i <list.size(); i++){
//			sum += list.get(i);
//		}
//		avg = (double)sum / list.size();
		
		//list에서 최소값과 최대값을 구해주세요.
//		int min = list.get(0);
//		int max = list.get(0);
//		for(int i = 0; i < list.size(); i++){
//			if(list.get(i) < min){
//				min = list.get(i);
//			}
//			if(max < list.get(i)){
//				max = list.get(i);
//			}
//		}
//
//		System.out.println("최대값 :" + max + " 최소값 : " + min);
//		System.out.println(list);
		
		//list를 오름차순으로 정렬해주세요. (나)
//		int temp = 0;
//		for(int i = 0; i < list.size()-1;i++){
//			for(int j = i+1; j < list.size();j++){
//				if(list.get(i) > list.get(j)){
//					temp = list.get(j);
//					list.set(j, list.get(i));
//					list.set(i, temp);
//				}
//			}
//		}
//		System.out.println(list);
		
		//(교수님)
		for(int i = 1; i < list.size(); i++){
			int temp = list.get(i);
			int j = 0;
			for(j = i - 1; j >= 0; j--){
				if(temp < list.get(j)){
					list.set(j + 1, list.get(j));
				}
				else{
					break;
				}
			}
			list.set(j + 1, temp);
		}
		System.out.println(list);
	
		//list를 내림차순으로 정렬해주세요.
		int temp = 0;
		for(int i = 0; i < list.size(); i++){
			for(int j = i+1; j < list.size(); j++){
				if(list.get(i) < list.get(j)){
					temp = list.get(j);
					list.set(j,list.get(i));
					list.set(i, temp);
				}
			}
		}
		System.out.println(list);
		
		//2차원
		ArrayList<ArrayList<Integer>> list2 = new ArrayList<>();
		
		list = new ArrayList<>();
		list.add(10);
		list.add(20);
		list.add(30);
		
		list2.add(list);
		
		list = new ArrayList<>();
		list.add(40);
		list.add(50);
		list2.add(list);
	
		System.out.println(list2);
		
		for(int i = 0; i < list2.size(); i++){
			ArrayList<Integer> li = list2.get(i);
			for(int j = 0; j < li.size(); j++){ // li.size(); 가 아니라 list2.get(i).size();로 해도됨. 배열이랑 같아..
				System.out.println(li.get(j));
			}
		}
		System.out.println("꺄");
		int num = list2.get(0).get(1);
		System.out.println(num);
	}

}
