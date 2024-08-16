package com.kh.sintoburi.controllerDs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sintoburi.domainDs.QuizVo;
import com.kh.sintoburi.serviceDs.GameService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/ds/game/*")
public class GameController {
	
	@Autowired
	private GameService gameService;
	
		// 퀴즈게임 점수기록
		@PostMapping("/quizRecord")
		@ResponseBody
		public String quisRecordPost(@RequestBody QuizVo vo) {
			
			System.out.println("vo:"+vo.toString());
			boolean result =gameService.recoardQuiz(vo);
			System.out.println("writePost");
			
			if(result) {
				return "success";
			}
			
			return "fail"; 
		}
		
		
		// 퀴즈게임 점수보기
		@PostMapping("/quizScore")
		@ResponseBody
		public List<QuizVo> quisScorePost() {

			List<QuizVo> result = gameService.getScore();

			return result; 
		}

}
