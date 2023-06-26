package com.ketchby.vo;

public class ScategoryVO {
	private int sca_no;
	private int bca_no;
	private String sca_name;
	
	public ScategoryVO(int sca_no, int bca_no, String sca_name) {
		super();
		this.sca_no = sca_no;
		this.bca_no = bca_no;
		this.sca_name = sca_name;
	}
	public ScategoryVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getSca_no() {
		return sca_no;
	}
	public void setSca_no(int sca_no) {
		this.sca_no = sca_no;
	}
	public int getBca_no() {
		return bca_no;
	}
	public void setBca_no(int bca_no) {
		this.bca_no = bca_no;
	}
	public String getSca_name() {
		return sca_name;
	}
	public void setSca_name(String sca_name) {
		this.sca_name = sca_name;
	}
	

}
