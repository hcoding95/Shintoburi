package com.kh.sintoburi.serviceDs;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.kh.sintoburi.domainDs.DsBoardVo;
import com.kh.sintoburi.domainDs.DsQuizVo;
import com.kh.sintoburi.domainDs.DsReportVo;
import com.kh.sintoburi.domainDs.DsPointDto;


public interface DsReportService {
	
	// 신고하기
	public boolean addReport(DsReportVo vo);

}
