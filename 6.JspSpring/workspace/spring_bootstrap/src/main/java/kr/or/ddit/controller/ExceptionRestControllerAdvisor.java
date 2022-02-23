package kr.or.ddit.controller;

import java.io.IOException;
import java.sql.SQLException;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class ExceptionRestControllerAdvisor {

	private HttpStatus result;
	
//	@ExceptionHandler(IOException.class) //이름은 Exception 이름으로 해주면 좋다.
//	public ResponseEntity<HttpStatus> ioException(Exception e){
//		result = HttpStatus.INTERNAL_SERVER_ERROR;
//		
//		return new ResponseEntity<HttpStatus>(result);
//	}
	
	@ExceptionHandler(IOException.class) //이름은 Exception 이름으로 해주면 좋다.
	public ResponseEntity<String> ioException(Exception e){
		String message = "파일이 존재하지 않습니다.";
		result = HttpStatus.INTERNAL_SERVER_ERROR;
		
		e.printStackTrace();
		
		return new ResponseEntity<String>(message,result);
	}
	
	@ExceptionHandler(SQLException.class)
	public ResponseEntity<String> sqlException(Exception e){
		String message = "DB의 장애로 서비스가 중단됩니다.";
		result = HttpStatus.INTERNAL_SERVER_ERROR;
		
		e.printStackTrace();
		
		return new ResponseEntity<String>(message,result);
	}
	
	@ExceptionHandler(Exception.class)
	public ResponseEntity<String> Exception(Exception e){
		String message = "서버 장애로 서비스가 중단됩니다.";
		result = HttpStatus.INTERNAL_SERVER_ERROR;
		
		e.printStackTrace();
		
		return new ResponseEntity<String>(message,result);
	}
}
