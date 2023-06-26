package com.ketchby.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVO {
private int cl_no;
private String r_content;
private int a_no;
private int r_star;
private Date r_date;
}
