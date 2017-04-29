
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entities.sub_category"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entities.post"%>
<%@page import="org.hibernate.Session"%>
<%@page import="classes.test"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="classes.user"%>
<%
    List<Integer> list_id = null;
    List<post> poste = null;
    test t = new test();

    if (request.getParameter("keyword") != null) {
        String keyword = request.getParameter("keyword");
        user u = new user();

        HashMap<Integer, HashSet<String>> posts = u.postSearch();
list_id = new ArrayList<Integer>();
        for (Map.Entry<Integer, HashSet<String>> e : posts.entrySet()) {
            if (e.getValue().contains(keyword)) {
                list_id.add(e.getKey());
                //out.print(e.getKey());
            }
        }
    } 
    if (request.getParameter("cat") != null) {
        int cat = Integer.parseInt(request.getParameter("cat"));
        Session s = t.openConnection();
        s.beginTransaction();
        sub_category c = (sub_category) s.get(sub_category.class, cat);
        poste = (List<post>) c.getPosts();

    }
    else{
        Session s = t.openConnection();
        s.beginTransaction();
        Criteria c=s.createCriteria(post.class);
        poste = (List<post>) c.list();
    }
    SimpleDateFormat ft
            = new SimpleDateFormat(" yyyy.MM.dd 'at' hh:mm");
%>

<%@include file="include/header.jsp" %>

<!-- PATH SECTION ================================================= -->
<section class="path mylistings-path">
    <div class="container">

        <div class="row">
            <ol>
                <li><a href="index.html">home / </a></li>
                <li><a href="mylistings.html"> All Listing</a></li>
            </ol>
        </div>

    </div>
</section>

<!-- listings ================================================= -->
<section class="my-listings">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>All Listing</h2>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="my-items table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <td>listings</td>
                                <td>views</td>
                                <td>reviews</td>                                
                                <td>last edited</td>
                            </tr>
                        </thead>






                        <%
                            Session s = t.openConnection();
                            if (list_id != null) {
                                for (int id : list_id) {
                                    post p = (post) s.get(post.class, id);


                        %>
                        <tbody>
                            <tr class="my-item">
                                <td>
                                    <div class="image-wrapper">
                                        <a class="image img-responsive" href="editlisting.html">
                                            <img src="style/img/item-4.jpg" alt="locations items">
                                        </a>
                                    </div>

                                    <div class="info">
                                        <a href="detail.html"><h3><%= p.getTitle()%></h3></a>
                                        <figure class="location">shebin</figure>
                                        <figure class="label label-info">restaurant</figure>
                                    </div>
                                </td>

                                <td class="viwes">426</td>
                                <td class="reviwes">43</td>
                                 

                                <td class="last-edited">
                                    <%=ft.format(p.getDate())%>  
                                </td>
                            </tr>
                        </tbody>
                        <%
                        }}  else if(poste != null) {
                            for (post po : poste) {                       
                        %>

                        <tbody>
                            <tr class="my-item">
                                <td>
                                    <div class="image-wrapper">
                                        <a class="image img-responsive" href="editlisting.html">
                                            <img src="style/img/item-4.jpg" alt="locations items">
                                        </a>
                                    </div>

                                    <div class="info">
                                        <a href="detail.jsp?post_id=<%=po.getId()%>"><h3><%= po.getTitle() %></h3></a>
                                        <figure class="location"><%= po.getCity().getName() %></figure>
                                        <figure class="label label-info">restaurant</figure>
                                    </div>
                                </td>

                                <td class="viwes">426</td>
                                <td class="reviwes">43</td>
                                

                                <td class="last-edited">
                                    <%=ft.format(po.getDate())%>

                                     
                                </td>
                            </tr>
                        </tbody>



                        <% }
                            }%>

                    </table>
                </div>
            </div>


        </div>
    </div>
</section>




<%@include file="include/footer.jsp" %>