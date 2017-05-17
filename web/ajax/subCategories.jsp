<%-- 
    Document   : subCategories
    Created on : May 2, 2017, 10:32:27 PM
    Author     : Ahmed_Eldeeb
--%>

<%@page import="java.util.List"%>
<%@page import="entities.sub_category"%>
<%@page import="model.Categories"%>
<%

    int cat = Integer.parseInt(request.getParameter("cat"));
    Categories cats = new Categories();

    List<sub_category> sub = cats.getSubCategories(cat);

    for (sub_category c : sub) {
%>
<option value="<%= c.getId()%>" ><%= c.getName()%></option>
<% } %>

