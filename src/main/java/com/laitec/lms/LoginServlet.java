package com.laitec.lms;

import com.laitec.lms.Model.BL.LibrarianBL;
import com.laitec.lms.Model.BL.StaffBL;
import com.laitec.lms.Model.BL.StudentBL;
import com.laitec.lms.Model.TO.Account;
import com.laitec.lms.Model.TO.Librarian;
import com.laitec.lms.Model.TO.Staff;
import com.laitec.lms.Model.TO.Student;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "login", value = "/login")
public class LoginServlet extends HttpServlet {
    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().removeAttribute("librarian");
        request.getSession().removeAttribute("staff");
        request.getSession().removeAttribute("student");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        switch (role) {
            case "librarian":
                LibrarianBL librarianBL = new LibrarianBL();
                try {
                    Librarian librarian = librarianBL.verifyLibrarian(email, password);
                    request.getSession().setAttribute("librarian", librarian);
                    request.getRequestDispatcher("librarian").forward(request, response);
                } catch (Exception e) {
                    request.getSession().setAttribute("loginError", e.getMessage());
                    response.sendRedirect("index.jsp");
                }
                break;
            case "staff":
                StaffBL staffBL = new StaffBL();
                try {
                    Staff staff = staffBL.verifyStaff(email, password);
                    if (staff.getAccount() == null) {
                        Account account = new Account();
                        staff.setAccount(account);
                        account.setStaff(staff);
                    }
                    request.getSession().setAttribute("staff", staff);
                    request.getRequestDispatcher("user").forward(request, response);
                } catch (Exception e) {
                    request.getSession().setAttribute("loginError", e.getMessage());
                    response.sendRedirect("index.jsp");
                }
                break;
            case "student":
                StudentBL studentBL = new StudentBL();
                try {
                    Student student = studentBL.verifyStudent(email, password);
                    if (student.getAccount() == null) {
                        Account account = new Account();
                        student.setAccount(account);
                        account.setStudent(student);
                    }
                    request.getSession().setAttribute("student", student);
                    request.getRequestDispatcher("user").forward(request, response);
                } catch (Exception e) {
                    request.getSession().setAttribute("loginError", e.getMessage());
                    response.sendRedirect("index.jsp");
                }
                break;
        }
    }

    public void destroy() {
    }
}
