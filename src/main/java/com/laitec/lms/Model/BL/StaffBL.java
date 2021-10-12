package com.laitec.lms.Model.BL;

import com.laitec.lms.Model.DA.StaffDA;
import com.laitec.lms.Model.TO.Book;
import com.laitec.lms.Model.TO.Staff;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;

public class StaffBL {
    public List<Book> getBorrowedBooks(Staff staff) {
        return staff.getAccount().getBorrowedBooks();
    }

    public int returnBook(Staff staff, int isbn) {
        int rowsAffected = 0;
        try {
            StaffDA staffDA = new StaffDA();
            rowsAffected = staffDA.returnBook(staff, isbn);
        } catch (Exception e) {
            System.out.println("-----returnBookStaff-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----returnBookStaff-----");
        }
        return rowsAffected;
    }

    public int borrowBook(Staff staff, int isbn) {
        int rowsAffected = 0;
        try {
            StaffDA staffDA = new StaffDA();
            rowsAffected = staffDA.borrowBook(staff, isbn);
        } catch (Exception e) {
            System.out.println("-----borrowBookStaff-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----borrowBookStaff-----");
        }
        return rowsAffected;
    }

    public <T> ArrayList<Staff> findStaff(T userInput, int level) {
        ArrayList<Staff> staffs = null;
        try {
            StaffDA staffDA = new StaffDA();
            staffs = staffDA.find(userInput, level);
        } catch (Exception e) {
            System.out.println("-----findStaff-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----findStaff-----");
        }
        return staffs;
    }

    public Staff verifyStaff(String email, String password) throws Exception {
        Staff staff;
        try {
            StaffDA staffDA = new StaffDA();
            staff = staffDA.verify(email, password);
        } catch (Exception e) {
            System.out.println("-----verifyStaff-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----verifyStaff-----");
            throw e;
        }
        return staff;
    }

    public int insertStaff(Staff staff) {
        int rowsAffected = 0;
        try {
            StaffDA staffDA = new StaffDA();
            rowsAffected = staffDA.insert(staff);
        } catch (Exception e) {
            System.out.println("-----insertStaff-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----insertStaff-----");
        }
        return rowsAffected;
    }

    public ArrayList<Staff> selectStaffs() {
        ArrayList<Staff> staffs = null;
        try {
            StaffDA staffDA = new StaffDA();
            staffs = staffDA.select();
        } catch (Exception e) {
            System.out.println("-----selectStaffs-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----selectStaffs-----");
        }
        return staffs;
    }

    public int updateStaff(Staff staff) {
        int rowsAffected = 0;
        try {
            StaffDA bookDA = new StaffDA();
            rowsAffected = bookDA.update(staff);
        } catch (Exception e) {
            System.out.println("-----updateStaff-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----updateStaff-----");
        }
        return rowsAffected;
    }

    public int deleteStaff(int id) {
        int rowsAffected = 0;
        try {
            StaffDA bookDA = new StaffDA();
            rowsAffected = bookDA.delete(id);
        } catch (Exception e) {
            System.out.println("-----deleteStaff-----");
            StringWriter errors = new StringWriter();
            e.printStackTrace(new PrintWriter(errors));
            System.out.println(errors);
            System.out.println("-----deleteStaff-----");
        }
        return rowsAffected;
    }
}
