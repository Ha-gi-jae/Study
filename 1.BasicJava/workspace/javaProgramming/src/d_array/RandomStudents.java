package d_array;

import java.util.Scanner;

public class RandomStudents {

	public static void main(String[] args) {
		//숫자를 입력받아 입력받은 숫자만큼 403호 학생들중 랜덤으로 출력해주세요.
		//25명중에 숫자를 입력받아 3이라고 입력하면 25명중에 3명을 랜덤으로 뽑느거 5입력하면 5명 뽑는거. 중복되면 안된다.
		Scanner s = new Scanner(System.in);
		String[] students = {"이단비", "김노을", "정현욱", "박소현", "김수진", "이희현", "강건", "이민영", "하기재",
							 "이윤우", "김미희", "김혜윤", "신승철", "이광효", "김진혁", "마창수", "양기욱", "이동근",
							 "석기현", "류인성", "이미정", "임나리", "송민섭", "김지윤", "조명석"};		
		System.out.print("숫자입력>");
		int number = Integer.parseInt(s.nextLine());
		//위 number 수 만큼 반복문을 실행시킬것이고, 이 수만큼 사람을 뽑을 것임.
		
		
		int[] array = new int[students.length]; // [0, 0, 0, 0,..0] 이 24개가 되었어.
		
		
		for(int i = 0; i < number; i++){
			
			while(true){
				int random = (int)(Math.random()*students.length);
				if(array[random] == 0){
					array[random]++;
					break;
					}
				else continue;
			} 
		}
		for(int j = 0; j < array.length; j++){
			if(array[j] == 1){
				System.out.println(students[j]);
			}
		}
				
		/*
		 * String[] students = {"이단비", "김노을", "정현욱", "박소현", "김수진", "이희현", "강건", "이민영", "하기재",
							 "이윤우", "김미희", "김혜윤", "신승철", "이광효", "김진혁", "마창수", "양기욱", "이동근",
							 "석기현", "류인성", "이미정", "임나리", "송민섭", "김지윤", "조명석"};
		    스캐너 만들어주기
		   몇명뽑을지 프린트
		   뽑을사람 숫자 입력 받기 int count = 
		   
		   String[] pick = new String[count];
		   int pickCount = 0;
		   
		   do{
		   		int random =
		   		
		   		boolean flag = true; 중복되지 않음
		   		for(int i = 0; i < pick.length; i++{
		   			if(students[random].equals(pick[i])){
		   				flag = false; 중복됨
		   			}
		   		
		   		}
		   		if(flag){
		   			pick[pickCount++] = students[random]
		   		}
		   }while(pickCount < count);
		   
		   출력Arrays.toString(pick)
		   
		   
		   
		   
		   
		   
		   
		   
		 */
		
		
		
		
		
		
	}

}
