package com.kh.sintoburi.domainDs;

import java.util.Date;

import lombok.Data;

@Data
public class DsUserVo {
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_point;
	private String grade;
	private String address;
	private String user_phone;
	private Integer business;
	private String business_num;
	private Date last_login;
	private String user_email;
}
