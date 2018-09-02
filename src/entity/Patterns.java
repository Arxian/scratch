package entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Objects;

@Entity
public class Patterns {
    private int patternId;
    private Integer every;
    private Integer defineEvery;
    private String days;

    @Id
    @Column(name = "patternID")
    public int getPatternId() {
        return patternId;
    }

    public void setPatternId(int patternId) {
        this.patternId = patternId;
    }

    @Basic
    @Column(name = "every")
    public Integer getEvery() {
        return every;
    }

    public void setEvery(Integer every) {
        this.every = every;
    }

    @Basic
    @Column(name = "defineEvery")
    public Integer getDefineEvery() {
        return defineEvery;
    }

    public void setDefineEvery(Integer defineEvery) {
        this.defineEvery = defineEvery;
    }

    @Basic
    @Column(name = "days")
    public String getDays() {
        return days;
    }

    public void setDays(String days) {
        this.days = days;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Patterns patterns = (Patterns) o;
        return patternId == patterns.patternId &&
                Objects.equals(every, patterns.every) &&
                Objects.equals(defineEvery, patterns.defineEvery) &&
                Objects.equals(days, patterns.days);
    }

    @Override
    public int hashCode() {
        return Objects.hash(patternId, every, defineEvery, days);
    }
}
