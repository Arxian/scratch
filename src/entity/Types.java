package entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Objects;

@Entity
public class Types {
    private int typeId;
    private String typeName;
    private Integer defaultHours;
    private Byte dispersed;

    @Id
    @Column(name = "typeID")
    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    @Basic
    @Column(name = "typeName")
    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    @Basic
    @Column(name = "defaultHours")
    public Integer getDefaultHours() {
        return defaultHours;
    }

    public void setDefaultHours(Integer defaultHours) {
        this.defaultHours = defaultHours;
    }

    @Basic
    @Column(name = "dispersed")
    public Byte getDispersed() {
        return dispersed;
    }

    public void setDispersed(Byte dispersed) {
        this.dispersed = dispersed;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Types types = (Types) o;
        return typeId == types.typeId &&
                Objects.equals(typeName, types.typeName) &&
                Objects.equals(defaultHours, types.defaultHours) &&
                Objects.equals(dispersed, types.dispersed);
    }

    @Override
    public int hashCode() {
        return Objects.hash(typeId, typeName, defaultHours, dispersed);
    }
}
