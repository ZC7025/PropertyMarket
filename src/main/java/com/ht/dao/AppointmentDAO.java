package com.ht.dao;

import com.ht.bean.Appointment;
import com.ht.common.bean.Pager;

public interface AppointmentDAO extends BaseDAO<String,Appointment> {

    Pager listByEmployeeId(Pager<Appointment> pager, String employeeId);

    Pager listByAgencyId(Pager<Appointment> pager, String agencyId);

    Appointment getByUserAndBuildings(String userId, String buildingsId);

    Appointment getByUserAndEmployee(String userId, String employeeId);

    /**
     * 通过用户和员工删除预约
     * @param userId
     * @param employeeId
     */
    void removeByUserEmployee(String userId, String employeeId);

    /**
     * 查询用户的所有预约
     * @param pager
     * @param userId
     * @return
     */
    Pager<Appointment> listByUser(Pager<Appointment> pager, String userId);

}
