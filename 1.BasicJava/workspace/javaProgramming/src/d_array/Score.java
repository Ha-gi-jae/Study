package d_array;

import java.util.Arrays;

public class Score {

	public static void main(String[] args) {
		/*
		 * 403호 모두의 국어, 영어, 수학, 사회, 과학, Oracle, java 점수를
		 * 0~100까지 랜덤으로 생성해주시고, 아래와 같이 출력해주세요.
		 * 
		 *  
		 * 이름		국어		영어		수학		사회		과학		Oracle		java		합계		평균		석차
		 */
		
		//이름
		String[] students = {"이단비", "김노을", "정현욱", "박소현", "김수진", "이희현", "강건", "이민영", "하기재",
				 "이윤우", "김미희", "김혜윤", "신승철", "이광효", "김진혁", "마창수", "양기욱", "이동근",
				 "석기현", "류인성", "이미정", "임나리", "송민섭", "김지윤", "조명석"};
		
		int[][] scores = new int[25][7]; //점수   x 학생  y 과목
		
		int[] sum = new int[scores.length]; // 합계
		
		double[] avg = new double[scores.length]; //평균
		
		int[] rank = new int[scores.length]; //석차
		
		int[] sec_sum = new int[7]; // 과목합계
		
		double[] sec_avg = new double[7]; // 과목평균
		
		
		
		
		//점수입력
		for(int i = 0; i < scores.length; i++){
			for(int j = 0; j <scores[i].length; j++){
				scores[i][j] = (int)(Math.random()*101);
			}
		}
		
		
		// 합계  평균
		for(int i = 0; i < scores.length; i++){
			for(int j = 0; j < scores[i].length; j++){
				sum[i] += scores[i][j];
			}	
			avg[i] = (double)sum[i] / scores[i].length;
		}
				
		// 석차 
		for (int i = 0; i < scores.length; i++) {
			rank[i] = 1;
			for (int j = 0; j < scores.length; j++) {
				if (avg[i] < avg[j]) {
					rank[i]++;
				}
			}
		}
				
		// 과목 합계
		for(int i = 0; i < scores.length; i++){
			for(int j = 0; j < scores[i].length; j++){
				sec_sum[j] +=  scores[i][j];
			}
		}	
		
		// 과목 평균
		for(int i = 0; i < scores[i].length; i++){
			sec_avg[i] = (double)sec_sum[i] / scores.length;
		}
		
		
		System.out.println("이름\t국어\t영어\t수학\t사회\t과학\tOracle\tJava\t합계\t평균\t석차");
		
		for(int i=0; i < scores.length; i++){
			System.out.print(students[i]);
			for(int j=0; j < scores[i].length; j++){
		          System.out.print("\t" + scores[i][j]);
			
			}
			System.out.print("\t" + sum[i] + "\t");
			System.out.printf("%.2f", avg[i]);
			System.out.println("\t" + rank[i]);
		}
		
		System.out.print("과목 합계\t");
		for(int i = 0; i < sec_sum.length; i++){
			System.out.print(sec_sum[i] + "\t");
		}
		
		System.out.print("\n과목평균\t");
		for(int i = 0; i < sec_avg.length; i++){
			System.out.printf("%.2f\t", sec_avg[i]);
		}
		
		
//		석차 순위별
//		int[] temp = new int[rank.length];
//		for(int i = 0; i<rank.length; i++){
//				for(int j=0; j<rank.length;j++){
//					if(rank[j] < rank[i]){
//						temp[i] = rank[j];
//						rank[j] = rank[i];
//						rank[i] = temp[i];
//					}
//				}
//				System.out.println(Arrays.toString(temp[i]));
//		}
		
		System.out.println("\t국어\t영어\t수학\t사회\t과학\tOracle\tJava\t합계\t평균\t석차");
		for(int i = 0; i < scores.length; i++){
			System.out.print(scores[i]+ "\t");
			for(int j=0; j < scores[i].length; j++){
				System.out.print(scores[i][j]+"\t");
			}
		}
		
	}

}
