package entity;

import javax.persistence.*;

@Entity
@Table(name = "crew_application")
public class CrewApplication {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "student_name")
    private String studentName;

    @OneToOne
    @JoinColumn(name = "student_id", referencedColumnName = "id", insertable = false, updatable = false)
    private Student student;

    @Column(name = "ic_number")
    private String icNumber;

    @Column(name = "gender")
    private String gender;

    @Column(name = "matric_number")
    private String matricNumber;

    @Column(name = "school")
    private String school;

    @Column(name = "phone_no")
    private String phoneNo;

    @Column(name = "email")
    private String email;

    @Column(name = "youtube_link")
    private String youtubeLink;

    @Column(name = "application_reason")
    private String applicationReason;

    @Column(name = "isApproved")
    private boolean isApproved;

    public CrewApplication() {
    }

    public CrewApplication(String studentName, Student student, String icNumber, String gender, String matricNumber, String school, String phoneNo, String email, String youtubeLink, String applicationReason) {
        this.studentName = studentName;
        this.student = student;
        this.icNumber = icNumber;
        this.gender = gender;
        this.matricNumber = matricNumber;
        this.school = school;
        this.phoneNo = phoneNo;
        this.email = email;
        this.youtubeLink = youtubeLink;
        this.applicationReason = applicationReason;
        this.isApproved = false;
    }
    
    public void setApproved(boolean isApproved) {
        this.isApproved = isApproved;
    }
} 