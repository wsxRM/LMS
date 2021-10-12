package com.laitec.lms.Model.TO;

import javax.persistence.*;

@Entity
@Table(name = "librarian")
@AttributeOverrides({
        @AttributeOverride(name = "userType", column = @Column(name = "librarian_userType", nullable = false, insertable = false, columnDefinition = "varchar(9) default 'librarian'")),
        @AttributeOverride(name = "username", column = @Column(name = "librarian_username", nullable = false, length = 25, unique = true)),
        @AttributeOverride(name = "password", column = @Column(name = "librarian_password", nullable = false, length = 25)),
        @AttributeOverride(name = "firstName", column = @Column(name = "librarian_firstName", nullable = false, length = 25)),
        @AttributeOverride(name = "lastName", column = @Column(name = "librarian_lastName", nullable = false, length = 25)),
        @AttributeOverride(name = "id", column = @Column(name = "librarian_id"))
})
public class Librarian extends User {
    public Librarian() {
    }

    @Override
    public String toString() {
        return "Librarian{" +
                super.toString() +
                '}';
    }
}
