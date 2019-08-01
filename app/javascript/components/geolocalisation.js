const geolocalisation = () => {
  document.querySelector('.geolocate-button').addEventListener('click', (event) => {
    navigator.geolocation.getCurrentPosition((data) => {
      const lat = data.coords.latitude;
      const lng = data.coords.longitude;
      console.log(data);
      console.log(lat);
      console.log(lng);

      let latlng = new google.maps.LatLng(data.coords.latitude, data.coords.longitude);
      console.log(latlng);

      new google.maps.Geocoder().geocode({'latLng': latlng}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          document.getElementById('places_params').value = `${results[1].formatted_address}`;
        } else {
          alert("Geocoder failed due to: " + status);
        }
      });

    });
  });
}

export { geolocalisation };

