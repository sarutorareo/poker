# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('table#roomtable tr').css 'background-color', '#cfc'
  $('.enter_button').click ->
    console.log 'room' + @id + ' clicked ' + $('#user_name').val()
    window.location.href = 'rooms/' + @id + '?user_name=' + $('#user_name').val()
    return
  return
