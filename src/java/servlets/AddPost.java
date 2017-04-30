/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import model.Post_Controller;
import entities.post;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

/**
 *
 * @author Enjoy
 */
@MultipartConfig(maxFileSize = 169999999)
public class AddPost extends HttpServlet {

    /**
     * ******************************************
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

    /**
     * ************************************************
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        if(request.getParameter("Addpost") != null){
        post x = new post();
        x.setAddress(request.getParameter("address"));

        x.setContent(request.getParameter("desc"));
        x.setDate(new Date());
        x.setPhone(request.getParameter("phone"));
        x.setEmail(request.getParameter("email"));
        x.setWebsite(request.getParameter("web"));
        x.setVideo_url(request.getParameter("url"));
        x.setTitle(request.getParameter("title"));

        System.out.println(".......................");
        Part filepart = request.getPart("img");
        
        InputStream inputstream = null;

        if (filepart != null) {

            long filesize = filepart.getSize();
            String filecontent = filepart.getContentType();
            inputstream = filepart.getInputStream();

        }
        System.out.println("...................");
        byte[] bytes = readFully(inputstream);
        x.setPic(bytes);

        Post_Controller a = new Post_Controller();
        out.print(a.addPost(x));

        out.close();
        }
        RequestDispatcher rd = request.getRequestDispatcher("addpost.jsp");
         rd.forward(request, response);

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
