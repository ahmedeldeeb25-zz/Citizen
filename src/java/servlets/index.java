/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import entities.category;
import entities.post;
import entities.sub_category;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.test;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;

/**
 *
 * @author Ahmed_Eldeeb
 */
public class index extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        test t = new test();
        Session s = t.openConnection();
        s.beginTransaction();

        //Get main categories List
        Criteria criteria = s.createCriteria(category.class);
        List<category> c = (List<category>) criteria.list();

        //Get first sub-category Posts
        sub_category s_list = (sub_category) s.get(sub_category.class, 1);
        List<post> posts = (List<post>) s_list.getPosts();

        //get First Three posts order B date
        Criteria post_criteria = s.createCriteria(post.class).
                addOrder(Order.desc("date")).setMaxResults(4);

        List<post> postList = (List<post>) post_criteria.list();

        //Requests
        request.setAttribute("categories", c);
        request.setAttribute("fistCat", posts);
        request.setAttribute("three", postList);
        
        s.close();

        //Disoatcher
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.include(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        test t = new test();
        Session s = t.openConnection();
        s.beginTransaction();

        //Get main categories List
        Criteria criteria = s.createCriteria(category.class);
        List<category> c = (List<category>) criteria.list();

        //Get first sub-category Posts
       Criteria post_c= s.createCriteria(post.class).
                addOrder(Order.desc("date")).setMaxResults(4);
        List<post> posts = (List<post>) post_c.list();

        //get First Three posts order B date
        Criteria post_criteria = s.createCriteria(post.class).
                addOrder(Order.desc("date")).setMaxResults(4);

        List<post> postList = (List<post>) post_criteria.list();

        //Requests
        request.setAttribute("categories", c);
        request.setAttribute("fistCat", posts);
        request.setAttribute("three", postList);
        
        

        //Disoatcher
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
