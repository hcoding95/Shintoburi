package com.kh.sintoburi.domain.hn;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class HnCriteria {
	private int pageNum; // 페이지 번호
	private int amount;  // 한 페이지 당 보여질 게시물 갯수
	private String type; // 검색항목(제목/내용/작성자) - TC
	private String keyword; // 검색어(사용자 입력값)
	
	public HnCriteria() {
		this(1, 10); // 1페이지, 10개
	}
	
	public HnCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		if (type != null) {
			String[] strs = type.split("");
			return strs;
		}
		return null;
		
	}
}
