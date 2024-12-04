package com.example.model;

import java.util.ArrayList;
import java.util.List;

public class School {
    private int id;
    private String name;
    private String address;
    private String postcode;
    private String phone;
    private String email;
    private List<Equipment> equipmentList = new ArrayList<>();

    public School(int id, String name, String address, String postcode, String phone, String email) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.postcode = postcode;
        this.phone = phone;
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

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getPhone() {
        return phone;
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

    public List<Equipment> getEquipmentList() {
        return equipmentList;
    }

    public void addEquipment(Equipment equipment) {
        this.equipmentList.add(equipment);
        System.out.println("Added equipment: " + equipment.getModel()); // Debugging output
    }
}