package kr.or.ddit.basic;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Arrays;

public class T04_ByteArrayIOTest {
	public static void main(String[] args) {
		
		byte[] inSrc = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
		byte[] outSrc = null;
		// 버퍼를 이용하지 않으니까 1byte씩 처리.. byte가 커지면 비효율적임.
		
		byte[] temp = new byte[4]; // 자료 읽을때 사용할 배열 <버퍼 역할>
		
		ByteArrayInputStream bais =  new ByteArrayInputStream(inSrc);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		
		try {
			
			// available() => 읽어 올 수 있는 byte수를 반환
			while(bais.available() > 0) {
				/*bais.read(temp); // temp배열 크기만큼 자료를 읽어와 temp 배열에 저장한다.
				
				baos.write(temp); // temp배열의 내용을 출력한다.
				*/
				
				// 버퍼로 읽어들인 byte 수를 반환한다.
				int len = bais.read(temp);
				
				// temp 배열의 내용 중에서 0번째 부터 len개수만큼 출력한다.
				baos.write(temp, 0, len);
				
				System.out.println("temp : " + Arrays.toString(temp));
			}
			System.out.println();
			
			outSrc = baos.toByteArray();
			
			System.out.println("inSrc => " + Arrays.toString(inSrc));
			System.out.println("outSrc = >" + Arrays.toString(outSrc));
			
		}catch (IOException ex) {
			ex.printStackTrace();
		}finally {
			try {
				bais.close();
				baos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}

//하기재 화이팅 끼룩
