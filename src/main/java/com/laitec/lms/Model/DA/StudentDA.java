package com.laitec.lms.Model.DA;

import com.laitec.lms.Config.HibernateUtils;
import com.laitec.lms.Model.TO.Account;
import com.laitec.lms.Model.TO.Book;
import com.laitec.lms.Model.TO.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.Objects;

public class StudentDA {
    public int returnBook(Student student, int isbn) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Book book = session.load(Book.class, isbn);
        Account account = student.getAccount();
        account.returnBook(book);
        transaction.commit();
        session.close();
        return 1;
    }

    public int borrowBook(Student student, int isbn) throws Exception {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Book book = session.load(Book.class, isbn);
        Account account = student.getAccount();
        account.borrowBook(book);
        transaction.commit();
        session.close();
        return 1;
    }

    public <T> ArrayList<Student> find(T userInput, int level) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        ArrayList<Student> students = null;
        switch (level) {
            case 1:
                students = (ArrayList<Student>) session.createQuery("from Student where username = '" + userInput + "' order by id").list();
                break;
            case 2:
                students = (ArrayList<Student>) session.createQuery("from Student where firstName = '" + userInput + "' order by id").list();
                break;
            case 3:
                students = (ArrayList<Student>) session.createQuery("from Student where lastName = '" + userInput + "' order by id").list();
                break;
            case 4:
                students = (ArrayList<Student>) session.createQuery("from Student where id = " + userInput + " order by id").list();
                break;
            case 5:
                students = (ArrayList<Student>) session.createQuery("from Student where className = '" + userInput + "' order by id").list();
                break;
        }
        transaction.commit();
        session.close();
        return students;
    }

    public Student verify(String email, String password) throws Exception {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Student student = (Student) session.createQuery("from Student where username = '" + email + "'").uniqueResult();
        if (student == null) {
            throw new Exception("Not Found");
        } else if (!Objects.equals(password, student.getPassword())) {
            throw new Exception("Invalid Password");
        }
        transaction.commit();
        session.close();
        return student;
    }

    public int insert(Student student) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(student);
        transaction.commit();
        session.close();
        return 1;
    }

    public ArrayList<Student> select() {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        ArrayList<Student> students = (ArrayList<Student>) session.createQuery("from Student order by id").list();
        transaction.commit();
        session.close();
        return students;
    }

    public int update(Student student) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.load(Student.class, student.getId());
        session.update(student);
        transaction.commit();
        session.close();
        return 1;
    }

    public int delete(int id) {
        SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Student student = session.load(Student.class, id);
        session.delete(student);
        transaction.commit();
        session.close();
        return 1;
    }
}
