package com.laitec.lms.Model.TO;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "account")
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "account_id", nullable = false)
    private int id;
    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private Staff staff = null;
    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private Student student = null;
    @OneToMany(mappedBy = "account", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<Book> borrowedBooks = null;

    public Account() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public List<Book> getBorrowedBooks() {
        return borrowedBooks;
    }

    public void returnBook(Book book) {
        if (borrowedBooks == null) {
            borrowedBooks = new ArrayList<>();
        }
        book.setAccount(null);
        for (Book borrowedBook : borrowedBooks) {
            if (book.getIsbn() == borrowedBook.getIsbn()) {
                borrowedBooks.remove(borrowedBook);
                break;
            }
        }
    }

    public void borrowBook(Book book) throws Exception {
        if (borrowedBooks == null) {
            borrowedBooks = new ArrayList<>();
        }
        if (book.getAccount() == null) {
            book.setAccount(this);
            borrowedBooks.add(book);
        } else {
            throw new Exception("Book is borrowed.");
        }
    }

    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", borrowedBooks=" + borrowedBooks +
                '}';
    }
}
