/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import entities.post;
import entities.profile;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Vector;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Ahmed_Eldeeb
 */
public class user {

    private SessionFactory sessionfactory;
    private Session session;
    private Vector vt;
    private Vector vc;
    private HashMap<Integer, HashSet<String>> set;
    private Criteria c;

    public user() {
        this.sessionfactory = new Configuration().configure().buildSessionFactory();
        this.session = sessionfactory.openSession();

    }

    public Boolean register(profile u) {

        session.beginTransaction();
        session.save(u);
        session.getTransaction().commit();
        session.close();

        return true;
    }

    public profile login(profile u) {

        session.beginTransaction();

        c = session.createCriteria(profile.class);
        c.add(Restrictions.eq("Email", u.getEmail()))
                .add(Restrictions.eq("Password", u.getPassword()));

        List<profile> user = (List<profile>) c.list();
        session.close();
        if (user.size() < 1) {
            return null;
        }

        return user.get(0);

    }
    
    public profile getUser(int id){
        
        session.beginTransaction();

        profile user =(profile) session.get(profile.class, id);
        session.close();
        
        return user;
        
    }
    
     

    /////////////////Post search/////////////////
    ////////////////////////////////////////////
    public HashMap<Integer, HashSet<String>> postSearch() {

        vt = new Vector();
        vc = new Vector();
        set = new HashMap();

        c = session.createCriteria(post.class);
        List<post> p = c.list();

        for (post Post : p) {
            String t = Post.getTitle();
            String c = Post.getContent();
            String z = c + t;
            set.put(Post.getId(), split((c + t).toLowerCase()));
        }

        return set;
    }

    private HashSet<String> split(String s) {
        String[] a = s.split(" ");

        HashSet<String> z = new HashSet<String>();
        for (int i = 0; i < a.length; i++) {
            z.add(a[i]);
        }
        return z;
    }
    /////////////////End of Post search/////////////////
    ////////////////////////////////////////////  
}
