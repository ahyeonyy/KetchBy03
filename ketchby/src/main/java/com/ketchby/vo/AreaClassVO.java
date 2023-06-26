package com.ketchby.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AreaClassVO {
	private int cl_no;
	private String cl_title;
	private String cl_level;
	private String cl_img;
	private int cl_price;
	private String bca_name;
	private String sca_name;
	private String a_level;
	private int cnt;
	private double aver;
}
