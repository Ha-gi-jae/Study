package kr.or.ddit.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jsp.command.SearchCriteria;
import com.jsp.controller.XSSHttpRequestParameterAdapter;
import com.jsp.dto.BoardVO;
import com.jsp.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/main")
	public String main() throws Exception{
		return "board/main";
	}
	
	@RequestMapping("/list")
	public ModelAndView list(SearchCriteria cri, ModelAndView mv) throws Exception{
		
		Map<String, Object> dataMap = boardService.getBoardList(cri);
		mv.setViewName("board/list"); // 뷰 경로를 board/list로 설정해줌.
		mv.addObject("dataMap", dataMap);
		return mv;
	}
	
	@RequestMapping("/registForm")
	public String registForm() {
		return "board/regist"; 
		// regist.jsp 가 아닌, registForm.jsp 이였다면   public void registForm(){}를 쓰면 된다.
		// 요청받은 URL(주소줄)의 경로로 .jsp를 찾으러감.
		// 현재 컨트롤러에 board 를 매핑 해주었기 때문에 /board를 매핑에 써주지 않았다.
	}
	
	@RequestMapping("/regist")
	public String regist(HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		
		String url = "redirect:/board/list.do";
		BoardVO board = (BoardVO) XSSHttpRequestParameterAdapter.execute(request, BoardVO.class, true);
		
		board.setContent(request.getParameter("content"));
		
		boardService.regist(board);
		
		rttr.addFlashAttribute("from", "regist");
		
		return url;
	}
}
