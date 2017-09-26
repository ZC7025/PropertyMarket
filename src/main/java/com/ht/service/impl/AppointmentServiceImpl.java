package com.ht.service.impl;

import com.ht.bean.Appointment;
import com.ht.common.bean.Pager;
import com.ht.dao.AppointmentDAO;
import com.ht.service.AppointmentService;

import java.util.List;

public class AppointmentServiceImpl implements AppointmentService{

    private AppointmentDAO appointmentDAO;

    public void setAppointmentDAO(AppointmentDAO appointmentDAO) {
        this.appointmentDAO = appointmentDAO;
    }

    @Override
    public void save(Appointment appointment) {
        appointmentDAO.save(appointment);
    }

    @Override
    public void update(Appointment appointment) {
        appointmentDAO.update(appointment);
    }

    @Override
    public void updateStatus(Appointment appointment) {
        appointmentDAO.updateStatus(appointment);
    }

    @Override
    public void remove(Appointment appointment) {
        appointmentDAO.remove(appointment);
    }

    @Override
    public Pager<Appointment> listByPager(Pager<Appointment> pager) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public Appointment getById(String s) {
        return appointmentDAO.getById(s);
    }

    @Override
    public List<Appointment> ListAll(String s) {
        return null;
    }

    @Override
    public Pager listByEmployeeId(Pager<Appointment> pager, String employeeId) {
        return appointmentDAO.listByEmployeeId(pager,employeeId);
    }

    @Override
    public Pager listByAgencyId(Pager<Appointment> pager, String agencyId) {
        return appointmentDAO.listByAgencyId(pager,agencyId);
    }

    @Override
    public Appointment getByUserAndBuildings(String userId, String buildingsId) {
        return appointmentDAO.getByUserAndBuildings(userId,buildingsId);
    }

    @Override
    public Appointment getByUserAndEmployee(String userId, String employeeId) {
        return appointmentDAO.getByUserAndEmployee(userId,employeeId);
    }

    @Override
    public void removeByUserEmployee(String userId, String employeeId) {
        appointmentDAO.removeByUserEmployee(userId,employeeId);
    }

    @Override
    public Pager<Appointment> listByUser(Pager<Appointment> pager, String userId) {
        return appointmentDAO.listByUser(pager,userId);
    }
}
