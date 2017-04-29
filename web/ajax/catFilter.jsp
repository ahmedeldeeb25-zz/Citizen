
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="classes.system_Helper"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entities.post"%>
<%@page import="entities.sub_category"%>
<%@page import="classes.test"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="entities.category"%>
<%@page import="entities.category"%>
<%@page import="org.hibernate.Session"%>
<%

    int id = Integer.parseInt(request.getParameter("cat"));
    test t = new test();
    system_Helper helper = new system_Helper();
    Session s = t.openConnection();
    s.beginTransaction();

    Criteria criteria = s.createCriteria(category.class);

    List<category> c = (List<category>) criteria.list();
    SimpleDateFormat ft
            = new SimpleDateFormat(" yyyy.MM.dd 'at' hh:mm");
%>

<%
    
    sub_category sub = (sub_category) s.get(sub_category.class, id);
    List<post> post_list = (List<post>) sub.getPosts();
    if(post_list !=null){
    for (post p : post_list) {

%>

<div class=" col-sm-12">
    <div class="media">
        <div class="media-left">
            <a href="#">
                <img class="media-object" src="style/img/item-1.jpg" >
            </a>
        </div>
        <div class="media-body">
            <h4 class="media-heading"> <a href="detail.jsp?post_id=<%=p.getId()%>"> <%=p.getTitle()%> </a> 
                <small><i>Posted on <%=ft.format(p.getDate())%></i></small> </h4>
            <%= p.getContent()%><br/>
            By:<a href="profile.jsp?user_id=<%=p.getUser_id().getId()%>">  <i><%=helper.getUserName(s, p.getUser_id().getId())%> </i></a>
        </div>

    </div>
</div>
<% }%>


<div class="col-md-12 text-center">
    <a href="allListing.jsp?cat=<%=id%>" class="btn btn-primary btn-rounded">View all listings<i class="fa fa-long-arrow-right"></i></a>
</div>

<%}else{%>
<h2>No Posts Now in this Category</h2>
<%}%>
<div class="col-md-12">
    <hr />
</div>