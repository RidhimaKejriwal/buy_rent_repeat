
package com.learn.buyrent.dao;

import com.learn.buyrent.entities.NGO;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class NGODao {
    private SessionFactory factory;

    public NGODao(SessionFactory factory) {
        this.factory = factory;
    }
    public List<NGO> getallNGOs()
    {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from NGO");
        List<NGO> list = query.list();
        return list;
    }
}
