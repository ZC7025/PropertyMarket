package com.ht.service.impl;

import com.ht.bean.Comment;
import com.ht.common.bean.Pager;
import com.ht.dao.CommentDAO;
import com.ht.service.CommentService;

import java.util.List;

/**
 * Created by 7025 on 2017/9/8.
 */
public class CommentServiceImpl implements CommentService {

    private CommentDAO commentDAO;

    public void setCommentDAO(CommentDAO commentDAO) {
        this.commentDAO = commentDAO;
    }

    @Override
    public void save(Comment comment) {
        commentDAO.save(comment);
    }

    @Override
    public void update(Comment comment) {
        commentDAO.update(comment);
    }

    @Override
    public void updateStatus(Comment comment) {
        commentDAO.updateStatus(comment);
    }

    @Override
    public void remove(Comment comment) {
        commentDAO.remove(comment);
    }

    @Override
    public Pager<Comment> listByPager(Pager<Comment> pager) {
        return commentDAO.listByPager(pager);
    }

    @Override
    public long count() {
        return commentDAO.count();
    }

    @Override
    public Comment getById(String s) {
        return commentDAO.getById(s);
    }

    @Override
    public List<Comment> ListAll(String s) {
        return commentDAO.ListAll(s);
    }

    @Override
    public long count(String id) {
        return commentDAO.count(id);
    }

    @Override
    public Pager<Comment> listByPager(Pager<Comment> pager, String id) {
        return commentDAO.listByPager(pager, id);
    }

    @Override
    public long countComm(String id) {
        return commentDAO.countComm(id);
    }

    @Override
    public Pager<Comment> listComm(Pager<Comment> pager, String id) {
        return commentDAO.listComm(pager, id);
    }

    @Override
    public long countUserComm(String id) {
        return commentDAO.countUserComm(id);
    }

    @Override
    public Pager<Comment> listUserComm(Pager<Comment> pager, String id) {
        return commentDAO.listUserComm(pager, id);
    }

    @Override
    public long frontCount(String id) {
        return commentDAO.frontCount(id);
    }

    @Override
    public Pager<Comment> frontComm(Pager<Comment> pager, String id) {
        return commentDAO.frontComm(pager, id);
    }
}
