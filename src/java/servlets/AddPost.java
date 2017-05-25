/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import entities.city;
import model.Post_Controller;
import entities.post;
import entities.profile;
import entities.sub_category;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import model.Categories;
import model.Cities;
import model.Posts;
import model.user;

/**
 *
 * @author Enjoy
 */
@MultipartConfig(maxFileSize = 169999999)
public class AddPost extends HttpServlet {

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

        HttpSession session = request.getSession();

        if (request.getParameter("Addpost") != null) {
            user u = new user();
            profile user = u.getUser(Integer.parseInt(String.valueOf(session.getAttribute("userID"))));
            //

            Cities city = new Cities();
            city c = city.getCity(Integer.parseInt(request.getParameter("city")));
            //

            Categories cats = new Categories();
            sub_category sub = cats.getSubCategory(Integer.parseInt(request.getParameter("city")));
//
            post x = new post();

            x.setAddress(request.getParameter("address"));
            x.setContent(request.getParameter("desc"));
            x.setDate(new Date());
            x.setPhone(request.getParameter("phone"));
            x.setEmail(request.getParameter("email"));
            x.setWebsite(request.getParameter("web"));
            x.setVideo_url(request.getParameter("url"));
            x.setTitle(request.getParameter("title"));
            x.setLang(request.getParameter("lang"));
            x.setLat(request.getParameter("lat"));

//            out.print(request.getParameter("address"));
//            out.print(request.getParameter("desc"));
//            out.print(request.getParameter("phone"));
//            out.print(request.getParameter("email"));
//            out.print(request.getParameter("web"));
//            out.print(request.getParameter("url"));
//            out.print(request.getParameter("title"));
//            out.print(request.getParameter("lang"));
//            out.print(request.getParameter("lat"));
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

            user.getPosts().add(x);
            c.getPosts().add(x);
            sub.getPosts().add(x);

            x.setUser_id(user);
            x.setCity(c);
            x.setCategory(sub);

            Post_Controller a = new Post_Controller();
            if (a.addPost(x) == "true") {
                response.sendRedirect("index");
                return;
            }
            out.print("Error");

            out.close();
        } else if (request.getParameter("updatePost") != null) {

            int postID = Integer.parseInt(request.getParameter("update"));
            user u = new user();
            profile user = u.getUser(Integer.parseInt(String.valueOf(session.getAttribute("userID"))));

            Cities city = new Cities();
            city c = city.getCity(Integer.parseInt(request.getParameter("city")));
           // city c = city.getCity(1);

            Categories cats = new Categories();
            sub_category sub = cats.getSubCategory(Integer.parseInt(request.getParameter("cat")));
           // sub_category sub = cats.getSubCategory(1);

            post x = new post();

            x.setAddress(request.getParameter("address"));
            x.setContent(request.getParameter("desc"));
            x.setDate(new Date());
            x.setPhone(request.getParameter("phone"));
            x.setEmail(request.getParameter("email"));
            x.setWebsite(request.getParameter("web"));
            x.setVideo_url(request.getParameter("url"));
            x.setTitle(request.getParameter("title"));
            x.setLang(request.getParameter("lang"));
            x.setLat(request.getParameter("lat"));

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

            user.getPosts().add(x);
            c.getPosts().add(x);
            sub.getPosts().add(x);

            x.setUser_id(user);
            x.setCity(c);
            x.setCategory(sub);

            Post_Controller a = new Post_Controller();
            a.updatePost(x, postID);

            out.close();
            return;
        } else if (request.getParameter("post_id") != null) {

            Posts post = new Posts();

            post p = post.getPost(Integer.parseInt(request.getParameter("post_id")));

            request.setAttribute("post", p);

            RequestDispatcher rd = request.getRequestDispatcher("updatePost.jsp");
            rd.forward(request, response);
            return;

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
