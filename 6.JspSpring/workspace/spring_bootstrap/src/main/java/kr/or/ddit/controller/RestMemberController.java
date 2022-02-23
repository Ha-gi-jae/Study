package kr.or.ddit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.jsp.dto.MemberVO;
import com.jsp.service.MemberServiceForModify;
import com.jsp.utils.MakeFileName;

import kr.or.ddit.utils.ExceptionLoggerHelper;

@RestController
@RequestMapping("/member")
public class RestMemberController {

	@Resource(name = "picturePath")
	private String picturePath;
	
	@Autowired
	private MemberServiceForModify memberService;
	
	@RequestMapping(value = "/picture", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> picture(@RequestParam("pictureFile")MultipartFile multi, String oldPicture) throws IOException{
		
		ResponseEntity<String> entity = null;
		
		String result = savePicture(oldPicture, multi);
		
		entity = new ResponseEntity<String>(result, HttpStatus.OK);
		
		return entity;
	}
	
	// saveFileResolver역할은  transferTo가 해준다.
	// 근데 savePicture는 MemberController에서도쓰고 여기도 쓰면 class로 따로 만들어서 호출하면 된다.
	private String savePicture(String oldPicture, MultipartFile multi) throws IOException{
		
		String fileName = null;
		
		// 파일 유무 확인
		if (!(multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 5)) {
			
			// 파일 저장폴더 설정
			String uploadPath = picturePath;
			fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
			File storeFile = new File(uploadPath, fileName);
			
			storeFile.mkdirs();
			
			//local HDD에 저장
			if (oldPicture != null && !oldPicture.isEmpty()) {
				File oldFile = new File(uploadPath, oldPicture);
				if(oldFile.exists()) {
					oldFile.delete();
				}
			}
		}
		return fileName;
	}
	
	@RequestMapping(value = "/getPicture", produces = "text/plain;charset=utf-8")
	public ResponseEntity<byte[]> getPicture(String picture) throws IOException{
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = this.picturePath;
		
		try {
			in = new FileInputStream(new File(imgPath, picture));
												// 마크업에 직접 src 나 url로 들어가 있을때 쓰인다. // CREATED -> OK로 해도 상관없다.
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
		}finally {
			if(in != null) {
				in.close();
			}
		}
		return entity;
	}
	
	//1
//	@RequestMapping(value ="/getPictureById/{id}", method=RequestMethod.GET, produces = "text/plain;charset=utf-8")
//	public ResponseEntity<byte[]> getPictureById(@PathVariable("id")String id) throws SQLException,IOException {
//		
//		String picture = null;
//		
//		try {
//			picture = memberService.getMember(id).getPicture();
//			
//		}catch(Exception e) {
//			throw new SQLException();
//		}
//		
//		return getPicture(picture);
//	}
	// IOException은 return에 있는 메서드가 날린다.
	
	//2
	// 위와 같은데 Exception 처리 어떻게 하느냐.
//	@RequestMapping(value ="/getPictureById/{id}", method=RequestMethod.GET, produces = "text/plain;charset=utf-8")
//	public ResponseEntity<byte[]> getPictureById(@PathVariable("id")String id, HttpServletRequest request) throws SQLException,IOException {
//		
//		String picture = null;
//		
//		try {
//			picture = memberService.getMember(id).getPicture();
//			
//		}catch(SQLException e) {
//			throw new SQLException();
//		}catch (Exception e) {
//			e.printStackTrace();
//			ExceptionLoggerHelper.write(request, e, memberService);
//		}
//		
//		return getPicture(picture);
//	}
	
	//3
	//	@RequestMapping(value ="/getPictureById/{id}", method=RequestMethod.GET, produces = "text/plain;charset=utf-8")
//	public ResponseEntity<byte[]> getPictureById(@PathVariable("id")String id, HttpServletRequest request) throws SQLException,IOException, Exception {
//		
//		String picture = null;
//		
//		try {
//			picture = memberService.getMember(id).getPicture();
//			
//		}catch(SQLException e) {
//			throw e;
//		}catch (Exception e) {
//			e.printStackTrace();
//			ExceptionLoggerHelper.write(request, e, memberService);
//			throw e;
//		}
//		
//		return getPicture(picture);
//	}
	
	//4
	//결국 이렇게 된다. Exception을 catch하면 구분할 필요 없다. advisor가 알아서 구분함. advisor가 Exception handler 되어있는것만.
	// 즉 그냥 던지기만 하면된다. -> IO랑 SQL은 만들어 놨음. advisor는 그래서 마지막에 Exception이 있다. 얘는 REST니까 톰캣한테 안나가게 잡아줘야함.
	@RequestMapping(value ="/getPictureById.do/{id}", method=RequestMethod.GET, produces = "text/plain;charset=utf-8")
	public ResponseEntity<byte[]> getPictureById(@PathVariable("id")String id, HttpServletRequest request) throws Exception {
							// endpoint는 .do 안붙혀도 되는데 중간이라 .do 넣어줘야함.
		String picture = null;
		try {
			picture = memberService.getMember(id).getPicture();
		}catch (Exception e) {
			e.printStackTrace();
			ExceptionLoggerHelper.write(request, e, memberService);
			throw e;
		}
		return getPicture(picture);
	}
	
	@RequestMapping("/idCheck")
	public ResponseEntity<String> idCheck(String id) throws Exception{
		ResponseEntity<String> entity = null;
		
		MemberVO member = memberService.getMember(id);
		
		if(member != null) {
			entity = new ResponseEntity<String>("duplicated", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("", HttpStatus.OK);
		}
		
		return entity;
	}
}
