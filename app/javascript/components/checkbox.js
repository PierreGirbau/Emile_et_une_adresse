function colorCheckbox () {
  const checkbox_1 = document.querySelector('label[for="place_type_of_place_1"');
  const checkbox_2 = document.querySelector('label[for="place_type_of_place_2"');
    checkbox_1.addEventListener('click', (event) => {
      event.currentTarget.classList.add("checkbox-clicked");
    });
    checkbox_2.addEventListener('click', (event) => {
      event.currentTarget.classList.add("checkbox-clicked");
    });
}

export { colorCheckbox };

// .label[for=place_type_of_place_1]"
