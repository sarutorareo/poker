# WebsocketRails::BaseControllerを継承
class WebsocketChatController < WebsocketRails::BaseController
  def message_recieve
    # クライアントからのメッセージを取得
    recieve_message = message()

    # websocket_chatイベントで接続しているクライアントにブロードキャスト
    # broadcast_message(:websocket_chat, recieve_message)
    WebSocketRails[:websocket_with_channel].trigger(:websocket_chat, message)
  end
end
