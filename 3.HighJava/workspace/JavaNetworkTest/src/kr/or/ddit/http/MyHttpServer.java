package kr.or.ddit.http;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.util.StringTokenizer;

/**
 * 간단한 웹서버 예제
 * 
 * @author PC-06
 */
public class MyHttpServer { // TCP 방식 - http 기반으로 파싱할거임.
	private final int port = 80;
	private final String encoding = "UTF-8";

	/**
	 * 서버 시작
	 */
	public void start() {

		System.out.println("HTTP 서버가 시작되었습니다.");

		try (ServerSocket server = new ServerSocket(port)) {
			while (true) {//기재기재기재기재기재기재기재기재기재기재기재기재기재기재기재기재
				try {
					Socket socket = server.accept();

					HttpHandler handler = new HttpHandler(socket); // 처리는 핸들러가!

					new Thread(handler).start();// 요청 처리 시작...

				} catch (IOException ex) {
					System.err.println("커넥션 오류!!!");
					ex.printStackTrace();
				} catch (RuntimeException ex) {
					System.err.println("알수 없는 오류!!!");
					ex.printStackTrace();
				}
			}

		} catch (IOException ex) {
			System.err.println("서버 시작 오류!!!");
			ex.printStackTrace();
		}

	}

	/**
	 * HTTP 요청 처리를 위한 Runnable 클래스
	 * 
	 * @author PC-06
	 *
	 */

	//헤더 // empty line // 바디 => htp
	private class HttpHandler implements Runnable {
		private final Socket socket;

		public HttpHandler(Socket socket) {
			this.socket = socket;
		}

		@Override
		public void run() {

			OutputStream out = null;
			BufferedReader br = null;

			try {
				out = new BufferedOutputStream(socket.getOutputStream());
				
				br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
				
				// 요청헤더 정보 파싱하기
				StringBuilder request = new StringBuilder(); // String + + 해주는 클래스. 속도가 빠름!
				while(true) {
					String str = br.readLine();
					
					if(str.equals("")) break; // empty line(헤더와 바디의 경계선) 체크
					
					request.append(str + "\n");
				}
				
				System.out.println("요청헤더:\n" + request.toString());
				System.out.println("-------------------------------");
				
				String reqPath = "";
				
				// 요청 페이지 정보 가져오기
				StringTokenizer st = new StringTokenizer(request.toString()); // 임의의 "," " " "/" 이런 구분자 역할을 쪼개는 것을 토큰이라고 함.
				// default는 공백.
				//Header 첫줄 request
				
				while(st.hasMoreTokens()) {
					String token = st.nextToken();
					if(token.startsWith("/")) {
						reqPath = token; // 경로담아옴~
					}
				}
				
				// 경로 디코딩
				reqPath = URLDecoder.decode(reqPath, "utf-8");
				
				// 상대경로(프로젝트 폴더기준) 설정
				String filePath = "./WebContent" + reqPath; // 경로 정보를 알아야 쏴줄 수 있음.
				
				// 해당 파일이름을 이용하여 Content-type 정보 추출하기
				String contentType = URLConnection.getFileNameMap().getContentTypeFor(filePath);
				
				
				// CSS파일인 경우 인식이 안되서 추가함...
				if(contentType == null && filePath.endsWith(".css")) {
					contentType = "text/css"; // 하드코딩으로 넣어준거임.
				}
				
				System.out.println("ContentType => " + contentType);
				
				File file = new File(filePath); // exists 쓰려고!
				if(!file.exists()) { 			// 있는지 없는지 체크를 위해서!
					makeErrorPage(out, 404, "Not Found");
					return;
				}
				
				byte[] body = makeResponseBody(filePath);
				
				byte[] header = makeResponseHeader(body.length, contentType);
				
				// 요청 헤더가 HTTP/1.0 이나 그 이후의 버전을 지원할 경우 MIME 헤더를 전송한다.
				if(request.toString().indexOf("HTTP/") != -1) {
					out.write(header); // 응답헤더 보내기
				}
				System.out.println("응답헤더:\n" + new String(header));
				System.out.println("-------------------------------");
				
				out.write(body); // 응답 내용 보내 기
				out.flush();
				
				
			} catch (IOException ex) {
				System.err.println("입출력 오류!!!");
				ex.printStackTrace();
			} finally {
				try {
					socket.close(); // 소켓닫기(연결 끊기)
				} catch (IOException ex) {
					ex.printStackTrace();
				}
			}

		}


	}
	/**
	 * 응답 헤더 생성하기
	 * @param length 응답내용 크기
	 * @param contentType 마임타입
	 * @return 바이트배열
	 */
	private byte[] makeResponseHeader(int length, String contentType) {
		
		String header = "HTTP/1.1 200 OK\r\n" // 프로토콜 버전 + 공백 + status 성공 코드 값 + OK( 앞에 값이 200이 맞다는 메세지)
				// \r\n : 윈도우 엔터임. \r은 처음 \n은 다음줄 => 다음줄의 처음
				// 리눅스에서도 되고 윈도우에서도 되니까 \r\n 쓰는게 좋음.
				+ "Server: MyHTTPServer 1.0\r\n"
				+ "Content-length: " + length + "\r\n"
				+ "Content-Type: " + contentType 
				+ "; charset=" + this.encoding + "\r\n\r\n";
													// └> 엔터 2번 => empty line
		
		return header.getBytes();
	}
	
	private byte[] makeResponseBody(String filePath) {
		FileInputStream fis = null;
		byte[] data = null;
		
		try {
			File file = new File(filePath);
			data = new byte[(int) file.length()];
			
			fis = new FileInputStream(file);
			fis.read(data);
			
		}catch(IOException ex) {
			System.err.println("입출력 오류!!!");
			ex.printStackTrace();
		}finally {
			if(fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return data;
	}
	
	/**
	 * 에러페이지 생성
	 * @param out
	 * @param statusCode
	 * @param errMsg
	 */
	private void makeErrorPage(OutputStream out, int statusCode, String errMsg) {
		
		String statusLine = "HTTP/1.1" + " " + statusCode + " " + errMsg;
		// 브라우저에 기본적으로 404가(에러페이지)  존재함.
		try {
			out.write(statusLine.getBytes());
			out.flush();
			
		}catch(IOException ex) {
			ex.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		new MyHttpServer().start();
	}
	
}










