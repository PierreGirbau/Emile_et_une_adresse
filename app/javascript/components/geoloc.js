function geoloc() {
  jQuery( document ).ready( function( $ ){
      $( "#geoloc" ).click( function(e) {
        e.preventDefault();
        navigator.geolocation.getCurrentPosition(
          function (position){ // success cb
            const lat = position.coords.latitude;
            const lng = position.coords.longitude;
            console.log(lat)
            console.log(lng)
            document.getElementById('places_params').value = [`${lat}`, `${lng}`];
          },
        );
      });
  });
};

export { geoloc };
