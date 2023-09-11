
package com.learn.buyrent.helper;

import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class Helper
{   
    public static Map<String,Long> getCounts(SessionFactory factory)
    {
        Session session = factory.openSession();
        String q1 = "Select count(*) from User";
        String q2 = "Select count(*) from Product";
        String q3 = "Select count(*) from Seller";
        String q4 = "Select count(*) from Product where product_Enable =: e and product_Approved =: a";
        
        Query query1 = session.createQuery(q1);
        Query query2 = session.createQuery(q2);
        Query query3 = session.createQuery(q3);
        Query query4 = session.createQuery(q4);
        query4.setParameter("e", "yes");
        query4.setParameter("a", "yes");
        
        Long userCount = (Long) query1.list().get(0);
        Long productCount = (Long) query2.list().get(0);
        Long sellerCount = (Long) query3.list().get(0);
        Long enabledApprovedCount = (Long) query4.list().get(0);
        
        Map <String,Long> map = new HashMap<>();
        map.put("userCount", userCount);
        map.put("productCount", productCount);
        map.put("sellerCount", sellerCount);
        map.put("enabledApprovedCount", enabledApprovedCount);
        
        session.close();
        return map;
    }
    
    public static String get10Words(String desc)
    {
        String[] str = desc.split(" ");
        if(str.length > 10)
        {
            String res = "";
            for(int i=0; i<10; i++)
            {
                res = res + str[i] + " ";
            }
            return (res + "...");
        }
        else
        {
            return (desc + "...");
        }
    }
    
}
