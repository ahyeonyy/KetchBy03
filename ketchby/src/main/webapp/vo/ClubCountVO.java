package com.ketchby.vo;

public class ClubCountVO {
	private int cb_ap_no;
	private int cb_no;
	private int a_no;
	public int getCb_ap_no() {
		return cb_ap_no;
	}
	public void setCb_ap_no(int cb_ap_no) {
		this.cb_ap_no = cb_ap_no;
	}
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
	public ClubCountVO(int cb_ap_no, int cb_no, int a_no) {
		super();
		this.cb_ap_no = cb_ap_no;
		this.cb_no = cb_no;
		this.a_no = a_no;
	}
	public ClubCountVO() {
		super();
		// TODO Auto-generated constructor stub
	}
}
