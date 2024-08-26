package com.kh.sintoburi.serviceDs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domainDs.DsReplyVo;
import com.kh.sintoburi.domainDs.DsReportVo;
import com.kh.sintoburi.mapperDs.DsReplyMapper;
import com.kh.sintoburi.mapperDs.DsReportMapper;

@Service
public class DsReportServiceImpl implements DsReportService {

	@Autowired
	private DsReportMapper reportMapper;

	@Override
	public boolean addReport(DsReportVo vo) {
		
		return reportMapper.insert(vo)>0?true:false;
	}

	
	
	
	
}
