package com.foodybuddy.buddy_comment.vo;

import java.time.LocalDateTime;

public class BuddyComment {
	private int comment_no;
	private int buddy_no;
	private int user_no;
	private int report_no;
	private String comment_main;
	private LocalDateTime reg_date;
	
	private String user_name;

	public BuddyComment() {
		super();

	}

	public BuddyComment(int comment_no, int buddy_no, int user_no, int report_no, String comment_main,
			LocalDateTime reg_date, String user_name) {
		super();
		this.comment_no = comment_no;
		this.buddy_no = buddy_no;
		this.user_no = user_no;
		this.report_no = report_no;
		this.comment_main = comment_main;
		this.reg_date = reg_date;
		this.user_name = user_name;
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public int getBuddy_no() {
		return buddy_no;
	}

	public void setBuddy_no(int buddy_no) {
		this.buddy_no = buddy_no;
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

	public String getComment_main() {
		return comment_main;
	}

	public void setComment_main(String comment_main) {
		this.comment_main = comment_main;
	}

	public LocalDateTime getReg_date() {
		return reg_date;
	}

	public void setReg_date(LocalDateTime reg_date) {
		this.reg_date = reg_date;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	@Override
	public String toString() {
		return "Comment [comment_no=" + comment_no + ", buddy_no=" + buddy_no + ", user_no=" + user_no + ", report_no="
				+ report_no + ", comment_main=" + comment_main + ", reg_date=" + reg_date + ", user_name=" + user_name
				+ "]";
	}

	

}
