/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entities.category;
import entities.post;
import entities.profile;
import entities.sub_category;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Ahmed_Eldeeb
 */
public class Categories {

    private SessionFactory sessionfactory;
    private Session session;
    private Criteria c;
    
    
    public List<category> getCategories(){
        sessionfactory = new Configuration().configure().buildSessionFactory();
        session = sessionfactory.openSession();
        session.beginTransaction();

        c = session.createCriteria(category.class);
        List<category> cat = c.list();
        session.close();

        return cat;
    }
     public List<sub_category> getSubCategories(int id){
        sessionfactory = new Configuration().configure().buildSessionFactory();
        session = sessionfactory.openSession();
        session.beginTransaction();

        category c = (category)session.get(category.class, id);
        List<sub_category> sub=(List<sub_category>)c.getSub();
       
        session.close();

        return sub;
    }
     
     public sub_category getSubCategory(int id){
        sessionfactory = new Configuration().configure().buildSessionFactory();
        session = sessionfactory.openSession();
        session.beginTransaction();

        
        sub_category sub=(sub_category)session.get(sub_category.class, id);
       
        session.close();

        return sub;
    }

}
