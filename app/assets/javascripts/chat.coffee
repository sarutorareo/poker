# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  console.log window.rails_env

  $('#user_list_box').css 'background-color', '#cfc'
  user_name = $('#user_name').text()
  room_name = $('#room_name').text()

  ws_dispatcher = undefined
  channel_dispatcher = undefined

  # Websocket-railsのディスパッチャを作成
  if window.rails_env == 'production'
    ws_dispatcher = new WebSocketRails('peaceful-falls-25438.herokuapp.com/websocket')
  else
    ws_dispatcher = new WebSocketRails('localhost:3000/websocket')
  channel_dispatcher = ws_dispatcher.subscribe(room_name)

  # ページロード時に新規ユーザ入室イベント発行
  ws_dispatcher.trigger 'new_user',
    room_name: room_name
    user_name: user_name

  # メッセージ送信時の処理
  $('#send').click ->
    # room_name = document.getElementById("room_name").innerText;
    comment = $('#comment').val()
    ws_dispatcher.trigger 'new_message',
      room_name: room_name
      user_name: user_name
      msg_body: comment
    return

  # メッセージ受信時の処理
  channel_dispatcher.bind 'cast_new_message', (message) ->
    create_message_li = (message) ->
      message_li = document.createElement('li')
      message_li.textContent = message.room_name + ' t ' + message.right_user + ' | ' + message.user_name + ' | ' + message.msg_body
      message_li

    message_li = create_message_li(message)
    $('#chat_area').append message_li

    return

  # 他クライアント切断時の処理
  ws_dispatcher.bind 'bload_cast_change_user_list', (dummy_hash) ->
    ws_dispatcher.trigger 'get_user_list', room_name: room_name
    return

  # ユーザリスト受信時の処理
  channel_dispatcher.bind 'cast_user_list', (user_list) ->
    if !$('#user_list_box')
      return
    #削除
    $('#user_list_box > option').remove()
    #追加
    $.each user_list, ->
      $('#user_list_box').append $('<option>').html(@user_name).val(@user_name)
      return
    return
  return
