<%-- 
    Document   : addComment
    Created on : Apr 17, 2017, 7:27:44 PM
    Author     : Ahmed_Eldeeb
--%>

 
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="java.util.Date"%>
<%@page import="entities.profile"%>
<%@page import="entities.post"%>
<%@page import="entities.comment"%>
<%@page import="org.hibernate.Session"%>
<%@page import="model.test"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    SimpleDateFormat ft
            = new SimpleDateFormat(" yyyy.MM.dd");
    String comment = request.getParameter("comment");
    int post_id = Integer.parseInt(request.getParameter("post_id"));
    int user_id = Integer.parseInt(session.getAttribute("userID").toString());

    test t = new test();
    Session s = t.openConnection();
    comment c = new comment();
    post Post = (post) s.get(post.class, post_id);
    profile user = (profile) s.get(profile.class, user_id);

    s.beginTransaction();
    c.setContent(comment);
    c.setPost_id(Post);
    c.setUser_id(user);
    c.setDate(new Date());
    Post.getComments().add(c);
    user.getComments().add(c);

    s.save(c);

    s.getTransaction().commit();
    s.close();

/////////////Display all Comments//////////////// 
    


    List<comment> comments =(List<comment>) Post.getComments();
  
   for(comment com:comments){
%>

<div class="review">
    <div class="image">
        <img src="imageView.jsp?user_id=<%= com.getUser_id().getId() %>" class="img-responsive center-block" alt="locations person">
    </div>

    <div class="discription">
        <figure>
            <span class="date">03.02.2017</span>
            <p>
                <%= com.getContent() %>
            </p>
        </figure>
    </div>
</div>

<%}%>
