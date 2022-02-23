package e_oop.score2;

public class score {

	public static void main(String[] args) {
		String[] studentNames = {"이단비", "김노을", "정현욱", "박소현", "김수진",
				 "이희현", "강건", "이민영", "하기재", "이윤우",
				 "김미희", "김혜윤", "신승철", "이광효", "김진혁",
				 "마창수", "양기옥", "이동근", "석기현", "류인성",
				 "이미정", "임나리", "송민섭", "김지윤", "조명석"};
		
		student[] students = new student[studentNames.length];
		
		for(int i = 0; i< studentNames.length; i++){
			students[i] = new student();
			students[i].name = studentNames[i];
			students[i].createRandomScore();
			students[i].getSum();
			students[i].getAverage();
		}
		
		for(int i = 0; i < students.length; i++){
			students[i].getRank(students);
		}
		
		
		for(int i = 0; i < students.length - 1; i++){
			int min = i;
			for(int j = i + 1; j < students.length; j++){
				if(students[j].rank < students[min].rank){
					min = j;
				}
			}
			student temp = students[i];
			students[i] = students[min];
			students[min] = temp;
		}	
			
			
		System.out.println("이름\t국어\t영어\t수학\t합계\t평균\t석차");
		for(int i = 0; i < students.length; i++){
			System.out.println(students[i].getInfo());
		}
		
	}

}
