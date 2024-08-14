package com.kh.sintoburi.domain.hn;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FaqVo {
	
	private int f_no;
	private String title;
	private String content;
	private String write_date;

}
