package com.kh.sintoburi.domain.gr;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class UsersVo {
	private String user_id;
	private String user_name;
	private String user_pw;
	private String email;
	private String address;
	private String grade;
	private int point;
	private int business;
	private String business_num;
	private Date last_login;
}
