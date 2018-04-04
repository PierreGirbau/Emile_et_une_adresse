
function colorCheckbox () {
  const checkboxes = document.querySelectorAll('.radio > label');
  for (var i = 0; i < checkboxes.length - 2; i++) {
    console.log(checkboxes[i])
    checkboxes[i].addEventListener("click", function() {
      var current = document.querySelector(".active");
      console.log(current)
      current.className = current.className.replace(" active", "");
    });
  }
}

export { colorCheckbox };

// .label[for=place_type_of_place_1]"
