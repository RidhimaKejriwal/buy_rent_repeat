
package com.learn.buyrent.dao;

import com.learn.buyrent.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CategoryDao {
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    //get all the categories in a list
    public List<Category> getCategories()
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Category");
        List<Category> list = query.list();
        return list;
    }
    
    // returns single category by its id
    public Category getCategoryById(int cid)
    {
        Category cat = null;
        try
        {
            Session session = this.factory.openSession();
            cat = session.get(Category.class, cid);
            session.close();
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return cat;
    }
    
    public int saveCategory(Category cat)
    {
        try
        {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            int catId = (int) session.save(cat);
            tx.commit();
            session.close();
            return catId;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return 0;
    }
    
    
}
