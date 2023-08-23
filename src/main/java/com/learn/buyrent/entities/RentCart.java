
package com.learn.buyrent.entities;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class RentCart 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String productName;
    private String sellerName;
    private String userName;
    private String sellerAddress;
    private int rentPrice;
    private String rentDuration;
    private Date exchangeDate;
    private String requestAccepted;
    private String isReturned;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getSellerName() {
        return sellerName;
    }

    public void setSellerName(String sellerName) {
        this.sellerName = sellerName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getSellerAddress() {
        return sellerAddress;
    }

    public void setSellerAddress(String sellerAddress) {
        this.sellerAddress = sellerAddress;
    }

    public int getRentPrice() {
        return rentPrice;
    }

    public void setRentPrice(int rentPrice) {
        this.rentPrice = rentPrice;
    }

    public String getRentDuration() {
        return rentDuration;
    }

    public void setRentDuration(String rentDuration) {
        this.rentDuration = rentDuration;
    }

    public Date getExchangeDate() {
        return exchangeDate;
    }

    public void setExchangeDate(Date exchangeDate) {
        this.exchangeDate = exchangeDate;
    }

    public String getRequestAccepted() {
        return requestAccepted;
    }

    public void setRequestAccepted(String requestAccepted) {
        this.requestAccepted = requestAccepted;
    }

    public String getIsReturned() {
        return isReturned;
    }

    public void setIsReturned(String isReturned) {
        this.isReturned = isReturned;
    }

    public RentCart(int id, String productName, String sellerName, String userName, String sellerAddress, int rentPrice, String rentDuration, Date exchangeDate, String requestAccepted, String isReturned) {
        this.id = id;
        this.productName = productName;
        this.sellerName = sellerName;
        this.userName = userName;
        this.sellerAddress = sellerAddress;
        this.rentPrice = rentPrice;
        this.rentDuration = rentDuration;
        this.exchangeDate = exchangeDate;
        this.requestAccepted = requestAccepted;
        this.isReturned = isReturned;
    }

    public RentCart(String productName, String sellerName, String userName, String sellerAddress, int rentPrice, String rentDuration, Date exchangeDate, String requestAccepted, String isReturned) {
        this.productName = productName;
        this.sellerName = sellerName;
        this.userName = userName;
        this.sellerAddress = sellerAddress;
        this.rentPrice = rentPrice;
        this.rentDuration = rentDuration;
        this.exchangeDate = exchangeDate;
        this.requestAccepted = requestAccepted;
        this.isReturned = isReturned;
    }

        
}
