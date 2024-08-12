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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sintoburi.domain.gr.BasketDetailDto;
import com.kh.sintoburi.service.gr.BasketService;

@Controller
@RequestMapping("/gr/basket/*")
public class BasketController {
	@Autowired
	private BasketService basketService;
	
	// 장바구니 목록 보기
	@GetMapping("/list")
	public void main(Model model, HttpSession session) {
		
		// TODO 한나씨 로그인 처리 완료 후 세션에서 받아서 처리
		String user_id="user01";
		List<BasketDetailDto> list = basketService.getList(user_id);
		model.addAttribute("list", list);
	}
		
	// 개수 수정
	@PostMapping("/modCount")
	@ResponseBody
	public boolean modCount(@RequestBody Map<String, Integer> map) {
		System.out.println("modCount...map:" + map);
		int bdno = map.get("bdno");
		int p_count = map.get("p_count");
		System.out.println("modCount...bdno:" + bdno);
		System.out.println("modCount...p_count:" + p_count);
		boolean result = false;
		if(p_count == 0)	{
			result = basketService.removeOne(bdno);
		} else {
			result = basketService.modifyCount(p_count, bdno);
		}
		return result;
	}
	
	@PostMapping("/removeOne")
	@ResponseBody
	public void removeOne(@RequestParam("bdno") int bdno) {
		System.out.println("removeOne...");
		boolean result = basketService.removeOne(bdno);
		
	}
	
	@PostMapping("/removeAll")
	public void removeAll(@RequestParam("pno") int pno) {
		boolean result = basketService.removeAll(pno);
		
	}
		

}
