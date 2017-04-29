<%@page import="java.util.List"%>
<%@page import="entities.comment"%>
<%@page import="entities.comment"%>
<%@page import="org.hibernate.Session"%>
<%@page import="classes.test"%>
<%@page import="entities.post"%>
<%
    int post_id = Integer.parseInt(request.getParameter("post_id"));

    post p;
    test t = new test();

    Session s = t.openConnection();
    p = (post) s.get(post.class, post_id);


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
                       $('.review').html(data);
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
<input type="hidden" value="<%=post_id%>" id="post_id" />
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
        <img class="thumbnail" src="style/img/item-2.jpg" style="
             margin:20px auto;
             ">
    </div>
</section>

<!-- About This List Section ================================================= -->
<section class="about-list">
    <div class="container">
        <div class="row">
            <div class="col-md-7 col-sm-7">
                <div class="about-list-content">

                    <p><%= p.getContent()%></p>
                </div>



                <div class="reviews">
                    <h2>reviews</h2>
                    <%
                        List<comment> list = (List<comment>) p.getComments();

                        if (list.size() > 0) {
                    %>
                    <%} else {%>
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
                                <a type="submit" class="btn btn-primary btn-rounded send-review">send review</a>
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



<%@include file="include/footer.jsp" %>

<% s.close();%>