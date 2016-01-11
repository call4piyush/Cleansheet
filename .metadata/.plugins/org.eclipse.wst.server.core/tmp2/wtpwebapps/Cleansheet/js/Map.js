	var directionDisplay;
	var distance;
	var map;
	

	//Function to display Intial map of india 
	function initialize() {
		directionsDisplay = new google.maps.DirectionsRenderer();
		var selam = new google.maps.LatLng(11.6537351,78.1381344);
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
		
		var start = document.getElementById("start").value;
		var end = document.getElementById("end").value;
		drivingRoute(start, end);		
	}
function calcRoute1() {
		
		var start = document.getElementById("start").value;
		var end = document.getElementById("mid").value;
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
				travelMode: google.maps.DirectionsTravelMode.DRIVING
			};
		
		// calculating distance from google maps (Driving directions)
				directionsService.route(request, function(response, status) {
				if (status == google.maps.DirectionsStatus.OK) {
				directionsDisplay.setDirections(response);
				document.getElementById("mySubmit").disabled = false;
				document.getElementById("distance").value= response.routes[0].legs[0].distance.value / 1000;
				document.getElementById("1234").innerHTML="	Distance: "+ Math.round(response.routes[0].legs[0].distance.value /1000);
				}
		});
				
	}
	
	