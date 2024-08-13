package com.kh.sintoburi.domain.ji;

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
public class ImageVo {

	private String uuid;	 // random string
	private String img_name; // 상품 이름
	private String img_path; // 상품 경로
	private Integer pno; 		 // 어느 상품의 첨부파일인지
}
