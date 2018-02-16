# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ajax:success', '#createEntry', (xhr, data, status) ->
  location.reload()

$(document).on 'ajax:error', '#createEntry', (xhr, data, status) ->
  form = $('#new_entry .modal-body')
  div = $('<div id="createEntryErrors" class="alert alert-danger"></div>')
  ul = $('<ul></ul>')
  data.responseJSON.messages.forEach (message, i) -> 
    li = $('<li></li>').text(message)
    ul.append(li)

  if $('#createEntryErrors')[0]
    $('#createEntryErrors').html(ul)    
  else
    div.append(ul)
    form.prepend(div)