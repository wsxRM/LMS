package com.laitec.lms;

import com.laitec.lms.Model.BL.BookBL;
import com.laitec.lms.Model.BL.LibrarianBL;
import com.laitec.lms.Model.BL.StaffBL;
import com.laitec.lms.Model.BL.StudentBL;
import com.laitec.lms.Model.TO.Book;
import com.laitec.lms.Model.TO.Librarian;
import com.laitec.lms.Model.TO.Staff;
import com.laitec.lms.Model.TO.Student;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "librarian", value = "/librarian")
public class LibrarianServlet extends HttpServlet {
    Book book;
    Librarian librarian;
    private String title, author, username, password, firstName, lastName;
    private int isbn, publication, id;

    private Librarian getLibrarian() {
        librarian = new Librarian();
        librarian.setUserType("librarian");
        librarian.setUsername(username);
        librarian.setPassword(password);
        librarian.setFirstName(firstName);
        librarian.setLastName(lastName);
        librarian.setId(id);
        return librarian;
    }

    private Book getBook() {
        book = new Book();
        book.setTitle(title);
        book.setAuthor(author);
        book.setIsbn(isbn);
        book.setPublication(publication);
        return book;
    }

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (request.getParameter("button") != null) {
            title = request.getParameter("title");
            author = request.getParameter("author");
            if (request.getParameter("isbn") != null)
                isbn = Integer.parseInt(request.getParameter("isbn"));
            if (request.getParameter("publication") != null)
                publication = Integer.parseInt(request.getParameter("publication"));

            username = request.getParameter("username");
            password = request.getParameter("password");
            firstName = request.getParameter("firstName");
            lastName = request.getParameter("lastName");
            if (request.getParameter("id") != null)
                id = Integer.parseInt(request.getParameter("id"));

            book = getBook();
            BookBL bookBL = new BookBL();
            ArrayList<Book> books;

            librarian = getLibrarian();
            LibrarianBL librarianBL = new LibrarianBL();
            ArrayList<Librarian> librarians;

            StaffBL staffBL = new StaffBL();
            ArrayList<Staff> staffs;

            StudentBL studentBL = new StudentBL();
            ArrayList<Student> students;

            String button = request.getParameter("button");
            String attribute = request.getParameter("attribute");
            String userType = request.getParameter("userType");
            request.getSession().setAttribute("userType", userType);
            switch (button) {
                case "addBook":
                    int rowsAffected = bookBL.insertBook(book);
                    if (rowsAffected == 1) {
                        request.getSession().setAttribute("addError", "Book added.");
                    } else {
                        request.getSession().setAttribute("addError", "Book not added.");
                    }
                    response.sendRedirect("librarian.jsp");
                    break;
                case "listBooks":
                    books = bookBL.selectBooks();
                    if (books.isEmpty()) {
                        request.getSession().setAttribute("booksListError", "No books found.");
                    } else {
                        request.getSession().setAttribute("books", books);
                    }
                    response.sendRedirect("librarian.jsp");
                    break;
                case "updateBook":
                    rowsAffected = bookBL.updateBook(book);
                    if (rowsAffected == 1) {
                        request.getSession().setAttribute("updateError", "Book updated.");
                    } else {
                        request.getSession().setAttribute("updateError", "Book not found.");
                    }
                    response.sendRedirect("librarian.jsp");
                    break;
                case "deleteBook":
                    rowsAffected = bookBL.deleteBook(isbn);
                    if (rowsAffected == 1) {
                        request.getSession().setAttribute("deleteError", "Book deleted.");
                    } else {
                        request.getSession().setAttribute("deleteError", "Book not found.");
                    }
                    response.sendRedirect("librarian.jsp");
                    break;
                case "searchBook":
                    switch (attribute) {
                        case "title":
                            books = bookBL.findBook(title, 1);
                            if (books.isEmpty()) {
                                request.getSession().setAttribute("searchBookError", "Book not found.");
                            } else {
                                request.getSession().setAttribute("books1", books);
                            }
                            response.sendRedirect("librarian.jsp");
                            break;
                        case "author":
                            books = bookBL.findBook(author, 2);
                            if (books.isEmpty()) {
                                request.getSession().setAttribute("searchBookError", "Book not found.");
                            } else {
                                request.getSession().setAttribute("books1", books);
                            }
                            response.sendRedirect("librarian.jsp");
                            break;
                        case "isbn":
                            books = bookBL.findBook(isbn, 3);
                            if (books.isEmpty()) {
                                request.getSession().setAttribute("searchBookError", "Book not found.");
                            } else {
                                request.getSession().setAttribute("books1", books);
                            }
                            response.sendRedirect("librarian.jsp");
                            break;
                        case "publication":
                            books = bookBL.findBook(publication, 4);
                            if (books.isEmpty()) {
                                request.getSession().setAttribute("searchBookError", "Book not found.");
                            } else {
                                request.getSession().setAttribute("books1", books);
                            }
                            response.sendRedirect("librarian.jsp");
                            break;
                    }
                    break;
                case "listUsers":
                    switch (userType) {
                        case "librarian":
                            librarians = librarianBL.selectLibrarians();
                            if (librarians.isEmpty()) {
                                request.getSession().setAttribute("usersListError", "No users found.");
                            } else {
                                request.getSession().setAttribute("users", librarians);
                            }
                            response.sendRedirect("librarian.jsp");
                            break;
                        case "staff":
                            staffs = staffBL.selectStaffs();
                            if (staffs.isEmpty()) {
                                request.getSession().setAttribute("usersListError", "No users found.");
                            } else {
                                request.getSession().setAttribute("users", staffs);
                            }
                            response.sendRedirect("librarian.jsp");
                            break;
                        case "student":
                            students = studentBL.selectStudents();
                            if (students.isEmpty()) {
                                request.getSession().setAttribute("usersListError", "No users found.");
                            } else {
                                request.getSession().setAttribute("users", students);
                            }
                            response.sendRedirect("librarian.jsp");
                            break;
                    }
                    break;
                case "searchUser":
                    switch (userType) {
                        case "librarian":
                            switch (attribute) {
                                case "username":
                                    librarians = librarianBL.findLibrarian(username, 1);
                                    if (librarians.isEmpty()) {
                                        request.getSession().setAttribute("searchUserError", "User not found.");
                                    } else {
                                        request.getSession().setAttribute("users1", librarians);
                                    }
                                    response.sendRedirect("librarian.jsp");
                                    break;
                                case "firstName":
                                    librarians = librarianBL.findLibrarian(firstName, 2);
                                    if (librarians.isEmpty()) {
                                        request.getSession().setAttribute("searchUserError", "User not found.");
                                    } else {
                                        request.getSession().setAttribute("users1", librarians);
                                    }
                                    response.sendRedirect("librarian.jsp");
                                    break;
                                case "lastName":
                                    librarians = librarianBL.findLibrarian(lastName, 3);
                                    if (librarians.isEmpty()) {
                                        request.getSession().setAttribute("searchUserError", "User not found.");
                                    } else {
                                        request.getSession().setAttribute("users1", librarians);
                                    }
                                    response.sendRedirect("librarian.jsp");
                                    break;
                                case "id":
                                    librarians = librarianBL.findLibrarian(id, 4);
                                    if (librarians.isEmpty()) {
                                        request.getSession().setAttribute("searchUserError", "User not found.");
                                    } else {
                                        request.getSession().setAttribute("users1", librarians);
                                    }
                                    response.sendRedirect("librarian.jsp");
                                    break;
                            }
                            break;
                        case "staff":
                            switch (attribute) {
                                case "username":
                                    staffs = staffBL.findStaff(username, 1);
                                    if (staffs.isEmpty()) {
                                        request.getSession().setAttribute("searchUserError", "User not found.");
                                    } else {
                                        request.getSession().setAttribute("users1", staffs);
                                    }
                                    response.sendRedirect("librarian.jsp");
                                    break;
                                case "firstName":
                                    staffs = staffBL.findStaff(firstName, 2);
                                    if (staffs.isEmpty()) {
                                        request.getSession().setAttribute("searchUserError", "User not found.");
                                    } else {
                                        request.getSession().setAttribute("users1", staffs);
                                    }
                                    response.sendRedirect("librarian.jsp");
                                    break;
                                case "lastName":
                                    staffs = staffBL.findStaff(lastName, 3);
                                    if (staffs.isEmpty()) {
                                        request.getSession().setAttribute("searchUserError", "User not found.");
                                    } else {
                                        request.getSession().setAttribute("users1", staffs);
                                    }
                                    response.sendRedirect("librarian.jsp");
                                    break;
                                case "id":
                                    staffs = staffBL.findStaff(id, 4);
                                    if (staffs.isEmpty()) {
                                        request.getSession().setAttribute("searchUserError", "No users found.");
                                    } else {
                                        request.getSession().setAttribute("users1", staffs);
                                    }
                                    response.sendRedirect("librarian.jsp");
                                    break;
                                case "deptName":
                                    String deptName = request.getParameter("deptName");
                                    staffs = staffBL.findStaff(deptName, 5);
                                    if (staffs.isEmpty()) {
                                        request.getSession().setAttribute("searchUserError", "User not found.");
                                    } else {
                                        request.getSession().setAttribute("users1", staffs);
                                    }
                                    response.sendRedirect("librarian.jsp");
                                    break;
                            }
                            break;
                        case "student":
                            switch (attribute) {
                                case "username":
                                    students = studentBL.findStudent(username, 1);
                                    if (students.isEmpty()) {
                                        request.getSession().setAttribute("searchUserError", "User not found.");
                                    } else {
                                        request.getSession().setAttribute("users1", students);
                                    }
                                    response.sendRedirect("librarian.jsp");
                                    break;
                                case "firstName":
                                    students = studentBL.findStudent(firstName, 2);
                                    if (students.isEmpty()) {
                                        request.getSession().setAttribute("searchUserError", "User not found.");
                                    } else {
                                        request.getSession().setAttribute("users1", students);
                                    }
                                    response.sendRedirect("librarian.jsp");
                                    break;
                                case "lastName":
                                    students = studentBL.findStudent(lastName, 3);
                                    if (students.isEmpty()) {
                                        request.getSession().setAttribute("searchUserError", "User not found.");
                                    } else {
                                        request.getSession().setAttribute("users1", students);
                                    }
                                    response.sendRedirect("librarian.jsp");
                                    break;
                                case "id":
                                    students = studentBL.findStudent(id, 4);
                                    if (students.isEmpty()) {
                                        request.getSession().setAttribute("searchUserError", "User not found.");
                                    } else {
                                        request.getSession().setAttribute("users1", students);
                                    }
                                    response.sendRedirect("librarian.jsp");
                                    break;
                                case "className":
                                    String className = request.getParameter("className");
                                    students = studentBL.findStudent(className, 5);
                                    if (students.isEmpty()) {
                                        request.getSession().setAttribute("searchUserError", "User not found.");
                                    } else {
                                        request.getSession().setAttribute("users1", students);
                                    }
                                    response.sendRedirect("librarian.jsp");
                                    break;
                            }
                            break;
                    }
                    break;
                case "updateLibrarian":
                    rowsAffected = librarianBL.updateLibrarian(librarian);
                    if (rowsAffected == 1) {
                        request.getSession().setAttribute("updateError1", "Librarian updated.");
                    } else {
                        request.getSession().setAttribute("updateError1", "Librarian not found.");
                    }
                    response.sendRedirect("librarian.jsp");
                    break;
                case "deleteUser":
                    switch (userType) {
                        case "librarian":
                            rowsAffected = librarianBL.deleteLibrarian(id);
                            if (rowsAffected == 1) {
                                request.getSession().setAttribute("deleteError1", "User deleted.");
                            } else {
                                request.getSession().setAttribute("deleteError1", "User not found.");
                            }
                            response.sendRedirect("librarian.jsp");
                            break;
                        case "staff":
                            rowsAffected = staffBL.deleteStaff(id);
                            if (rowsAffected == 1) {
                                request.getSession().setAttribute("deleteError1", "User deleted.");
                            } else {
                                request.getSession().setAttribute("deleteError1", "User not found.");
                            }
                            response.sendRedirect("librarian.jsp");
                            break;
                        case "student":
                            rowsAffected = studentBL.deleteStudent(id);
                            if (rowsAffected == 1) {
                                request.getSession().setAttribute("deleteError1", "User deleted.");
                            } else {
                                request.getSession().setAttribute("deleteError1", "User not found.");
                            }
                            response.sendRedirect("librarian.jsp");
                            break;
                    }
                    break;
            }
        } else {
            response.sendRedirect("librarian.jsp");
        }
    }

    public void destroy() {
    }
}
