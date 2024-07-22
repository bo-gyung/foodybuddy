package com.foodybuddy.buddy.vo;

import java.time.LocalDateTime;

public class Buddy {
	private int buddy_no;
	private int foody_no;
	private int user_no;
	private int report_no;
	private String buddy_approve;
	private LocalDateTime reg_date;
	private String buddy_title;
	private String buddy_main;
	private int buddy_view;
	private String party_name;
	private LocalDateTime meet_date;
	private int party_number;
	private LocalDateTime formation_date;
	
	public Buddy() {
		super();
	}
	public Buddy(int buddy_no, int foody_no, int user_no, int report_no, String buddy_approve, LocalDateTime reg_date,
			String buddy_title, String buddy_main, int buddy_view, String party_name, LocalDateTime meet_date,
			int party_number, LocalDateTime formation_date) {
		super();
		this.buddy_no = buddy_no;
		this.foody_no = foody_no;
		this.user_no = user_no;
		this.report_no = report_no;
		this.buddy_approve = buddy_approve;
		this.reg_date = reg_date;
		this.buddy_title = buddy_title;
		this.buddy_main = buddy_main;
		this.buddy_view = buddy_view;
		this.party_name = party_name;
		this.meet_date = meet_date;
		this.party_number = party_number;
		this.formation_date = formation_date;
	}
	
	public int getBuddy_no() {
		return buddy_no;
	}
	public void setBuddy_no(int buddy_no) {
		this.buddy_no = buddy_no;
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
	public String getBuddy_approve() {
		return buddy_approve;
	}
	public void setBuddy_approve(String buddy_approve) {
		this.buddy_approve = buddy_approve;
	}
	public LocalDateTime getReg_date() {
		return reg_date;
	}
	public void setReg_date(LocalDateTime reg_date) {
		this.reg_date = reg_date;
	}
	public String getBuddy_title() {
		return buddy_title;
	}
	public void setBuddy_title(String buddy_title) {
		this.buddy_title = buddy_title;
	}
	public String getBuddy_main() {
		return buddy_main;
	}
	public void setBuddy_main(String buddy_main) {
		this.buddy_main = buddy_main;
	}
	public int getBuddy_view() {
		return buddy_view;
	}
	public void setBuddy_view(int buddy_view) {
		this.buddy_view = buddy_view;
	}
	public String getParty_name() {
		return party_name;
	}
	public void setParty_name(String party_name) {
		this.party_name = party_name;
	}
	public LocalDateTime getMeet_date() {
		return meet_date;
	}
	public void setMeet_date(LocalDateTime meet_date) {
		this.meet_date = meet_date;
	}
	public int getParty_number() {
		return party_number;
	}
	public void setParty_number(int party_number) {
		this.party_number = party_number;
	}
	public LocalDateTime getFormation_date() {
		return formation_date;
	}
	public void setFormation_date(LocalDateTime formation_date) {
		this.formation_date = formation_date;
	}
	
	@Override
	public String toString() {
		return "Buddy [buddy_no=" + buddy_no + ", foody_no=" + foody_no + ", user_no=" + user_no + ", report_no="
				+ report_no + ", buddy_approve=" + buddy_approve + ", reg_date=" + reg_date + ", buddy_title="
				+ buddy_title + ", buddy_main=" + buddy_main + ", buddy_view=" + buddy_view + ", party_name="
				+ party_name + ", meet_date=" + meet_date + ", party_number=" + party_number + ", formation_date="
				+ formation_date + "]";
	}
}
