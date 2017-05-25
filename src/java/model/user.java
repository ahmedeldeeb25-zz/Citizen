package model;

import entities.post;
import entities.profile;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.Criteria;
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

    /**
     * The Desciption of the method to explain what the method does
     *
     * @param the parameters used by the method
     * @return the value returned by the method
     * @throws what kind of exception does this method throw
     */
    public Boolean register(profile u) {

        sessionfactory = new Configuration().configure().buildSessionFactory();
        session = sessionfactory.openSession();
        session.beginTransaction();
        session.save(u);
        session.getTransaction().commit();
        session.close();

        return true;
    }

    public profile login(profile u) {

        sessionfactory = new Configuration().configure().buildSessionFactory();
        session = sessionfactory.openSession();
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

    public profile getUser(int id) {
        sessionfactory = new Configuration().configure().buildSessionFactory();
        session = sessionfactory.openSession();
        session.beginTransaction();

        profile user = (profile) session.get(profile.class, id);
        session.close();

        return user;

    }

//    public void updateProfile(profile u) {
//
//        sessionfactory = new Configuration().configure().buildSessionFactory();
//        session = sessionfactory.openSession();
//        session.beginTransaction();
//        session.update(u);
//        session.getTransaction().commit();
//        session.close();
//
//    }

    /////////////////Post search/////////////////
    ////////////////////////////////////////////
    public String Words(String line) throws FileNotFoundException, IOException {

        BufferedReader stopWordsFile = new BufferedReader(new FileReader("C://Users//Ahmed_Eldeeb//Documents//NetBeansProjects//Citizen//src//stopWords.txt"));

        String stopWord;

        HashSet<String> set = new HashSet<String>();

        while ((stopWord = stopWordsFile.readLine()) != null && !stopWord.equals(" ")) {

            set.add(stopWord.toLowerCase());

        }
        String newWords = "";
        String lineWords[] = line.replaceAll("[ ;'*()`<>{}./\"-_]+", ",").split(",");

        boolean flag = false;
        int siz = set.size();

        for (int i = 0; i < lineWords.length; ++i) {
            set.add(lineWords[i]);

            if (set.size() != siz) {
                ++siz;
                newWords += lineWords[i] + " ";

            }

        }

        stopWordsFile.close();
        return newWords;
    }

    public void runProgram() throws IOException {
        String line = "My name is eslam ahmed elkhafagy ahmed ali ahmed yousef mohamed and i have 21 years old my freind";

        String s[] = Words(line).split(" ");

        HashMap<Integer, Integer> postscount = new HashMap<Integer, Integer>();

        for (Map.Entry<Integer, HashSet<String>> e : set.entrySet()) {
            int count = 0;
            for (int i = 0; i < s.length; i++) {
                if (e.getValue().contains(s[i])) {
                    count++;
                }
            }

            postscount.put(e.getKey(), count);

        }

        Object[] z = postscount.values().toArray();
        java.util.Arrays.sort(z);

//...........................................................................................
        ArrayList<Integer> fin = new ArrayList<Integer>();
        for (int i = z.length - 1; i >= 0; --i) {
            for (Map.Entry<Integer, Integer> e : postscount.entrySet()) {

                if (e.getValue().equals(z[i]) && !z[i].equals(0)) {
                    if (!fin.contains(e.getKey())) {
                        fin.add(e.getKey());
                    }
                }

            }

        }
        System.out.println(fin);

    }

    public HashMap<Integer, HashSet<String>> postSearch() {

        vt = new Vector();
        vc = new Vector();
        set = new HashMap();

        sessionfactory = new Configuration().configure().buildSessionFactory();
        session = sessionfactory.openSession();
        c = session.createCriteria(post.class);
        List<post> p = c.list();

        for (post Post : p) {
            String t = Post.getTitle();
            String c = Post.getContent();
            String z = c + t;
            set.put(Post.getId(), split((c + t).toLowerCase()));
        }
        session.close();
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

    public Boolean updateProfile(profile u) {
// System.out.println("u ======     "+u.getAbout()+"  "+u.getFirst_name());
        try {

            SessionFactory sessionfactory = new Configuration().configure().buildSessionFactory();
            Session session = sessionfactory.openSession();
            session.beginTransaction();

            profile x = (profile) session.get(profile.class, 1);
            //  System.out.println(x.toString()+"\n ........................................");
//       session.delete(x);

            x.setFirst_name(u.getFirst_name());
            x.setLast_name(u.getLast_name());
            x.setEmail(u.getEmail());
            x.setPhone(u.getPhone());
            x.setAbout(u.getAbout());
            x.setSocial(u.getSocial());
            /**/
//       File file = new File(request.getParameter("img"));
//       byte[] bytefile= new byte[(int)file.length()];
//       try{
//           FileInputStream fs = new FileInputStream(file);
//           fs.read(bytefile);
//           fs.close();
//           
//           
//       }catch(Exception ex){
//           JOptionPane.showMessageDialog(null, ex);
//       }
//       /**/
            x.setPicture(u.getPicture());
            x.setSocial(u.getSocial());
//            System.out.println("x .............>  "+x.toString());
            session.update(x);
            session.getTransaction().commit();
            session.close();

        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }
}
