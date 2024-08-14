package com.kh.sintoburi.domain.hn;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class NoticeFormDto {
	
	private int n_no;
	private String title;
	private String content;
	private MultipartFile image;
	private Date write_date;

}
