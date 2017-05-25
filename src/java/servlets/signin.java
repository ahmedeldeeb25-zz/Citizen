/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import model.user;
import entities.profile;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ahmed_Eldeeb
 */
public class signin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();

        if (session.getAttribute("userID") == null) {
            if (request.getParameter("login") != null) {
                profile u = new profile();
                user a = new user();

                u.setEmail(request.getParameter("Email"));
                u.setPassword(request.getParameter("Password"));

                profile user = a.login(u);
                if (user != null) {
                    session.setAttribute("userID", user.getId());
                    session.setAttribute("from", "0");
                    session.setAttribute("to", "0");
                    session.setAttribute("userName", user.getFirst_name() + " " + user.getLast_name());
                    response.sendRedirect("index");
                    return;
                } else {
                    request.setAttribute("error", "Invalid username or password");
                    RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
                    rd.include(request, response);
                }

            } else {
                RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
                rd.forward(request, response);
            }
        } else {
            response.sendRedirect("profile.jsp");
        }

    }

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
