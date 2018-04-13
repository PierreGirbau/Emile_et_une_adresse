function colorCheckbox1 () {
  const radio_buttons = document.querySelectorAll("[type=radio]");
  const checkboxes_1 = document.querySelectorAll('.radio > label');
  console.log(radio_buttons)
  radio_buttons.forEach(radioBtn => {
    radioBtn.addEventListener('click', () => {
      if(radioBtn.checked === true) {
        alert('I am checked!');
      };
    });
  });
}

export { colorCheckbox1 };

// function colorCheckbox2 () {
//   const checkboxes_2 = document.querySelectorAll('.radio > label .season');
//   for (var i = 3; i < checkboxes_2.length; i++) {
//     console.log(checkboxes_2[i])
//     checkboxes_2[3].classList.add("active");
//     checkboxes_2[i].addEventListener("click", function() {
//       var current_2 = document.querySelectorAll(".active");
//       current_2[1].classList.toggle("active");
//       this.className += " active";
//     });
//   }
// }

// export { colorCheckbox2 };
