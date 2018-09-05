package entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Objects;

@Entity
public class Mentors {
    private String mentorId;
    private String menteeId;

    @Id
    @Column(name = "mentorID")
    public String getMentorId() {
        return mentorId;
    }

    public void setMentorId(String mentorId) {
        this.mentorId = mentorId;
    }

    @Basic
    @Column(name = "menteeID")
    public String getMenteeId() {
        return menteeId;
    }

    public void setMenteeId(String menteeId) {
        this.menteeId = menteeId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Mentors mentors = (Mentors) o;
        return Objects.equals(mentorId, mentors.mentorId) &&
                Objects.equals(menteeId, mentors.menteeId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(mentorId, menteeId);
    }
}
