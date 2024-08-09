package com.kh.sintoburi.domain.gr;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class ProductVo {
	private int pno;
	private String name;
	private String content;
	private int price;
	private int stock;
	private String status;
	private Date reg_date;
	private Date upd_date;
	private int cate_no;
}
