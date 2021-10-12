package com.laitec.lms.Model.TO;

import javax.persistence.*;

@Entity
@Table(name = "staff")
@AttributeOverrides({
        @AttributeOverride(name = "userType", column = @Column(name = "staff_userType", nullable = false, insertable = false, columnDefinition = "varchar(5) default 'staff'")),
        @AttributeOverride(name = "username", column = @Column(name = "staff_username", nullable = false, length = 25, unique = true)),
        @AttributeOverride(name = "password", column = @Column(name = "staff_password", nullable = false, length = 25)),
        @AttributeOverride(name = "firstName", column = @Column(name = "staff_firstName", nullable = false, length = 25)),
        @AttributeOverride(name = "lastName", column = @Column(name = "staff_lastName", nullable = false, length = 25)),
        @AttributeOverride(name = "id", column = @Column(name = "staff_id"))
})
public class Staff extends User {
    @Basic
    @Column(name = "staff_deptName", nullable = false, length = 25)
    private String deptName;
    @OneToOne(mappedBy = "staff", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private Account account = null;

    public Staff() {
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    @Override
    public String toString() {
        return "Staff{" +
                super.toString() +
                ", deptName='" + deptName + '\'' +
                ", account=" + account +
                '}';
    }
}
