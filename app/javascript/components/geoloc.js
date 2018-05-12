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
              // function(){ // fail cb
              //   infoWindow.setContent(browserHasGeolocation ?
              //     'Error: The Geolocation service failed.' :
              //     'Error: Your browser doesn\'t support geolocation.');
              // }
          );
          // document.getElementById('go-emile').click();
      });
  });
};

export { geoloc };
