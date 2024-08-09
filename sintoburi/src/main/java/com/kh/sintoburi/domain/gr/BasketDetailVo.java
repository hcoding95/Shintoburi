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
public class BasketDetailVo {
	private int bdno;
	private int pno;
	private int bno;
	private int p_count;
	private Date put_date;
}
