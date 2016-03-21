# WebsocketRails::BaseControllerを継承
class WebsocketChatController < WebsocketRails::BaseController
  def new_message_at_room
    # クライアントからのメッセージを取得
    recieve_message = message()
    p "new_message_at_room"
    p recieve_message

    WebsocketRails[recieve_message[:room_name]].trigger(:cast_new_message_at_room, recieve_message)
    # websocket_chatイベントで接続しているクライアントにブロードキャスト
    # broadcast_message(:new_message, recieve_message)
  end
#  def new_user
#    puts "test in new_user"
#    # クライアントからのメッセージを取得
#    recieve_message = message()
#
#    connection_store[:users] = recieve_message[:user_name]
#    WebSocketRails[:websocket_with_channel].send_message :new_user, recieved_message
#  end
end
