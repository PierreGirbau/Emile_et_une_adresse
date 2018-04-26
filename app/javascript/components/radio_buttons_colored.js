function radioButtonsColored () {
  $(document).on('click', '.btns', function (e) {
    console.log(e)
    $(".active").not($(this).addClass('active')).removeClass();
  });
}

export { radioButtonsColored };
