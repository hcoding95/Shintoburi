package com.kh.sintoburi.controller.hn;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.sintoburi.domain.hn.EnquiryVo;
import com.kh.sintoburi.service.hn.EnquiryService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/hn/mypage/*")
@Log4j
public class MypageController {

	@Autowired
	private EnquiryService enquiryService;

	// 1:1 문의사항
	@GetMapping("/enqList")
	public void list(Model model) {
		List<EnquiryVo> list = enquiryService.getList();
		model.addAttribute("list", list);
	}

	@GetMapping("/enqRegisterForm")
	public void enqRegisterForm() {
		
	}
	// 문의사항 작성
	@PostMapping("/enqRegister")
	public String enqRegister(EnquiryVo vo , RedirectAttributes rttr) {
		boolean result = enquiryService.register(vo);
		log.info("result:" + result);
		rttr.addFlashAttribute("enqRegister", result);
		return "redirect:/mypage/enqList";
	}
	// 문의사항 데이터 1개
	@GetMapping("/enqRead")
	public String enqRead(@RequestParam("eno")int eno,Model model) {
		EnquiryVo enquiryVo = enquiryService.selectByEno(eno);
		model.addAttribute("enquiryVo",enquiryVo);
		return "mypage/enqRead";
	}
	// 수정
	@PostMapping("/enqMod")
	public String enqMod(EnquiryVo vo, RedirectAttributes rttr) {
		boolean result = enquiryService.modify(vo);
		rttr.addFlashAttribute("resultMod",result);
		return "redirect:/mypage/enqList";
	}
	// 삭제
	@PostMapping("/enqDel")
	public String enqDel(@RequestParam("eno") int eno, RedirectAttributes rttr) {
		boolean result = enquiryService.remove(eno);
		rttr.addFlashAttribute("resultDel",result);
		return "redirect:/mypage/enqList";
	}
	// 공지사항

	// FAQ

}
