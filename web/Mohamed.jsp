<%@page import="java.util.List"%>
<%@page import="entities.post"%>
<%@page import="model.Posts"%>
<%@ page import="com.google.gson.Gson" %><%--
  Created by IntelliJ IDEA.
  User: m7md
  Date: 12/05/17
  Time: 07:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    double array[][];
    Posts p = new Posts();
    List<post> posts = p.getAll();
%>

<!DOCTYPE html>
<html>
    <head> 
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD4DvaNOnpTRUFASvy6lyY0DDVcfXytvnY&libraries=places&&callback=initMap">
        </script>
        <%
            array = new double[posts.size()][2];
//posts.size()
            for (int i = 0; i < posts.size(); i++) {
                // int i= posts.size()-2;
                array[i][0] = Double.parseDouble(posts.get(i).getLat());
                array[i][1] = Double.parseDouble(posts.get(i).getLang());
            }

            String json = new Gson().toJson(array);


        %>
        <script>
            function loadMap() {
                var mapOptions = {
                    center: new google.maps.LatLng(30.5605, 31.0079),
                    zoom: 7
                }
                var map = new google.maps.Map(document.getElementById("sample"), mapOptions);

                var arr =<%=json%>;
                var l =<%= posts.size()%>;
                console.log(arr.length);
                console.log(arr);
                for (var i = 0; i < l; i++) {
                    var marker = new google.maps.Marker({
                        position: new google.maps.LatLng(arr[i][0], arr[i][1]),
                        map: map,
                    });
                }


            }
        </script>
    </head>
    <body onload="loadMap()">
        <div id="sample" style="width:580px;height:400px;"></div>
    </body>
</html>