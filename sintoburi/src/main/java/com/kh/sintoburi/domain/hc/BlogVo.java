package com.kh.sintoburi.domain.hc;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BlogVo {
	
	private int blog_no;
	private String user_id;
	private String 	blog_content;
	private Date regdate;
	private Date updatedate;
	
	private List<AttachFileDto> fileList;
	private List<ProductTagDto> productTagList;
	
	
}
