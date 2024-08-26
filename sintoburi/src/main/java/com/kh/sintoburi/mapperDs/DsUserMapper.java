package com.kh.sintoburi.mapperDs;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.kh.sintoburi.domainDs.DsLoginDto;
import com.kh.sintoburi.domainDs.DsUserVo;

public interface DsUserMapper {
	
	@Select("select user_point from tbl_user where user_id=#{user_id}")
	public Integer select(String user_id);
	
	@Insert("insert into tbl_user(user_id,user_pw,user_name,address,user_phone,user_email)"
			+ " values(#{user_id},#{user_pw},#{user_name},"
			+ " #{address},#{user_phone},#{user_email})")
	public Integer insert(DsUserVo vo);
	
	@Select("select count(*) from tbl_user where user_id=#{user_id}")
	public Integer selectByUserId(String user_id);
	
	@Select("select * from tbl_user where user_id=#{user_id} and user_pw=#{user_pw}")
	public DsUserVo selectLoginUser(DsLoginDto dto);
	
	

}