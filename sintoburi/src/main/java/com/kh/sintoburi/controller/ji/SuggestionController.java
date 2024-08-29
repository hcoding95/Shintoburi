package com.kh.sintoburi.controller.ji;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.sintoburi.domain.ji.SuggestionVo;
import com.kh.sintoburi.service.ji.SuggestionService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/ji/suggestion/*")
@Log4j
public class SuggestionController {

	@Autowired
	private SuggestionService suggService;
	
	// 문의사항 등록
	@PostMapping("/register")
	public boolean register(@RequestBody SuggestionVo vo) {
		boolean result = suggService.register(vo);
		return result;
	}
	
	// 문의사항 수정
	@PutMapping("/modify")
	public boolean modify(@RequestBody SuggestionVo vo) {
		boolean result = suggService.modify(vo);
		return result;
	}
	
	// 문의사항 삭제
	@DeleteMapping("/remove/{suggestion_no}/{product_no}")
	public boolean remove(@PathVariable("suggestion_no") int suggestion_no,
						  @PathVariable("product_no") int product_no) {
		boolean result = suggService.remove(suggestion_no, product_no);
		return result;
	}
	
	// 문의사항 목록 가져오기 
	@GetMapping("/list/{product_no}")
	public List<SuggestionVo> list(@PathVariable("product_no") int product_no) {
	    log.info("product_no: " + product_no);
	    List<SuggestionVo> list = suggService.getList(product_no);
	    log.info("list: " + list);
	    return list;
	}
}
