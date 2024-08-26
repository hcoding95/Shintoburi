package com.kh.sintoburi.controllerDs;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sintoburi.domainDs.DsReplyVo;
import com.kh.sintoburi.domainDs.DsReportVo;
import com.kh.sintoburi.serviceDs.DsReportService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/ds/report/*")
public class DsReportController {
	
	@Autowired
	private DsReportService reportService;
	
	@PostMapping("/addReport")
	@ResponseBody
	public boolean addReport(@RequestBody DsReportVo vo) {
		
	
		return reportService.addReport(vo);
		
	
	}
	
	

}
