package com.learn.buyrent.entities;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class User 
{
    @Id
    private String userEmail;
    private String userName;
    private String userPassword;
    private String userPhone;
    private String userAddress;
    private String userCity;
    private String userCode;
    private String userPic;

    public String getUserPic() {
        return userPic;
    }

    public void setUserPic(String userPic) {
        this.userPic = userPic;
    }
    
    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }
    
    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserCity() {
        return userCity;
    }

    public void setUserCity(String userCity) {
        this.userCity = userCity;
    }

    public User(String userEmail, String userName, String userPassword, String userPhone, String userAddress, String userCity, String userCode, String userPic) {
        this.userEmail = userEmail;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userAddress = userAddress;
        this.userCity = userCity;
        this.userCode = userCode;
        this.userPic = userPic;
    }

    public User() {
    }

    public User(String userName, String userPassword, String userPhone, String userAddress, String userCity, String userCode, String userPic) {
        this.userName = userName;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userAddress = userAddress;
        this.userCity = userCity;
        this.userCode = userCode;
        this.userPic = userPic;
    }
    
    
    
}
