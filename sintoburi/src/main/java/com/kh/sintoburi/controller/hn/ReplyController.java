package com.kh.sintoburi.controller.hn;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sintoburi.domain.hn.ReplyVo;
import com.kh.sintoburi.service.hn.ReplyService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/hn/reply/*")
@Log4j
public class ReplyController {

	@Autowired
	private ReplyService replyService;

	// 답변 등록
	@PostMapping("/registerReply")
	@ResponseBody
	 public boolean registerReply(@RequestBody ReplyVo replyVo) {
		boolean result = replyService.insertReply(replyVo);
		return result;
	}
            
}
