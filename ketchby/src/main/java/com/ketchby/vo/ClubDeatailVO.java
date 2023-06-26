package com.ketchby.vo;



public class ClubDeatailVO {
	private int cb_no;
	private String a_img;
	private String cb_title; 
	private String cb_content; 
	private int cb_people; 
	private String cb_cls_date;
	private String bloc_name;
	private String sloc_name; 
	private String a_nick; 
	private String bca_name; 
	private String sca_name; 
	private String cb_img;
	private int sloc_no;
	private int cnt;
	public int getCb_no() {
		return cb_no;
	}
	public void setCb_no(int cb_no) {
		this.cb_no = cb_no;
	}
	public String getA_img() {
		return a_img;
	}
	public void setA_img(String a_img) {
		this.a_img = a_img;
	}
	public String getCb_title() {
		return cb_title;
	}
	public void setCb_title(String cb_title) {
		this.cb_title = cb_title;
	}
	public String getCb_content() {
		return cb_content;
	}
	public void setCb_content(String cb_content) {
		this.cb_content = cb_content;
	}
	public int getCb_people() {
		return cb_people;
	}
	public void setCb_people(int cb_people) {
		this.cb_people = cb_people;
	}
	public String getCb_cls_date() {
		return cb_cls_date;
	}
	public void setCb_cls_date(String cb_cls_date) {
		this.cb_cls_date = cb_cls_date;
	}
	public String getBloc_name() {
		return bloc_name;
	}
	public void setBloc_name(String bloc_name) {
		this.bloc_name = bloc_name;
	}
	public String getSloc_name() {
		return sloc_name;
	}
	public void setSloc_name(String sloc_name) {
		this.sloc_name = sloc_name;
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
	public String getCb_img() {
		return cb_img;
	}
	public void setCb_img(String cb_img) {
		this.cb_img = cb_img;
	}
	public int getSloc_no() {
		return sloc_no;
	}
	public void setSloc_no(int sloc_no) {
		this.sloc_no = sloc_no;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public ClubDeatailVO(int cb_no, String a_img, String cb_title, String cb_content, int cb_people, String cb_cls_date,
			String bloc_name, String sloc_name, String a_nick, String bca_name, String sca_name, String cb_img,
			int sloc_no, int cnt) {
		super();
		this.cb_no = cb_no;
		this.a_img = a_img;
		this.cb_title = cb_title;
		this.cb_content = cb_content;
		this.cb_people = cb_people;
		this.cb_cls_date = cb_cls_date;
		this.bloc_name = bloc_name;
		this.sloc_name = sloc_name;
		this.a_nick = a_nick;
		this.bca_name = bca_name;
		this.sca_name = sca_name;
		this.cb_img = cb_img;
		this.sloc_no = sloc_no;
		this.cnt = cnt;
	}
	public ClubDeatailVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
