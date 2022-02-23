package kr.or.ddit.basic;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class T18_SyncCollectionTest {
/*
	Vector, Hashtable등의 예전부터 존재하던 Collection 클래스들은 내부에 동기화 처리가 되어 있다.
	그런데, 최근에 새로 구성된 Collection 클래스들은 동기화 처리가 되어있지 않다.
	그래서 동기화가 필요한 프로그램에서 이런 Collection 클래스들을 사용하려면 동기화 처리를 한 후에 사용해야 한다.
 */
	// 동기화 처리를 하지 않을 경우...
	private static List<Integer> list1 = new ArrayList<Integer>();
	// vector 도 list 다.        			 new Vector<>();
	
	//동기화 처리를 하는 경우... Collection 클래스 자체 동기화 처리.
	private static List<Integer> list2 = Collections.synchronizedList(new ArrayList<Integer>());
	
	public static void main(String[] args) {
		
		// 익명 클래스로 스레드 구현
		Runnable r = new Runnable() {
			
			@Override
			public void run() {
				for(int i = 1; i <= 10000; i++) {
//					list1.add(i); // 동시에 add() 메서드를 접근 못하게 해줘야한다.  동기화 처리 하지 않은 경우...
					list2.add(i); // 동기화 처리를 한 경우...
				}
			}
		};
		
		Thread[] ths = new Thread[] {
			new Thread(r), new Thread(r),				
			new Thread(r), new Thread(r), new Thread(r)
				
		};
		
		for(Thread th : ths) {
			th.start();
		}
		
		for(Thread th : ths) {
			try {
				th.join();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		
//		System.out.println("list1의 개수 : " + list1.size());
		System.out.println("list2의 개수 : " + list2.size());
	}
}










