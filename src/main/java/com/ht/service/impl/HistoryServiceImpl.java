package com.ht.service.impl;

import com.ht.bean.History;
import com.ht.common.bean.Pager;
import com.ht.dao.HistoryDAO;
import com.ht.service.HistoryService;

import java.util.List;

/**
 * Created by 7025 on 2017/9/11.
 */
public class HistoryServiceImpl implements HistoryService {

    private HistoryDAO historyDAO;

    public void setHistoryDAO(HistoryDAO historyDAO) {
        this.historyDAO = historyDAO;
    }

    @Override
    public void save(History history) {
        historyDAO.save(history);
    }

    @Override
    public void update(History history) {
        historyDAO.update(history);
    }

    @Override
    public void updateStatus(History history) {

    }

    @Override
    public void remove(History history) {
        historyDAO.remove(history);
    }

    @Override
    public Pager<History> listByPager(Pager<History> pager) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public History getById(String s) {
        return null;
    }

    @Override
    public List<History> ListAll(String s) {
        return null;
    }

    @Override
    public long countHistory(String id) {
        return historyDAO.countHistory(id);
    }

    @Override
    public Pager<History> listByPager(Pager<History> pager, String id) {
        return historyDAO.listByPager(pager, id);
    }

    @Override
    public History getById(String userId, String buildingsId) {
        return historyDAO.getById(userId, buildingsId);
    }

    @Override
    public void remove(List<History> histories) {
        historyDAO.remove(histories);
    }
}
