package com.ketchby.vo;



import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class CourseDetailVO {
	private int cl_no;
	private Date rs_date;
	private String cl_title;
	private String cl_img;
	private int cl_price; 
}
