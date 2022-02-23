package j_collection;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

public class sql {

	public static void main(String[] args) {
		HashMap<String, String> column = new HashMap<>();
		ArrayList<HashMap<String, String>> table = new ArrayList<>();
		column.put("LPROD_ID", "1");
		column.put("LPROD_GU", "p101");
		column.put("LPROD_NM", "컴퓨터제품");
		table.add(column);
		
		column = new HashMap<>();
		column.put("LPROD_ID", "2");
		column.put("LPROD_GU", "p102");
		column.put("LPROD_NM", "전자제품");
		table.add(column);
		
		column = new HashMap<>();
		column.put("LPROD_ID", "3");
		column.put("LPROD_GU", "p201");
		column.put("LPROD_NM", "여성캐주얼");
		table.add(column);
		
		column = new HashMap<>();
		column.put("LPROD_ID", "4");
		column.put("LPROD_GU", "p202");
		column.put("LPROD_NM", "남성캐주얼");
		table.add(column);
		
		column = new HashMap<>();
		column.put("LPROD_ID", "5");
		column.put("LPROD_GU", "p301");
		column.put("LPROD_NM", "피혁잡화");
		table.add(column);
		
		column = new HashMap<>();
		column.put("LPROD_ID", "6");
		column.put("LPROD_GU", "p302");
		column.put("LPROD_NM", "화장품");
		table.add(column);
		
		column = new HashMap<>();
		column.put("LPROD_ID", "7");
		column.put("LPROD_GU", "p401");
		column.put("LPROD_NM", "음반/CD");
		table.add(column);
		
		column = new HashMap<>();
		column.put("LPROD_ID", "8");
		column.put("LPROD_GU", "p402");
		column.put("LPROD_NM", "도서");
		table.add(column);
		
		column = new HashMap<>();
		column.put("LPROD_ID", "9");
		column.put("LPROD_GU", "p403");
		column.put("LPROD_NM", "문구류");
		table.add(column);
		
		column = new HashMap<>();
		column.put("LPROD_ID", "10");
		column.put("LPROD_GU", "p501");
		column.put("LPROD_NM", "농산물");
		table.add(column);
		

		System.out.println("LPROD_ID\tLPROD_GU\tLPROD_NM");
		for(int i = 0; i < table.size(); i++){		//뒤의 get은 키 값을 부르는거임.
				System.out.println(table.get(i).get("LPROD_ID") +
						"\t\t" + table.get(i).get("LPROD_GU") +
						"\t\t" + table.get(i).get("LPROD_NM"));
		}
		
	}

}
