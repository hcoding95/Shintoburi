package com.kh.sintoburi.domain.hc;


import lombok.Data;

@Data
public class HcProductTagDto {
	private int blog_no;
	private int product_id;
	private String product_name;
	private boolean isDuplicate; // 중복체크
}
