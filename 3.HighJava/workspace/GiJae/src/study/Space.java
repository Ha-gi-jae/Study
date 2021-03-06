package study;

public class Space {

	public enum Planet {
		수성(2439),
		금성(6052),
		지구(6371),
		화성(3390),
		목성(69911),
		토성(58232),
		천왕성(25362),
		해왕성(24622);
		
		//각 행성의 반지름이 저장될 변수 선언
		private int size;
		
		//생성자 만들기
		Planet(int star){
			size = star; 
		}
		
		// 값을 반환해줄 메서드
		public int getSize() {
			return size;
		}	
		
	}

	
	public static void main(String[] args) {
		
		double pi = 3.141592;
		// Math.PI 파이값
		
		// 순서가 행성 반지름을 먼저 곱할 때에는 double로 형변환 시켜줘야하지만
		// pi를 먼저 곱해주면 뒤의 반지름의 타입들이 오토캐스팅 된다.
		for(Planet star : Planet.values()) {
			System.out.println(star+ "의 면적은 " +Math.round(4*pi*star.getSize()*star.getSize()) + "km² 입니다.");
		}
		
		
		// 데이터를 배열로 가져온다.
//		Planet[] planetArr = Planet.values();
//		for(int i = 0; i < planetArr.length; i++) {
//			System.out.println(planetArr[i].name() + "의 면적은 "
//					+ Math.round(pi * 4*planetArr[i].getSize() // 값이 너무 길어서 반올림
//							* planetArr[i].getSize()
//							)+ "km² 입니다.");
//		}

	}
	
}
