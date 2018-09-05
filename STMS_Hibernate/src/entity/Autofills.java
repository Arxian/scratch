package entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Objects;

@Entity
public class Autofills {
    private int eventId;
    private Integer taskId;

    @Id
    @Column(name = "eventID")
    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    @Basic
    @Column(name = "taskID")
    public Integer getTaskId() {
        return taskId;
    }

    public void setTaskId(Integer taskId) {
        this.taskId = taskId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Autofills autofills = (Autofills) o;
        return eventId == autofills.eventId &&
                Objects.equals(taskId, autofills.taskId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(eventId, taskId);
    }
}
