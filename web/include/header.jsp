<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="view port" content="width=device-width,initial-scale=1">
        <title>Locations</title>
        <link rel="stylesheet" href="style/css/bootstrap.min.css" />

        <link rel="stylesheet" href="style/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="style/css/hover.css" />
        <link rel="stylesheet" href="style/css/custom.css" type="text/css"/>
        <link rel="stylesheet" href="style/css/mystyle.css" type="text/css"/>
        <link href='https://fonts.googleapis.com/css?family=Lato:400,300,700,900,400italic' rel='stylesheet' type='text/css'>

        <!--[if It IE 9]>
               <script src="js/html5shiv.min.js"></script>
               <script src="js/respond.min.js"></script>
               <![endif]-->

        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
         
         <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD4DvaNOnpTRUFASvy6lyY0DDVcfXytvnY&libraries=places&&callback=initMap">
        </script>
        <script src="style/js/traffic_accidents.json"></script>
        <script type="text/javascript" src="style/js/markerclusterer.js"></script>
        <script src="style/js/jquery-2.2.3.min.js"></script>
        
<!--        <script>
            function initialize() {
                var center = new google.maps.LatLng(59.9214, 10.8463);
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 12,
                    center: center,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                });
                var opt = {
                    "legend": {
                        "Fatal": "#FF0066",
                        "Very serious injuries": "#FF9933",
                        "Serious injuries": "#FFFF00",
                        "Minor injuries": "#99FF99",
                        "No injuries": "#66CCFF",
                        "Not recorded": "#A5A5A5"
                    }
                };
                var markers = [];
                for (var i = 0; i < data.features.length; i++) {
                    var accident_injuries = data.features[i].properties["5074"];
                    var accident_title = "";
                    var accident_lnglat = data.features[i].geometry["coordinates"];
                    switch (Number(accident_injuries)) {
                        case 1:
                            accident_title = "Fatal";
                            break;
                        case 3:
                            accident_title = "Serious injuries";
                            break;
                        case 2:
                            accident_title = "Very serious injuries";
                            break;
                        case 5:
                            accident_title = "No injuries";
                            break;
                        case 4:
                            accident_title = "Minor injuries";
                            break;
                        case 6:
                            accident_title = "Not recorded";
                            break;
                    }
                    var accident_LatLng = new google.maps.LatLng(Number(accident_lnglat[1]), Number(accident_lnglat[0]));
                    var marker = new google.maps.Marker({
                        position: accident_LatLng,
                        title: accident_title
                    });
                    markers.push(marker);
                }
                var markerCluster = new MarkerClusterer(map, markers, opt);
            }
            google.load("visualization", "1", {packages: ["corechart"]});
            google.setOnLoadCallback(initialize);
        </script>-->

    </head>

    <body onload="loadMap()">

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
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

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