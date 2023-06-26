package com.ketchby.vo;

public class SlocationVO {
	int sloc_no;
	String sloc_name;
	int bloc_no;
	
	public SlocationVO(int sloc_no, String sloc_name, int bloc_no) {
		super();
		this.sloc_no = sloc_no;
		this.sloc_name = sloc_name;
		this.bloc_no = bloc_no;
	}
	public SlocationVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getSloc_no() {
		return sloc_no;
	}
	public void setSloc_no(int sloc_no) {
		this.sloc_no = sloc_no;
	}
	public String getSloc_name() {
		return sloc_name;
	}
	public void setSloc_name(String sloc_name) {
		this.sloc_name = sloc_name;
	}
	public int getBloc_no() {
		return bloc_no;
	}
	public void setBloc_no(int bloc_no) {
		this.bloc_no = bloc_no;
	}
	

}
