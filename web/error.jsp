
<%-- 
    Document   : error
    Created on : Apr 30, 2017, 3:12:13 PM
    Author     : Ahmed_Eldeeb
--%>


<%@ page language="java" contentType="text/html; charset=US-ASCII"
         pageEncoding="US-ASCII" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="include/header.jsp"></jsp:include>


    <!-- PANNER SECTION ================================================= -->
    <section class="error">
        <div class="container">
            <div class="row">
            <% if (response.getStatus() == 404) { %>
            <h1 class="text-center">404</h1>
            <h2 class="text-center">error</h2>
            <p class="text-center">Error Page URL , Go Back To <a href="<c:url value="index" ></c:url>">Home Page</a></p> 
            <% } else if(response.getStatus() == 500) {%>
            <h1 class="text-center"><%=response.getStatus()%></h1>
            <h2 class="text-center">This Content is Not Available</h2>
            <p class="text-center"> Go Back To <a href="<c:url value="index" ></c:url>">Home Page</a></p> 
            <% }else   {%>
            <h1 class="text-center"><%=response.getStatus()%></h1>
            <h2 class="text-center"><%= exception %></h2>
            <p class="text-center"> Go Back To <a href="<c:url value="index" ></c:url>">Home Page</a></p> 
            <% }%>
        </div>
    </div>
</section>

<jsp:include page="include/footer.jsp" ></jsp:include>