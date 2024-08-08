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
public class UserDto {
	private String user_id;
	private String user_name;
	private String grade;
	private String email;
	private Date  last_login;
	private int business;

}
