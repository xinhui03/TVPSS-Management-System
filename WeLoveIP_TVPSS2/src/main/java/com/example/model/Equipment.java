package com.example.model;

public class Equipment {
    private String model;
    private String type;
    private String status;

    // Constructor and getter methods
    public Equipment(String model, String type, String status) {
        this.model = model;
        this.type = type;
        this.status = status;
    }

    public String getModel() {
        return model;
    }

    public String getType() {
        return type;
    }

    public String getStatus() {
        return status;
    }
    
    public void setModel(String model) {
        this.model = model;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}