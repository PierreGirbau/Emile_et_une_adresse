function radioButtonsAddClass () {
  document.querySelector('.radio > label[for="place_type_of_place_une_bonne_table"]').classList.add('btns');
  document.querySelector('.radio > label[for="place_type_of_place_un_bon_verre"]').classList.add('btns');
  document.querySelector('.radio > label[for="place_type_of_place_du_bon_son"]').classList.add('btns');
}


function radioButtonsAddClass2 () {
  document.querySelector('.radio > label[for="detail_season_pendant_les_beaux_jours"]').classList.add('btns');
  document.querySelector('.radio > label[for="detail_season_toute_lannée"]').classList.add('btns');
}

export { radioButtonsAddClass, radioButtonsAddClass2 };
