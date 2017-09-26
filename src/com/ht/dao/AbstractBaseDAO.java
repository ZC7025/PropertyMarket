package ht.dao;

import org.hibernate.SessionFactory;

public class AbstractBaseDAO {

    protected static SessionFactory sessionFactory;

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static void setSessionFactory(SessionFactory sessionFactory) {
        AbstractBaseDAO.sessionFactory = sessionFactory;
    }
}
