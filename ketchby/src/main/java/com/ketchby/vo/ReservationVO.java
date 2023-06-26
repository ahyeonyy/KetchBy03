package com.ketchby.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class ReservationVO {
	private int rs_no;
	private int a_no;
	private int cl_no;
	private String rs_date;
	private int cl_people;
}
