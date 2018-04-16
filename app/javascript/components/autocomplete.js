function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    let placeAddress = document.getElementById('place_name');
    let parisPosition = new google.maps.LatLngBounds(
      new google.maps.LatLng(48.8566667, 2.3509871));
    // console.log(parisPosition)
    let options = {
      bounds: parisPosition,
      types: ['establishment'],
      componentRestrictions: {country: ['fr']}
      };
    if (placeAddress) {
      let autocomplete = new google.maps.places.Autocomplete(placeAddress, options);
      google.maps.event.addDomListener(placeAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
      autocomplete.addListener('place_changed', function() {
        var place = autocomplete.getPlace();
        console.log(place)
        console.log()
        var google_place_id;
        var place_name;
        var place_address;
        var place_phone;
        var place_website;
        var place_photo;
        var place_periods

        var google_place_id = place["place_id"];
        var place_name = place["name"];
        var place_address = place["formatted_address"]
        var place_phone = place["formatted_phone_number"];
        var place_website = place["website"];
        var place_photo = place["photos"][0].getUrl({'maxWidth': 3000, 'maxHeight': 3000});
        var place_periods = place["opening_hours"]["weekday_text"];

        // pour le post, permet de remplir les clés place_id, name et addresse de la place
        document.getElementById('place_google_place_id').value = google_place_id;
        document.getElementById('place_address').value = place_address;
        document.getElementById('place_name').value = place_name;
        document.getElementById('place_phone_number').value = place_phone;
        document.getElementById('place_website').value = place_website;
        document.getElementById('place_photo').value = place_photo;
        document.getElementById('place_periods').value = place_periods;
      });
    };
  });
}

export { autocomplete };

