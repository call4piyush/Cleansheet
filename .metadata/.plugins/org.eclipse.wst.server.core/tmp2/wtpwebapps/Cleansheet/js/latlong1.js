/**
 * 
 */
var latitude,longitude;
function calcLat() {
		var address = document.getElementById("end").value;
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
	document.getElementById("lat").value =latitude;
	document.getElementById("long").value =longitude;
}