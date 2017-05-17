<%-- 
    Document   : imageView
    Created on : May 2, 2017, 9:01:12 PM
    Author     : Ahmed_Eldeeb
--%>

<%@page import="model.user"%>
<%@page import="model.Posts"%>
<%@page import="java.io.OutputStream"%>
<%@page import="entities.profile"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
    if (request.getParameter("postID") != null) {
        int postID = Integer.parseInt(request.getParameter("postID"));

        response.setContentType("image/*");
        Posts post = new Posts();

        OutputStream os;

        byte[] img = post.getPost(postID).getPic();
        os = response.getOutputStream();
        os.write(img);
        os.flush();
        os.close();

    } else if (request.getParameter("user_id") != null) {
        int userID = Integer.parseInt(request.getParameter("user_id"));

        response.setContentType("image/*");
        user u = new user();

        OutputStream os;

        byte[] img = u.getUser(userID).getPicture();
        os = response.getOutputStream();
        os.write(img);
        os.flush();
        os.close();

    }
%>
