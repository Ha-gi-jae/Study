package study;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class RacingHorse {

	static int sr = 0; // horse 클래스에서 run에서 들어온 순서대로 랭크값 올리면서 horse의 rank에 그 값을 저장해줌.

	public static void main(String[] args) {

		List<horse> horse = new ArrayList<>(); // Comparable 써야하므로 List로.
		horse.add(new horse("01번"));
		horse.add(new horse("02번"));
		horse.add(new horse("03번"));
		horse.add(new horse("04번"));
		horse.add(new horse("05번"));
		horse.add(new horse("06번"));
		horse.add(new horse("07번"));
		horse.add(new horse("08번"));
		horse.add(new horse("09번"));
		horse.add(new horse("10번"));

		for (horse h : horse) {
			h.start(); // 시작
		}
		for (horse h : horse) {
			try {
				h.join(); // 메인 스레드 대기. (먼저 끝나면 등수를 뽑을 수 없음.)
			} catch (InterruptedException e) {
				e.printStackTrace();
			}

		}
		Collections.sort(horse); // 랭크 순위로 오름차순 정렬 시키기.
		System.out.println("경기 끝...");
		System.out.println("=========================");
		for (horse h : horse) { // 선수 와 등수 출력
			System.out.println(h.getHorseName() + " 선수 " + h.getRank() + " 등 입니다.");
		}

	}
}

class horse extends Thread implements Comparable<horse> { // horse class 는 Thread와 Comparable 상속받음
	private String name; // 말 이름
	private int rank; // 등수
	static int div;

	public horse(String name) {
		this.name = name;
	}

	public String getHorseName() { // 상속받은 Thread는 getName()메서드 가지고 있기 때문에 게터의 명을 getName이 아닌 getHorseName으로 만듬.
		return name;
	}

	public void setHorseName(String name) { // 위 와 똑같기 때문에 setHorseName으로 만듬.
		this.name = name;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	@Override
	public void run() { // 쓰레드 친구들이 할일
		// System.out.println(name + " 출발"); // 출발~
		for (int i = 0; i < 50; i++) {
			if (div >= 10) {
				if (div % 10 == 0) {
					System.out.println("\n\n\n\n");
				}
			}
			String s = "";
			// System.out.print(name + " ");
			for (int j = 0; j < i; j++) { // 쓰레드가 지나가면서 -가 한개씩 늘어남
				s += "-";
				// System.out.print("-");
			}
			s += ">";
			// System.out.print(">"); //실질적으로 가만히 출력만 반복하고있다. 앞과 뒤에 있는 포문이 앞으로 나아가는 것 처럼
			// 찍어준다.

			for (int k = 49; i < k; k--) { // 쓰레드가 지나가면서 -가 한개씩 줄어듬
				s += "-";
				// System.out.print("-");
			}
			div++;
			System.out.println(name + " " + s);

			try {
				Thread.sleep((int) (Math.random() * 151 + 100));
			} catch (InterruptedException ex) {
				ex.printStackTrace();
			}
		}
		RacingHorse.sr++; // 맨 처음 sr 초기값을 0으로 설정했음. 각 스레드가 끝나때 마다 sr을 ++ 해줌.
		setRank(RacingHorse.sr); // 위 에서 스레드가 sr++ 한 값을 set메서드를 이용해 rank의 값에 넣어줌.

		// System.out.println(name + " 도착 " + rank + "등 "); // 몇번 말이 몇등으로 도착했는지 간략하게 출력.
	}

	@Override
	public int compareTo(horse h) { // 오름차순 정렬
		return ((Integer) getRank()).compareTo(h.getRank());
	}

}