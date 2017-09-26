package com.ht.dao.impl;

import com.ht.bean.Room;
import com.ht.common.bean.Pager;
import com.ht.dao.AbstractBaseDAO;
import com.ht.dao.RoomDAO;
import com.ht.vo.RoomAndHouse;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 7025 on 2017/9/4.
 */
public class RoomDAOImpl extends AbstractBaseDAO implements RoomDAO {
    @Override
    public void save(Room room) {
        getSessionFactory().getCurrentSession().save(room);
    }

    @Override
    public void save(List<Room> rooms) {
        Session session = getSessionFactory().getCurrentSession();
        for (int i = 0; i < rooms.size(); i++) {
            session.save(rooms.get(i));
            if(i % 20 == 0) {
                session.flush();
                session.clear();
            }
        }
    }

    @Override
    public void update(Room room) {
        getSessionFactory().getCurrentSession().update(room);
    }

    @Override
    public void updateStatus(Room room) {
        getSessionFactory().getCurrentSession().update(room);
    }

    @Override
    public void remove(Room room) {

    }

    @Override
    public Pager<Room> listByPager(Pager<Room> pager) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public Room getById(String s) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Room where id=:id");
        query.setParameter("id",s);
        return (Room) query.uniqueResult();
    }

    @Override
    public List<Room> ListAll(String s) {
        return null;
    }

    @Override
    public List<RoomAndHouse> listAll(String id) {
        Session session = getSessionFactory().getCurrentSession();
//        Query query = session.createQuery("from Room where building.id=:id order by name");
        Query query = session.createQuery("select r.id, r.name, r.saleStatus, h.name, h.area, h.unitPrice from Room r left outer join House h on r.house.id = h.id where r.building.id = ? order by r.name");
        query.setParameter(0, id);
        List<Object[]> objects = query.list();
        List<RoomAndHouse> roomAndHouses = new ArrayList<>();
        for(Object[] objects1 : objects) {
            RoomAndHouse roomAndHouse = new RoomAndHouse();
            roomAndHouse.setId((String)objects1[0]);
            roomAndHouse.setName((String)objects1[1]);
            roomAndHouse.setSaleStatus((Integer) objects1[2]);
            roomAndHouse.setHouseName((String) objects1[3]);
            roomAndHouse.setArea((Double) objects1[4]);
            roomAndHouse.setUnitPrice((Double) objects1[5]);
            roomAndHouses.add(roomAndHouse);
        }
        return roomAndHouses;
    }

    @Override
    public List<Room> listByBuild(String buildId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Room where building.id =:buildId and saleStatus = 1");
        query.setParameter("buildId",buildId);
        List<Room> rooms = query.list();
        return rooms;
    }

    @Override
    public List<Room> listByBuildFloor(String buildId, int floor) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Room where building.id =:buildId and saleStatus = 1 and floor=:floor");
        query.setParameter("buildId",buildId);
        query.setParameter("floor",floor);
        List<Room> rooms = query.list();
        return rooms;
    }

    @Override
    public Room getBySale(String saleId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from Room where sale.id =:id");
        query.setParameter("id",saleId);
        return (Room)query.uniqueResult();
    }

    @Override
    public void removeById(String id) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("delete from Room where building.id =:id");
        query.setParameter("id",id);
        query.executeUpdate();
    }

    @Override
    public long countRoom(String buildId) {
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery("select count(id) from Room where building.id=:id");
        query.setParameter("id", buildId);
        return (long)query.uniqueResult();
    }
}
