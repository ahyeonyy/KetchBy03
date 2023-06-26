package com.ketchby.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class TimeVO {
	private int cl_no;
	private String day;
	private String s_time;
	private String e_time;
}
