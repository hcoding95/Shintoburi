package com.kh.sintoburi.domain.ji;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ProductRegisterDto {
	private	String name;
	private String content;
	private Integer price;
	private Integer stock;
	private String status;
	private Integer cate_no;
	private MultipartFile productImg; 
	
}
