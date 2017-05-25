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
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import org.hibernate.Criteria;
import org.hibernate.Session;

/**
 *
 * @author Ahmed_Eldeeb
 */
public class allListing extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        List<Integer> list_id = null;
        List<post> poste = null;
        test t = new test();

        if (request.getParameter("keyword") != null) {

            user u = new user();

            String[] keyword = u.Words(request.getParameter("keyword")).split(" ");

            HashMap<Integer, HashSet<String>> posts = u.postSearch();
            list_id = new ArrayList<Integer>();
            HashMap<Integer, Integer> postscount = new HashMap<Integer, Integer>();

            for (Map.Entry<Integer, HashSet<String>> e : posts.entrySet()) {
                int count = 0;
                for (int i = 0; i < keyword.length; i++) {
                    if (e.getValue().contains(keyword[i])) {
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
            list_id = fin;
            //out.print(list_id);
        }
        if (request.getParameter("cat") != null) {
            int cat = Integer.parseInt(request.getParameter("cat"));
            Session s = t.openConnection();
            s.beginTransaction();
            sub_category c = (sub_category) s.get(sub_category.class, cat);
            if (c != null) {
                poste = (List<post>) c.getPosts();
            }
            s.close();
        } else {
            Session s = t.openConnection();
            s.beginTransaction();
            Criteria c = s.createCriteria(post.class);
            poste = (List<post>) c.list();
            s.close();
        }

        //Send request
        request.setAttribute("poste", poste);
        request.setAttribute("list_id", list_id);

        //Dispatcher
        RequestDispatcher rd = request.getRequestDispatcher("allListing.jsp");
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
