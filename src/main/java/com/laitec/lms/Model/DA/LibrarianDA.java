package com.laitec.lms.Model.DA;

import com.laitec.lms.Config.HibernateUtils;
import com.laitec.lms.Model.TO.Librarian;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.Objects;

public class LibrarianDA {
    public <T> ArrayList<Librarian> find(T userInput, int level) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        ArrayList<Librarian> librarians = null;
        switch (level) {
            case 1:
                librarians = (ArrayList<Librarian>) session.createQuery("from Librarian where username = '" + userInput + "' order by id").list();
                break;
            case 2:
                librarians = (ArrayList<Librarian>) session.createQuery("from Librarian where firstName = '" + userInput + "' order by id").list();
                break;
            case 3:
                librarians = (ArrayList<Librarian>) session.createQuery("from Librarian where lastName = '" + userInput + "' order by id").list();
                break;
            case 4:
                librarians = (ArrayList<Librarian>) session.createQuery("from Librarian where id = " + userInput + " order by id").list();
                break;
        }
        transaction.commit();
        session.close();
        return librarians;
    }

    public Librarian verify(String email, String password) throws Exception {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Librarian librarian = (Librarian) session.createQuery("from Librarian where username = '" + email + "'").uniqueResult();
        if (librarian == null) {
            throw new Exception("Not Found.");
        } else if (!Objects.equals(password, librarian.getPassword())) {
            throw new Exception("Invalid Password.");
        }
        transaction.commit();
        session.close();
        return librarian;
    }

    public int insert(Librarian librarian) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(librarian);
        transaction.commit();
        session.close();
        return 1;
    }

    public ArrayList<Librarian> select() {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        ArrayList<Librarian> librarians = (ArrayList<Librarian>) session.createQuery("from Librarian order by id").list();
        transaction.commit();
        session.close();
        return librarians;
    }

    public int update(Librarian librarian) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.load(Librarian.class, librarian.getId());
        session.update(librarian);
        transaction.commit();
        session.close();
        return 1;
    }

    public int delete(int id) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Librarian librarian = session.load(Librarian.class, id);
        session.delete(librarian);
        transaction.commit();
        session.close();
        return 1;
    }
}
