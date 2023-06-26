package com.ketchby.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class AccReviewVO {
private int cl_no;
private String r_content;
private int a_no;
private double r_star;
private Date r_date;
private String cl_title;
}
