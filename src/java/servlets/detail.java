/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import entities.post;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import model.Posts;
import model.Suggests;
import model.test;
import org.hibernate.Session;

/**
 *
 * @author Ahmed_Eldeeb
 */
public class detail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

//        if (session.getAttribute("from") != null) {
//            if (String.valueOf(session.getAttribute("from")) == "0") {
//                session.setAttribute("from", request.getParameter("post_id"));
//                JOptionPane.showMessageDialog(null, "34");
//            } else {
//                session.setAttribute("to", request.getParameter("post_id"));
//                JOptionPane.showMessageDialog(null, "102");
//                int from=Integer.parseInt(String.valueOf(session.getAttribute("from")));
//                int to=Integer.parseInt(String.valueOf(session.getAttribute("to")));
//                Suggests s=new Suggests();
//                s.updatesuggest(from, to);
//            }
//           
//        }

        if (request.getParameter("delete") != null) {

            int id = Integer.parseInt(request.getParameter("delete"));
            int userId = Integer.parseInt(String.valueOf(session.getAttribute("userID")));
            Posts posts = new Posts();
            post p = posts.getPost(id);

            if (userId == p.getUser_id().getId()) {
                posts.deletePost(p);
            }
            response.sendRedirect("profiles");

        } else {
            int post_id = Integer.parseInt(request.getParameter("post_id"));

            post p;
            test t = new test();

            Session s = t.openConnection();
            s.beginTransaction();
            p = (post) s.get(post.class, post_id);
            request.setAttribute("p", p);

            Suggests su = new Suggests();

            int spost_id = Integer.parseInt(request.getParameter("post_id"));

            request.setAttribute("suggestedPosts", su.sort(su.suggestpost(spost_id)));

            request.getRequestDispatcher("detail.jsp").include(request, response);
///////////////////////////
            int hitsCount = p.getVisit();

            if (hitsCount == 0) {
                hitsCount = 1;
            } else {
                hitsCount += 1;
            }
            p.setVisit(hitsCount);
            s.save(p);
            s.getTransaction().commit();
            s.close();
            /////////////////////
        }

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
