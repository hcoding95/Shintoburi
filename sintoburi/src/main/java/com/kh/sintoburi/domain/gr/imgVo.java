package com.kh.sintoburi.domain.gr;

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
public class imgVo {
	private int ino;
	private int pno;
	private String img_path;
	private int cate_no;
}
