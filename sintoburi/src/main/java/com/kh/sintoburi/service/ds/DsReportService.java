package com.kh.sintoburi.service.ds;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.kh.sintoburi.domain.ds.DsBoardVo;
import com.kh.sintoburi.domain.ds.DsPointDto;
import com.kh.sintoburi.domain.ds.DsQuizVo;
import com.kh.sintoburi.domain.ds.DsReportVo;


public interface DsReportService {
	
	// 신고하기
	public boolean addReport(DsReportVo vo);

}
