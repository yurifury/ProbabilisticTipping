$ ->
  $('#round_closing_date').datepicker
    dateFormat: 'yy-mm-dd'
    minDate: 1

  # Reference: About this competition, monash footy tipping
  fix = (x) ->
    Math.round(x * 100) / 100

  update_values = (p, el) ->
    p = p / 100
    container = $($(el).parent().find('.w-d-l')[0])
    $(container.find('.win')[0]).text fix(1 + Math.log(p) / Math.LN2) + " if correct"
    $(container.find('.draw')[0]).text fix(1 + 0.5 * Math.log(p * (1 - p)) / Math.LN2) + " if a draw"
    $(container.find('.lose')[0]).text fix(1 + Math.log(1 - p) / Math.LN2) + " if wrong"

  $('.slider').slider
    min: 1
    max: 99
    step: 1
    slide: (event, ui) ->
      input = $(event.target).parent().find('input')[0]
      $(input).val(ui.value)
      update_values(ui.value, event.target)

    change: (event, ui) ->
      input = $(event.target).parent().find('input')[0]
      $(input).val(ui.value)
      update_values(ui.value, event.target)

  $('.draw').click (event) ->
    slider_el = $(event.target).parent('fieldset').find('.slider')[0]
    $(slider_el).slider("value", 50)

  for input in $('.probability_input')
    slider_el = $(input).parent().parent('fieldset').find('.slider')[0]
    $(slider_el).slider("value", $(input).val())

