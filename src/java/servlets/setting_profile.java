/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import model.user;
import entities.profile;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.swing.JOptionPane;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Enjoy
 */
@MultipartConfig(maxFileSize = 169999999)
public class setting_profile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public static byte[] readFully(InputStream input) throws IOException {
        byte[] buffer = new byte[50000];
        int bytesRead;
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        while ((bytesRead = input.read(buffer)) != -1) {
            output.write(buffer, 0, bytesRead);
        }
        return output.toByteArray();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        profile x = new profile();
        x.setFirst_name(request.getParameter("fname"));
        x.setLast_name(request.getParameter("lname"));
        x.setEmail(request.getParameter("email"));
        x.setPhone(request.getParameter("phone"));
        x.setAbout(request.getParameter("about"));
        x.setPhone(request.getParameter("phone"));
        x.setSocial(request.getParameter("face") + "\n" + request.getParameter("twitter"));

        Part filepart = request.getPart("img");
        InputStream inputstream = null;

        if (filepart != null) {

            long filesize = filepart.getSize();
            String filecontent = filepart.getContentType();
            inputstream = filepart.getInputStream();

        }
        byte[] bytes = readFully(inputstream);
        x.setPicture(bytes);
        user o = new user();
        // out.print(o.updateProfile(x)+"\n .......................");
        if (o.updateProfile(x)) {
            response.sendRedirect("index");
        } else {
            out.print("false");
        }
        out.close();
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
