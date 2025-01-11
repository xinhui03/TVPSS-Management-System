package entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "teacher")
public class Teacher {
	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 @Column(name = "id")
	 private int id;
	 
	 @Column(name = "fullName")
	 private String fullName;

	 @Column(name = "schoolName")
     private String schoolName;

    @Column(name = "contactNumber")
    private String contactNumber;
	    
    @Column(name = "email")
    private String email;
	    
    @Column(name = "state")
    private String state;
	    
    @Column(name = "city")
    private String city;

	// Default constructor
	    public Teacher() {
	    }

	    // Parameterized constructor
	    public Teacher(String fullName, String schoolName, String contactNumber, String email, String state, String city) {
	        this.fullName = fullName;
	        this.schoolName = schoolName;
	        this.contactNumber = contactNumber;
	        this.email = email;
	        this.state = state;
	        this.city = city;
	    }
	 
	 // Getters and setters
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

	    public String getSchoolName() {
	        return schoolName;
	    }

	    public void setSchoolName(String schoolName) {
	        this.schoolName = schoolName;
	    }

	    public String getContactNumber() {
	        return contactNumber;
	    }

	    public void setContactNumber(String contactNumber) {
	        this.contactNumber = contactNumber;
	    }

	    public String getEmail() {
	        return email;
	    }

	    public void setEmail(String email) {
	        this.email = email;
	    }

	    public String getState() {
	        return state;
	    }

	    public void setState(String state) {
	        this.state = state;
	    }

	    public String getCity() {
	        return city;
	    }

	    public void setCity(String city) {
	        this.city = city;
	    }

	    
	    @Override
	    public String toString() {
	        return "Teacher{" +
	        		"id=" + id +
	                ", fullName='" + fullName + '\'' +
	                ", schoolName='" + schoolName + '\'' +
	                ", contactNumber='" + contactNumber + '\'' +
	                ", email='" + email + '\'' +
	                ", state='" + state + '\'' +
	                ", city='" + city + '\'' +
	                '}';
	    }
	}