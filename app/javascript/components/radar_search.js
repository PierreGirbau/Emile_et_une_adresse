function radarSearch() {
  document.addEventListener("DOMContentLoaded", function() {
  const placeAddress = document.getElementById('search_field');
  const parisPosition = new google.maps.LatLngBounds(
    new google.maps.LatLng(48.8566667, 2.3509871));
  const options = {
    bounds: parisPosition,
    types: ['establishment'],
    componentRestrictions: {country: ['fr']}
    };
  if (placeAddress) {
    const autocomplete = new google.maps.places.Autocomplete(placeAddress, options);
    google.maps.event.addDomListener(placeAddress, 'keydown', function(e) {
      if (e.key === "Enter") {
        e.preventDefault(); // Do not submit the form on Enter.
      };
    });
    autocomplete.addListener('place_changed', function() {
      const place = autocomplete.getPlace();
      const lat = place.geometry.location.lat();
      const lng = place.geometry.location.lng();
      let map;
      const place_coordinate = {lat: parseFloat(`${lat}`), lng: parseFloat(`${lng}`)}; // ce qu'on tape dans la barre de recherche, en mode autocomplete donc
      console.log(place_coordinate)
      document.getElementById('places_params').value = [`${lat}`, `${lng}`];

      map = new google.maps.Map(document.getElementById('map'), {
        center: place_coordinate,
        zoom: 15
      });
      console.log(map)
      const service = new google.maps.places.PlacesService(map);
      service.radarSearch({
              location: place_coordinate,
              radius: 700,
              type: ['establishment']
          }, callback);

      function callback(results, status) {

        if (status === google.maps.places.PlacesServiceStatus.OK) {
          let all_places = []
          for (let i = 0; i < results.length; i++) {
            // Fetch the ID of each Place returned by the Radar Search
            let places = results[i]["place_id"];
            all_places.push(places)
            };
          // console.log(all_places)
          console.log(results)
          // document.getElementById('places_params').value = all_places;
          };
        };
      });
    };
  });
};

export { radarSearch };
