function colorCheckbox1 () {
  const checkboxes_1 = document.querySelectorAll('.radio > label');
  console.log(checkboxes_1)
  for (var i = 0; i < checkboxes_1.length - 2; i++) {
    checkboxes_1[i].addEventListener("click", function() {
      checkboxes_1[i].classList.add('active')
      let current_1 = document.querySelectorAll('.active');
      checkboxes_1[i].classList.toggle("active");
    });
  }
}

export { colorCheckbox1 };

function colorCheckbox2 () {
  const checkboxes_2 = document.querySelectorAll('.radio > label .season');
  for (var i = 3; i < checkboxes_2.length; i++) {
    console.log(checkboxes_2[i])
    checkboxes_2[3].classList.add("active");
    checkboxes_2[i].addEventListener("click", function() {
      var current_2 = document.querySelectorAll(".active");
      current_2[1].classList.toggle("active");
      this.className += " active";
    });
  }
}

export { colorCheckbox2 };
