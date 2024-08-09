package com.kh.sintoburi.domain.hn;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserVo {
	
	private String user_id;
	private String user_name;
	private String user_pw;
	private String email;
	private String address;
	private String grade;
	private int point;
	private int  business;
	private int  business_num;
	private Date  last_login;

}
