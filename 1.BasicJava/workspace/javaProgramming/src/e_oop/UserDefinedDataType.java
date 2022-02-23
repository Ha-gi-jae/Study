package e_oop;

public class UserDefinedDataType {

	public static void main(String[] args) {
		/*
		 * 사용자 정의 데이터 타입
		 *  - 데이터의 최종 진화 형태이다. (기본형 -> 배열 -> 클래스)
		 *  - 서로 다른 타입의 데이터를 묶어서 사용하는 것이다.
		 *  - 변수와 메서드로 구성할 수 있다.
		 */
		
		//기본형(1개의 변수에 1개의 데이터만 저장)
		int kor;
		int eng;
		int math;
		int sum;
		double avg;
		
		//배열(같은 타입의 데이터를 여러개 저장)
		int[] scores;
		int sum2;
		double avg2;
		
		//클래스(관련된 변수를 다 묶어서 저장)
//		Scanner sc = new Scanner(system.in); 스캐너 만드는 것처럼 하면 객체가 생성.
		Student student = new Student(); //객체생성(인스턴스화)을 한다. // 설계도에서 뽑아서 쓴다. 클래스 이름으로 타입. 초기화 new 예약어! 
										 //클래스명 변수명 = 초기화 클래스명();
		student.kor = 80;
		student.eng = 90;
		student.math = 75;
		student.sum = student.kor + student.eng + student.math;
		student.avg = student.sum /3.0;
		student.name = "홍길동";
		student.rank = 1;
		
		System.out.println(student.name);
		System.out.println(student.avg);
		
	}

}


class Student{ //설계도
	int kor;
	int eng;
	int math;
	int sum;
	double avg;
	String name;
	int rank;

	
	
	
	
	
}