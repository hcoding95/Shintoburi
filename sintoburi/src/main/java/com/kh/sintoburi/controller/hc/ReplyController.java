package com.kh.sintoburi.controller.hc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.sintoburi.domain.hc.ReplyDto;
import com.kh.sintoburi.service.hc.ReplyService;

@RestController
@RequestMapping("/hc/reply/*")
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	// 댓글 가져오기
	@GetMapping("/getReply")
	public List<ReplyDto> getReply(int blog_no) {
		List<ReplyDto> list = replyService.getReplyListByBlog_no(blog_no);
		return list;
	}
	// 댓글 쓰기
	@PostMapping("/setReply")
	public boolean setReply(@RequestBody ReplyDto replyDto) {
		System.out.println("내가받은 댓글 정보는? " + replyDto);
		if(replyService.insertReply(replyDto)) {
			return true;
		}
		return false;
	}
	// 댓글 수정
	@PostMapping("/modify")
	public boolean modify(ReplyDto replyDto) {
		if(replyService.modifyReply(replyDto)) {
			return true;
		}
		return false;
	}
	// 댓글 수정
	@PostMapping("/delete")
	public boolean delete(int blog_rno) {
		if(replyService.deleteReply(blog_rno)) {
			return true;
		}
		return false;
	}
	
	

}
