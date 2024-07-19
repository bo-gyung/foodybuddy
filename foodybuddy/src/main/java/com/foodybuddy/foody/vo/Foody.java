package com.foodybuddy.foody.vo;

import java.time.LocalDateTime;

import com.foodybuddy.common.Paging;

public class Foody extends Paging{
	private int foody_no;
	private int user_no;
	private int report_no;
	private String foody_title;
	private String foody_name;
	private int foody_taste;
	private int foody_clean;
	private String foody_parking;
	private String foody_delivery;
	private String foody_main;
	private LocalDateTime reg_date;
	private LocalDateTime mod_date;
	private String foody_address;
	private int foody_click;
	private int foody_good;

	public Foody() {
		super();
	}

	public Foody(int foody_no, int user_no, int report_no, String foody_title, String foody_name, int foody_taste,
			int foody_clean, String foody_parking, String foody_delivery, String foody_main, LocalDateTime reg_date,
			LocalDateTime mod_date, String foody_address, int foody_click, int foody_good) {
		super();
		this.foody_no = foody_no;
		this.user_no = user_no;
		this.report_no = report_no;
		this.foody_title = foody_title;
		this.foody_name = foody_name;
		this.foody_taste = foody_taste;
		this.foody_clean = foody_clean;
		this.foody_parking = foody_parking;
		this.foody_delivery = foody_delivery;
		this.foody_main = foody_main;
		this.reg_date = reg_date;
		this.mod_date = mod_date;
		this.foody_address = foody_address;
		this.foody_click = foody_click;
		this.foody_good = foody_good;
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

	public String getFoody_title() {
		return foody_title;
	}

	public void setFoody_title(String foody_title) {
		this.foody_title = foody_title;
	}

	public String getFoody_name() {
		return foody_name;
	}

	public void setFoody_name(String foody_name) {
		this.foody_name = foody_name;
	}

	public int getFoody_taste() {
		return foody_taste;
	}

	public void setFoody_taste(int foody_taste) {
		this.foody_taste = foody_taste;
	}

	public int getFoody_clean() {
		return foody_clean;
	}

	public void setFoody_clean(int foody_clean) {
		this.foody_clean = foody_clean;
	}

	public String getFoody_parking() {
		return foody_parking;
	}

	public void setFoody_parking(String foody_parking) {
		this.foody_parking = foody_parking;
	}

	public String getFoody_delivery() {
		return foody_delivery;
	}

	public void setFoody_delivery(String foody_delivery) {
		this.foody_delivery = foody_delivery;
	}

	public String getFoody_main() {
		return foody_main;
	}

	public void setFoody_main(String foody_main) {
		this.foody_main = foody_main;
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

	public String getFoody_address() {
		return foody_address;
	}

	public void setFoody_address(String foody_address) {
		this.foody_address = foody_address;
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
		return "Foody [foody_no=" + foody_no + ", user_no=" + user_no + ", report_no=" + report_no + ", foody_title="
				+ foody_title + ", foody_name=" + foody_name + ", foody_taste=" + foody_taste + ", foody_clean="
				+ foody_clean + ", foody_parking=" + foody_parking + ", foody_delivery=" + foody_delivery
				+ ", foody_main=" + foody_main + ", reg_date=" + reg_date + ", mod_date=" + mod_date
				+ ", foody_address=" + foody_address + ", foody_click=" + foody_click + ", foody_good=" + foody_good
				+ "]";
	}

}