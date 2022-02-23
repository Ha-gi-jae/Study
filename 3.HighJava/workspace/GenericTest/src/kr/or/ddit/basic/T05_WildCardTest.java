package kr.or.ddit.basic;

import java.util.Arrays;

public class T05_WildCardTest {
	public static void main(String[] args) {
		Course<Person> personCourse = new Course<>("일반인과정", 5);
		personCourse.add(new Person("일반인1"));
		personCourse.add(new Worker("직장인1"));
		personCourse.add(new Student("학생1"));
		personCourse.add(new HighStudent("고등학생1"));
		
		Course<Worker> workerCourse = new Course<>("직장인과정", 5);
//		workerCourse.add(new Person("일반인")); Worker만 올 수 있기때문에 컴파일러 오류^^.
		workerCourse.add(new Worker("직장인1"));

		Course<Student> studentCourse = new Course<>("학생과정", 5);
		studentCourse.add(new Student("학생1"));
		studentCourse.add(new HighStudent("고등학생1"));
		
		Course<HighStudent> highStudentCourse = new Course<>("고등학생과정", 5);
//		highStudentCourse.add(new Student("학생1")); HighStudent 만 올 수 있기 때문에 컴파일러 오류^^.
		highStudentCourse.add(new HighStudent("고등학생1"));
		
		//----------------------------------------------------------------------------------
		
		listCourseInfo(personCourse);
		listCourseInfo(workerCourse);
		listCourseInfo(studentCourse);
		listCourseInfo(highStudentCourse);
		
		System.out.println();
		
//		listStudentCourseInfo(workerCourse); // Student 하위 타입만 올 수있기때문에 worker타입은 올 수 없다. 그래서 컴파일러 오류^^.
		listStudentCourseInfo(studentCourse);
		listStudentCourseInfo(highStudentCourse);
		
		System.out.println();
		
		listWorkerCourseInfo(workerCourse);
//		listWorkerCourseInfo(personCourse); // super 사용했기 때문에 person이 가능함. person에 일반인 직장인 학생 고등학생 있기 때문에 나오는거임 person 하위 나오는게아니거!
	}
	
	/**
	 * 모든 과정 수강정보 조회
	 * @param course
	 */									// 어떤 과정이든 오게 하기 위해서 와일드카드로 씀. HighStudent를 쓰면 고등학생타입만 가능.
	public static void listCourseInfo(Course<?> course) { // 메인에서 바로 호출하려고 하기 때문에 static
		System.out.println(course.getName()
				+ " 수강생: " + Arrays.toString(course.getStudents()));
	}
	/**
	 * 학생과정 수강정보 조회	
	 * @param course
	 */
													// 학생 하위 타입만 가지고 오게 하겠다.
	public static void listStudentCourseInfo(Course<? extends Student> course) {
		System.out.println(course.getName()
				+ " 수강생: " + Arrays.toString(course.getStudents()));
		
	}
	/**
	 * 직장인 과정 수강정보 조회
	 * @param course
	 */
													// 직장인 하위타입만 가지고 오겠다. super를 쓰면 직장인 상위타입 (Person 가져옴.)
//	public static void listWorkerCourseInfo(Course<? extends Worker> course) {
//		System.out.println(course.getName()
//				+ " 수강생: " + Arrays.toString(course.getStudents()));		
//	}
	
	public static void listWorkerCourseInfo(Course<? super Worker> course) {
		System.out.println(course.getName()
				+ " 수강생: " + Arrays.toString(course.getStudents()));		
	}
	
	
}

// 일반인
class Person{
	
	String name; //이름
	
	public Person(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "이름:" + name;
	}
	
	
}

// 근로자
class Worker extends Person {

	public Worker(String name) {
		super(name);
	}
	
}

//학생
class Student extends Person {

	public Student(String name) {
		super(name);
	}
	
}

// 고등학생
class HighStudent extends Student{

	public HighStudent(String name) {
		super(name);
	}
	
}

class Course<T>{
	private String name; // 과정명
	private T[] students; // 수강생(제너릭 배열)
	// 일반인 ,학생, 고등학생 어느 타입이 올지모르기 때문에.
	public Course(String name, int capacity) { // capacity 총 인원
		super();
		this.name = name;
		// 타입 파라미터로 배열을 생성시 오브젝트 배열을 생성 후, 타입 파라미터 배열로 캐스팅 처리 해야 함.
		students = (T[])(new Object[capacity]); // 제너릭 타입이므로 형변환처리. => T를 모르면 객체 생성 불가능하기 때문에. 
	}

	/**
	 * 과정명 조회
	 * @return
	 */
	public String getName() {
		return name;
	}

	/**
	 * 수강생 조회
	 * @return
	 */
	public T[] getStudents() {
		return students;
	}
	
	/**
	 * 수강생 등록
	 * @param t
	 */
	public void add(T t) {
		for(int i = 0; i < students.length; i++) {
			if(students[i] == null) { // 아직 등록되지않은(빈) 자리인지...
				students[i] = t; //등록
				break;
			}
		}
	}
	
	
}