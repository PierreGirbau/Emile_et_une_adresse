/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import { loadDynamicBannerText } from '../components/banner';
import { flatpickrr } from '../plugins/flatpickr';
import { modalShow } from '../components/modal';
import { setTimeout } from '../components/flash_alert_disappears';
import { radarSearch } from '../components/radar_search';
import { counter } from '../components/counter';
import { radioButtonsAddClass, radioButtonsAddClass2 } from '../components/radio_buttons_add_class';
import { geoloc } from '../components/geoloc';
import { submitTag } from '../components/submit_tag';
import 'bootstrap';

// initializeAutocomplete();

if ( document.getElementById('banner-typed-text') ) {
  loadDynamicBannerText();
};

if ( document.querySelector('.datepicker') ) {
 flatpickrr();
};

if ( document.getElementById('modal-id') ) {
 modalShow();
};

if ( document.getElementById('search_field') ) {
 radarSearch();
};

  // buttonOnClick();
if ( document.querySelector(".counter") ) {
  counter();
};

if ( document.querySelector('.radio > label[for="place_type_of_place_une_bonne_table"]') ) {
  radioButtonsAddClass();
};

if ( document.querySelector('.radio > label[for="detail_season_toute_lannée"]') ) {
  radioButtonsAddClass2();
};

if ( document.querySelector('.alert') ) {
  setTimeout();
};

if ( document.getElementById('geoloc') ) {
  geoloc();
};

if ( document.getElementById('go-emile') ) {
  submitTag();
};
