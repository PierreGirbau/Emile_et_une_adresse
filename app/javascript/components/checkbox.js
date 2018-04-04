function colorCheckbox () {
  const checkboxes = document.querySelectorAll('.radio > label');
  for (var i = 0; i < checkboxes.length - 2; i++) {
    checkboxes[0].classList.add("active");
    checkboxes[i].addEventListener("click", function() {
      var current = document.querySelectorAll(".active");
      console.log(current[0])
      current[0].classList.toggle("active");
      this.className += " active";
    });
  }
}

export { colorCheckbox };
