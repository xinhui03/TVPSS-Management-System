package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "school")
public class SchoolInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "schoolName")
    private String schoolName;

    @Column(name = "addressI")
    private String addressI;

    @Column(name = "addressII")
    private String addressII;

    @Column(name = "phoneNo")
    private String phoneNo;

    @Column(name = "email")
    private String email;

    @Column(name = "postcode")
    private String postcode;

    @Column(name = "state")
    private String state;
    
    @Column(name = "faxNo")
    private String faxNo;
    
    @Column(name = "schoolLogo")
    private String schoolLogo;
    
    @Column(name = "videoLink")
    private String videoLink;

    // Default constructor
    public SchoolInfo() {
    }

    // Parameterized constructor
    public SchoolInfo(String schoolName, String addressI, String addressII, String phoneNo, String email, String postcode, String state, String faxNo, String schoolLogo, String videoLink) {
        this.schoolName = schoolName;
        this.addressI = addressI;
        this.addressII = addressII;
        this.phoneNo = phoneNo;
        this.email = email;
        this.postcode = postcode;
        this.state = state;
        this.faxNo = faxNo;
        this.schoolLogo = schoolLogo;
        this.videoLink = videoLink;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getAddressI() {
        return addressI;
    }

    public void setAddressI(String addressI) {
        this.addressI = addressI;
    }

    public String getAddressII() {
        return addressII;
    }

    public void setAddressII(String addressII) {
        this.addressII = addressII;
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

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
    
    public String getFaxNo() {
        return faxNo;
    }

    public void setFaxNo(String faxNo) {
        this.faxNo = faxNo;
    }
    
    public String getSchoolLogo() {
        return schoolLogo;
    }

    public void setSchoolLogo(String schoolLogo) {
        this.schoolLogo = schoolLogo;
    }
    
    public String getVideoLink() {
        return videoLink;
    }

    public void setVideoLink(String videoLink) {
        this.videoLink = videoLink;
    }

    // toString method
    @Override
    
    public String toString() {
        return "SchoolInfo{" +
                "id=" + id +
                ", schoolName='" + schoolName + '\'' +
                ", addressI='" + addressI + '\'' +
                ", addressII='" + addressII + '\'' +
                ", phoneNo='" + phoneNo + '\'' +
                ", email='" + email + '\'' +
                ", postcode='" + postcode + '\'' +
                ", state='" + state + '\'' +
                ", faxNo='" + faxNo + '\'' +
                ", schoolLogo='" + schoolLogo + '\'' +
                ", videoLink='" + videoLink + '\'' +
                '}';
    }
}
