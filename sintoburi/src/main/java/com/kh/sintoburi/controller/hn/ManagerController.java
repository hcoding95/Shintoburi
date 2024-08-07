package com.kh.sintoburi.controller.hn;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sintoburi.domain.hn.EnquiryVo;
import com.kh.sintoburi.domain.hn.UserDto;
import com.kh.sintoburi.service.hn.EnquiryService;
import com.kh.sintoburi.service.hn.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/hn/manager/*")
@Log4j
public class ManagerController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private EnquiryService enquiryService;
	
	// 회원목록
	@GetMapping("/userList")
	public void userList(Model model) {
		List<UserDto> list = userService.getList();
		model.addAttribute("userList",list);
	}
	// 회원정보수정
	 @PostMapping("/modGrade")
	    @ResponseBody
	    public boolean modGrade(@RequestBody Map<String, String> map) {
	        String user_id = map.get("user_id");
	        String grade = map.get("grade");

	        boolean result = userService.modifyGrade(user_id, grade);
	        return result;
	    }
	
	// 문의사항 목록
	@GetMapping("/enqList")
	public void list(Model model) {
		List<EnquiryVo> list = enquiryService.getList();
		model.addAttribute("enquiryList",list);
	}
	
	// 문의사항 상세보기
	@GetMapping("/enquiryDetail/{eno}")
    public String enquiryDetail(@PathVariable("eno") int eno, Model model) {
		System.out.println("enquiryDetail...");
        EnquiryVo enquiryVo = enquiryService.selectByEno(eno);
        model.addAttribute("enquiryVo", enquiryVo);
        return "hn/manager/enquiryDetail";
    }
	

}
