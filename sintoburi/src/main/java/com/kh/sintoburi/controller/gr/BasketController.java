package com.kh.sintoburi.controller.gr;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.sintoburi.domain.gr.BasketDetailDto;
import com.kh.sintoburi.domain.gr.BasketDetailVo;
import com.kh.sintoburi.domain.gr.BasketVo;
import com.kh.sintoburi.domain.gr.LoginDto;
import com.kh.sintoburi.service.gr.BasketService;

@Controller
@RequestMapping("/gr/basket/*")
public class BasketController {
	@Autowired
	private BasketService basketService;
		
	// 장바구니 담기
		@PostMapping("/putBasket")
		public String putBasket(HttpSession session, BasketDetailVo detailVo, RedirectAttributes rttr) {
			//장바구니 번호 가져오기
			LoginDto dto = (LoginDto)session.getAttribute("login");
			if (dto == null) {
				return "redirect:/gr";
			}
			String user_id = dto.getUser_id();
			int bno =basketService.getBnoByUserId(user_id);
			
			//없다면 장바구니 번호 생성하기
			if (bno == 0) {
				BasketVo vo = new BasketVo();
				vo.setUser_id(user_id);
				basketService.getBasketKey(vo);
				bno = vo.getBno();
			}
			
			//장바구니 상세에 담기
			boolean result = basketService.putBasket(detailVo);
			rttr.addFlashAttribute("resultputBasket", result);
			return "redirect:/gr/basket/list";
		}
	
	
	// 장바구니 목록 보기
	@GetMapping("/list")
	public String main(Model model, HttpSession session) {
		// TODO 한나씨 로그인 처리 완료 후 세션에서 받아서 처리
		LoginDto dto = (LoginDto)session.getAttribute("login");
		if (dto == null) {
			return "redirect:/gr";
		}
		String user_id = dto.getUser_id();
		
		
		List<BasketDetailDto> list = basketService.getList(user_id);
		model.addAttribute("list", list);
		return "/gr/basket/list";
	}
		
	// 개수 수정
	@PostMapping("/modCount")
	@ResponseBody
	public boolean modCount(@RequestBody Map<String, Integer> map) {
		//System.out.println("modCount...map:" + map);
		int bdno = map.get("bdno");
		int p_count = map.get("p_count");
		//System.out.println("modCount...bdno:" + bdno);
		//System.out.println("modCount...p_count:" + p_count);
		boolean result = false;
		if(p_count == 0)	{
			result = basketService.removeOne(bdno);
		} else {
			result = basketService.modifyCount(p_count, bdno);
		}
		return result;
	}
	
	//장바구니 삭제
	@PostMapping("/removeOne")
	@ResponseBody
	public boolean removeOne(@RequestBody Map<String, List<Integer>> bdnos) {
		System.out.println("removeOne...bdnos:" + bdnos);
		List<Integer> list = bdnos.get("bdnos");
		for (Integer bdno : list) {
			basketService.removeOne(bdno);
		}
		return true;
	}
	
	
	@PostMapping("/removeAll")
	@ResponseBody
	public String removeAll(/* @RequestBody Map<String, Integer> map, */HttpSession session) {
		
		LoginDto dto = (LoginDto)session.getAttribute("login");
		if (dto == null) {
			return "redirect:/gr";
		}
		String user_id = dto.getUser_id();
	
		int bno = basketService.getBnoByUserId(user_id);
//		System.out.println("removeAll...map:" + map);
//		Integer bno = map.get("bno");
//		System.out.println("removeAll...bno:" + bno);
		boolean result = basketService.removeAll(bno);
		return String.valueOf(result);
//		return false;
	}
	
	
		

}
