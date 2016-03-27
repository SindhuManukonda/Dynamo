<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<%@ include file="/css/style.css"%>
<%@ include file="header.jsp" %>
<style>
div {
     color:black;
}
</style>
<head> 
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" /> 
  <title>Google Maps Multiple Markers</title> 
  <script src="http://maps.google.com/maps/api/js?sensor=false" 
          type="text/javascript"></script>
</head> 
<body>
<h2 align="center">Location Map</h2>
<table>
<tr>
<td height="600px">
<%@ include file="Menu.jsp" %>
</td>
<td height="600px" width="75%">
<div id="map" style="width: 1600px; height: 600px;"></div>

  <script type="text/javascript">
    var locations = [
      ['Ramya', -33.890542, 151.274856, 4,'Fire','7324566543'],
      ['Maurani', -33.923036, 151.259052, 5,'Flood','1324566543'],
      ['Srinadh', -34.028249, 151.157507, 3,'Fire','2324566543'],
      ['Sindhu', -33.80010128657071, 151.28747820854187, 2,'Police','3324566543'],
      ['Unnati', -33.950198, 151.259302, 1,'EarthQuake','4324566543']
    ];

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 10,
      center: new google.maps.LatLng(-33.92, 151.25),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();

    var marker, i;
    var image = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
    for (i = 0; i < locations.length; i++) {  
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map,
        icon : image
      });

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent('Name : ' +locations[i][0] + '</br>' +'Skill : ' 
        		  +locations[i][4] + '</br>'+ 'Phone no :'+locations[i][5]+
        		  '</br>'+'<img src="<%=request.getContextPath()%>/images/icon.jpg"/>');
          infowindow.open(map, marker);
        }
      })(marker, i));
    }
  </script>
</td>
</tr>
</table>
  
</body>
</html>