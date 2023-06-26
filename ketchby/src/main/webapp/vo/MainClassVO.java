package com.ketchby.vo;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class MainClassVO {
	
    private int cl_no;
    private String cl_title;
    private String addr;
    private String cl_img;
    private String cl_level;
    private int cl_price;
    private String bca_name;
    private String sca_name;
    private int a_no;
    private String a_level;
    
	public int getCl_no() {
		return cl_no;
	}
	public void setCl_no(int cl_no) {
		this.cl_no = cl_no;
	}
	public String getCl_title() {
		return cl_title;
	}
	public void setCl_title(String cl_title) {
		this.cl_title = cl_title;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getCl_img() {
		return cl_img;
	}
	public void setCl_img(String cl_img) {
		this.cl_img = cl_img;
	}
	public String getCl_level() {
		return cl_level;
	}
	public void setCl_level(String cl_level) {
		this.cl_level = cl_level;
	}
	public int getCl_price() {
		return cl_price;
	}
	public void setCl_price(int cl_price) {
		this.cl_price = cl_price;
	}
	public String getBca_name() {
		return bca_name;
	}
	public void setBca_name(String bca_name) {
		this.bca_name = bca_name;
	}
	public String getSca_name() {
		return sca_name;
	}
	public void setSca_name(String sca_name) {
		this.sca_name = sca_name;
	}
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public String getA_level() {
		return a_level;
	}
	public void setA_level(String a_level) {
		this.a_level = a_level;
	}
	
	
    
}
