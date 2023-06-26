package com.ketchby.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClassVO {
	private int cl_no;
	private int sca_no;
	private int a_no;
	private String cl_title;
	private String cl_img;
	private String cl_content;
	private String cl_level;
	private int cl_people;
	private int cl_price;
	private String cl_addr;
	private String cl_date;
	private String cl_s_date;
	private String cl_e_date;
	private String cl_type;
	private String bca_name;
	private String sca_name;
}
