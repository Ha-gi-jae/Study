package study;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class ListSort {

	public static void main(String[] args) {
		List<Student> studentList = new ArrayList<Student>();
		studentList.add(new Student("2108240", "하기재",(int)(Math.random()*101),(int)(Math.random()*101),(int)(Math.random()*101)));
		studentList.add(new Student("2108241", "강　건",(int)(Math.random()*101),(int)(Math.random()*101),(int)(Math.random()*101)));
		studentList.add(new Student("2108242", "이민영",(int)(Math.random()*101),(int)(Math.random()*101),(int)(Math.random()*101)));
		studentList.add(new Student("2108243", "이희현",(int)(Math.random()*101),(int)(Math.random()*101),(int)(Math.random()*101)));
		studentList.add(new Student("2108244", "이광효",(int)(Math.random()*101),(int)(Math.random()*101),(int)(Math.random()*101)));
		studentList.add(new Student("2108245", "정현욱",(int)(Math.random()*101),(int)(Math.random()*101),(int)(Math.random()*101)));
		studentList.add(new Student("2108246", "석기현",(int)(Math.random()*101),(int)(Math.random()*101),(int)(Math.random()*101)));
		studentList.add(new Student("2108247", "이동근",(int)(Math.random()*101),(int)(Math.random()*101),(int)(Math.random()*101)));
		studentList.add(new Student("2108248", "이윤우",(int)(Math.random()*101),(int)(Math.random()*101),(int)(Math.random()*101)));
		studentList.add(new Student("2108249", "히히히",(int)(Math.random()*101),(int)(Math.random()*101),(int)(Math.random()*101)));
		
		//총점 구해서 넣어주기
		Collections.sort(studentList);
		for(int i=0; i < studentList.size(); i++) {
			studentList.get(i).setScore(studentList.get(i).getKor()+studentList.get(i).getEng()+studentList.get(i).getMath());
		}
		
		//순위 구하기
		for(int i = 0; i < studentList.size(); i++) {
			int rank = 1;
			for (int j = 0; j < studentList.size(); j++) {
				if (studentList.get(i).getScore() < studentList.get(j).getScore()) {
					studentList.get(i).setRank(++rank);
				}
			}
		}
		//학번 오름차순 정렬 출력
		for(Student stu: studentList) {
			System.out.println(stu);
		}
		System.out.println("================================================================================");
		
		//다시 섞기
		Collections.shuffle(studentList);
		
		//섞은 후 출력
		for(Student stu: studentList) {
			System.out.println(stu);
		}
		System.out.println("================================================================================");
		//총점 내림차순 정렬 
		Collections.sort(studentList, new StudentScoreDesc());
		
		//총점 내림차순 정렬 출력
		for(Student stu: studentList) {
			System.out.println(stu);
		}
		
	}

}

class StudentScoreDesc implements Comparator<Student>{
	
	@Override
	public int compare(Student stu1, Student stu2) {
		if(stu1.getScore() > stu2.getScore()) {
			return -1;
		} else if (stu1.getScore() == stu2.getScore()) {
			return 0;
		} else {
			return 1;
		}			
	}
}

class Student implements Comparable<Student>{

	private String num;		//학번
	private String name;	//이름
	private int kor;		//국어점수
	private int eng;		//영어점수
	private int math;		//수학점수
	private int score;		//총점
	private int rank = 1;		//등수
	
	
	
	public Student(String num, String name, int kor, int eng, int math) {
		super();
		this.num = num;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
	}



	public String getNum() {
		return num;
	}



	public void setNum(String num) {
		this.num = num;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public int getKor() {
		return kor;
	}



	public void setKor(int kor) {
		this.kor = kor;
	}



	public int getEng() {
		return eng;
	}



	public void setEng(int eng) {
		this.eng = eng;
	}



	public int getMath() {
		return math;
	}



	public void setMath(int math) {
		this.math = math;
	}



	public int getScore() {
		return score;
	}



	public void setScore(int score) {
		this.score = score;
	}



	public int getRank() {
		return rank;
	}



	public void setRank(int rank) {
		this.rank = rank;
	}

	@Override
	public int compareTo(Student stu) {
		return this.getNum().compareTo(stu.getNum());
	}



	@Override
	public String toString() {
		return "Student [num=" + num + ", name=" + name + ", kor=" + kor + ", eng=" + eng + ", math=" + math
				+ ", score=" + score + ", rank=" + rank + "]";
	}
	
}