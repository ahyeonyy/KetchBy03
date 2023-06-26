package com.ketchby.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class ReviewInfoVO {
	private String r_content;
	private Date r_date;
	private String a_nick;
	private double r_star;
}
