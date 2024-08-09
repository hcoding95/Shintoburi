package com.kh.sintoburi.domain.hn;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EnquiryFormDto {

	private String user_id;
	private String enquiry_type;
	private String content;
	private MultipartFile image;
}
