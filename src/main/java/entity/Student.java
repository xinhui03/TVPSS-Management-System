package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "student")
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "fullName")
    private String fullName;

    @Column(name = "email")
    private String email;

    @Column(name = "address")
    private String address;

    @Column(name = "contact")
    private String contact;

    @Column(name = "parentcontact")
    private String parentcontact;

    @Column(name = "studentid")
    private String studentid;

    @Column(name = "grade")
    private String grade;

    // Default constructor
    public Student() {
    }

    // Parameterized constructor
    public Student(String fullName, String email, String address, String contact, String parentcontact, String studentid, String grade) {
        this.fullName = fullName;
        this.email = email;
        this.address = address;
        this.contact = contact;
        this.parentcontact = parentcontact;
        this.studentid = studentid;
        this.grade = grade;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getParentcontact() {
        return parentcontact;
    }

    public void setParentcontact(String parentcontact) {
        this.parentcontact = parentcontact;
    }

    public String getStudentid() {
        return studentid;
    }

    public void setStudentid(String studentid) {
        this.studentid = studentid;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    // toString method
    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", contact='" + contact + '\'' +
                ", parentcontact='" + parentcontact + '\'' +
                ", studentid='" + studentid + '\'' +
                ", grade='" + grade + '\'' +
                '}';
    }
}
