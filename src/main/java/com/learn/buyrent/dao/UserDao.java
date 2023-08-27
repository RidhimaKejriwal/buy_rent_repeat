
package com.learn.buyrent.dao;

import com.learn.buyrent.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    //get user by email and passwrd
    public User getUserByEmailAndPassword(String email, String password)
    {
        User user = null;
        
        try
        {
            String query = "from User where userEmail =: e and userPassword =: p";
            Session session = this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);
            user = (User) q.uniqueResult();
            session.close();
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return user;
    }
    
    public User getUserByEmail(String email)
    {
        User user = null;
        
        try
        {
            String query = "from User where userEmail =: e ";
            Session session1 = this.factory.openSession();
            Query q = session1.createQuery(query);
            q.setParameter("e", email);
            user = (User) q.uniqueResult();
            session1.close();
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return user;
    }
    
    public User getUserById(int uid)
    {
        User user = null;
        
        try
        {
            String query = "from User where userId =: id ";
            Session session1 = this.factory.openSession();
            Query q = session1.createQuery(query);
            q.setParameter("id", uid);
            user = (User) q.uniqueResult();
            session1.close();
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return user;
    }
}
