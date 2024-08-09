package com.kh.sintoburi.domain.hc;

import java.util.Date;

import lombok.Data;

@Data
public class BlogVo {
	
	private long blog_no;
	private String user_id;
	private String 	blog_content;
	private Date regdate;
	private Date updatedate;

}
