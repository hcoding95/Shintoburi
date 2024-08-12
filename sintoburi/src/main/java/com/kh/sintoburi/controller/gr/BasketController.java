package com.kh.sintoburi.controller.gr;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.sintoburi.domain.gr.BasketDetailDto;
import com.kh.sintoburi.service.gr.BasketService;

@Controller
@RequestMapping("/gr/basket/*")
public class BasketController {
	@Autowired
	private BasketService basketService;
	
	@GetMapping("/list")
	public void main(Model model, HttpSession session) {
		
		// TODO 한나씨 로그인 처리 완료 후 세션에서 받아서 처리
		String user_id="user01";
		List<BasketDetailDto> list = basketService.getList(user_id);
		model.addAttribute("list", list);
	}
		
	@PostMapping("/Modify")
		public boolean basketModify(int p_count, int bdno, Model model) {
					
		boolean result = basketService.modifyCount(p_count, bdno);
		//if
		
		return result;
	}
	
	@PostMapping("/RemoveOne")
	public void basketRemoveOne(@RequestParam("bdno") int bdno) {
		basketService.removeOne(bdno);
	}
	
	@PostMapping("/RemoveAll")
	public void basketRemoveAll(@RequestParam("pno") int pno) {
		basketService.removeAll(pno);
	}
		

}
