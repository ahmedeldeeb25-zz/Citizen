<%@page import="model.user"%>
<%@page import="entities.profile"%>
 
<%@include file="include/header.jsp" %>

<!-- PATH SECTION ================================================= -->
<section class="path">
    <div class="container">

        <div class="row">
            <ol>
                <li><a href="index.html">home / </a></li>
                <li><a href="signin.html"> sig in</a></li>
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
                        <%
                            if(request.getAttribute("error") !=null){
                        %>
                        <div class="alert alert-danger"><%=request.getAttribute("error") %></div>
                        <%}%>
                        <h1>sign in</h1>
                        <form method="post" action="signin" onblur="return signinValidation()">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" name="Email" class="form-control" id="exampleInputEmail1" placeholder="Your Email">
                                <p class="alert alert-danger hidden emailValid"></p>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" name="Password" class="form-control" id="exampleInputPassword1" placeholder="Your Password">
                            </div>

                            <button type="submit" name="login" class="btn btn-default btn-lg">sign in</button>
                        </form>

                        <hr />

                        <div class="forget-pass">
                            <a href="#" >i have forgot my password</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>




<jsp:include page="include/footer.jsp" />