package com.kh.sintoburi.domainDs;

import java.util.Date;

import lombok.Data;

@Data
public class DsBoardVo {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private String category;
	private Date regdate;
	private Date updatedate;
	private String thumbnail;
	private Long view_count;
}