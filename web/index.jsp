
<%@page import="model.Posts"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.hibernate.criterion.Order"%>
<%@page import="model.system_Helper"%>

<%@page import="entities.post"%>
<%@page import="entities.sub_category"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="entities.category"%>
<%@page import="org.hibernate.Session"%>
<%@page import="model.test"%>
<%@page import="java.util.List"%>
<%@page import="entities.post"%>
<%@page import="model.Posts"%>
<%@ page import="com.google.gson.Gson" %>
<%
    List<category> c = (List<category>) request.getAttribute("categories");
    List<post> post_list = (List<post>) request.getAttribute("fistCat");
    List<post> postList = (List<post>) request.getAttribute("three");

    SimpleDateFormat ft
            = new SimpleDateFormat(" yyyy.MM.dd 'at' hh:mm");
%>

<jsp:include page="include/header.jsp" />

<%
    Posts poo = new Posts();
    List<post> posts = poo.getAll();
%>
<%
    double array[][] = new double[posts.size()][2];

    for (int i = 0; i < posts.size(); i++) {
        array[i][0] = Double.parseDouble(posts.get(i).getLat());
        array[i][1] = Double.parseDouble(posts.get(i).getLang());
    }

    String json = new Gson().toJson(array);


%>

<script>
    function loadMap() {
        var mapOptions = {
            center: new google.maps.LatLng(28.0800558, 32.91066409999996
                    ),
            zoom: 6
        }
        var map = new google.maps.Map(document.getElementById("sample"), mapOptions);

        var arr =<%=json%>;
        var length =<%= posts.size()%>
        for (var i = 0; i < length; i++) {
            var marker = new google.maps.Marker({
                position: new google.maps.LatLng(arr[i][0], arr[i][1]),
                map: map,
            });
        }


    }
</script>

<script>
    $(document).ready(function () {
        $("#catFilter ").click(function () {

            $.ajax({
                url: 'ajax/catFilter.jsp',
                type: 'get',
                cache: false,
                data: {cat: this.value},
                success: function (data) {
                    $('.recent-places .row').html(data);
                    //console.log(data);

                },
                error: function () {
                    alert('There is an error');
                }
            });
        });
    });
</script>


<!-- PANNER SECTION ================================================= -->
<section class="panner">

    <div class="panner-back">

        <div class="panner-content">
            <div class="container">
                <div class="row">
                    <div class="page-title">
                        <h1>best deals in one place</h1>
                        <h2>with locations you can find the best deals in your location</h2>
                    </div>

                    <form method="get" action="allListing">

                        <div class="input-group">
                            <input type="text" name="keyword" class="form-control" placeholder="What are you looking for">
                            <span class="input-group-btn">
                                <button type="submit" class="btn btn-default"><i class="fa fa-long-arrow-right"></i>
                                </button>
                            </span>
                        </div>

                    </form>

                </div>
            </div>
        </div>

    </div>

</section>



<!-- MAP SECTION ========================================= -->

<!--<div class="col-sm-12">
    <div id="map-container">-->
<div id="sample"  style="
     min-width:580px;min-height:550px; margin: 5px 5px;
     padding: 6px;
     border-width: 1.5px;
     border-style: solid;
     border-color: #ccc #ccc #999 #ccc;
     -webkit-box-shadow: rgba(64, 64, 64, 0.5) 0 2px 5px;
     -moz-box-shadow: rgba(64, 64, 64, 0.5) 0 2px 5px;
     box-shadow: rgba(64, 64, 64, 0.1) 0 2px 5px;

     "></div>
<!--    </div>
</div>-->





<!-- BROWSE LISTING SECTION ================================================= -->
<section class="listings">
    <h2 class="text-center">browse our listings</h2>
    <div class="container">
        <div class="row">

            <%                if (c.size() > 0) {
                    for (category cat : c) {
            %>

            <div class=" col-sm-6">
                <div class="list-item">
                    <div class="list-title">
                        <div class="icon">
                            <i class="fa fa-suitcase"></i>
                        </div>
                        <h3><%= cat.getName()%></h3>
                    </div>

                    <ul>
                        <%
                            List<sub_category> list = (List<sub_category>) cat.getSub();
                            for (sub_category sub_cat : list) {
                        %>
                        <li value="<%=sub_cat.getId()%>" id="catFilter">
                            <a ><%=sub_cat.getName()%></a>
                            <figure class="count"><%= sub_cat.getPosts().size()%></figure>
                        </li>
                        <% }%>


                    </ul>
                </div>
            </div>
            <% }
            } else {%>
            <h2>No categories Found yet</h2>
            <%}%>

            <div class="clearfix"></div>


        </div>
    </div>
</section>

<!-- RECENT PLACES SECTION ================================================= -->
<section class="recent-places">
    <div class="container">

        <div class="row">


            <%
                int sub_id = post_list.get(0).getCategory().getId();
                if (post_list.size() > 0) {
                    for (post p : post_list) {

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
                        By:<a href="profiles?user_id=<%=p.getUser_id().getId()%>"> 
                            <i><%= p.getUser_id().getFirst_name() + " " + p.getUser_id().getLast_name()%> </i></a>
                    </div>

                </div>
            </div>
            <% }%>
            <div class="col-md-12 text-center">
                <a href="allListing?cat=<%=sub_id%>" class="btn btn-primary btn-rounded">View all listings<i class="fa fa-long-arrow-right"></i></a>
            </div>

            <%  } else {%>
            <h2>No Posts yet</h2>
            <%}%>




            <div class="col-md-12">
                <hr />
            </div>
        </div>
    </div>
</section>



<!-- SUBSCRIPE SECTION ================================================= -->
<section class="subscripe">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h3>Subscribe and be notified about new locations</h3>
            </div>

            <div class="col-md-6">
                <form role="search">

                    <div class="input-group">
                        <input type="text" name="email" class="form-control" placeholder="What are you looking for">
                        <span class="input-group-btn">
                            <button type="submit" class="btn btn-default"><i class="fa fa-long-arrow-right"></i>
                            </button>
                        </span>
                    </div>

                </form>
            </div>
        </div>
    </div>
</section>



<!-- RECENTLY RATED SECTION ================================================= -->
<section class="recently-rated">
    <div class="container">
        <h2>recently rated items</h2>
        <div class="row">
            <div class="col-md-12 col-sm-12">

                <%
                    if (postList.size() > 0) {
                        for (post p : postList) {
                %>
                <div class=" col-sm-12">
                    <div class="media">
                        <div class="media-left">
                            <a href="#">
                                <img class="media-object" src="imageView.jsp?postID=<%= p.getId()%>" >
                            </a>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading"> <a href="detail?post_id=<%=p.getId()%>"> <%= p.getTitle()%> </a> <small><i>Posted on <%=p.getDate()%></i></small> </h4>
                            <%= p.getContent()%><br/>
                            By:<a href="profiles?user_id=<%=p.getUser_id().getId()%>">   <i><%= p.getUser_id().getFirst_name() + " " + p.getUser_id().getLast_name()%> </i></a>
                        </div>

                    </div>
                </div>

                <%}
                } else {%>
                <h2>No Posts</h2>
                <%}%>
            </div>

        </div>
    </div>
</section>



<%@include file="include/footer.jsp" %>