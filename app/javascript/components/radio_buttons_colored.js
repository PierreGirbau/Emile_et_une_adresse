function radioButtonsColored () {
  $(document).on('click', '.btns', function (e) {
    console.log(e)
    $(".active").not($(this).addClass('active')).removeClass();
  });
  console.log(document.querySelectorAll(".btns"))
}

export { radioButtonsColored };
