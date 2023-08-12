package com.learn.buyrent.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Product 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int pId;
    private String pName;
    @Column(length = 3000)
    private String pDesc;
    private String pPhoto1;
    private String pPhoto2;
    private int pSellPrice;
    private int pRentPrice;
    private int pQuality;
    private String pUsedFor;
    @ManyToOne
    private Category category;
    private String product_Enable;
    private String product_Approved;
    @ManyToOne
    private Seller seller_id;

    public Seller getSeller_id() {
        return seller_id;
    }

    public void setSeller_id(Seller seller_id) {
        this.seller_id = seller_id;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpDesc() {
        return pDesc;
    }

    public void setpDesc(String pDesc) {
        this.pDesc = pDesc;
    }

    public String getpPhoto1() {
        return pPhoto1;
    }

    public void setpPhoto1(String pPhoto1) {
        this.pPhoto1 = pPhoto1;
    }

    public String getpPhoto2() {
        return pPhoto2;
    }

    public void setpPhoto2(String pPhoto2) {
        this.pPhoto2 = pPhoto2;
    }

    public int getpSellPrice() {
        return pSellPrice;
    }

    public void setpSellPrice(int pSellPrice) {
        this.pSellPrice = pSellPrice;
    }

    public int getpRentPrice() {
        return pRentPrice;
    }

    public void setpRentPrice(int pRentPrice) {
        this.pRentPrice = pRentPrice;
    }

    public int getpQuality() {
        return pQuality;
    }

    public void setpQuality(int pQuality) {
        this.pQuality = pQuality;
    }

    public String getpUsedFor() {
        return pUsedFor;
    }

    public void setpUsedFor(String pUsedFor) {
        this.pUsedFor = pUsedFor;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getProduct_Enable() {
        return product_Enable;
    }

    public void setProduct_Enable(String product_Enable) {
        this.product_Enable = product_Enable;
    }

    public String getProduct_Approved() {
        return product_Approved;
    }

    public void setProduct_Approved(String product_Approved) {
        this.product_Approved = product_Approved;
    }
    
    

    public Product(int pId, String pName, String pDesc, String pPhoto1, String pPhoto2, int pSellPrice, int pRentPrice, int pQuality, String pUsedFor, Category category, String product_Enable, String product_Approved) {
        this.pId = pId;
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPhoto1 = pPhoto1;
        this.pPhoto2 = pPhoto2;
        this.pSellPrice = pSellPrice;
        this.pRentPrice = pRentPrice;
        this.pQuality = pQuality;
        this.pUsedFor = pUsedFor;
        this.category = category;
        this.product_Enable = product_Enable;
        this.product_Approved = product_Approved;
    }

    public Product() {
    }

    public Product(String pName, String pDesc, String pPhoto1, String pPhoto2, int pSellPrice, int pRentPrice, int pQuality, String pUsedFor, Category category, String product_Enable, String product_Approved) {
        this.pName = pName;
        
        this.pDesc = pDesc;
        this.pPhoto1 = pPhoto1;
        this.pPhoto2 = pPhoto2;
        this.pSellPrice = pSellPrice;
        this.pRentPrice = pRentPrice;
        this.pQuality = pQuality;
        this.pUsedFor = pUsedFor;
        this.category = category;
        this.product_Enable = product_Enable;
        this.product_Approved = product_Approved;
    }
    
    
}
