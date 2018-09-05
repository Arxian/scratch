package entity;

import persist.DBManager;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Objects;

@Entity
public class Events {
    private int eventId;
    private String eventName;
    private Integer eventPriority;
    private String eventDescription;
    private Timestamp startDate;
    private Timestamp endDate;
    private Boolean eventComplete;
    private Integer subjectId;
    private Integer patternId;
    private String userId;
    private Integer typeId;

    public Events() {
    }

    @Id
    @Column(name = "eventID")
    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    @Basic
    @Column(name = "eventName")
    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    @Basic
    @Column(name = "eventPriority")
    public Integer getEventPriority() {
        return eventPriority;
    }

    public void setEventPriority(Integer eventPriority) {
        this.eventPriority = eventPriority;
    }

    @Basic
    @Column(name = "eventDescription")
    public String getEventDescription() {
        return eventDescription;
    }

    public void setEventDescription(String eventDescription) {
        this.eventDescription = eventDescription;
    }

    @Basic
    @Column(name = "startDate")
    public Timestamp getStartDate() {
        return startDate;
    }

    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }

    @Basic
    @Column(name = "endDate")
    public Timestamp getEndDate() {
        return endDate;
    }

    public void setEndDate(Timestamp endDate) {
        this.endDate = endDate;
    }

    @Basic
    @Column(name = "eventComplete")
    public Boolean getEventComplete() {
        return eventComplete;
    }

    public void setEventComplete(Boolean eventComplete) {
        this.eventComplete = eventComplete;
    }

    @Basic
    @Column(name = "subjectID")
    public Integer getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }

    @Basic
    @Column(name = "patternID")
    public Integer getPatternId() {
        return patternId;
    }

    public void setPatternId(Integer patternId) {
        this.patternId = patternId;
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
    @Column(name = "typeID")
    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Events events = (Events) o;
        return eventId == events.eventId &&
                Objects.equals(eventName, events.eventName) &&
                Objects.equals(eventPriority, events.eventPriority) &&
                Objects.equals(eventDescription, events.eventDescription) &&
                Objects.equals(startDate, events.startDate) &&
                Objects.equals(endDate, events.endDate) &&
                Objects.equals(eventComplete, events.eventComplete) &&
                Objects.equals(subjectId, events.subjectId) &&
                Objects.equals(patternId, events.patternId) &&
                Objects.equals(userId, events.userId) &&
                Objects.equals(typeId, events.typeId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(eventId, eventName, eventPriority, eventDescription, startDate, endDate, eventComplete, subjectId, patternId, userId, typeId);
    }

    public String json(){
        if (this.endDate != null){
            return String.format("{title: '%s', start: '%s', end: '%s', type: 'Event', description: '%s'}", this.eventName, this.startDate.toString(), this.endDate.toString(), this.eventDescription);
        }
        return String.format("{title: '%s', start: '%s', type: 'Event', description: '%s'}", this.eventName, this.startDate.toString(), this.eventDescription);
    }

    public Events(String name, String prio, String typ, String subj, String startD, String startT, String endD, String endT, String user){
        this.eventName = name;
        switch (prio){
            case "Low":
                this.eventPriority = 1;
                break;
            case "Medium":
                this.eventPriority = 2;
                break;
            case "High":
                this.eventPriority = 3;
                break;
        }
        this.typeId = DBManager.getType(typ).getTypeId();
        this.subjectId = DBManager.getSubject(subj, user).getSubjectId();
        this.startDate = Timestamp.valueOf(startD+" "+startT);
        this.endDate = Timestamp.valueOf(endD+" "+endT);
        this.userId = user;
    }
}
