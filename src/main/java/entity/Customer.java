package entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "customer")
public class Customer {
	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 @Column(name = "id")
	 private int id;
	 @Column(name = "name")
	 private String name;
	 @Column(name = "address")
	 private String address;
	 @Column(name = "contactNum")
	 private String contactNum;
	 @Column(name = "email")
	 private String email;
	 
	// Default constructor
	    public Customer() {
	    }

	    // Parameterized constructor
	    public Customer(String name, String address, String contactNum, String email) {
	        this.name = name;
	        this.address = address;
	        this.contactNum = contactNum;
	        this.email = email;
	    }
	 
	 // Getters and setters
	    public int getId() {
	        return id;
	    }

	    public void setId(int id) {
	        this.id = id;
	    }

	    public String getName() {
	        return name;
	    }

	    public void setName(String name) {
	        this.name = name;
	    }

	    public String getAddress() {
	        return address;
	    }

	    public void setAddress(String address) {
	        this.address = address;
	    }

	    public String getContactNum() {
	        return contactNum;
	    }

	    public void setContactNum(String contactNum) {
	        this.contactNum = contactNum;
	    }

	    public String getEmail() {
	        return email;
	    }

	    public void setEmail(String email) {
	        this.email = email;
	    }
	    
	 @Override
	 public String toString() {
	 return "Customer [id=" + id + ", name=" + name + ", address=" +
	 address + ", contactNum=" + contactNum
	 + ", email=" + email + "]";
	 }
	}