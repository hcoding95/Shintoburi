package com.kh.sintoburi.domain.ji;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
@Builder
public class ProductVo {

	private Integer pno;
	private String name;
	private String content;
	private Integer price;
	private Integer stock;
	private String status;
	private Date reg_date;
	private Date upd_date;
	private Integer cate_no;
	
//	private List<이미지VO> images = new ArrayList<>();
	private List<ImageVo> imageList;
}
