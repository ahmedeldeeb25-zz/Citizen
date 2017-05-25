/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entities.category;
import entities.city;
import entities.govern;
import entities.post;
import entities.profile;
import entities.sub_category;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import javax.servlet.http.Part;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import static servlets.AddPost.readFully;

/**
 *
 * @author Ahmed_Eldeeb
 */
public class test {

    public Session openConnection() {

        SessionFactory sessionfactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionfactory.openSession();
        return session;

    }

    public static void main(String[] args) {

        user u = new user();
//            profile user = u.getUser(1);
//
//            Cities city = new Cities();
//            city c = city.getCity(1);
//
//            Categories cats = new Categories();
//            sub_category sub = cats.getSubCategory(1);
//
//            post x = new post();
//
//            x.setAddress("address");
//            x.setContent("desc");
//            x.setDate(new Date());
//            x.setPhone("phone");
//            x.setEmail("email");
//            x.setWebsite("web");
//            x.setVideo_url("url");
//            x.setTitle("title");
//            x.setLang("12");
//            x.setLat("31");
//           
//
//           
//
//            user.getPosts().add(x);
//            c.getPosts().add(x);
//            sub.getPosts().add(x);
//
//            x.setUser_id(user);
//            x.setCity(c);
//            x.setCategory(sub);
//
//            Post_Controller a = new Post_Controller();
//            if(a.addPost(x) == "true"){
//                System.out.println("aaaaaaaaaaaa");
//            }

user x=new user();
        x.getUser(1);
        
        Cities c=new Cities();
        c.getCity(1);
        
        Categories f=new Categories();
        f.getSubCategory(1);
///////////////////////////////////////////////////

    }
}
