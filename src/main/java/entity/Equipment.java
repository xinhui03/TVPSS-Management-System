package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "equipment")
public class Equipment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "modelName")
    private String modelName;

    @Column(name = "typeModel")
    private String typeModel;

    @Column(name = "status")
    private String status;

    // Default constructor
    public Equipment() {
    }

    // Parameterized constructor
    public Equipment(String modelName, String typeModel, String status) {
        this.modelName = modelName;
        this.typeModel = typeModel;
        this.status = status;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getModelName() {
        return modelName;
    }

    public void setModelName(String modelName) {
        this.modelName = modelName;
    }

    public String getTypeModel() {
        return typeModel;
    }

    public void setTypeModel(String typeModel) {
        this.typeModel = typeModel;
    }

    public String getstatus() {
        return status;
    }

    public void setstatus(String status) {
        this.status = status;
    }

    // toString method
    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", schoolName='" + modelName + '\'' +
                ", addressI='" + typeModel + '\'' +
                ", addressII='" + status + '\'' +        
                '}';
    }
}