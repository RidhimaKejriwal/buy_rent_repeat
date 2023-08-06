
package com.learn.buyrent.dao;

import com.learn.buyrent.entities.Seller;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class SellerDao {
    private SessionFactory factory;

    public SellerDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    //get user by email and passwrd
    public Seller getUserByEmailAndPassword(String email, String password)
    {
        Seller seller = null;
        
        try
        {
            String query = "from Seller where userEmail =: e and userPassword =: p";
            Session session = this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);
            seller = (Seller) q.uniqueResult();
            session.close();
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return seller;
    }
    
    public Seller getUserByEmail(String email)
    {
        Seller seller = null;
        
        try
        {
            String query = "from Seller where userEmail =: e ";
            Session session1 = this.factory.openSession();
            Query q = session1.createQuery(query);
            q.setParameter("e", email);
            seller = (Seller) q.uniqueResult();
            session1.close();
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return seller;
    }
}
