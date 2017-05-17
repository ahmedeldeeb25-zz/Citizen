/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entities.govern;
import entities.city;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Ahmed_Eldeeb
 */
public class Cities {

    private SessionFactory sessionfactory;
    private Session session;
    private Criteria c;

    public List<govern> getGovs() {
        sessionfactory = new Configuration().configure().buildSessionFactory();
        session = sessionfactory.openSession();
       // session.beginTransaction();

        c = session.createCriteria(govern.class);
        List<govern> cat = c.list();
        session.close();

        return cat;
    }

    public List<city> getCities(int id) {
        sessionfactory = new Configuration().configure().buildSessionFactory();
        session = sessionfactory.openSession();
       // session.beginTransaction();

        govern c = (govern) session.get(govern.class, id);
        List<city> sub = (List<city>) c.getCity();

        session.close();

        return sub;
    }

    public city getCity(int id) {
        sessionfactory = new Configuration().configure().buildSessionFactory();
        session = sessionfactory.openSession();
       // session.beginTransaction();

        city sub = (city) session.get(city.class, id);

        session.close();

        return sub;
    }

}
