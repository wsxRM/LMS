package com.laitec.lms.Model.BL;

import com.laitec.lms.Model.DA.LibrarianDA;
import com.laitec.lms.Model.TO.Librarian;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;

public class LibrarianBL {
    public <T> ArrayList<Librarian> findLibrarian(T userInput, int level) {
        ArrayList<Librarian> librarians = null;
        try {
            LibrarianDA librarianDA = new LibrarianDA();
            librarians = librarianDA.find(userInput, level);
        } catch (Exception e) {
            System.out.println("-----findLibrarian-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----findLibrarian-----");
        }
        return librarians;
    }

    public Librarian verifyLibrarian(String email, String password) throws Exception {
        Librarian librarian;
        try {
            LibrarianDA librarianDA = new LibrarianDA();
            librarian = librarianDA.verify(email, password);
        } catch (Exception e) {
            System.out.println("-----verifyLibrarian-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----verifyLibrarian-----");
            throw e;
        }
        return librarian;
    }

    public int insertLibrarian(Librarian librarian) {
        int rowsAffected = 0;
        try {
            LibrarianDA librarianDA = new LibrarianDA();
            rowsAffected = librarianDA.insert(librarian);
        } catch (Exception e) {
            System.out.println("-----insertLibrarian-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----insertLibrarian-----");
        }
        return rowsAffected;
    }

    public ArrayList<Librarian> selectLibrarians() {
        ArrayList<Librarian> librarians = null;
        try {
            LibrarianDA librarianDA = new LibrarianDA();
            librarians = librarianDA.select();
        } catch (Exception e) {
            System.out.println("-----selectLibrarians-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----selectLibrarians-----");
        }
        return librarians;
    }

    public int updateLibrarian(Librarian librarian) {
        int rowsAffected = 0;
        try {
            LibrarianDA librarianDA = new LibrarianDA();
            rowsAffected = librarianDA.update(librarian);
        } catch (Exception e) {
            System.out.println("-----updateLibrarian-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----updateLibrarian-----");
        }
        return rowsAffected;
    }

    public int deleteLibrarian(int id) {
        int rowsAffected = 0;
        try {
            LibrarianDA librarianDA = new LibrarianDA();
            rowsAffected = librarianDA.delete(id);
        } catch (Exception e) {
            System.out.println("-----deleteLibrarian-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----deleteLibrarian-----");
        }
        return rowsAffected;
    }
}
