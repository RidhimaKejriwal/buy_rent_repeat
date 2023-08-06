package com.learn.buyrent.entities;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class NGO {
    @Id
    private int did;
    private String name;
    private String phone;
    private String email;
    private String cause;
    private String city;
    private String state;
    private String photo;
    private String description;
    private String link;
}
