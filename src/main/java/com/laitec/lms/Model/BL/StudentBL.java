package com.laitec.lms.Model.BL;

import com.laitec.lms.Model.DA.StudentDA;
import com.laitec.lms.Model.TO.Book;
import com.laitec.lms.Model.TO.Student;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;

public class StudentBL {
    public List<Book> getBorrowedBooks(Student student) {
        return student.getAccount().getBorrowedBooks();
    }

    public int returnBook(Student student, int isbn) {
        int rowsAffected = 0;
        try {
            StudentDA studentDA = new StudentDA();
            rowsAffected = studentDA.returnBook(student, isbn);
        } catch (Exception e) {
            System.out.println("-----returnBookStudent-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----returnBookStudent-----");
        }
        return rowsAffected;
    }

    public int borrowBook(Student student, int isbn) {
        int rowsAffected = 0;
        try {
            StudentDA studentDA = new StudentDA();
            rowsAffected = studentDA.borrowBook(student, isbn);
        } catch (Exception e) {
            System.out.println("-----borrowBookStudent-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----borrowBookStudent-----");
        }
        return rowsAffected;
    }

    public <T> ArrayList<Student> findStudent(T userInput, int level) {
        ArrayList<Student> students = null;
        try {
            StudentDA studentDA = new StudentDA();
            students = studentDA.find(userInput, level);
        } catch (Exception e) {
            System.out.println("-----findStudent-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----findStudent-----");
        }
        return students;
    }

    public Student verifyStudent(String email, String password) throws Exception {
        Student student;
        try {
            StudentDA studentDA = new StudentDA();
            student = studentDA.verify(email, password);
        } catch (Exception e) {
            System.out.println("-----verifyStudent-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----verifyStudent-----");
            throw e;
        }
        return student;
    }

    public int insertStudent(Student student) {
        int rowsAffected = 0;
        try {
            StudentDA studentDA = new StudentDA();
            rowsAffected = studentDA.insert(student);
        } catch (Exception e) {
            System.out.println("-----insertStudent-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----insertStudent-----");
        }
        return rowsAffected;
    }

    public ArrayList<Student> selectStudents() {
        ArrayList<Student> students = null;
        try {
            StudentDA studentDA = new StudentDA();
            students = studentDA.select();
        } catch (Exception e) {
            System.out.println("-----selectStudents-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----selectStudents-----");
        }
        return students;
    }

    public int updateStudent(Student student) {
        int rowsAffected = 0;
        try {
            StudentDA bookDA = new StudentDA();
            rowsAffected = bookDA.update(student);
        } catch (Exception e) {
            System.out.println("-----updateStudent-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----updateStudent-----");
        }
        return rowsAffected;
    }

    public int deleteStudent(int id) {
        int rowsAffected = 0;
        try {
            StudentDA bookDA = new StudentDA();
            rowsAffected = bookDA.delete(id);
        } catch (Exception e) {
            System.out.println("-----deleteStudent-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----deleteStudent-----");
        }
        return rowsAffected;
    }
}
