function radioButtons () {
  const radio_buttons = document.querySelectorAll("[type=radio]");
  const checkboxes_1 = document.querySelectorAll('.radio > label');
  console.log(checkboxes_1)
  radio_buttons.forEach(radioBtn => {
    radioBtn.addEventListener('click', () => {
      console.log(radioBtn.id)
      if(radioBtn.checked === true) {
        document.querySelector(`label[for=${radioBtn.id}]`).classList.toggle("active");
      };
    });
  });
}

export { radioButtons };

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
