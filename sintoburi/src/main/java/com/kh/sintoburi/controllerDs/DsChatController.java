package com.kh.sintoburi.controllerDs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sintoburi.domainDs.DsChatVo;
import com.kh.sintoburi.serviceDs.DsChatService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/ds/chat/*")
public class DsChatController {

	@Autowired
	private DsChatService chatService;
	
	@ResponseBody
	@PostMapping("/sendChat")
	public boolean sendchat(@RequestBody DsChatVo vo) {
		
		return chatService.sendChat(vo);
	}
	
	// 채팅 로그를 보여줌
	@ResponseBody 
	@PostMapping("/chatLog")
	public List<DsChatVo> chatLog() {
		
		return chatService.getChatLog();
	}
	
	// 채팅 로그를 삭제함
	@ResponseBody
	@PostMapping("/resetLog")
	public boolean resetLog() {
		
		return chatService.deleteChatLog();
	}
	
}
