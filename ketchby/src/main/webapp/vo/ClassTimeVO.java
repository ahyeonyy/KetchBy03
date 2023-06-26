package com.ketchby.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class ClassTimeVO {
	private String t_day;
	private String t_s_time;
	private String t_e_time;
}
