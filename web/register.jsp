
<%@page import="entities.profile"%>
<%@page import="model.user"%>
<%@page import="model.test"%>
<%

%>

<%    if (request.getParameter("Register") != null) {
        user u = new user();
        profile p = new profile();

        p.setFirst_name(request.getParameter("First_name"));
        p.setLast_name(request.getParameter("Last_name"));
        p.setAddress(request.getParameter("Address"));
        p.setEmail(request.getParameter("Email"));
        p.setPassword(request.getParameter("Password"));
        p.setSec_question(request.getParameter("sec_question"));
        p.setAnswer(request.getParameter("answer"));

        Boolean status = u.register(p);
        if (status != false) {
            response.sendRedirect("signin.jsp");
        }
    }
%>

<%

%>

<%@include file="include/header.jsp" %>

<!-- PATH SECTION ================================================= -->
<section class="path">
    <div class="container">

        <div class="row">
            <ol>
                <li><a href="index.html">home / </a></li>
                <li><a href="register.html"> register</a></li>
            </ol>
        </div>

    </div>
</section>

<!-- SIGNIN SECTION ================================================= -->
<section class="signin">
    <div class="container">
        <div class="row">

            <div class="container">
                <div class="row">

                    <div class="col-sm-push-3 col-md-6 col-sm-6">
                        <h1>register</h1>
                        <form action="register.jsp" method="post" onclick="registerValidation()">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>First Name</label>
                                    <input required type="text" class="form-control" name="First_name" id="exampleInputEmail1" placeholder="First Name">
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Last Name</label>
                                    <input required type="text" name="Last_name" class="form-control" id="exampleInputPassword1" placeholder="Last Name">
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>City</label>
                                    <select required class="selectpicker" name="Address">
                                        <option>Alex</option>
                                        <option>cairo</option>
                                        <option>shebin</option>
                                        <option>giza</option>
                                    </select>

                                </div>
                            </div>
                            <div class="clearfix"></div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Email</label>
                                    <input required type="email" name="Email" class="form-control" id="exampleInputPassword1" placeholder="Email">
                                    <p class="alert alert-danger hidden emailValid"></p>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" name="Password" class="form-control" id="exampleInputEmail1" placeholder="Password">
                                    <p class="alert alert-danger hidden passValid"></p>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Confirm Password</label>
                                    <input required type="password" name="confirm Password" class="form-control" id="exampleInputPassword1" placeholder="Confirm Password">
                                    <p class="alert alert-danger hidden confimPass"></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Security question</label>
                                    <select required class="selectpicker" name="sec_question" >
                                        <option>What is .....?</option>
                                        <option>What is .....?</option>
                                        <option>What is .....?</option>
                                        <option>What is .....?</option>

                                    </select>

                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Your Answer</label>
                                    <input required type="text" name="answer" class="form-control" id="exampleInputPassword1" placeholder="Answer">
                                </div>
                            </div>

                            <button   type="submit" name="Register" class="btn btn-default btn-lg">register now</button>
                        </form>

                        <hr />

                    </div>
                </div>
            </div>

        </div>
    </div>
</section>



<%@include file="include/footer.jsp" %>