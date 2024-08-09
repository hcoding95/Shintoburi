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
public class ReportPostVo {
	private int re_no;
	private int post_no;
	private String post_content;
	private String post_id;
	private String re_reason;
	private String re_id;
	private Date re_date;
	private String status;

}
