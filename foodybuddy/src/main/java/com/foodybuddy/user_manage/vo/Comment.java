package com.foodybuddy.user_manage.vo;

import java.sql.Timestamp;

public class Comment {
    private int comment_num;
    private int foody_no;
    private String foody_title;
    private String comment_main;
    private Timestamp reg_date;

    // 기본 생성자
    public Comment() {}

    // 모든 필드를 포함하는 생성자
    public Comment(int comment_num, int foody_no, String foody_title, String comment_main, Timestamp reg_date) {
        this.comment_num = comment_num;
        this.foody_no = foody_no;
        this.foody_title = foody_title;
        this.comment_main = comment_main;
        this.reg_date = reg_date;
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

	public String getFoody_title() {
		return foody_title;
	}

	public void setFoody_title(String foody_title) {
		this.foody_title = foody_title;
	}

	public String getComment_main() {
		return comment_main;
	}

	public void setComment_main(String comment_main) {
		this.comment_main = comment_main;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "Comment [comment_num=" + comment_num + ", foody_no=" + foody_no + ", foody_title=" + foody_title
				+ ", comment_main=" + comment_main + ", reg_date=" + reg_date + "]";
	}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}