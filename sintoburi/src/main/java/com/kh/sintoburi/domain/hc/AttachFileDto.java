package com.kh.sintoburi.domain.hc;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AttachFileDto {
	private String file_name;   //1.png
	private String file_path; // yyyy/MM/dd
	private String uuid;       // random string
	private boolean image;     //이미지인지 여부
	private int blog_no;			// 어디에 붙일건지
}
