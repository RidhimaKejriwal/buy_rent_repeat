package com.learn.buyrent.helper;

import com.learn.buyrent.entities.Product;
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
            
}
