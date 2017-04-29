/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

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

    public Posts() {
        this.sessionfactory = new Configuration().configure().buildSessionFactory();
        this.session = sessionfactory.openSession();
    }
    
    
    
}
