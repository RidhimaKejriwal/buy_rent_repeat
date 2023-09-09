
package com.learn.buyrent.dao;

import com.learn.buyrent.entities.Product;
import com.learn.buyrent.entities.RentCart;
import java.util.List;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.NativeQuery;
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
    
    public void updateProduct(Product product)
    {
        try
        {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            session.update(product);
            tx.commit();
            session.close();
        }catch(Exception e)
        {
            e.printStackTrace();
        }        
    }
    
    //get all enabled approved seller products of sellerid
    public List<Product> getAllEnabledApprovedSellerProducts(int sid)
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product where seller_id =: id and product_Enable =: e and product_Approved =: a");
        query.setParameter("id", sid);
        query.setParameter("e", "yes");
        query.setParameter("a", "yes");
        List<Product> list = query.list();
        return list;        
    }
    
    //get all enabled but not approved products 
    public List<Product> getAllEnabledNotApprovedProducts()
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product where product_Approved =: a and product_Enable =: e");
        query.setParameter("a", "no");
        query.setParameter("e", "yes");
        List<Product> list = query.list();
        return list;        
    }
    
    //get all disabled but approved seller products of sellerid
    public List<Product> getAllDisabledApprovedSellerProducts(int sid)
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product where seller_id =: id and product_Enable =: e and product_Approved =: a");
        query.setParameter("id", sid);
        query.setParameter("e", "no");
        query.setParameter("a", "yes");
        List<Product> list = query.list();
        return list;        
    }
    
     //get all enabled approved products
    public List<Product> getAllEnabledApprovedProducts()
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product where product_Enable =: e and product_Approved =: a");
        query.setParameter("e", "yes");
        query.setParameter("a", "yes");
        List<Product> list = query.list();
        return list;        
    }
    
     //get all enabled approved products by category id
    public List<Product> getAllEnabledApprovedProductsbyCategory(int cid)
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product as p where product_Enable =: e and product_Approved =: a and p.category.categoryId =: id");
        query.setParameter("e", "yes");
        query.setParameter("a", "yes");
        query.setParameter("id", cid);
        List<Product> list = query.list();
        return list;        
    }
    
    public List<Product> getSearchedProducts(String ch)
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product as p where p.pName like :key and product_Enable =: e and product_Approved =: a");
        query.setParameter("e", "yes");
        query.setParameter("a", "yes");
        query.setParameter("key", "%"+ch+"%");
//        List<Object[]> list1 = query.list();
        List<Product> list = query.list();
//        for(Object[] product : list1)
//        {
//            
//        }
        return list;        
    }
    
    public String getSellingPrice(int sellingPrice)
    {
        String price = "";
        if(sellingPrice == 0)
        {
            price = price + "not for sale";
            return price;
        }
        else
        {
            price = price + " &#8377 " + sellingPrice;
            return price;
        }
    }
    public String getRentPrice(int RentPrice)
    {
        String price = "";
        if(RentPrice == 0)
        {
            price = price + "not for rent";
            return price;
        }
        else
        {
            price = price + " &#8377 " + RentPrice;
            return price;
        }
    }
    
    public Product getProductbyId(int pid)
    {
        Product product = new Product();
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product where pId =: p");
        query.setParameter("p", pid);
        product = (Product)query.uniqueResult();
        return product;
    }
    
    public String getStars(int quality)
    {
        String stars = "";
        for(int i=0; i<quality; i++)
        {
            stars = stars + " " + "\u2B50";
        }
        return stars;
    }
}
