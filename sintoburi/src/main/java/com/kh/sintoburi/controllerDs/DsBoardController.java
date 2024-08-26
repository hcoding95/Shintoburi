package com.kh.sintoburi.controllerDs;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sintoburi.domainDs.DsBoardVo;
import com.kh.sintoburi.domainDs.DsLikeDto;
import com.kh.sintoburi.domainDs.DsUserVo;
import com.kh.sintoburi.serviceDs.DsBoardService;
import com.kh.sintoburi.serviceDs.DsLikeService;

import lombok.extern.log4j.Log4j;
@Log4j
@Controller
@RequestMapping("/ds/board/*")
public class DsBoardController {
	
	@Autowired
	public DsBoardService boardService;
	
	@Autowired
	public DsLikeService likeService;

	// 글읽기 폼(상세보기)
	@GetMapping("/read")
	public void read(Long bno,Model model,HttpSession session) {
		boardService.upViewCount(bno);
		DsBoardVo vo = boardService.getDetail(bno);
		
		
		// 좋아요 갯수와 좋아요 했는지를 판단하는 부분
		
		DsBoardVo boardVo = boardService.getDetail(bno);
		Integer likeCount = likeService.getLikeCount(boardVo.getBno());
		System.out.println("likeCount:" + likeCount);
		DsUserVo user = (DsUserVo) session.getAttribute("login");

		
		if (user != null) {

		

			boolean result = likeService.checkLike(user.getUser_id(), bno);
			model.addAttribute("result", result);

			System.out.println("result: " + boardVo.getWriter() + " " + user.getUser_id());

		}

		model.addAttribute("likeCount", likeCount);
		
		
		
		model.addAttribute("detail",vo);
		
	}
	
	
	
	@ResponseBody
	@PostMapping("/checkLike")
	public boolean checkLike(@RequestBody DsLikeDto dto) {
		
		
		boolean result = likeService.doLike(dto);

		System.out.println("result:" + result);

		return result;
		
	}

	@ResponseBody
	@PostMapping("/uncheckLike")
	public boolean uncheckLike(@RequestBody DsLikeDto dto) {
	
		
		boolean result = likeService.undoLike(dto);
		System.out.println("result:" + result);
		return result;
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
		public String modifyPost(@RequestBody DsBoardVo vo) {
			
			boolean result =boardService.updatePost(vo);
			System.out.println("vo:"+vo.toString());
			System.out.println("updatePost");
			
			if(result) {
				return "success";
			}
			
			return "fail"; //"redirect:/ds/board/index"
		}
		
	// 회원가입
	@GetMapping("/register")
	public void register() {
			
	}
	
	// 로그인
	@GetMapping("/login")
	public void login() {
				
	}
	
	
	

	
	// 글쓰기 폼
	@GetMapping("/write")
	public void write() {
		
	}
	
	// 테스트 페이지
	@GetMapping("/test")
	public void test() {
		
	}

	
	// 글쓰기 처리
	@PostMapping("/writePost")
	@ResponseBody
	public String writePost(@RequestBody DsBoardVo vo) {
		
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
		List<DsBoardVo> list = boardService.getList();
		
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
	
	
	
	@GetMapping("/runGame")
	public void runGame() {
		
	}
	
	// 퀴즈 게임
	@GetMapping("/quizGame")
	public void quizGame() {

	}
	
	
	
	
	
	
	
}
