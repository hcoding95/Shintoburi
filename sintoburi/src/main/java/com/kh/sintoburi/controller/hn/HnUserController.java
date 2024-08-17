package com.kh.sintoburi.controller.hn;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sintoburi.domain.hn.HnCriteria;
import com.kh.sintoburi.domain.hn.HnLoginDto;
import com.kh.sintoburi.domain.hn.HnPageDto;
import com.kh.sintoburi.domain.hn.HnUserDto;
import com.kh.sintoburi.service.hn.HnUserService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/hn/manager/user/")
@Log4j
public class HnUserController {

	@Autowired
	private HnUserService userService;

	// 회원목록
	@GetMapping("/userList")
	public void userList(Model model, HnCriteria criteria) {
		System.out.println("Page Number: " + criteria.getPageNum());
		System.out.println("Amount per Page: " + criteria.getAmount());

		// 회원목록
		List<HnUserDto> list = userService.getList(criteria);
		int total = userService.getTotal(criteria);
		HnPageDto pageMaker = new HnPageDto(criteria, total);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("userList", list);
		model.addAttribute("criteria", criteria);
	}

	// 매니저목록
	@GetMapping("/managerList")
	public void managerList(Model model, HnCriteria criteria) {
		List<HnUserDto> managerList = userService.managerList(criteria);
		int total = userService.managerTotalCount(criteria);
		HnPageDto pageMaker = new HnPageDto(criteria, total);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("managerList", managerList);
		model.addAttribute("criteria", criteria);
	}

	// 등급수정
	@PostMapping("/modGrade")
	@ResponseBody
	public boolean modGrade(@RequestBody HnUserDto dto) {
		System.out.println("modGrade...");
		String user_id = dto.getUser_id();
		String grade = dto.getGrade();

		boolean result = userService.modifyGrade(user_id, grade);
		return result;
	}

//		로그인한 유저 문의사항
//		@GetMapping("/enqList")
//		public void list(Model model) {
//			List<EnquiryVo> enquiryList = enquiryService.getList();
//			model.addAttribute("enquiryList", enquiryList);
//			// 답변 리스트
//			List<ReplyVo> replyLisy = replyService.replyList();
//			model.addAttribute("replyList", replyLisy);
	//
//		}

	

}
