package com.ketchby.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



public class HotClubVO {
	private int cb_no;
	private String cb_title;
	private int cb_people;
	private int ap_cnt;
	private String cb_img;
	private String bca_name;
	private String sca_name;
	private String cb_cls_date;
	private int sloc_no;
	public int getCb_no() {
		return cb_no;
	}
	public void setCb_no(int cb_no) {
		this.cb_no = cb_no;
	}
	public String getCb_title() {
		return cb_title;
	}
	public void setCb_title(String cb_title) {
		this.cb_title = cb_title;
	}
	public int getCb_people() {
		return cb_people;
	}
	public void setCb_people(int cb_people) {
		this.cb_people = cb_people;
	}
	public int getAp_cnt() {
		return ap_cnt;
	}
	public void setAp_cnt(int ap_cnt) {
		this.ap_cnt = ap_cnt;
	}
	public String getCb_img() {
		return cb_img;
	}
	public void setCb_img(String cb_img) {
		this.cb_img = cb_img;
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
	public String getCb_cls_date() {
		return cb_cls_date;
	}
	public void setCb_cls_date(String cb_cls_date) {
		this.cb_cls_date = cb_cls_date;
	}
	public int getSloc_no() {
		return sloc_no;
	}
	public void setSloc_no(int sloc_no) {
		this.sloc_no = sloc_no;
	}
	public HotClubVO(int cb_no, String cb_title, int cb_people, int ap_cnt, String cb_img, String bca_name,
			String sca_name, String cb_cls_date, int sloc_no) {
		super();
		this.cb_no = cb_no;
		this.cb_title = cb_title;
		this.cb_people = cb_people;
		this.ap_cnt = ap_cnt;
		this.cb_img = cb_img;
		this.bca_name = bca_name;
		this.sca_name = sca_name;
		this.cb_cls_date = cb_cls_date;
		this.sloc_no = sloc_no;
	}
	public HotClubVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
