package com.foodybuddy.user_manage.vo;

import java.sql.Timestamp;

public class FoodyPost {
    private int foody_no;
    private String foody_title;
    private String foody_main;
    private Timestamp reg_date;
    private int foody_click;
    private int foody_good;

    // Getter와 Setter 메서드들
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

    public String getFoody_main() {
        return foody_main;
    }

    public void setFoody_main(String foody_main) {
        this.foody_main = foody_main;
    }

    public Timestamp getReg_date() {
        return reg_date;
    }

    public void setReg_date(Timestamp reg_date) {
        this.reg_date = reg_date;
    }

    public int getFoody_click() {
        return foody_click;
    }

    public void setFoody_click(int foody_click) {
        this.foody_click = foody_click;
    }

    public int getFoody_good() {
        return foody_good;
    }

    public void setFoody_good(int foody_good) {
        this.foody_good = foody_good;
    }

	@Override
	public String toString() {
		return "FoodyPost [foody_no=" + foody_no + ", foody_title=" + foody_title + ", foody_main=" + foody_main
				+ ", reg_date=" + reg_date + ", foody_click=" + foody_click + ", foody_good=" + foody_good + "]";
	}
}
