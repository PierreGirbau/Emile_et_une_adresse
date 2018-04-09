function buttonOnClick() {
  const button = document.getElementById("save");
  console.log(button);
  button.addEventListener('click', function() {
    if (button.innerHTML === "Enregistrer") {
      button.innerHTML = "Enregistré!";
      button.classList.add("button-clicked");
    } else {
      button.innerHTML = "Enregistrer";
      button.classList.remove("button-clicked");
    }
  });
};

export { buttonOnClick };


// sur le clic du bouton, appeler la méthode
// qui permet de sauvegarder l'endroit en saved_place
// puis de la passer en true
// en décliquant passer de true à false
// et dans la vue n'afficher uqe les instances qui ont true à
// la méthode visible
