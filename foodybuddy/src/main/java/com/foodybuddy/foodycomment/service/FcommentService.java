package com.foodybuddy.foodycomment.service;

import static com.foodybuddy.common.sql.JDBCTemplate.close;
import static com.foodybuddy.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.foodybuddy.foodycomment.dao.FcommentDao;
import com.foodybuddy.foodycomment.vo.Comment;

public class FcommentService {
	public void addComment(Comment comment) {
        Connection conn = getConnection();
        FcommentDao commentDao = new FcommentDao();
        commentDao.insertComment(comment, conn);
        close(conn);
    }

    public List<Comment> getCommentsByFoodyNo(int foody_no) {
        Connection conn = getConnection();
        FcommentDao commentDao = new FcommentDao();
        List<Comment> comments = commentDao.selectCommentsByFoodyNo(foody_no, conn);
        close(conn);
        return comments;
    }
}	
