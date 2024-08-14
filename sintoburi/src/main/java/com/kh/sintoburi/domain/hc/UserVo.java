package com.kh.sintoburi.domain.hc;

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
	private String user_password;
	private String user_name;
	private int user_point;
	private String address;
	private int sumFollow;
	private boolean checkFollow;

}
