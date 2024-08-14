package com.kh.sintoburi.domain.gr;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class BasketCriteria {

	private int pageNum = 1; //페이지 번호
	private int amount = 10; // 한 페이지 당 보여질 게시물 갯수
	private String user_id;
//	private String type; // 검색항목(제목/내용/작성자) - TC
//	private String keyword; // 검색어(사용자 입력값)
	
	
	public BasketCriteria() {
		this(1,10, null); //1페이지 10개
	}
	
	public BasketCriteria(String user_id) {
		this.user_id = user_id;
	}
	public BasketCriteria(int pageNum, int amount, String user_id) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.user_id = user_id;
	}
	
//	public String[] getTypeArr() {
//		if (type != null) {
//			String[] strs = type.split("");
//			return strs;
//		}
//		return null;
//	}
			
}
