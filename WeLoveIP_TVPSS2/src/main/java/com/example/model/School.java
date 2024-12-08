package com.example.model;

import java.util.ArrayList;
import java.util.List;

public class School {
    private int id;
    private String name;
    private String addressI;
    private String addressII;
    private String postcode;
    private String phone;
    private String state;
    private String fax;
    private String email;
    private String logo;
    private String link;
    private List<Equipment> equipmentList = new ArrayList<>();

    public School(int id, String name, String addressI, String addressII,String postcode, String phone, String state, String fax, String email, String logo, String link) {
        this.id = id;
        this.name = name;
        this.addressI = addressI;
        this.addressII = addressII;
        this.postcode = postcode;
        this.phone = phone;
        this.state = state;
        this.fax = fax;
        this.email = email;
        this.logo = logo;
        this.link = link;
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

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getPhone() {
        return phone;
    }

    public void setState(String state) {
        this.state = state;
    }
    
    public String getState() {
        return state;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }
    
    public String getFax() {
        return fax;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }
    
    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public List<Equipment> getEquipmentList() {
        return equipmentList;
    }

    public void addEquipment(Equipment equipment) {
        this.equipmentList.add(equipment);
        System.out.println("Added equipment: " + equipment.getModel()); // Debugging output
    }
}