
package com.learn.buyrent.dao;

import com.learn.buyrent.entities.Admin;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class AdminDao 
{
    private SessionFactory factory;

    public AdminDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    //get user by email and passwrd
    public Admin getUserByEmailAndPassword(String email, String password)
    {
        Admin admin = null;
        
        try
        {
            String query = "from Admin where userEmail =: e and userPassword =: p";
            Session session = this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);
            admin = (Admin) q.uniqueResult();
            session.close();
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return admin;
    }
    
}
