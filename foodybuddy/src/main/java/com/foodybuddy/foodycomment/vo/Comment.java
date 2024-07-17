package com.foodybuddy.foodycomment.vo;

import java.time.LocalDateTime;

public class Comment {
	private int comment_num;
	private int foody_no;
	private int user_no;
	private int report_no;
	private String user_name;
	private String comment_text;
	private LocalDateTime reg_date;
	private LocalDateTime mod_date;
	
	public Comment() {
		super();

	}

	public Comment(int comment_num, int foody_no, int user_no, int report_no, String user_name, String comment_text,
			LocalDateTime reg_date, LocalDateTime mod_date) {
		super();
		this.comment_num = comment_num;
		this.foody_no = foody_no;
		this.user_no = user_no;
		this.report_no = report_no;
		this.user_name = user_name;
		this.comment_text = comment_text;
		this.reg_date = reg_date;
		this.mod_date = mod_date;
	}

	public int getComment_num() {
		return comment_num;
	}

	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}

	public int getFoody_no() {
		return foody_no;
	}

	public void setFoody_no(int foody_no) {
		this.foody_no = foody_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getComment_text() {
		return comment_text;
	}

	public void setComment_text(String comment_text) {
		this.comment_text = comment_text;
	}

	public LocalDateTime getReg_date() {
		return reg_date;
	}

	public void setReg_date(LocalDateTime reg_date) {
		this.reg_date = reg_date;
	}

	public LocalDateTime getMod_date() {
		return mod_date;
	}

	public void setMod_date(LocalDateTime mod_date) {
		this.mod_date = mod_date;
	}

	@Override
	public String toString() {
		return "Comment [comment_num=" + comment_num + ", foody_no=" + foody_no + ", user_no=" + user_no
				+ ", report_no=" + report_no + ", user_name=" + user_name + ", comment_text=" + comment_text
				+ ", reg_date=" + reg_date + ", mod_date=" + mod_date + "]";
	}
	
	
	
}
