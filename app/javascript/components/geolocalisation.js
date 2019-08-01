const geolocalisation = () => {
  document.querySelector('.geolocate-button').addEventListener('click', (event) => {
    navigator.geolocation.getCurrentPosition((data) => {
      const lat = data.coords.latitude;
      const lng = data.coords.longitude;
      console.log(lat)
      console.log(lng)
      document.getElementById('places_params').value = [`${lat}`, `${lng}`];
    });
  });
}

export { geolocalisation };
