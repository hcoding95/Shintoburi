package com.kh.sintoburi.domainDs;

import java.util.Date;

import lombok.Data;

@Data
public class DsQuizVo {
	private Long bno;
	private String user_id;
	private String user_name;
	private Integer score;
	private Date gamedate;
	
}
