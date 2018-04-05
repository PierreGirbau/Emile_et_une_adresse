function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var placeAddress = document.getElementById('place_name');
    var parisPosition = new google.maps.LatLngBounds(
      new google.maps.LatLng(48.8566667, 2.3509871));
    // console.log(parisPosition)
    var options = {
      bounds: parisPosition,
      types: ['establishment'],
      componentRestrictions: {country: ['fr']}
      };
    if (placeAddress) {
      var autocomplete = new google.maps.places.Autocomplete(placeAddress, options);
      google.maps.event.addDomListener(placeAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
      autocomplete.addListener('place_changed', function() {
        var place = autocomplete.getPlace();
        console.log(place)
        console.log(place["photos"])
        var google_place_id;
        var place_name;
        var place_address;

        var google_place_id = place["place_id"];
        var place_name = place["name"];
        var place_address = place["address_components"][6]["long_name"]

        // pour le post, permet de remplir les clés place_id, name et addresse de la place
        document.getElementById('place_google_place_id').value = google_place_id;
        document.getElementById('place_address').value = place_address;
        document.getElementById('place_name').value = place_name;
      });
    }
  });
}

export { autocomplete };

