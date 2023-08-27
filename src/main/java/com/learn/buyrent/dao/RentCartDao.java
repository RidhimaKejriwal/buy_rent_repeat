
package com.learn.buyrent.dao;

import com.learn.buyrent.entities.Product;
import com.learn.buyrent.entities.RentCart;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class RentCartDao 
{
    private SessionFactory factory;
    
    public RentCartDao(SessionFactory factory)
    {
        this.factory = factory;
    }
    
    public boolean saveProduct(RentCart rcart)
    {
        boolean f = false;
        try
        {
            
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            session.save(rcart);
            tx.commit();
            session.close();
            
            f = true;
            
        }catch(Exception e)
        {
            e.printStackTrace();
            f = false;
        }
        
        return f;
    }
    
    public void updateProduct(RentCart rcart)
    {
        try
        {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            session.update(rcart);
            tx.commit();
            session.close();
        }catch(Exception e)
        {
            e.printStackTrace();
        }        
    }
    
    public void deleteProduct(int id)
    {
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        Query query = session.createQuery("delete from RentCart where id =: i");
        query.setParameter("i", id);
        int r = query.executeUpdate();
        System.out.println(r);
        tx.commit();
        session.close();
    }
    
    public int finalRentPrice(int rentPrice, String rentDuration , int durationNumber, String durationType)
    {
        int price = 0;
        float priceperday = 0;
        switch (rentDuration) {
            case "per Day":
                priceperday = rentPrice;
                break;
            case "per Week":
                priceperday = rentPrice/7;
                break;
            case "per Month":
                priceperday = rentPrice/30;
                break;
            case "for 3 months":
                priceperday = rentPrice/90;
                break;
            case "for 6 months":
                priceperday = rentPrice/180;
                break;
            default:
                break;
        }
        if(durationType.equals("day(s)")){
            price = (int)priceperday * durationNumber;
        }
        else if(durationType.equals("week(s)"))
        {
            price = (int)priceperday * durationNumber * 7;
        }
        else if(durationType.equals("month(s)"))
        {
            price = (int)priceperday * durationNumber * 30;
        }
        return price;
    }
    
    public String finalRentDuration(int durationNumber, String durationType)
    {
        String duration = durationNumber + durationType;
        return duration;
    }
    
    public int buyingPrice(int sellingPrice, String modeOfDelivery)
    {
        int price;
        if(modeOfDelivery.equals("pickup"))
        {
            price = sellingPrice;
        }
        else
        {
            float deliveryCharge = (10*sellingPrice)/100;
            price = sellingPrice + (int)deliveryCharge;
        }
        return price;
    }
    
    public RentCart getProductwithId(int id)
    {
        RentCart product = new RentCart();
        Session s = this.factory.openSession();
        Query query = s.createQuery("from RentCart where id =: i");
        query.setParameter("i", id);
        product = (RentCart)query.uniqueResult();
        return product;        
    }
    
    public List<RentCart> allRentedProductwithUserId(int userId)
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from RentCart where userId =: id and requestAccepted =: a");
        query.setParameter("id", userId);
        query.setParameter("a", "no");
        List<RentCart> list = query.list();
        return list;        
    }
    
    public List<RentCart> allRentedProductwithSellerId(int sellerId)
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from RentCart where sellerId =: id and requestAccepted =: a");
        query.setParameter("id", sellerId);
        query.setParameter("a", "no");
        List<RentCart> list = query.list();
        return list;
    }
    
    public List<RentCart> allRentedApprovedIncompleteProductwithUserId(int userId)
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from RentCart where userId =: id and requestAccepted =: a and processComplete =: p");
        query.setParameter("id", userId);
        query.setParameter("a", "yes");
        query.setParameter("p", "incomplete");
        List<RentCart> list = query.list();
        return list;        
    }
    
    public List<RentCart> allRentedApprovedIncompleteProductwithSellerId(int sellerId)
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from RentCart where sellerId =: id and requestAccepted =: a and processComplete =: p");
        query.setParameter("id", sellerId);
        query.setParameter("a", "yes");
        query.setParameter("p", "incomplete");
        List<RentCart> list = query.list();
        return list;
    }
}
