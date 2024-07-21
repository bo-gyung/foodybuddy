package com.foodybuddy.user_manage.vo;

import java.sql.Timestamp;

public class Post {
    private int postNo;
    private String postTitle;
    private Timestamp postDate;
    private int postViews;

    // Getter와 Setter 메서드들
    public int getPostNo() {
        return postNo;
    }

    public void setPostNo(int postNo) {
        this.postNo = postNo;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public Timestamp getPostDate() {
        return postDate;
    }

    public void setPostDate(Timestamp postDate) {
        this.postDate = postDate;
    }

    public int getPostViews() {
        return postViews;
    }

    public void setPostViews(int postViews) {
        this.postViews = postViews;
    }

	@Override
	public String toString() {
		return "Post [postNo=" + postNo + ", postTitle=" + postTitle + ", postDate=" + postDate + ", postViews="
				+ postViews + "]";
	}
    
    
}
