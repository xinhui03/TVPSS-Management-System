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

    @Column(name = "is_approved")
    private boolean isApproved;

    @Column(name = "is_rejected")
    private boolean isRejected;

    public CrewApplication() {
    }

    public CrewApplication(String studentName, String icNumber, String gender, String matricNumber, String school, String phoneNo, String email, String youtubeLink, String applicationReason) {
        this.studentName = studentName;
        this.icNumber = icNumber;
        this.gender = gender;
        this.matricNumber = matricNumber;
        this.school = school;
        this.phoneNo = phoneNo;
        this.email = email;
        this.youtubeLink = youtubeLink;
        this.applicationReason = applicationReason;
        this.isApproved = false;
        this.isRejected = false;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getIcNumber() {
        return icNumber;
    }

    public void setIcNumber(String icNumber) {
        this.icNumber = icNumber;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getMatricNumber() {
        return matricNumber;
    }

    public void setMatricNumber(String matricNumber) {
        this.matricNumber = matricNumber;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getYoutubeLink() {
        return youtubeLink;
    }

    public void setYoutubeLink(String youtubeLink) {
        this.youtubeLink = youtubeLink;
    }

    public String getApplicationReason() {
        return applicationReason;
    }

    public void setApplicationReason(String applicationReason) {
        this.applicationReason = applicationReason;
    }

    public boolean getIsApproved() {
        return isApproved;
    }

    public void setApproved(boolean isApproved) {
        this.isApproved = isApproved;
    }

    public boolean getIsRejected() {
        return isRejected;
    }

    public void setRejected(boolean isRejected) {
        this.isRejected = isRejected;
    }
} 