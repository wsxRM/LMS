package com.laitec.lms.Model.TO;

import javax.persistence.*;

@Entity
@Table(name = "student")
@AttributeOverrides({
        @AttributeOverride(name = "userType", column = @Column(name = "student_userType", nullable = false, insertable = false, columnDefinition = "varchar(7) default 'student'")),
        @AttributeOverride(name = "username", column = @Column(name = "student_username", nullable = false, length = 25, unique = true)),
        @AttributeOverride(name = "password", column = @Column(name = "student_password", nullable = false, length = 25)),
        @AttributeOverride(name = "firstName", column = @Column(name = "student_firstName", nullable = false, length = 25)),
        @AttributeOverride(name = "lastName", column = @Column(name = "student_lastName", nullable = false, length = 25)),
        @AttributeOverride(name = "id", column = @Column(name = "student_id"))
})
public class Student extends User {
    @Basic
    @Column(name = "student_className", nullable = false, length = 25)
    private String className;
    @OneToOne(mappedBy = "student", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private Account account = null;

    public Student() {
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    @Override
    public String toString() {
        return "Student{" +
                super.toString() +
                ", className='" + className + '\'' +
                ", account=" + account +
                '}';
    }
}
