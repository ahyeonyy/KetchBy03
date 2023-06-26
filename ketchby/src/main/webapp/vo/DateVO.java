package com.ketchby.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DateVO {
	private int cl_no;
	private String s_date;
	private String e_date;
	private int price;
	private int people;
	
	
}
