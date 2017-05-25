
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entities.govern"%>
<%@page import="model.Cities"%>
<%@page import="java.util.List"%>
<%@page import="entities.category"%>
<%@page import="model.Categories"%>
<%
    Categories cats = new Categories();
    List<category> cat = cats.getCategories();

    Cities cities = new Cities();
    List<govern> govs = cities.getGovs();
%>
<%@include file="include/header2.jsp" %>

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


<script>


    $(document).ready(function () {

        $("input").each(function () {
            $(this).attr("required", "true");
        });

        $("#mainCat").on("change", function (e) {
            $.ajax({
                url: "ajax/subCategories.jsp",
                data: {cat: this.value},
                cache: true,
                type: 'GET',
                success: function (data) {
                    // console.log(data)
                    $("#subCat").html(data);
                }
            });
        });
    });
</script>

<script>
    $(document).ready(function () {
        $("#gov").on("change", function (e) {
            $.ajax({
                url: "ajax/cities.jsp",
                data: {govern: this.value},
                cache: true,
                type: 'GET',
                success: function (data) {
                    //console.log(data)
                    $("#city").html(data);
                }
            });
        });
    });
</script>

<!-- PATH SECTION ================================================= -->
<section class="path">
    <div class="container">

        <div class="row">
            <ol>
                <li><a href="index.jsp">home / </a></li>
                <li><a href="addlist.jsp"> submit Post</a></li>
            </ol>
        </div>

    </div>
</section>

<!-- SIGNIN SECTION ================================================= -->

<div class="center-block" style="width: 50%;height:50% ;margin: 50px auto">
    <h2 class="text-center">Choose Your Address on the map</h2>
    <input id="pac-input" class="controls" type="text" placeholder="Search Box">
    <div id="map"></div>
</div>

<section class="signin addlisintpage">
    <div class="container">
        <div class="row">

            <div class="container">
                <div class="row">

                    <div class="col-sm-push-2 col-md-8 col-sm-6">
                        <h1 class="text-center">submit Post</h1>

                        <!---->
                        <form action="AddPost" method="post" enctype="multipart/form-data">
                            <div class="col-md-12">
                                <h3>about</h3>
                            </div>
                            <div class="col-md-9">
                                <div class="form-group">
                                    <label>Post Title</label>
                                    <input name="title" type="text" class="form-control" placeholder="Title">
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Category</label>
                                    <select id="mainCat"  class="selectpicker">
                                        <option></option>
                                        <%
                                            for (category c : cat) {
                                        %>
                                        <option value="<%= c.getId()%>" ><%= c.getName()%></option>
                                        <% }%>
                                    </select>

                                </div>
                            </div>
                            <div class="clearfix"></div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Sub Category</label>
                                    <select id="subCat" name="cat" class="selectpicker">

                                    </select>

                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="desc" class="form-control" rows="4" placeholder="Describe the listing"></textarea>
                                </div>
                            </div>

                            <!--                            <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label>Tags</label>
                                                                <input type="text" name="tags" class="form-control" placeholder="+ Add tag">
                                                            </div>
                                                        </div>-->

                            <div class="col-md-12">
                                <h3 class="second-h3">contact</h3>
                            </div>

                            <div class="col-md-6">
                                <!---New Item here------------->


                            </div>

                            <input type="hidden" name="lang" value="151.2195">
                            <input type="hidden" name="lat" value="-33.8688">
                            <input type="hidden" name="address" value="Egypt">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Governorate</label>
                                    <select class="selectpicker" id="gov" name="region">
                                        <option></option>
                                        <%
                                            for (govern g : govs) {
                                        %>
                                        <option value="<%= g.getId()%>"><%= g.getName()%></option>
                                        <% }%>

                                    </select>
                                </div>

                                <div class="form-group">
                                    <label>City</label>
                                    <select class="selectpicker" id="city" name="city">

                                    </select>
                                </div>

                                <div class="form-group">
                                    <label>Listing Phone</label>
                                    <input type="text" class="form-control" name="phone" placeholder="Phone numer">
                                </div>

                                <div class="form-group">
                                    <label>listing email</label>
                                    <input type="text" class="form-control" name="email" placeholder="hello@example.com">
                                </div>

                                <div class="form-group">
                                    <label>listing website </label>
                                    <input type="text" class="form-control" name="web" placeholder="http://">
                                </div>

                            </div>

                            <div class="col-md-12">
                                <h3>gallery</h3>
                            </div>

                            <div class="col-md-12">
                                <div class="file-upload">
                                    <input type="file" name="img"  class="file-upload-input with-preview MultiFile-applied"  title="Click to add files" maxlength="20" accept="image/*" id="MultiFile1" >

                                    <span>click to upload image here</span>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>video url </label>
                                    <input type="text" name="url" class="form-control" placeholder="http://">
                                </div>
                            </div>


                            <div class="col-md-12">
                                <% if (session.getAttribute("userID") != null) { %>
                                <button type="submit" name="Addpost" style="margin-top:50px" class="btn btn-default btn-lg">preview & submit listing</button>
                                <% } else { %>
                                <a  href="<c:url  value="signin"></c:url>" name="Addpost" style="margin-top:50px" class="btn btn-default btn-lg">preview & submit listing</a>
                                <% }%>

                            </div>
                        </form>



                    </div>
                </div>
            </div>

        </div>
    </div>
</section>


<script>
    // This example adds a search box to a map, using the Google Place Autocomplete
    // feature. People can enter geographical searches. The search box will return a
    // pick list containing a mix of places and predicted search terms.

    // This example requires the Places library. Include the libraries=places
    // parameter when you first load the API. For example:
    // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">



    // This will contain all markers positions
    var savedPositions = [];

    function initAutocomplete() {
        var map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: -33.8688, lng: 151.2195},
            zoom: 13,
            mapTypeId: 'roadmap'
        });


        var input = document.getElementById('pac-input');
        var searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);


        map.addListener('bounds_changed', function () {
            searchBox.setBounds(map.getBounds());
        });

        var markers = [];

        searchBox.addListener('places_changed', function () {
            var places = searchBox.getPlaces();

            if (places.length == 0) {
                return;
            }

            markers.forEach(function (marker) {
                marker.setMap(null);
            });
            markers = [];
            var bounds = new google.maps.LatLngBounds();
            places.forEach(function (place) {
                if (!place.geometry) {
                    console.log("Returned place contains no geometry");
                    return;
                }
                var icon = {
                    url: place.icon,
                    size: new google.maps.Size(71, 71),
                    origin: new google.maps.Point(0, 0),
                    anchor: new google.maps.Point(17, 34),
                    scaledSize: new google.maps.Size(25, 25)
                };

                markers.push(new google.maps.Marker({
                    map: map,
                    icon: icon,
                    title: place.name,
                    position: place.geometry.location
                }));

                // Here you can keep all markers positions
                savedPositions.push({
                    name: place.name,
                    lat: place.geometry.location.lat(), // latitude
                    lng: place.geometry.location.lng() // longitude
                });

                if (place.geometry.viewport) {
                    bounds.union(place.geometry.viewport);
                } else {
                    bounds.extend(place.geometry.location);
                }
            });
            map.fitBounds(bounds);
        });
    }

//            document.getElementById("pac-input").onblur = function () {
//                myFunction()
//            };
//
//            function myFunction() {
//                // alert(savedPositions.valueOf());
//                 
//                    try{
//                    console.log(savedPositions[0]["lat"]);
//                }catch(e){
//                    console.log("aa")
//                }
//            }

    $(document).ready(function () {
        $("button[name='Addpost']").click(function (event) {

            try {

                $("input[name='lang']").val(savedPositions[savedPositions.length - 1]["lng"]);
                $("input[name='lat']").val(savedPositions[savedPositions.length - 1]["lat"]);
                $("input[name='address']").val(savedPositions[savedPositions.length - 1]["name"]);
            } catch (e) {
                console.log("Empty values")
            }
        });

    });

</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAwKPH7hcDbfG8EnX7XlfWUIyodujiYy6U&libraries=places&callback=initAutocomplete"
async defer></script>


<script src="style/js/jquery.nicescroll.min.js"></script>
<script src="style/js/smooth-scroll.min.js"></script>
<script src="style/js/jqstyles.js"></script>
<script src="style/js/bootstrap.min.js"></script>
<script src="style/js/validation.js"></script>



</body>
</html>