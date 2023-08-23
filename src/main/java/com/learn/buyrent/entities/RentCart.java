
package com.learn.buyrent.entities;

import java.time.LocalDate;
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
    private int buyingPrice;
    private String rentDuration;
    private LocalDate exchangeDate;
    private String requestAccepted;
    private String isReturned;
    private String isDelivered;
    private String modeOfDelivery;

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

    public LocalDate getExchangeDate() {
        return exchangeDate;
    }

    public void setExchangeDate(LocalDate exchangeDate) {
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

    public int getBuyingPrice() {
        return buyingPrice;
    }

    public void setBuyingPrice(int buyingPrice) {
        this.buyingPrice = buyingPrice;
    }

    public String getIsDelivered() {
        return isDelivered;
    }

    public void setIsDelivered(String isDelivered) {
        this.isDelivered = isDelivered;
    }

    public String getModeOfDelivery() {
        return modeOfDelivery;
    }

    public void setModeOfDelivery(String modeOfDelivery) {
        this.modeOfDelivery = modeOfDelivery;
    }
    
    public RentCart(int id, String productName, String sellerName, String userName, String sellerAddress, int rentPrice, String rentDuration, LocalDate exchangeDate, String requestAccepted, String isReturned) {
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

    public RentCart(String productName, String sellerName, String userName, String sellerAddress, int rentPrice, String rentDuration, LocalDate exchangeDate, String requestAccepted, String isReturned) {
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

    public RentCart() {
    }

    
        
}
