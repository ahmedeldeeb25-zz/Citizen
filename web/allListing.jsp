
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entities.sub_category"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entities.post"%>
<%@page import="org.hibernate.Session"%>
<%@page import="model.test"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="model.user"%>
<%
    test t = new test();
    List<Integer> list_id = (List<Integer>) request.getAttribute("list_id");
    List<post> poste = (List<post>) request.getAttribute("poste");

    SimpleDateFormat ft
            = new SimpleDateFormat(" yyyy.MM.dd 'at' hh:mm");
%>

<%@include file="include/header.jsp" %>
<style>
      
      #map {
        height: 100%;
      }
     
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #description {
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
      }

      #infowindow-content .title {
        font-weight: bold;
      }

      #infowindow-content {
        display: none;
      }

      #map #infowindow-content {
        display: inline;
      }

      .pac-card {
        margin: 10px 10px 0 0;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
        background-color: #fff;
        font-family: Roboto;
      }

      #pac-container {
        padding-bottom: 12px;
        margin-right: 12px;
      }

      .pac-controls {
        display: inline-block;
        padding: 5px 11px;
      }

      .pac-controls label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }

      #pac-input {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 400px;
      }

      #pac-input:focus {
        border-color: #4d90fe;
      }

      #title {
        color: #fff;
        background-color: #4d90fe;
        font-size: 25px;
        font-weight: 500;
        padding: 6px 12px;
      }
      #target {
        width: 345px;
      }
    </style>

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
                                            <img class="media-object" src="imageView.jsp?postID=<%= p.getId()%>" >
                                        </a>
                                    </div>

                                    <div class="info">
                                        <a href="detail.html"><h3><%= p.getTitle()%></h3></a>
                                        <figure class="location"><%= p.getCity().getName() %></figure>
                                        <figure class="label label-info"><%= p.getCategory().getName() %></figure>
                                    </div>
                                </td>

                                <td class="viwes"><%= p.getVisit()%></td>
                                <td class="reviwes"><%= p.getComments().size()%></td>


                                <td class="last-edited">
                                    <%=ft.format(p.getDate())%>  
                                </td>
                            </tr>
                        </tbody>
                        <%
                            }
                        } else if (poste.size() > 0) {
                            for (post po : poste) {
                        %>

                        <tbody>
                            <tr class="my-item">
                                <td>

                                    <div class="image-wrapper">
                                        <a class="image img-responsive" href="editlisting.html">
                                            <img class="media-object" src="imageView.jsp?postID=<%= po.getId()%>" >
                                        </a>
                                    </div>

                                    <div class="info">
                                        <a href="detail.jsp?post_id=<%=po.getId()%>"><h3><%= po.getTitle()%></h3></a>
                                        <figure class="location"><%= po.getCity().getName()%></figure>
                                        <figure class="label label-info">restaurant</figure>
                                    </div>
                                </td>

                                <td class="viwes"><%= po.getVisit()%></td>
                                <td class="reviwes"><%= po.getComments().size()%></td>


                                <td class="last-edited">
                                    <%=ft.format(po.getDate())%>


                                </td>
                            </tr>
                        </tbody>



                        <% }
                        } else {%>
                        <h2>No available Posts Yet</h2>
                        <% }%>

                    </table>
                </div>
            </div>


        </div>
    </div>
</section>




<%@include file="include/footer.jsp" %>