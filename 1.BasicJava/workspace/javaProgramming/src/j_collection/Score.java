package j_collection;

import java.util.ArrayList;
import java.util.Arrays;

public class Score {

	public static void main(String[] args) {
		
		ArrayList<String> student = new ArrayList();
		student.add("이단비");
		student.add("김노을");
		student.add("정현욱");
		student.add("박소현");
		student.add("김수진");
		student.add("이희현");
		student.add("강건");
		student.add("이민영");
		student.add("하기재");
		student.add("이윤우");
		student.add("김미희");
		student.add("김혜윤");
		student.add("신승철");
		student.add("이광효");
		student.add("김진혁");
		student.add("마창수");
		student.add("양기욱");
		student.add("이동근");
		student.add("석기현");
		student.add("류인성");
		student.add("이미정");
		student.add("임나리");
		student.add("송민섭");
		student.add("김지윤");
		student.add("조명석");
		
		ArrayList<String> subject = new ArrayList();
		subject.add("국어");
		subject.add("영어");
		subject.add("수학");
		subject.add("사회");
		subject.add("과학");
		subject.add("Oracle");
		subject.add("Java");
		
		ArrayList<Integer> score = new ArrayList();
		ArrayList<ArrayList<Integer>> scores = new ArrayList();
		//점수 구하기
		for(int i = 0; i < student.size(); i++){
			score = new ArrayList();
			for(int j = 0; j < subject.size(); j++){
				score.add((int)(Math.random()*100)+1);
			}
			scores.add(score);
//			System.out.println(scores.get(i));
		}
		
		//합계 + 평균
		ArrayList<Integer> sum = new ArrayList();
		ArrayList<Double> avg = new ArrayList();
		for(int i = 0; i < student.size(); i++){
			int score_sum = 0;
			for(int j = 0; j < subject.size(); j++){
				score_sum += scores.get(i).get(j);
			}
			sum.add(score_sum);
			avg.add(Math.round((double)sum.get(i)/subject.size()*100)/100.0);
		}
		
		//순위
		ArrayList<Integer> rank = new ArrayList();
		for(int i = 0; i < student.size(); i++){
			int sum_rank = 1;
			for(int j = 0; j < student.size(); j++){
				if(sum.get(i) < sum.get(j)){
					sum_rank++;
				}
			}
			rank.add(sum_rank);
		}
		
		//과목 합계 평균
		ArrayList<Integer> subsum = new ArrayList();
		ArrayList<Double> subavg = new ArrayList();
		for(int i = 0; i < subject.size(); i++){
			int sum_sub = 0;
			for(int j = 0; j < student.size(); j++){
				sum_sub += scores.get(j).get(i);
			}
			subsum.add(sum_sub);
			subavg.add(Math.round((double)subsum.get(i)/student.size()*100)/100.0);
		}
		//출력
		System.out.println("이름\t국어\t영어\t수학\t사회\t과학\tOracle\tJava\t합계\t평균\t등수");
		for(int i = 0; i < student.size(); i++){
			System.out.print(student.get(i));
			for(int j = 0; j < subject.size(); j++){
				System.out.print("\t" + scores.get(i).get(j));
			}
			System.out.println("\t" + sum.get(i) + "\t" + avg.get(i) + "\t" + rank.get(i));
		}
		
		System.out.print("과목합계");
		for(int i = 0; i < subject.size(); i++){
			System.out.print("\t" +subsum.get(i));
		}
		System.out.print("\n과목평균");
		for(int i = 0; i < subject.size(); i++){
			System.out.print("\t" + subavg.get(i));
		}
		
	}

}
