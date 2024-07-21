package com.foodybuddy.foodyPic.vo;

public class Foody_Pic {
	private int pic_num;
	private int foody_no;
	private String pic_sub;
	private boolean pic_main;
	
	public Foody_Pic() {
		super();
		
	}

	public Foody_Pic(int pic_num, int foody_no, String pic_sub, boolean pic_main) {
		super();
		this.pic_num = pic_num;
		this.foody_no = foody_no;
		this.pic_sub = pic_sub;
		this.pic_main = pic_main;
	}

	public int getPic_num() {
		return pic_num;
	}

	public void setPic_num(int pic_num) {
		this.pic_num = pic_num;
	}

	public int getFoody_no() {
		return foody_no;
	}

	public void setFoody_no(int foody_no) {
		this.foody_no = foody_no;
	}

	public String getPic_sub() {
		return pic_sub;
	}

	public void setPic_sub(String pic_sub) {
		this.pic_sub = pic_sub;
	}

	public boolean isPic_main() {
		return pic_main;
	}

	public void setPic_main(boolean pic_main) {
		this.pic_main = pic_main;
	}

	@Override
	public String toString() {
		return "Foody_Pic [pic_num=" + pic_num + ", foody_no=" + foody_no + ", pic_sub=" + pic_sub + ", pic_main="
				+ pic_main + "]";
	}
	
	
	
}
