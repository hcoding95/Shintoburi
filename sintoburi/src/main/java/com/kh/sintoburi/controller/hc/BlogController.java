package com.kh.sintoburi.controller.hc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.sintoburi.domain.hc.BlogVo;
import com.kh.sintoburi.service.hc.BlogService;

@Controller
@RequestMapping("/hc/blog/*")
public class BlogController {
	
	@Autowired
	private BlogService blogService;
	
	@GetMapping("/blog")
	public void blog(String user_id, Model model) {
		List<BlogVo> list = blogService.getListByUser_id(user_id);
		model.addAttribute("list", list);
		
	}
	
	@GetMapping("/detail")
	public void detail(int blog_no, Model model) {
		System.out.println("디테일뷰작동" + blog_no);
		BlogVo blogVo = blogService.readByBlogNo(blog_no);
		model.addAttribute("blogVo", blogVo);
		System.out.println("내가 만든 디테일은?" + blogVo);
		
	}
	
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/registerAction")
	public String registeraction(BlogVo blogVo) {
		System.out.println("내가받은 blogvo는?" + blogVo);
		String path = "";
		if(blogService.insert(blogVo)) {
			path="redirect:/hc/main/home";
		} else {
			path="redirect:/hc/blog/register";
		}
		return path;
	}
	
	@GetMapping("/modify_form")
	public void modify_form (int blog_no, Model model) {
		BlogVo blogVo = blogService.readByBlogNo(blog_no);
		model.addAttribute("blogVo", blogVo);
	}
	
	// 이거 겟메핑인거 다른 로그인한 사람이 접근할때 확인해서 격퇴하는걸로
	@PostMapping("/modifyAction")
	public String modifyAction(BlogVo blogVo) {
		System.out.println("내가받은 blogvo는?" + blogVo);
		String path = "";
		if(blogService.modify(blogVo)) {
			path="redirect:/hc/main/home";
		} else {
			path="redirect:/hc/blog/register";
		}
		return path;
	}
	
	@PostMapping("/delete")
	public String delete(int blog_no) {
		String path = "";
		if(blogService.delete(blog_no)) {
			path="redirect:/hc/main/home";
		} else {
			path="redirect:/hc/blog/modify_form?blog_no=" + blog_no;
		}
		return path;
	}
 	
	

}
