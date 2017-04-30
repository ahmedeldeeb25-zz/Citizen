

<%@page import="entities.profile"%>
<%
    profile user = (profile) request.getAttribute("user");

%>


<%@include file="include/header.jsp" %>  

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
                                    <img src="img/milan.jpg" class="img-responsive center-block" alt="my profile image">    
                             </div> 
                            </div>
                            
                            <div class="col-md-12">
                               <div class="text-center">
                                   
                               </div>
                                
                            </div>
                            
                            <div class="col-md-12">
                                <div class="text-center">
                                   <form>
                                <div class="form-group">
                                    <label class="custom-file-upload">Change Profile
                                    <input id="ProfileUpload" type="file" value="Marion"  placeholder="">
                                    </label>
                                </div>
                               </form>
                                    
                                </div>
                            </div>
                            
                            
                            

                            <form>
                              <div class="col-md-12">
                                <h3>about you</h3>
                              </div>

                              <div class="col-md-6">
                                <div class="form-group">
                                    <label>first name</label>
                                    <input type="text" value="Marion" class="form-control" placeholder="">
                                </div>
                              </div>

                              <div class="col-md-6">
                                <div class="form-group">
                                    <label>last name</label>
                                    <input type="text" value="cotilard" class="form-control" placeholder="">
                                </div>
                              </div>

                              <div class="col-md-6">
                                <div class="form-group">
                                    <label>email</label>
                                    <input type="text" value="marion@example.com" class="form-control" placeholder="">
                                </div>
                              </div>

                              <div class="col-md-6">
                                <div class="form-group">
                                    <label>phone</label>
                                    <input type="text" value="0115498654" class="form-control" placeholder="">
                                </div>
                              </div>

                              <div class="col-md-12">
                                <div class="form-group">
                                    <label>about you</label>
                                    <textarea value="" rows="4" class="form-control" placeholder="something about you"></textarea
                                </div>
                              </div>

                              <div class="row">
                                <div class="col-md-12">
                                    <h3>Your Social Networks</h3>
                                </div>
                              

                              <div class="col-md-6">
                                <div class="form-group">
                                    <label>facebook</label>
                                    <input type="text" value="" class="form-control" placeholder="Facebook">
                                </div>
                              </div>

                              <div class="col-md-6">
                                <div class="form-group">
                                    <label>twitter</label>
                                    <input type="text" value="" class="form-control" placeholder="Twitter">
                                </div>
                              </div>

                               

                               

                              

                              </div>

                              <div class="row">
                                <div class="col-md-12">
                                    <h3 class="text-center">Change Your Password</h3>
                                </div>
                              </div>

                              <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>current password</label>
                                            <input type="password" value="" class="form-control" placeholder="Instagram">
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>new password</label>
                                            <input type="text" value="" class="form-control" placeholder="new Password">
                                        </div>
                                    </div>

                                  <div class="col-md-12">
                                    <div class="form-group">
                                        <label>confirm password</label>
                                        <input type="text" value="" class="form-control" placeholder="Confirm New Password">
                                    </div>
                                  </div>

                                  <div class="col-md-12">
                                <button type="submit" style="margin-top:50px" id="savechanges" class="btn btn-default btn-lg">save changes</button>
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



<%@include file="include/footer.jsp" %>