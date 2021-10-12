package com.laitec.lms.Config;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {
    private static final SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();

    private HibernateUtils() {
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
