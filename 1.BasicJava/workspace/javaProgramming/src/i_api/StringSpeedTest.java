package i_api;

public class StringSpeedTest {

	public static void main(String[] args) {
//		스트링은 변경할 때 객체를 새로 생성한다.
//		String str = "a";
//		long start = System.currentTimeMillis();
//		for(int i = 0; i < 1000000; i++){
//			str += "a";
//		}
//		long end = System.currentTimeMillis();
//		System.out.println(end - start + "ms");
//		StringBuffer 쓰면 조흠~ 메쏘드도 있옹~ 뜨뜨륑~
		StringBuffer sb = new StringBuffer("a");
		long start = System.currentTimeMillis();
		for(int i = 0; i < 200000; i++){
			sb.append("a");
		}
		long end = System.currentTimeMillis();
		System.out.println(end - start + "ms");
	}

}
