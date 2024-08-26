package com.kh.sintoburi.mapperDs;

import org.apache.ibatis.annotations.Insert;

import com.kh.sintoburi.domainDs.DsReportVo;


public interface DsReportMapper {
	
	@Insert("insert into tbl_reportpost"
			+ " values(seq_report.nextval,"
			+ "#{post_url},#{post_id},#{re_reason},#{re_id},"
			+ "sysdate,'미처리',#{delete_url},#{category},#{write_num})")
	public Integer insert(DsReportVo vo);

}
