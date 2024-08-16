package com.kh.sintoburi.controllerDs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sintoburi.domainDs.ChatVo;
import com.kh.sintoburi.domainDs.ReplyVo;
import com.kh.sintoburi.serviceDs.ChatService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/ds/chat/*")
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	@ResponseBody
	@PostMapping("/sendchat")
	public boolean sendchat(@RequestBody ChatVo vo) {
		
		return chatService.sendChat(vo);
	}
}
