function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var placeAddress = document.getElementById('place_name');
    console.log(placeAddress)
    var parisPosition = new google.maps.LatLngBounds(
      new google.maps.LatLng(48.8566667, 2.3509871));
    var options = {
      bounds: parisPosition,
      types: ['establishment'],
      componentRestrictions: {country: ['fr']}
      };
    if (placeAddress) {
      var autocomplete = new google.maps.places.Autocomplete(placeAddress, options);
      console.log(autocomplete);
      google.maps.event.addDomListener(placeAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
