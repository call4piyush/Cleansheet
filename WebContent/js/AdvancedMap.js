	var directionDisplay;
	var distance;
	var map;
	var waypts = [];
	var dist=0;

	//Function to display Intial map of india 
	function initialize() {
		directionsDisplay = new google.maps.DirectionsRenderer();
		var selam = new google.maps.LatLng(28.6456707,76.950673);
		var myOptions = {
		  zoom:5,
		  mapTypeId: google.maps.MapTypeId.ROADMAP,
		  center: selam
		}    
		map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
		directionsDisplay.setMap(map);
	}

	//function that is called onclick of calculate Distance button 
	function calcRoute() {
		var mid = document.getElementById("mid").value;
		  waypts.push({
		      location: mid,
		      stopover: true
		    });
		var start = document.getElementById("start").value;
		var end = document.getElementById("end").value;
		drivingRoute(start, end);		
	}
	
	
	//function to update the map with driving assistance and prints value of distance by road
	function drivingRoute(start, end){
		directionsDisplay = new google.maps.DirectionsRenderer();
		var myOptions = {
		  zoom:5,
		  mapTypeId: google.maps.MapTypeId.ROADMAP,
		}    
		map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
		directionsDisplay.setMap(map);
		var directionsService = new google.maps.DirectionsService();
		
		var request = {
				origin:start,
				destination:end,
				waypoints: waypts,
			    optimizeWaypoints: true,
				travelMode: google.maps.DirectionsTravelMode.DRIVING
			};
		// calculating distance from google maps (Driving directions)
				directionsService.route(request, function(response, status) {
				if (status == google.maps.DirectionsStatus.OK) {
					directionsDisplay.setDirections(response);
				      var route = response.routes[0];
				      
				      var summaryPanel = document.getElementById('1234');
				      summaryPanel.innerHTML = ''; // For each route, display summary information.
				      for (var i = 0; i < route.legs.length; i++) {
				          var routeSegment = i + 1;
				          summaryPanel.innerHTML += '<b>Route Segment: ' + routeSegment +
				              '</b><br>';
				          summaryPanel.innerHTML += route.legs[i].start_address + ' to ';
				          summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
				          summaryPanel.innerHTML += route.legs[i].distance.text + '<br><br>';
				          if(i==0)
				        	  {
				        	  document.getElementById("distance").value=route.legs[i].distance.value / 1000;
				        	  document.getElementById("mySubmit").disabled = false;
				        	  }
				          else
				        	 dist=dist+route.legs[i].distance.value / 1000;
				        }
				      document.getElementById("distance1").value=dist;				      
				      }});
	}
	
	