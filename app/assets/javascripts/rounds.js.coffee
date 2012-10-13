$ ->
  $('#round_closing_date').datepicker
    dateFormat: 'yy-mm-dd'
    minDate: 1

  $('.slider').slider
    min: 1
    max: 99
    step: 1
    slide: (event, ui) ->
      input = $(event.target).parent().find('input')[0]
      $(input).val(ui.value)

    change: (event, ui) ->
      input = $(event.target).parent().find('input')[0]
      $(input).val(ui.value)

  $('.draw').click (event) ->
    slider_el = $(event.target).parent('fieldset').find('.slider')[0]
    $(slider_el).slider("value", 50)

  for input in $('.probability_input')
    slider_el = $(input).parent().parent('fieldset').find('.slider')[0]
    $(slider_el).slider("value", $(input).val())


