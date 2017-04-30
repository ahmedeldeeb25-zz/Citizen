/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import entities.post;
import java.io.IOException;
 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.test;
import model.user;
import entities.sub_category;
import javax.servlet.RequestDispatcher;
import org.hibernate.Criteria;
import org.hibernate.Session;
 
/**
 *
 * @author Ahmed_Eldeeb
 */
public class allListing extends HttpServlet {

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

        List<Integer> list_id = null;
        List<post> poste = null;
        test t = new test();

        if (request.getParameter("keyword") != null) {
            String keyword = request.getParameter("keyword");
            user u = new user();

            HashMap<Integer, HashSet<String>> posts = u.postSearch();
            list_id = new ArrayList<Integer>();
            for (Map.Entry<Integer, HashSet<String>> e : posts.entrySet()) {
                if (e.getValue().contains(keyword)) {
                    list_id.add(e.getKey());
                    //out.print(e.getKey());
                }
            }
        }
        if (request.getParameter("cat") != null) {
            int cat = Integer.parseInt(request.getParameter("cat"));
            Session s = t.openConnection();
            s.beginTransaction();
            sub_category c = (sub_category) s.get(sub_category.class, cat);
            if( c!= null)
            poste = (List<post>) c.getPosts();

        } else {
            Session s = t.openConnection();
            s.beginTransaction();
            Criteria c = s.createCriteria(post.class);
            poste = (List<post>) c.list();
        }
        
        //Send request
        request.setAttribute("poste", poste);
        request.setAttribute("list_id", list_id);
        
        //Dispatcher
        RequestDispatcher rd=request.getRequestDispatcher("allListing.jsp");
        rd.include(request, response);
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
