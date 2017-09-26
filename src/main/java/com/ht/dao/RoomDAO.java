package com.ht.dao;

import com.ht.bean.Room;
import com.ht.vo.RoomAndHouse;

import java.util.List;

/**
 * Created by 7025 on 2017/9/4.
 */
public interface RoomDAO extends BaseDAO<String, Room> {

    void save(List<Room> rooms);

    List<RoomAndHouse> listAll(String id);

    List<Room> listByBuild(String buildId);

    /**
     * 通过楼栋和楼层查询房间
     * @param buildId
     * @param floor
     * @return
     */
    List<Room> listByBuildFloor(String buildId, int floor);

    Room getBySale(String saleId);

    void removeById(String id);

    /**
     * 判断该楼栋是否生成了房号
     * @param buildId
     * @return
     */
    long countRoom(String buildId);
}
