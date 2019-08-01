const autocomp = () => {
  const placeAddress = document.querySelector('.input-button-form');
  const parisPosition = new google.maps.LatLngBounds(
    new google.maps.LatLng(48.8566667, 2.3509871));
  const options = {
    bounds: parisPosition,
    types: ['geocode'],
    componentRestrictions: {country: ['fr']}
    };

  const autocomplete = new google.maps.places.Autocomplete(placeAddress, options);
};

export { autocomp };
