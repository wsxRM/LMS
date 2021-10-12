package com.laitec.lms.Model.DA;

import com.laitec.lms.Config.HibernateUtils;
import com.laitec.lms.Model.TO.Book;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.ArrayList;

public class BookDA {
    public <T> ArrayList<Book> find(T userInput, int level) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        ArrayList<Book> books = null;
        switch (level) {
            case 1:
                books = (ArrayList<Book>) session.createQuery("from Book where title = '" + userInput + "' order by isbn").list();
                break;
            case 2:
                books = (ArrayList<Book>) session.createQuery("from Book where author = '" + userInput + "' order by isbn").list();
                break;
            case 3:
                books = (ArrayList<Book>) session.createQuery("from Book where isbn = " + userInput + " order by isbn").list();
                break;
            case 4:
                books = (ArrayList<Book>) session.createQuery("from Book where publication = " + userInput + " order by isbn").list();
                break;
        }
        transaction.commit();
        session.close();
        return books;
    }

    public int insert(Book book) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(book);
        transaction.commit();
        session.close();
        return 1;
    }

    public ArrayList<Book> select() {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        ArrayList<Book> books = (ArrayList<Book>) session.createQuery("from Book order by isbn").list();
        transaction.commit();
        session.close();
        return books;
    }

    public int update(Book book) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.load(Book.class, book.getIsbn());
        session.update(book);
        transaction.commit();
        session.close();
        return 1;
    }

    public int delete(int isbn) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Book book = session.load(Book.class, isbn);
        session.delete(book);
        transaction.commit();
        session.close();
        return 1;
    }
}
