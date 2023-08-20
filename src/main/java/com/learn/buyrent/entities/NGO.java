package com.learn.buyrent.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class NGO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int did;
    private String name;
    private String phone;
    private String email;
    private String cause;
    private String city;
    private String state;
    private String address;
    private String photo;
    @Column(length = 3000)
    private String description;
    private String link;

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getCause() {
        return cause;
    }

    public void setCause(String cause) {
        this.cause = cause;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public NGO() {
    }

    public NGO(int did, String name, String phone, String email, String cause, String city, String state, String photo, String description, String link) {
        this.did = did;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.cause = cause;
        this.city = city;
        this.state = state;
        this.photo = photo;
        this.description = description;
        this.link = link;
    }

    public NGO(String name, String phone, String email, String cause, String city, String state, String photo, String description, String link) {
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.cause = cause;
        this.city = city;
        this.state = state;
        this.photo = photo;
        this.description = description;
        this.link = link;
    }
    
    
}
