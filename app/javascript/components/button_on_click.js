function buttonOnClick() {
  const labels = document.querySelectorAll("label[for]")
  console.log(labels)
  labels.forEach(label => {
    label.addEventListener('click', () => {
      label[for=input].checked = 'checked'
    })
  })
};

export { buttonOnClick };


// sur le clic du bouton, appeler la méthode
// qui permet de sauvegarder l'endroit en saved_place
// puis de la passer en true
// en décliquant passer de true à false
// et dans la vue n'afficher uqe les instances qui ont true à
// la méthode visible
