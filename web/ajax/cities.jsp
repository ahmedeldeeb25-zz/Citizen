<%@page import="model.Cities"%>
<%@page import="java.util.List"%>
<%@page import="entities.city"%>
<%@page import="entities.govern"%>
<%

    int id = Integer.parseInt(request.getParameter("govern"));
    Cities city=new Cities();

    List<city> sub = city.getCities(id);

    for (city c : sub) {
%>
<option value="<%= c.getId()%>" ><%= c.getName()%></option>
<% } %>