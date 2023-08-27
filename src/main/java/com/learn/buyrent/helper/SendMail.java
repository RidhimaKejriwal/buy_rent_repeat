package com.learn.buyrent.helper;

import com.learn.buyrent.entities.Product;
import com.learn.buyrent.entities.RentCart;
import com.learn.buyrent.helper.GmailSender;
import com.learn.buyrent.entities.User;
import com.learn.buyrent.entities.Seller;

import java.util.Random;

public class SendMail {
    public String getRandom()
    {
        Random rd = new Random();
        int num = rd.nextInt(999999);
        
        return String.format("%06d", num);
    }
    
    public boolean sendToUser(User user)
    {
        GmailSender gmail = new GmailSender();
        String to = user.getUserEmail();
        String from = "requestrentrepeat@gmail.com";
        String subject = "User verification Email";
        String text = "Registration successful!! Please verify your account using this code: " + user.getUserCode();
        boolean b = gmail.sendEmail(to, from, subject, text);
        return b;
    }
    
    public boolean sendToSeller(Seller seller)
    {
        GmailSender gmail = new GmailSender();
        String to = seller.getUserEmail();
        String from = "requestrentrepeat@gmail.com";
        String subject = "Seller verification Email";
        String text = "Registration successful!! Please verify your account using this code: " + seller.getUserCode();
        boolean b = gmail.sendEmail(to, from, subject, text);
        return b;
    }
    
    public boolean productApprovedMail(Seller seller, Product product)
    {
        GmailSender gmail = new GmailSender();
        String to = seller.getUserEmail();
        String from = "requestrentrepeat@gmail.com";
        String subject = "Product Registration Approved";
        String text = "Greetings "+seller.getUserName()+"! Your product "+product.getpName()+" with Product id: "+product.getpId()+" has been approved by the admin.";
        boolean b = gmail.sendEmail(to, from, subject, text);
        return b;
    }
    
    public boolean productRejectedMail(Seller seller, Product product)
    {
        GmailSender gmail = new GmailSender();
        String to = seller.getUserEmail();
        String from = "requestrentrepeat@gmail.com";
        String subject = "Product Registration Rejected";
        String text = "Greetings "+seller.getUserName()+"! Your product "+product.getpName()+" with Product id: "+product.getpId()+" has been rejected by the admin.";
        boolean b = gmail.sendEmail(to, from, subject, text);
        return b;
    }
            
    public void cartRequestAccepted(Seller seller, User user, RentCart product)
    {
        GmailSender gmail = new GmailSender();
        String to = user.getUserEmail();
        String from = "requestrentrepeat@gmail.com";
        String subject = "Product request accepted";
        String text = "Greetings "+user.getUserName()+"! Your request for "+product.getProductName()+" has been accepted by the Seller. Collect your product from: "+seller.getUserAddress()+" on: "+product.getExchangeDate()+" ";
        gmail.sendEmail(to, from, subject, text);
    }
    
     public void buyRequestAccepted(User user, RentCart product)
    {
        GmailSender gmail = new GmailSender();
        String to = user.getUserEmail();
        String from = "requestrentrepeat@gmail.com";
        String subject = "Buy request accepted";
        String text = "Greetings "+user.getUserName()+"! Your request for "+product.getProductName()+" has been accepted by the Seller. It will be delivered to you on: "+product.getExchangeDate()+" ";
        gmail.sendEmail(to, from, subject, text);
    }
     
    public void cartRequestRejected(User user, RentCart product)
    {
        GmailSender gmail = new GmailSender();
        String to = user.getUserEmail();
        String from = "requestrentrepeat@gmail.com";
        String subject = "Product request Rejected";
        String text = "Greetings "+user.getUserName()+"! Your request for "+product.getProductName()+" has been rejected by the Seller.";
        gmail.sendEmail(to, from, subject, text);
    }
    
    public void exchangeOTPUser(User user, RentCart product)
    {
        GmailSender gmail = new GmailSender();
        String to = user.getUserEmail();
        String from = "requestrentrepeat@gmail.com";
        String subject = "Exchange OTP";
        String text = "Here is your Exchange OTP: " + product.getVerifyOTP()+". Provide this OTP to seller only at the time of receiving product.";
        gmail.sendEmail(to, from, subject, text);
    }
}
