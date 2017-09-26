package ht.dao;

import com.ht.bean.Employee;
import com.ht.common.bean.Pager;

import java.util.List;

/**
 * Created by sweet on 2017/8/25.
 */
public interface EmployeeDAO extends BaseDAO<String, Employee> {


    Employee getByPhonePwd(String phone, String pwd);

    Employee getByEmailPwd(String email, String pwd);

    List<Employee> listByAgeencyId(String agency_id);

    Pager<Employee> listByAgency(Pager<Employee> pager, String agencyId);

    List<Employee> listByBuildings(String buildingsId);


}
