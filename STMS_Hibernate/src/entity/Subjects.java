package entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Objects;

@Entity
public class Subjects {
    private int subjectId;
    private String name;
    private String colour;

    @Id
    @Column(name = "subjectID")
    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "colour")
    public String getColour() {
        return colour;
    }

    public void setColour(String colour) {
        this.colour = colour;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Subjects subjects = (Subjects) o;
        return subjectId == subjects.subjectId &&
                Objects.equals(name, subjects.name) &&
                Objects.equals(colour, subjects.colour);
    }

    public Subjects(String name, String colour, String usr){
        this.name = name;
        this.subjectId = name.hashCode();
        this.userId = usr;
        this.colour = colour;
    }

    @Override
    public int hashCode() {
        return Objects.hash(subjectId, name, colour);
    }
}
