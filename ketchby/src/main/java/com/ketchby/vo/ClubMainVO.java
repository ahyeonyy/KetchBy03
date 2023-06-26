package com.ketchby.vo;

import java.sql.Date;

public class ClubMainVO {
	private int cb_no;
	private String cb_img;
	private String cb_title;
	private String a_nick;
	private String bca_name;
	private String sca_name;
	private Date cb_cls_date;
	private int cb_people;
	public int getCb_no() {
		return cb_no;
	}
	public void setCb_no(int cb_no) {
		this.cb_no = cb_no;
	}
	public String getCb_img() {
		return cb_img;
	}
	public void setCb_img(String cb_img) {
		this.cb_img = cb_img;
	}
	public String getCb_title() {
		return cb_title;
	}
	public void setCb_title(String cb_title) {
		this.cb_title = cb_title;
	}
	public String getA_nick() {
		return a_nick;
	}
	public void setA_nick(String a_nick) {
		this.a_nick = a_nick;
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
	public Date getCb_cls_date() {
		return cb_cls_date;
	}
	public void setCb_cls_date(Date cb_cls_date) {
		this.cb_cls_date = cb_cls_date;
	}
	public int getCb_people() {
		return cb_people;
	}
	public void setCb_people(int cb_people) {
		this.cb_people = cb_people;
	}
	public ClubMainVO(int cb_no, String cb_img, String cb_title, String a_nick, String bca_name, String sca_name,
			Date cb_cls_date, int cb_people) {
		super();
		this.cb_no = cb_no;
		this.cb_img = cb_img;
		this.cb_title = cb_title;
		this.a_nick = a_nick;
		this.bca_name = bca_name;
		this.sca_name = sca_name;
		this.cb_cls_date = cb_cls_date;
		this.cb_people = cb_people;
	}
	public ClubMainVO() {
		super();
	}
	
	
}
