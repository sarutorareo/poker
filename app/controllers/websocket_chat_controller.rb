# WebsocketRails::BaseControllerを継承
class WebsocketChatController < WebsocketRails::BaseController
  def new_message
#    binding.pry 
    # クライアントからのメッセージを取得
    recieve_message = message()
    p "new_message"
    p recieve_message
    p controller_store
    p connection_store

    room_name = recieve_message[:room_name]
    user_name = recieve_message[:user_name]

    if !is_right_user?(room_name, user_name)
      logger.warn("!!WARN new_message from not right user #{room_name} | #{user_name} | #{recieve_message[:msg_body]} right user= #{get_right_user(room_name)}")
      return
    end

   next_user = rotate_right_user!(room_name, user_name)
   p "next user=" + (next_user.nil? ? "nil" : next_user)

   WebsocketRails[room_name].trigger(:cast_new_message, recieve_message.merge({right_user: next_user.nil? ? "" : next_user}))
   # WebsocketRails[room_name].trigger(:cast_new_message, recieve_message.merge({right_user: ""}))
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
  end
  def get_right_user(room_name)
    users = user_list(room_name)
    return "!ANYONE" if users.length <= 1
    return "!ANYONE" if controller_store[room_name].nil? ||  controller_store[room_name][:right_user].nil? 
    r_user = controller_store[room_name][:right_user]
    return "!ANYONE" if users.find { |user| user[:user_name] == r_user } == nil
    return controller_store[room_name][:right_user]
  end
  def is_right_user?(room_name, user_name)
    (get_right_user(room_name) == "!ANYONE") || (get_right_user(room_name) == user_name)
  end
  def is_tern_chat?(room_name)
    room_name == "room01"
  end
  def rotate_right_user!(room_name, user_name)
    next_user = nil
    users = user_list(room_name)

    if (is_tern_chat?(room_name) && (users.length >= 2))
      pos = users.index {|user| user[:user_name] == user_name}
      if (pos.nil?)
        logger.warn("!!WARN pos.nil")
        return next_user
      end
      pos = -1 if pos >= users.length-1
      next_user = users[pos+1][:user_name]
    end
    controller_store[room_name] = {right_user: next_user}

    next_user
  end
end
