
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="model.system_Helper"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entities.post"%>
<%@page import="entities.sub_category"%>
<%@page import="model.test"%>
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
    int sum=0;
    sub_category sub = (sub_category) s.get(sub_category.class, id);
    List<post> post_list = (List<post>) sub.getPosts();
    if (post_list.size() > 0  ) {
        if(post_list.size() >=3)
            sum=3;
        else
            sum=post_list.size();
        for (post p : post_list.subList(0, sum)) {

%>

<div class=" col-sm-12">
    <div class="media">
        <div class="media-left">
            <a href="#">
                <% if (p.getPic() != null) {%>
                <img class="media-object" src="imageView.jsp?postID=<%= p.getId()%>" >
                <%} else {%>
                <img class="media-object" src="style/img/default.png" >
                <%}%>
            </a>
        </div>
        <div class="media-body">
            <h4 class="media-heading"> <a href="detail?post_id=<%=p.getId()%>"> <%=p.getTitle()%> </a> 
                <small><i>Posted on <%=ft.format(p.getDate())%></i></small> </h4>
            <%= p.getContent()%><br/>
            By:<a href="profiles?user_id=<%=p.getUser_id().getId()%>">  <i><%= p.getUser_id().getFirst_name() + " " + p.getUser_id().getLast_name()%> </i></a>
        </div>

    </div>
</div>
<% }%>


<div class="col-md-12 text-center">
    <a href="allListing?cat=<%=id%>" class="btn btn-primary btn-rounded">View all listings<i class="fa fa-long-arrow-right"></i></a>
</div>

<%} else {%>
<h2>No Posts Now in this Category</h2>
<%}%>
<div class="col-md-12">
    <hr />
</div>