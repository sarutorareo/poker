# WebsocketRails::BaseControllerを継承
class WebsocketChatController < WebsocketRails::BaseController
  def new_message
    # クライアントからのメッセージを取得
    recieve_message = message()
    p "new_message"
    p recieve_message

    WebsocketRails[recieve_message[:room_name]].trigger(:cast_new_message, recieve_message)
    # websocket_chatイベントで接続しているクライアントにブロードキャスト
    # broadcast_message(:new_message, recieve_message)
  end

  def new_user
    # クライアントからのメッセージを取得
    recieve_message = message()
    p "in new_user"
    p recieve_message

    connection_store[:users] = { :room_name => recieve_message[:room_name], :user_name => recieve_message[:user_name] }

    cast_user_list(recieve_message[:room_name])
  end

  def get_user_list
    # クライアントからのメッセージを取得
    recieve_message = message()
    p "in get_user_list"
    p recieve_message

    cast_user_list(recieve_message[:room_name])
  end

  def delete_user
    # disconectにより、ユーザ情報は自動的にconnection_storeから削除されている。⇛残ったユーザをクライアントに通知をするだけで良い
    # だが、room_nameが取得できないため、一旦全クライアントにブロードキャスト⇛javascriptから、現在のユーザリストを要求する
    broadcast_message(:bload_cast_change_user_list, {})
  end
 
  private
  def cast_user_list(room_name)
    WebsocketRails[room_name].trigger(:cast_user_list, user_list(room_name))
  end
  def user_list(room_name)
    users = connection_store.collect_all(:users)
    users.select {|user| user && user[:room_name] == room_name}
    p users.select {|user| user && user[:room_name] == room_name}
  end
end
