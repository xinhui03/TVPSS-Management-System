package entity;

import jakarta.persistence.*;

@Entity
@Table(name = "school")
public class School {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    private String code;
    private String name;
    private String state;
    
    public School() {}
    
    public School(String code, String name, String state) {
        this.code = code;
        this.name = name;
        this.state = state;
    }
    
    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }
    
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    
    public String getState() { return state; }
    public void setState(String state) { this.state = state; }
}
