package com.kh.sintoburi.controllerDs;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sintoburi.domainDs.ReplyVo;
import com.kh.sintoburi.serviceDs.ReplyService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/ds/reply/*")
public class ReplyController {
	@Autowired
	private ReplyService replyService;
	
	@ResponseBody
	@PostMapping("/commitComment")
	public boolean register(@RequestBody ReplyVo vo) {
		
		return replyService.commitComment(vo);
	}
	
	
	
	
		@PostMapping("/getReply")
		@ResponseBody
		public List<ReplyVo> getReply(@RequestBody Map<String, Long>map) {
			
			Long bno = map.get("bno");
			List<ReplyVo> list = replyService.getReply(bno);
			
			System.out.println("리스트:"+list.toString());
			
			return list;
			
		
		}
}
