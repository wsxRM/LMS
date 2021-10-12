package com.laitec.lms;

import com.laitec.lms.Model.BL.LibrarianBL;
import com.laitec.lms.Model.BL.StaffBL;
import com.laitec.lms.Model.BL.StudentBL;
import com.laitec.lms.Model.TO.Librarian;
import com.laitec.lms.Model.TO.Staff;
import com.laitec.lms.Model.TO.Student;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "signup", value = "/signup")
public class SignupServlet extends HttpServlet {
    Librarian librarian;
    Staff staff;
    Student student;
    private String email, password, firstName, lastName, deptName, className;

    private Librarian getLibrarian() {
        librarian = new Librarian();
        librarian.setUsername(email);
        librarian.setPassword(password);
        librarian.setFirstName(firstName);
        librarian.setLastName(lastName);
        return librarian;
    }

    private Staff getStaff() {
        staff = new Staff();
        staff.setUsername(email);
        staff.setPassword(password);
        staff.setFirstName(firstName);
        staff.setLastName(lastName);
        staff.setDeptName(deptName);
        return staff;
    }

    private Student getStudent() {
        student = new Student();
        student.setUsername(email);
        student.setPassword(password);
        student.setFirstName(firstName);
        student.setLastName(lastName);
        student.setClassName(className);
        return student;
    }

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        email = request.getParameter("email");
        password = request.getParameter("password");
        firstName = request.getParameter("firstName");
        lastName = request.getParameter("lastName");
        String role = request.getParameter("role");
        switch (role) {
            case "librarian":
                librarian = getLibrarian();
                LibrarianBL librarianBL = new LibrarianBL();
                int rowsAffected = librarianBL.insertLibrarian(librarian);
                if (rowsAffected == 1) {
                    request.getSession().setAttribute("signupError", "User added.");
                } else {
                    request.getSession().setAttribute("signupError", "User not added.");
                }
                response.sendRedirect("index.jsp");
                break;
            case "staff":
                deptName = request.getParameter("deptName");
                staff = getStaff();
                StaffBL staffBL = new StaffBL();
                rowsAffected = staffBL.insertStaff(staff);
                if (rowsAffected == 1) {
                    request.getSession().setAttribute("signupError", "User added.");
                } else {
                    request.getSession().setAttribute("signupError", "User not added.");
                }
                response.sendRedirect("index.jsp");
                break;
            case "student":
                className = request.getParameter("className");
                student = getStudent();
                StudentBL studentBL = new StudentBL();
                rowsAffected = studentBL.insertStudent(student);
                if (rowsAffected == 1) {
                    request.getSession().setAttribute("signupError", "User added.");
                } else {
                    request.getSession().setAttribute("signupError", "User not added.");
                }
                response.sendRedirect("index.jsp");
                break;
        }
    }

    public void destroy() {
    }
}
