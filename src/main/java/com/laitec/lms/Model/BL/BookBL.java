package com.laitec.lms.Model.BL;

import com.laitec.lms.Model.DA.BookDA;
import com.laitec.lms.Model.TO.Book;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;

public class BookBL {
    public <T> ArrayList<Book> findBook(T userInput, int level) {
        ArrayList<Book> books = null;
        try {
            BookDA bookDA = new BookDA();
            books = bookDA.find(userInput, level);
        } catch (Exception e) {
            System.out.println("-----findBook-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----findBook-----");
        }
        return books;
    }

    public int insertBook(Book book) {
        int rowsAffected = 0;
        try {
            BookDA bookDA = new BookDA();
            rowsAffected = bookDA.insert(book);
        } catch (Exception e) {
            System.out.println("-----insertBook-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----insertBook-----");
        }
        return rowsAffected;
    }

    public ArrayList<Book> selectBooks() {
        ArrayList<Book> books = null;
        try {
            BookDA bookDA = new BookDA();
            books = bookDA.select();
        } catch (Exception e) {
            System.out.println("-----selectBooks-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----selectBooks-----");
        }
        return books;
    }

    public int updateBook(Book book) {
        int rowsAffected = 0;
        try {
            BookDA bookDA = new BookDA();
            rowsAffected = bookDA.update(book);
        } catch (Exception e) {
            System.out.println("-----updateBook-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----updateBook-----");
        }
        return rowsAffected;
    }

    public int deleteBook(int isbn) {
        int rowsAffected = 0;
        try {
            BookDA bookDA = new BookDA();
            rowsAffected = bookDA.delete(isbn);
        } catch (Exception e) {
            System.out.println("-----deleteBook-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----deleteBook-----");
        }
        return rowsAffected;
    }
}
