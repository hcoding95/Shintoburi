package com.kh.sintoburi.controller.hc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.sintoburi.domain.hc.ReplyDto;
import com.kh.sintoburi.service.hc.ReplyService;

@RestController
@RequestMapping("/hc/reply/*")
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	@GetMapping("/getReply")
	public List<ReplyDto> getReply(int blog_no) {
		List<ReplyDto> list = replyService.getReplyListByBlog_no(blog_no);
		return list;
	}
	
	@PostMapping("/setReply")
	public boolean setReply(ReplyDto replyDto) {
		if(replyService.insertReply(replyDto)) {
			return true;
		}
		return false;
	}

}
