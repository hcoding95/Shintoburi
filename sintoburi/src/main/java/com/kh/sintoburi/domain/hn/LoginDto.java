package com.kh.sintoburi.domain.hn;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LoginDto {

	private String user_id;
	private String user_pw;
	private boolean useCookie;
}
