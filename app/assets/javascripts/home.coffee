
class Home
  @_timer: null
  
$(document).on 'change', '#home_index_form select#project_id', ->
  ur = new Home
  $('.index_list_page').html ' '
  $.get($("#home_index_form").prop('action'), $("#home_index_form").serialize(), null, "script")
  return false 
