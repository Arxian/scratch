package entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Objects;

@Entity
public class Users {
    private String userId;
    private Byte mentor;

    public Users(String userId) {
        this.userId = userId;
    }

    @Id
    @Column(name = "userID")
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "mentor")
    public Byte getMentor() {
        return mentor;
    }

    public void setMentor(Byte mentor) {
        this.mentor = mentor;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Users users = (Users) o;
        return Objects.equals(userId, users.userId) &&
                Objects.equals(mentor, users.mentor);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userId, mentor);
    }
}
