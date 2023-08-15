
package com.learn.buyrent.dao;

import com.learn.buyrent.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ProductDao {
    
    private SessionFactory factory;
    
    public ProductDao(SessionFactory factory)
    {
        this.factory = factory;
    }
    
    public boolean saveProduct(Product product)
    {
        boolean f = false;
        try
        {
            
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            session.save(product);
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
    
    //get seller products by sellerid
    public List<Product> getAllEnabledSellerProducts(int sid)
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product where seller_id =: id and product_Enable =: e");
        query.setParameter("id", sid);
        query.setParameter("e", "yes");
        List<Product> list = query.list();
        return list;        
    }
    
    //get all enabled products 
    public List<Product> getAllEnabledNotApprovedProducts()
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product where product_Approved =: a and product_Enable =: e");
        query.setParameter("a", "no");
        query.setParameter("e", "yes");
        List<Product> list = query.list();
        return list;        
    }
    
    public List<Product> getAllDisabledSellerProducts(int sid)
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product where seller_id =: id and product_Enable =: e");
        query.setParameter("id", sid);
        query.setParameter("e", "no");
        List<Product> list = query.list();
        return list;        
    }
}
