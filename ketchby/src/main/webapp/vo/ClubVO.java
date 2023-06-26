package com.ketchby.vo;

import java.sql.Date;

public class ClubVO {
	private int cb_no;
	private int a_no;
	private int sca_no;
	private String cb_title;
	private String cb_img;
	private String cb_content;
	private int sloc_no;
	private int cb_people;
	private String cb_op_date;
	private String cb_cls_date;
	public int getCb_no() {
		return cb_no;
	}
	public void setCb_no(int cb_no) {
		this.cb_no = cb_no;
	}
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public int getSca_no() {
		return sca_no;
	}
	public void setSca_no(int sca_no) {
		this.sca_no = sca_no;
	}
	public String getCb_title() {
		return cb_title;
	}
	public void setCb_title(String cb_title) {
		this.cb_title = cb_title;
	}
	public String getCb_img() {
		return cb_img;
	}
	public void setCb_img(String cb_img) {
		this.cb_img = cb_img;
	}
	public String getCb_content() {
		return cb_content;
	}
	public void setCb_content(String cb_content) {
		this.cb_content = cb_content;
	}
	public int getSloc_no() {
		return sloc_no;
	}
	public void setSloc_no(int sloc_no) {
		this.sloc_no = sloc_no;
	}
	public int getCb_people() {
		return cb_people;
	}
	public void setCb_people(int cb_people) {
		this.cb_people = cb_people;
	}
	public String getCb_op_date() {
		return cb_op_date;
	}
	public void setCb_op_date(String cb_op_date) {
		this.cb_op_date = cb_op_date;
	}
	public String getCb_cls_date() {
		return cb_cls_date;
	}
	public void setCb_cls_date(String cb_cls_date) {
		this.cb_cls_date = cb_cls_date;
	}
	public ClubVO(int cb_no, int a_no, int sca_no, String cb_title, String cb_img, String cb_content, int sloc_no,
			int cb_people, String cb_op_date, String cb_cls_date) {
		super();
		this.cb_no = cb_no;
		this.a_no = a_no;
		this.sca_no = sca_no;
		this.cb_title = cb_title;
		this.cb_img = cb_img;
		this.cb_content = cb_content;
		this.sloc_no = sloc_no;
		this.cb_people = cb_people;
		this.cb_op_date = cb_op_date;
		this.cb_cls_date = cb_cls_date;
	}
	public ClubVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
