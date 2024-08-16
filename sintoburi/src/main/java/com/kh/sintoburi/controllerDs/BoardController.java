package com.kh.sintoburi.controllerDs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.sintoburi.domainDs.BoardVo;
import com.kh.sintoburi.serviceDs.BoardService;

import lombok.extern.log4j.Log4j;
@Log4j
@Controller
@RequestMapping("/ds/board/*")
public class BoardController {
	
	@Autowired
	public BoardService boardService;
	
	
	// 글읽기 폼(상세보기)
	@GetMapping("/read")
	public void read(Long bno,Model model) {
		BoardVo vo = boardService.getDetail(bno);
		
		model.addAttribute("detail",vo);
		
	}
	// 삭제처리
	@PostMapping("/delete")
	public String delete(@RequestParam("bno") Long bno) {
		
		
		boardService.deletePost(bno);
		return "redirect:/ds/board/index";
	}
	
	// 수정폼
	@GetMapping("/modify")
	public void modifyForm(Long bno,Model model) {
		model.addAttribute("modifyDetail",boardService.getDetail(bno));
	}
	
		// 수정 처리
		@PostMapping("/modifyPost")
		@ResponseBody
		public String modifyPost(@RequestBody BoardVo vo) {
			
			boolean result =boardService.updatePost(vo);
			System.out.println("vo:"+vo.toString());
			System.out.println("updatePost");
			
			if(result) {
				return "success";
			}
			
			return "fail"; //"redirect:/ds/board/index"
		}
	

	
	// 글쓰기 폼
	@GetMapping("/write")
	public void write() {
		
	}
	
	// 글쓰기 처리
	@PostMapping("/writePost")
	@ResponseBody
	public String writePost(@RequestBody BoardVo vo) {
		
		boolean result =boardService.insertPost(vo);
		System.out.println("vo:"+vo.toString());
		System.out.println("writePost");
		
		if(result) {
			return "success";
		}
		
		return "fail"; //"redirect:/ds/board/index"
	}
	
	// 커뮤니티-홈화면
	@GetMapping("/index")
	public void index(Model model) {
		List<BoardVo> list = boardService.getList();
		
		System.out.println("list:"+list.toString());
		model.addAttribute("list", list);
	}
	
	// 이벤트 페이지
	@GetMapping("/event")
	public void event() {
		
	}
	
	// 이벤트 페이지
	@GetMapping("/chat")
	public void chat() {
		
	}
	
	// 이벤트 페이지
	@GetMapping("/eventGame")
	public void eventGame() {
		
	}
	
	
	// 이벤트 페이지
	@GetMapping("/pushGame")
	public void pushGame() {
		
	}
	
	// 이벤트 페이지
	@GetMapping("/quizGame")
	public void quizGame() {

	}
	
	
	
	
	
	
}
