/**
 * 
 */
var latitude,longitude;
function calcLat() {
		var address = document.getElementById("location").value;
		getLat(address);
	}

function getLat(address){
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode({ 'address': address }, function(results, status) {
	 if (status == google.maps.GeocoderStatus.OK) {
		  latitude = results[0].geometry.location.lat();
		  longitude = results[0].geometry.location.lng();
		  returnLat();
		  }
	 
	});
}
function returnLat()
{
	document.getElementById("1234").innerHTML ="Latitute is: " + latitude+"<br>Longitude is: " + longitude;
	document.getElementById("lat").value =latitude;
	document.getElementById("long").value =longitude;
	document.getElementById("mySubmit").disabled = false;
}