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
import { colorCheckbox1 } from '../components/checkbox';
import { colorCheckbox2 } from '../components/checkbox';
import { modalShow } from '../components/modal';
import { buttonOnClick } from '../components/button_on_click';
import { nearbySearch } from '../components/nearbysearch';
import 'bootstrap';

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
 nearbySearch();
};

if ( document.getElementById('save') ) {
  buttonOnClick();
};

 colorCheckbox1();
 colorCheckbox2();


