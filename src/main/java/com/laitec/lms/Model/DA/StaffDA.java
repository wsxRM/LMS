package com.laitec.lms.Model.DA;

import com.laitec.lms.Config.HibernateUtils;
import com.laitec.lms.Model.TO.Account;
import com.laitec.lms.Model.TO.Book;
import com.laitec.lms.Model.TO.Staff;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.Objects;

public class StaffDA {
    public int returnBook(Staff staff, int isbn) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Book book = session.load(Book.class, isbn);
        Account account = staff.getAccount();
        account.returnBook(book);
        transaction.commit();
        session.close();
        return 1;
    }

    public int borrowBook(Staff staff, int isbn) throws Exception {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Book book = session.load(Book.class, isbn);
        Account account = staff.getAccount();
        account.borrowBook(book);
        transaction.commit();
        session.close();
        return 1;
    }

    public <T> ArrayList<Staff> find(T userInput, int level) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        ArrayList<Staff> staffs = null;
        switch (level) {
            case 1:
                staffs = (ArrayList<Staff>) session.createQuery("from Staff where username = '" + userInput + "' order by id").list();
                break;
            case 2:
                staffs = (ArrayList<Staff>) session.createQuery("from Staff where firstName = '" + userInput + "' order by id").list();
                break;
            case 3:
                staffs = (ArrayList<Staff>) session.createQuery("from Staff where lastName = '" + userInput + "' order by id").list();
                break;
            case 4:
                staffs = (ArrayList<Staff>) session.createQuery("from Staff where id = " + userInput + " order by id").list();
                break;
            case 5:
                staffs = (ArrayList<Staff>) session.createQuery("from Staff where deptName = '" + userInput + "' order by id").list();
                break;
        }
        transaction.commit();
        session.close();
        return staffs;
    }

    public Staff verify(String email, String password) throws Exception {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Staff staff = (Staff) session.createQuery("from Staff where username = '" + email + "'").uniqueResult();
        if (staff == null) {
            throw new Exception("Not Found");
        } else if (!Objects.equals(password, staff.getPassword())) {
            throw new Exception("Invalid Password");
        }
        transaction.commit();
        session.close();
        return staff;
    }

    public int insert(Staff staff) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(staff);
        transaction.commit();
        session.close();
        return 1;
    }

    public ArrayList<Staff> select() {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        ArrayList<Staff> staffs = (ArrayList<Staff>) session.createQuery("from Staff order by id").list();
        transaction.commit();
        session.close();
        return staffs;
    }

    public int update(Staff staff) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.load(Staff.class, staff.getId());
        session.update(staff);
        transaction.commit();
        session.close();
        return 1;
    }

    public int delete(int id) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Staff staff = session.load(Staff.class, id);
        session.delete(staff);
        transaction.commit();
        session.close();
        return 1;
    }
}
