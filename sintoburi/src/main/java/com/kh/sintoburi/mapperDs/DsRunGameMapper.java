package com.kh.sintoburi.mapperDs;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.sintoburi.domainDs.DsBoardVo;
import com.kh.sintoburi.domainDs.DsPointDto;


public interface DsRunGameMapper {
	


	
	
	@Update("update tbl_user"
			+ " set user_point=user_point+#{user_point}"
			+ " where user_id=#{user_id}")
	public Integer update(DsPointDto dto);
	
	
	
	
}
