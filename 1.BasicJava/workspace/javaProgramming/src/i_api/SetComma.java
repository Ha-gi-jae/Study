package i_api;

import e_oop.ScanUtil;

public class SetComma {

	public static void main(String[] args) {
		//숫자를 입력받아 입력받은 숫자에 3자리 마다 콤마(,)를 붙여 출력해주세요.
		//1,234,567
		//문자열로 입력 받아야함.

		String num = ScanUtil.nextLine();
//		String rev = "";
//		String num2 = "";
//
//		for(int i = num.length() - 1; 0 <= i; i--){
//			rev += num.charAt(i);
//		}
//		
//		for(int i = num.length()-1; 0<= i; i--){
//			num2 += rev.charAt(i);
//			if(i % 3 == 0){
//				num2 += ",";
//			}	
//		}
//		
//		String res = num2.substring(0, num2.length()-1);
//		
//		System.out.println(res);
		
		String rev = "";
		String num2 = "";
		int count = 0;
		for(int i = num.length() - 1; i >= 0; i--){
			rev = num.charAt(i) + rev;
			count++;	
			if(count%3 == 0 && count != num.length()){
					rev = "," + rev;
				}
		}
		System.out.println(rev);
		
		
		
	}
	

}
