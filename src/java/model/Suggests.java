/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entities.Suggested;
import entities.post;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.swing.JOptionPane;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Ahmed_Eldeeb
 */
public class Suggests {

    public static void main(String[] args) {
        Suggests su = new Suggests();

        System.out.println(su.sort(su.suggestpost(1)));
        
//        su.updatesuggest(1, 3);
        // System.out.println(su.searchsuggest(1, 3));
    }

    private SessionFactory sessionfactory;
    private Session session;
    private Criteria c;

    public boolean searchsuggest(int from, int to) {

        sessionfactory = new Configuration().configure().buildSessionFactory();
        session = sessionfactory.openSession();
        session.beginTransaction();

        c = session.createCriteria(Suggested.class);
        c.add(Restrictions.and(Restrictions.eq("pFrom", from), Restrictions.eq("pTo", to)));
        List<Suggested> cat = c.list();

        session.close();

        if (cat.size() > 0) {
            return true;
        }
        return false;

    }

    public void updatesuggest(int from, int to) {

        if (searchsuggest(from, to)) {

            try {
                sessionfactory = new Configuration().configure().buildSessionFactory();
                session = sessionfactory.openSession();
                session.beginTransaction();
                c = session.createCriteria(Suggested.class);
                c.add(Restrictions.and(Restrictions.eq("pFrom", from), Restrictions.eq("pTo", to)));
                List<Suggested> cat = c.list();

                Suggested s = cat.get(0);
                System.out.println(s.getVisits());
                s.setVisits(s.getVisits()+1);

                session.update(s);

                System.out.println(s.getId());

            } catch (Exception ex) {
                JOptionPane.showMessageDialog(null, ex + "\n in method update to update visit");
            }

        } else {
            try {
                sessionfactory = new Configuration().configure().buildSessionFactory();
                session = sessionfactory.openSession();
                session.beginTransaction();

                Suggested s = new Suggested();

                s.setpFrom(from);
                s.setpTo(to);

                session.save(s);

            } catch (Exception ex) {
                JOptionPane.showMessageDialog(null, ex + "\n in method update to insert");
            }
            //add to from

        }
        session.getTransaction().commit();
        session.close();
        System.out.println("aaaaaaaaa");
    }

    public HashMap<Integer, Integer> suggestpost(int to) {

        HashMap<Integer, Integer> su = new HashMap<Integer, Integer>();

        try {
            sessionfactory = new Configuration().configure().buildSessionFactory();
            session = sessionfactory.openSession();

            c = session.createCriteria(Suggested.class);
            c.add(Restrictions.eq("pFrom", to));
            List<Suggested> cat = c.list();

            for (int i = 0; i < cat.size(); i++) {
                su.put(cat.get(i).getpTo(), cat.get(i).getVisits());
            }

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex);
        }
        return su;

    }

    public ArrayList<Integer> sort(HashMap<Integer, Integer> postsvisit) {

        Object[] z = postsvisit.values().toArray();
        java.util.Arrays.sort(z);
        ArrayList<Integer> fin = new ArrayList<Integer>();

        try {

            for (int i = z.length - 1; i >= 0; --i) {
                for (Map.Entry<Integer, Integer> e : postsvisit.entrySet()) {

                    if (e.getValue().equals(z[i]) && !z[i].equals(0)) {
                        if (!fin.contains(e.getKey())) {
                            fin.add(e.getKey());
                        }
                    }

                }

            }
             

        } catch (Exception ex) {
            System.out.println("Error in Sort Method");
        }
        return fin;
    }

}
