//$(function(){
//  console.log(window.rails_env);
//
//  $('#user_list_box').css('background-color', '#cfc');
//
//  var user_name = $("#user_name").prop("innerText");
//  var room_name = $("#room_name").prop("innerText");
//
//  if (window.rails_env == "production") {
//    ws_dispatcher = new WebSocketRails("peaceful-falls-25438.herokuapp.com/websocket");
//  }
//  else {
//    ws_dispatcher = new WebSocketRails("localhost:3000/websocket");
//  }
//  channel_dispatcher = ws_dispatcher.subscribe(room_name);
//
//  ws_dispatcher.trigger("new_user", {room_name: room_name, user_name: user_name});
//
//  // メッセージ送信時の処理
//  $('#send').click(function(){
//  // room_name = document.getElementById("room_name").innerText;
//  comment = $("#comment").prop("value");
//  ws_dispatcher.trigger("new_message", {room_name: room_name, user_name: user_name, msg_body: comment});
//  });
//
//  // メッセージ受信時の処理
//  channel_dispatcher.bind("cast_new_message", function(message){
//    message_li = document.createElement("li");
//    message_li.textContent = message.room_name + " x " + message.user_name + " x " + message.msg_body;
//    document.getElementById("chat_area").appendChild(message_li);
//  });
//
//  // 他クライアント切断時の処理
//  ws_dispatcher.bind("bload_cast_change_user_list", function(dummy_hash){
//    ws_dispatcher.trigger("get_user_list", {room_name: room_name});
//  });
//
//  // ユーザリスト受信時の処理
//  channel_dispatcher.bind("cast_user_list", function(user_list){
//    if (!$("#user_list_box")) {
//      return;
//    }
//
//    //削除
//    $("#user_list_box > option").remove();
// 
//    //追加
//    $.each(user_list, function(){
//      $("#user_list_box").append ($('<option>') .html(this.user_name).val(this.user_name));
//    });
//  });
//});
