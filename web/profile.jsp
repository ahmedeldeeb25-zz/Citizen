<%@page import="entities.profile"%>
<%@page import="model.user"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="entities.post"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 



<%@include file="include/header.jsp" %>

<%
    user u = new user();
    profile pr = u.getUser(Integer.parseInt(String.valueOf(session.getAttribute("userID"))));
%>
<!-- PATH SECTION ================================================= -->
<section class="path">
    <div class="container">

        <div class="row">
            <ol>
                <li><a href="index">home / </a></li>
                <li><a href="profile"> your profile</a></li>
            </ol>

            <div id="setting">
                <i class="fa fa-cogs" aria-hidden="true"></i> <a href="setting"> Setting</a>
            </div>

        </div>

    </div>
</section>

<!-- SIGNIN SECTION ================================================= -->
<section class="signin profile">
    <div class="container">
        <div class="row">



            <div class="col-sm-push-2 col-md-8 col-sm-6">
                <h1 class="text-center"><%= pr.getFirst_name()+" "+pr.getLast_name() %></h1>

                <div class="col-md-12">
                    <div class=" text-center profile-image">
                        <%if (pr.getPicture() == null) { %>
                        <img src="style/img/default.png" class="img-responsive center-block" alt="my profile image">    
                        <%} else {%>
                        <img src="userImage.jsp?userID=<%= session.getAttribute("userID")%>" class="img-responsive center-block" alt="my profile image">    
                        <%}%>
                    </div> 
                </div>

            </div>

            <section class="my-listings">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h2>my listings</h2>
                        </div>
                    </div>

                    <%
                        //List<post> userPosts =(ArrayList<post>)request.getAttribute("userPost");
                        List<post> userPosts = (List<post>) request.getAttribute("userPost");
                        if (userPosts.size() > 0) { %>
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

                                    <tbody>

                                        <% for (post p : userPosts) {%>
                                        <tr class="my-item">
                                            <td>
                                                <div class="image-wrapper">
                                                    <a class="image img-responsive" href="editlisting.html">
                                                        <img class="media-object" src="imageView.jsp?postID=<%= p.getId()%>" >
                                                    </a>
                                                </div>

                                                <div class="info">
                                                    <a href="detail?post_id=<%= p.getId() %>"><h3><%= p.getTitle()%></h3></a>
                                                    <figure class="location"><%= p.getCity().getName()%></figure>											 
                                                </div>
                                            </td>
                                            <td class="viwes"><%= p.getVisit()%></td>
                                            <td class="reviwes"><%= p.getComments().size()%></td>

                                            <td class="last-edited">
                                                Today 15:30

                                                <% if ((session.getAttribute("userID") != null && request.getParameter("user_id") == null) || request.getParameter("user_id") == session.getAttribute("userID")) {%>
                                                <div class="edit-options">
                                                    <a href="AddPost?post_id=<%= p.getId()%>" class="link icon"><i class="fa fa-edit"></i>Edit</a>
                                                    <c:url value="detail" var="base" />
                                                    <a href="${base}?post_id=<%= p.getId()%>" class="link icon"><i class="fa fa-comment"></i>Reviews</a>
                                                    <a href="${base}?delete=<%= p.getId()%>" class="delete link icon"><i class="fa fa-trash"></i>Delete</a>

                                                </div>
                                                <% } %>
                                            </td>
                                        </tr>
                                        <%}%>

                                    </tbody>

                                </table>
                            </div>
                        </div>


                    </div>
                    <% } else { %>
                    <h2>No posts yet</h2>
                    <%}%>
                </div>

            </section>
        </div>
    </div>


</section>

</div>     



</div>
</div>
</section>



<%@include file="include/footer.jsp" %>