
package com.learn.buyrent.entities;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class SellCart 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String productName;
    private String sellerName;
    private String userName;
    private String sellerAddress;
    private int sellingPrice;
    private int buyingPrice;
    private String rentDuration;
    private Date exchangeDate;
    private String pickupFromSeller;
    private String getDelivered;

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

    public int getSellingPrice() {
        return sellingPrice;
    }

    public void setSellingPrice(int sellingPrice) {
        this.sellingPrice = sellingPrice;
    }

    public int getBuyingPrice() {
        return buyingPrice;
    }

    public void setBuyingPrice(int buyingPrice) {
        this.buyingPrice = buyingPrice;
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

    public String getPickupFromSeller() {
        return pickupFromSeller;
    }

    public void setPickupFromSeller(String pickupFromSeller) {
        this.pickupFromSeller = pickupFromSeller;
    }

    public String getGetDelivered() {
        return getDelivered;
    }

    public void setGetDelivered(String getDelivered) {
        this.getDelivered = getDelivered;
    }

    public SellCart(int id, String productName, String sellerName, String userName, String sellerAddress, int sellingPrice, int buyingPrice, String rentDuration, Date exchangeDate, String pickupFromSeller, String getDelivered) {
        this.id = id;
        this.productName = productName;
        this.sellerName = sellerName;
        this.userName = userName;
        this.sellerAddress = sellerAddress;
        this.sellingPrice = sellingPrice;
        this.buyingPrice = buyingPrice;
        this.rentDuration = rentDuration;
        this.exchangeDate = exchangeDate;
        this.pickupFromSeller = pickupFromSeller;
        this.getDelivered = getDelivered;
    }

    public SellCart(String productName, String sellerName, String userName, String sellerAddress, int sellingPrice, int buyingPrice, String rentDuration, Date exchangeDate, String pickupFromSeller, String getDelivered) {
        this.productName = productName;
        this.sellerName = sellerName;
        this.userName = userName;
        this.sellerAddress = sellerAddress;
        this.sellingPrice = sellingPrice;
        this.buyingPrice = buyingPrice;
        this.rentDuration = rentDuration;
        this.exchangeDate = exchangeDate;
        this.pickupFromSeller = pickupFromSeller;
        this.getDelivered = getDelivered;
    }
    
    
}
