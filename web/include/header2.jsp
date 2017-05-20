<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="view port" content="width=device-width,initial-scale=1">
        <title>Locations</title>
        <link rel="stylesheet" href="style/css/bootstrap.min.css" />
        <!--                <link rel="stylesheet" href="style/css/custom.css" type="text/css"/>-->
        <link rel="stylesheet" href="style/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="style/css/min.css" type="text/css">
        <link rel="stylesheet" href="style/css/hover.css" />
        <!--        <link rel="stylesheet" href="style/css/custom.css" type="text/css"/>-->
        <link rel="stylesheet" href="style/css/mystyle.css" type="text/css"/>
        <link href='https://fonts.googleapis.com/css?family=Lato:400,300,700,900,400italic' rel='stylesheet' type='text/css'>



        <script src="style/js/jquery-2.2.3.min.js"></script>



    </head>

    <body>

        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index"><img class="img-responsive" src="style/img/logo.png"></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" style="margin-top:5px" id="bs-example-navbar-collapse-1">

                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="index">home</a></li>

                        <% if (session.getAttribute("userID") == null) {%>

                        <li><a href="signin">sign in</a></li>
                        <li><a href="register">register</a></li>
                            <%} else {%>
                        <li><a href="profiles"><%= session.getAttribute("userName")%></a></li>


                        <li>
                            <div class="dropdown">
                                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    <i class="fa fa-cog fa-spin" aria-hidden="true"></i>
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                    <li><a href="setting">Setting</a></li>
                                    <li><a href="logout">Logout</a></li>

                                    <li role="separator" class="divider"></li>
                                    <li><button class="btn btn-default add-list"><a href="addpost.jsp" target="_blank"><i class="fa fa-plus"></i>add listing</a></button></li>
                                </ul>
                            </div>
                        </li>
                        <%}%>

                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
        
        
        