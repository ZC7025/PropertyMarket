package com.ht.service.impl;

import com.ht.bean.Message;
import com.ht.common.bean.Pager;
import com.ht.dao.MessageDAO;
import com.ht.service.MessageService;

import java.util.List;

/**
 * Created by 7025 on 2017/9/5.
 */
public class MessageServiceImpl implements MessageService {

    private MessageDAO messageDAO;

    public void setMessageDAO(MessageDAO messageDAO) {
        this.messageDAO = messageDAO;
    }

    @Override
    public void save(Message message) {
        messageDAO.save(message);
    }

    @Override
    public void update(Message message) {
        messageDAO.update(message);
    }

    @Override
    public void updateStatus(Message message) {
        messageDAO.updateStatus(message);
    }

    @Override
    public void remove(Message message) {
        messageDAO.remove(message);
    }

    @Override
    public Pager<Message> listByPager(Pager<Message> pager) {
        return messageDAO.listByPager(pager);
    }

    @Override
    public long count() {
        return messageDAO.count();
    }

    @Override
    public Message getById(String s) {
        return messageDAO.getById(s);
    }

    @Override
    public List<Message> ListAll(String s) {
        return messageDAO.ListAll(s);
    }

    @Override
    public long count(String id) {
        return messageDAO.count(id);
    }

    @Override
    public Pager<Message> listByPager(Pager<Message> pager, String id) {
        return messageDAO.listByPager(pager,id);
    }

    @Override
    public long countMsg(String id) {
        return messageDAO.countMsg(id);
    }

    @Override
    public Pager<Message> listMsg(Pager<Message> pager, String id) {
        return messageDAO.listMsg(pager, id);
    }

    @Override
    public long countUserMsg(String id) {
        return messageDAO.countUserMsg(id);
    }

    @Override
    public Pager<Message> listUserMsg(Pager<Message> pager, String id) {
        return messageDAO.listUserMsg(pager, id);
    }

    @Override
    public long frontCount(String id) {
        return messageDAO.frontCount(id);
    }

    @Override
    public Pager<Message> frontMsg(Pager<Message> pager, String id) {
        return messageDAO.frontMsg(pager, id);
    }
}
