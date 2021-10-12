package com.laitec.lms.Model.TO;

import javax.persistence.*;

@Entity
@Table(name = "book")
public class Book {
    @Basic
    @Column(name = "book_title", nullable = false, length = 25, unique = true)
    private String title;
    @Basic
    @Column(name = "book_author", nullable = false, length = 25)
    private String author;
    @Id
    @Column(name = "book_isbn")
    private int isbn;
    @Basic
    @Column(name = "book_publication", nullable = false)
    private int publication;
    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private Account account = null;

    public Book() {
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getIsbn() {
        return isbn;
    }

    public void setIsbn(int isbn) {
        this.isbn = isbn;
    }

    public int getPublication() {
        return publication;
    }

    public void setPublication(int publication) {
        this.publication = publication;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    @Override
    public String toString() {
        return "Book{" +
                "title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", isbn=" + isbn +
                ", publication=" + publication +
                ", account=" + account +
                '}';
    }
}
