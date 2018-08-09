function radioButtonsChecked() {
  const radio_buttons = document.querySelectorAll('.radio_buttons')
  $('.search-bar').hide();
  
  radio_buttons.forEach((radio_button) => {
    radio_button.addEventListener('change', function() {
      const checked = document.querySelector('.radio input:checked');
      if (checked) {
        $('.search-bar').show();
        if ($('.few-results')) {
          $('.few-results').hide();
        }
      }
    });
  });
}

function submitTag() {
  $('#go-emile').prop('disabled', true);
  document.getElementById('geoloc').addEventListener('click', (event) => {
    $('#go-emile').prop('disabled', false);
  })
  document.getElementById('geoloc').addEventListener('click', (event) => {
    if($('#search_field').val() !== '') {
      $('#go-emile').prop('disabled', false);
    }
  })
  $(document).ready(function(){
      $('#go-emile').attr('disabled',true);
      $('#search_field').keyup(function(){
          if($(this).val().length !=0)
              $('#go-emile').attr('disabled', false);            
          else
              $('#go-emile').attr('disabled',true);
      })
  });
}

export { radioButtonsChecked, submitTag };
