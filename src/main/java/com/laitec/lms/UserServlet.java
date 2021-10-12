package com.laitec.lms;

import com.laitec.lms.Model.BL.BookBL;
import com.laitec.lms.Model.BL.StaffBL;
import com.laitec.lms.Model.BL.StudentBL;
import com.laitec.lms.Model.TO.Book;
import com.laitec.lms.Model.TO.Staff;
import com.laitec.lms.Model.TO.Student;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "user", value = "/user")
public class UserServlet extends HttpServlet {
    Staff staff;
    Student student;
    private String username, password, firstName, lastName, deptName, className;
    private int isbn, publication;

    private Staff getStaff() {
        staff.setUsername(username);
        staff.setPassword(password);
        staff.setFirstName(firstName);
        staff.setLastName(lastName);
        staff.setDeptName(deptName);
        return staff;
    }

    private Student getStudent() {
        student.setUsername(username);
        student.setPassword(password);
        student.setFirstName(firstName);
        student.setLastName(lastName);
        student.setClassName(className);
        return student;
    }

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (request.getParameter("button") != null) {
            String userType = "";
            int rowsAffected;
            ArrayList<Book> books;
            List<Book> borrowedBooks;

            staff = (Staff) request.getSession().getAttribute("staff");
            student = (Student) request.getSession().getAttribute("student");
            if (staff != null) {
                userType = staff.getUserType();
            } else if (student != null) {
                userType = student.getUserType();
            }
            request.getSession().setAttribute("userType", userType);

            String title = request.getParameter("title");
            String author = request.getParameter("author");
            if (request.getParameter("isbn") != null)
                isbn = Integer.parseInt(request.getParameter("isbn"));
            if (request.getParameter("publication") != null)
                publication = Integer.parseInt(request.getParameter("publication"));

            username = request.getParameter("username");
            password = request.getParameter("password");
            firstName = request.getParameter("firstName");
            lastName = request.getParameter("lastName");
            deptName = request.getParameter("deptName");
            className = request.getParameter("className");

            BookBL bookBL = new BookBL();
            StaffBL staffBL = new StaffBL();
            StudentBL studentBL = new StudentBL();

            String button = request.getParameter("button");
            String attribute = request.getParameter("attribute");
            switch (button) {
                case "listBooks":
                    books = bookBL.selectBooks();
                    if (books.isEmpty()) {
                        request.getSession().setAttribute("booksListError", "No books found.");
                    } else {
                        request.getSession().setAttribute("listBooks", books);
                    }
                    response.sendRedirect("user.jsp");
                    break;
                case "searchBook":
                    switch (attribute) {
                        case "title":
                            books = bookBL.findBook(title, 1);
                            if (books.isEmpty()) {
                                request.getSession().setAttribute("searchBookError", "Book not found.");
                            } else {
                                request.getSession().setAttribute("searchBook", books);
                            }
                            response.sendRedirect("user.jsp");
                            break;
                        case "author":
                            books = bookBL.findBook(author, 2);
                            if (books.isEmpty()) {
                                request.getSession().setAttribute("searchBookError", "Book not found.");
                            } else {
                                request.getSession().setAttribute("searchBook", books);
                            }
                            response.sendRedirect("user.jsp");
                            break;
                        case "isbn":
                            books = bookBL.findBook(isbn, 3);
                            if (books.isEmpty()) {
                                request.getSession().setAttribute("searchBookError", "Book not found.");
                            } else {
                                request.getSession().setAttribute("searchBook", books);
                            }
                            response.sendRedirect("user.jsp");
                            break;
                        case "publication":
                            books = bookBL.findBook(publication, 4);
                            if (books.isEmpty()) {
                                request.getSession().setAttribute("searchBookError", "Book not found.");
                            } else {
                                request.getSession().setAttribute("searchBook", books);
                            }
                            response.sendRedirect("user.jsp");
                            break;
                    }
                    break;
                case "borrowBook":
                    switch (userType) {
                        case "staff":
                            rowsAffected = staffBL.borrowBook(staff, isbn);
                            if (rowsAffected == 1) {
                                request.getSession().setAttribute("borrowError", "Book borrowed.");
                            } else {
                                request.getSession().setAttribute("borrowError", "Book not found.");
                            }
                            response.sendRedirect("user.jsp");
                            break;
                        case "student":
                            rowsAffected = studentBL.borrowBook(student, isbn);
                            if (rowsAffected == 1) {
                                request.getSession().setAttribute("borrowError", "Book borrowed.");
                            } else {
                                request.getSession().setAttribute("borrowError", "Book not found.");
                            }
                            response.sendRedirect("user.jsp");
                            break;
                    }
                    break;
                case "returnBook":
                    switch (userType) {
                        case "staff":
                            rowsAffected = staffBL.returnBook(staff, isbn);
                            if (rowsAffected == 1) {
                                request.getSession().setAttribute("returnError", "Book returned.");
                            } else {
                                request.getSession().setAttribute("returnError", "Book not returned.");
                            }
                            response.sendRedirect("user.jsp");
                            break;
                        case "student":
                            rowsAffected = studentBL.returnBook(student, isbn);
                            if (rowsAffected == 1) {
                                request.getSession().setAttribute("returnError", "Book returned.");
                            } else {
                                request.getSession().setAttribute("returnError", "Book not returned.");
                            }
                            response.sendRedirect("user.jsp");
                            break;
                    }
                    break;
                case "listBorrowedBooks":
                    switch (userType) {
                        case "staff":
                            borrowedBooks = staffBL.getBorrowedBooks(staff);
                            if (borrowedBooks != null) {
                                if (borrowedBooks.isEmpty()) {
                                    request.getSession().setAttribute("borrowedBooksListError", "No books found.");
                                } else {
                                    request.getSession().setAttribute("listBorrowedBooks", borrowedBooks);
                                }
                            } else {
                                request.getSession().setAttribute("borrowedBooksListError", "No books found.");
                            }
                            response.sendRedirect("user.jsp");
                            break;
                        case "student":
                            borrowedBooks = studentBL.getBorrowedBooks(student);
                            if (borrowedBooks != null) {
                                if (borrowedBooks.isEmpty()) {
                                    request.getSession().setAttribute("borrowedBooksListError", "No books found.");
                                } else {
                                    request.getSession().setAttribute("listBorrowedBooks", borrowedBooks);
                                }
                            } else {
                                request.getSession().setAttribute("borrowedBooksListError", "No books found.");
                            }
                            response.sendRedirect("user.jsp");
                            break;
                    }
                    break;
                case "updateUser":
                    switch (userType) {
                        case "staff":
                            staff = getStaff();
                            rowsAffected = staffBL.updateStaff(staff);
                            if (rowsAffected == 1) {
                                request.getSession().setAttribute("updateError", "Staff updated.");
                            } else {
                                request.getSession().setAttribute("updateError", "Staff not found.");
                            }
                            response.sendRedirect("user.jsp");
                            break;
                        case "student":
                            student = getStudent();
                            rowsAffected = studentBL.updateStudent(student);
                            if (rowsAffected == 1) {
                                request.getSession().setAttribute("updateError", "Student updated.");
                            } else {
                                request.getSession().setAttribute("updateError", "Student not found.");
                            }
                            response.sendRedirect("user.jsp");
                            break;
                    }
                    break;
            }
        } else {
            response.sendRedirect("user.jsp");
        }
    }

    public void destroy() {
    }
}
