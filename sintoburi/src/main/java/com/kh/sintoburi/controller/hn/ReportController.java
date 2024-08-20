package com.kh.sintoburi.controller.hn;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.sintoburi.domain.hn.HnCriteria;
import com.kh.sintoburi.domain.hn.HnPageDto;
import com.kh.sintoburi.domain.hn.ReportPostVo;
import com.kh.sintoburi.service.hn.ReportPostService;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/hn/manager/report")
@Log4j
public class ReportController {
	

	@Autowired
	private ReportPostService reportPostService;


	// 신고게시글목록
	@GetMapping("/reportList")
	public void reportList(Model model, HnCriteria criteria) {
		List<ReportPostVo> list = reportPostService.ReportList(criteria);
		model.addAttribute("reportList", list);
		
		int total = reportPostService.getTotalCount(criteria);
		HnPageDto pageMaker = new HnPageDto(criteria, total);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("criteria", criteria);
	}

	// 신고게시글상세보기
	@GetMapping("/reportDetail/{re_no}")
	public String reportDetail(@PathVariable("re_no") int re_no, Model model) {

		ReportPostVo reportPostVo = reportPostService.selectByReNo(re_no);
		model.addAttribute("reportPostVo", reportPostVo);

		return "hn/manager/report/reportDetail";
	}

}
