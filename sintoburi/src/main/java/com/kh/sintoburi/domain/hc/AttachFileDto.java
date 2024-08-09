package com.kh.sintoburi.domain.hc;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class AttachFileDto {
	private String fileName;   //1.png
	private String uploadPath; // yyyy/MM/dd
	private String uuid;       // random string
	private boolean image;     //이미지인지 여부
	private long blogNo;			// 어디에 붙일건지
}
