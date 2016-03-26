# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('table#poker_room_table tr').css 'background-color', '#cfc'
  $('.enter_poker_room_button').click ->
    console.log 'room' + @id + ' clicked ' + $('#user_name').val()
    window.location.href = 'poker_rooms/' + @id + '?user_name=' + $('#user_name').val()
    return
  return
