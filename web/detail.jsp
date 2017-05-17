<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="entities.comment"%>
<%@page import="entities.comment"%>
<%@page import="org.hibernate.Session"%>
<%@page import="model.test"%>
<%@page import="entities.post"%>
<%
    /*int post_id = Integer.parseInt(request.getParameter("post_id"));

    post p;
    test t = new test();

    Session s = t.openConnection();
    p = (post) s.get(post.class, post_id);
     */
    post p = (post) request.getAttribute("p");

%>
<%@include file="include/header.jsp" %>
<script>
    $(document).ready(function () {
        $(".send-review").click(function () {
            var content = $('.comment-content').val();
            var p_id = $("#post_id").val();
            if ($('.comment-content').val() != "") {

                $.ajax({
                    url: 'ajax/addComment.jsp',
                    type: 'post',
                    cache: false,
                    data: {post_id: p_id, comment: content},
                    success: function (data) {
                        $('.reviews').html(data);
                        console.log(data);
                        $('.comment-content').val("");
                    },
                    error: function () {
                        alert('There is an error');
                    }
                });
            }
        });
    });
</script>
<!-- PATH SECTION ================================================= -->
<input type="hidden" value="<%= p.getId()%>" id="post_id" />
<section class="path">
    <div class="container">

        <div class="row">
            <ol>
                <li><a href="index.html">home / </a></li>
                <li><a href="detail.html"><%=p.getTitle()%></a></li>
            </ol>
        </div>

    </div>
</section>

<section class="owel">

    <div class="container">
        <div class="row">
            <h2><%= p.getTitle()%></h2> 
            <h3><%= p.getCity().getName()%></h3>


        </div>
    </div>

    <div class="text-center">
        <img class="thumbnail" style="margin:20px auto;width: 434px; height:293"  src="imageView.jsp?postID=<%= p.getId()%>" >
<!--        <img class="thumbnail" src="style/img/item-2.jpg" style="
             margin:20px auto;
             ">-->
    </div>
</section>

<!-- About This List Section ================================================= -->
<section class="about-list">
    <div class="container">
        <div class="row">

            <div class="col-md-8 text-justify" style="width: 500px;">
                <div class="about-list-content">
                    <p class="lead"><%= p.getContent()%></p>
                </div>
            </div>

            <div class="col-md-7 col-sm-7">


                <div class="reviews">
                    <h2>reviews</h2>
                    <%
                        List<comment> list = (List<comment>) p.getComments();
                        if (list.size() > 0) {
                            for (comment com : list) {
                    %>
                    <div class="review">
                        <div class="image">
                            <img src="imageView.jsp?user_id=<%= com.getUser_id().getId()%>" class="img-responsive center-block" alt="locations person">
                        </div>

                        <div class="discription">
                            <figure>
                                <span class="date">03.02.2017</span>
                                <p>
                                    <%= com.getContent()%>
                                </p>
                            </figure>
                        </div>
                    </div>
                    <%}
                    } else {%>
                    <h3>No Reviews Yet.</h3>
                    <%}%>

                </div>

                <div class="write-review">
                    <h2>write a review</h2>

                    <div class="clearfix form inputs-underline">
                        <div class="box">
                            <div class="comment">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="comment-title">
                                            <h4>review your experience</h4>
                                        </div>



                                        <div class="form-group">
                                            <label>your message <em>*</em></label>
                                            <textarea name="name" class="form-control comment-content" placeholder="Describe your experience" required="" rows="8"></textarea>
                                        </div>
                                    </div>



                                </div>
                            </div>

                            <div class="form-group">
                                <%
                                    if (session.getAttribute("userID") == null) {
                                %>
                                <a type="submit" href="<c:url value="signin" />" class="btn btn-primary btn-rounded">send review</a>
                                <%} else { %>
                                <a type="submit" class="btn btn-primary btn-rounded send-review">send review</a>
                                <%}%>
                            </div>

                        </div>
                    </div>
                </div>

            </div>

            <div class="col-md-5 col-sm-5">
                <div class="detail-sidebar">
                    <div class="detail-map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3453.7961716107397!2d31.221992714427266!3d30.042704981882846!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x145840d12f1cc3c1%3A0xde3e1b56b22e91f8!2sCairo+Opera+House!5e0!3m2!1sen!2seg!4v1489375607242" width="100%" height="310px" background-color: "rgb(229, 227, 223)" frameborder="0" style="border:0" allowfullscreen></iframe>
                    </div>

                    <div class="content">
                        <address>
                            <figure>
                                <i class="fa fa-map-marker"></i>
                                3858 Elgalaa Street
                            </figure>
                            <figure>
                                <i class="fa fa-envelope"></i>
                                <a href="#">email@example.com</a>
                            </figure>
                            <figure>
                                <i class="fa fa-phone"></i>
                                01154609899
                            </figure>
                            <figure>
                                <i class="fa fa-globe"></i>
                                <a href="#">www.locations-events.bitballoon.com</a>
                            </figure>
                        </address>
                    </div>

                </div>



            </div>
        </div>
    </div>
</section>

<hr/>

<div class="row">
    <div class="container">
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <img src="style/img/milan.jpg">
                <div class="caption">
                    <h3>Post Number one</h3>
                    <p>lorum epsum foren proum lorum epsum foren proum lorum epsum foren proum</p>
                </div>
            </div>
        </div>
        
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <img src="style/img/milan.jpg">
                <div class="caption">
                    <h3>Post Number one</h3>
                    <p>lorum epsum foren proum lorum epsum foren proum lorum epsum foren proum</p>
                    
                </div>
            </div>
        </div>
        
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <img src="style/img/milan.jpg">
                <div class="caption">
                    <h3>Post Number one</h3>
                    <p>lorum epsum foren proum lorum epsum foren proum lorum epsum foren proum</p>
                </div>
            </div>
        </div>
    </div>
</div>





<%@include file="include/footer.jsp" %>

