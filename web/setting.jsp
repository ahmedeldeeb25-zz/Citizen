<%@page import="javax.swing.JOptionPane"%>
<%@page import="entities.profile"%>
<%@page import="model.user"%>
<jsp:include page="include/header.jsp"></jsp:include>


<%
    user u = new user();
    profile p = u.getUser(Integer.parseInt(String.valueOf(session.getAttribute("userID"))));
%>
<!-- PATH SECTION ================================================= -->
<section class="path">
    <div class="container">

        <div class="row">
            <ol>
                <li><a href="index.html">home / </a></li>
                <li><a href="profile.html"> your profile</a></li>
            </ol>
        </div>

    </div>
</section>

<%
%>

<!-- SIGNIN SECTION ================================================= -->
<section class="signin profile">
    <div class="container">
        <div class="row">

            <div class="container">
                <div class="row">

                    <div class="col-sm-push-2 col-md-8 col-sm-6">
                        <h1 class="text-center">your profile</h1>

                        <div class="col-md-12">
                            <div class=" text-center profile-image">
                                <%if (p.getPicture() == null) { %>
                                <img src="style/img/default.png" class="img-responsive center-block" alt="my profile image">    
                                <%} else {%>
                                <img src="userImage.jsp?userID=<%= session.getAttribute("userID")%>" class="img-responsive center-block" alt="my profile image">    
                                <%}%>
                            </div> 
                        </div>

                        <div class="col-md-12">
                            <div class="text-center">

                            </div>

                        </div>

                        <div class="col-md-12">
                            <div class="text-center">
                                <!--                                   <form>
                                                               
                                                               </form>
                                                                     
                                                                </div>
                                                            </div>-->

                                <form action="setting_profile" method="post" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label class="custom-file-upload">Change Profile
                                            <input id="ProfileUpload" name ="img" type="file"  accept="image/*">
                                        </label>

                                    </div>
                                    <div class="col-md-12">
                                        <h3>about you</h3>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>first name</label>
                                            <input type="text" name="fname" value="<%= p.getFirst_name()%>" class="form-control" placeholder="">
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>last name</label>
                                            <input type="text" name="lname" value="<%= p.getLast_name()%>" class="form-control" placeholder="">
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>email</label>
                                            <input type="text" name="email" value="<%= p.getEmail()%>" class="form-control" placeholder="">
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>phone</label>
                                            <input type="text" name="phone" value="<%= p.getPhone()%>" class="form-control" placeholder="">
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>about you</label>
                                            <textarea   name="about" rows="4" class="form-control" placeholder="something about you"><%= p.getAbout()%></textarea>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <h3>Your Social Networks</h3>
                                        </div>


                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>facebook</label>
                                                <input type="text" name="face" value="" class="form-control" placeholder="Facebook">
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>twitter</label>
                                                <input type="text" value="" name="twitter" class="form-control" placeholder="Twitter">
                                            </div>
                                        </div>



                                    </div>



                                    <div class="row">
                                        <div class="col-md-8 col-md-offset-2">






                                            <div class="col-md-12">
                                                <button type="submit" name="chage" style="margin-top:50px" id="savechanges" class="btn btn-default btn-lg">save changes</button>
                                            </div>

                                        </div>
                                    </div>
                                </form>

                                <hr />

                            </div>
                        </div>
                    </div>

                </div>
            </div>
            </section>

            <jsp:include page="include/footer.jsp"></jsp:include>