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