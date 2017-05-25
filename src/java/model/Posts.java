/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entities.post;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Vector;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Ahmed_Eldeeb
 */
public class Posts {

    private SessionFactory sessionfactory;
    private Session session;
    private Criteria c;

    public post getPost(int id) {
        sessionfactory = new Configuration().configure().buildSessionFactory();
        session = sessionfactory.openSession();
        session.beginTransaction();

        post user = (post) session.get(post.class, id);
        session.close();

        return user;

    }
     public List<post> getAll() {
        sessionfactory = new Configuration().configure().buildSessionFactory();
        session = sessionfactory.openSession();
        session.beginTransaction();

         c = session.createCriteria(post.class);
        List<post> cat = c.list();
        
        session.close();

        return cat;

    }

    public void deletePost(post p) {
        sessionfactory = new Configuration().configure().buildSessionFactory();
        session = sessionfactory.openSession();
        session.beginTransaction();
        session.delete(p);
        session.getTransaction().commit();
        session.close();
    }

}
