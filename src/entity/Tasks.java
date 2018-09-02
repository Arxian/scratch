package entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
public class Tasks {
    private int taskId;
    private String name;
    private Integer priority;
    private String description;
    private Timestamp created;
    private Timestamp due;
    private Boolean completed;
    private String userId;
    private Integer subjectId;

    @Id
    @Column(name = "taskID")
    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
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
    @Column(name = "priority")
    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    @Basic
    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "created")
    public Timestamp getCreated() {
        return created;
    }

    public void setCreated(Timestamp created) {
        this.created = created;
    }

    @Basic
    @Column(name = "due")
    public Timestamp getDue() {
        return due;
    }

    public void setDue(Timestamp due) {
        this.due = due;
    }

    @Basic
    @Column(name = "completed")
    public Boolean getCompleted() {
        return completed;
    }

    public void setCompleted(Boolean completed) {
        this.completed = completed;
    }

    @Basic
    @Column(name = "userID")
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "subjectID")
    public Integer getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Tasks tasks = (Tasks) o;
        return taskId == tasks.taskId &&
                Objects.equals(name, tasks.name) &&
                Objects.equals(priority, tasks.priority) &&
                Objects.equals(description, tasks.description) &&
                Objects.equals(created, tasks.created) &&
                Objects.equals(due, tasks.due) &&
                Objects.equals(completed, tasks.completed) &&
                Objects.equals(userId, tasks.userId) &&
                Objects.equals(subjectId, tasks.subjectId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(taskId, name, priority, description, created, due, completed, userId, subjectId);
    }
}
