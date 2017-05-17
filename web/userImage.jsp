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
    if (request.getParameter("userID") != null) {
        int id = Integer.parseInt(request.getParameter("userID"));

        response.setContentType("image/*");
        user u=new user();

        OutputStream os;

        byte[] img = u.getUser(id).getPicture();
        os = response.getOutputStream();
        os.write(img);
        os.flush();
        os.close();

    }
%>
