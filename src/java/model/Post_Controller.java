package model;

import entities.post;
import entities.profile;
import javax.swing.JOptionPane;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Post_Controller {

    public String addPost(post u) {
        try {
            SessionFactory sessionfactory = new Configuration().configure().buildSessionFactory();
            Session session = sessionfactory.openSession();
            session.beginTransaction();

            session.save(u);
            session.getTransaction().commit();
            session.close();

        } catch (Exception ex) {
            //JOptionPane.showMessageDialog(null, ex.getMessage());
            return ex.toString();
        }
        System.out.println("inserted");
        return "true";
    }

    public Boolean updatePost(post u,int postID) {
       
            SessionFactory sessionfactory = new Configuration().configure().buildSessionFactory();
            Session session = sessionfactory.openSession();
            session.beginTransaction();

            post x = (post) session.get(post.class, postID);
            System.out.println(x.toString() + "\n ........................................");
//       session.delete(x);
            x.setAddress(u.getAddress());
            x.setPhone(u.getPhone());
            x.setEmail(u.getEmail());
            x.setWebsite(u.getWebsite());
            x.setVideo_url(u.getVideo_url());
            x.setTitle(u.getTitle());
            x.setPic(u.getPic());
            x.setContent(u.getContent());

            session.update(x);
            session.getTransaction().commit();
            session.close();
        
        return true;
    }

    public Boolean deletePost(int id) {
        try {
            SessionFactory sessionfactory = new Configuration().configure().buildSessionFactory();
            Session session = sessionfactory.openSession();
            session.beginTransaction();

            post x = (post) session.get(post.class, id);

            session.delete(x);

            session.getTransaction().commit();
            session.close();
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    public void incrementVisit(int id) {
        try {
            SessionFactory sessionfactory = new Configuration().configure().buildSessionFactory();
            Session session = sessionfactory.openSession();
            session.beginTransaction();

            post x = (post) session.get(post.class, id);

            x.setVisit(x.getVisit() + 1);
            session.update(x);
            session.getTransaction().commit();
            session.close();
        } catch (Exception ex) {
            ex.printStackTrace();

        }

    }

//    public void incrementComment(int id) {
//        try {
//            SessionFactory sessionfactory = new Configuration().configure().buildSessionFactory();
//            Session session = sessionfactory.openSession();
//            session.beginTransaction();
//
//            post x = (post) session.get(post.class, id);
//
//            x.setComment(x.getComment() + 1);
//            session.update(x);
//            session.getTransaction().commit();
//            session.close();
//        } catch (Exception ex) {
//            ex.printStackTrace();
//
//        }
//
//    }
//    public static void main(String[] args) {
//        Post_Controller a = new Post_Controller();
//        for (int i = 0; i < 5; i++) {
//            a.incrementComment(1);
//        }
//
//    }
}
