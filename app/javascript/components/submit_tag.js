function submitTag () {
  const radio_buttons = document.querySelectorAll('.radio_buttons')
  const radio_label = document.querySelector('.radio label')
  const submit_tag = document.getElementById('go-emile')
  radio_buttons.forEach((radio_button) => {
    radio_button.addEventListener('change', function() {
      const checked = document.querySelector('.radio input:checked');
      if (checked) {
        submit_tag.click();
      }
    });
  });
}

export { submitTag };
