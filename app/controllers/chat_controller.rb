class ChatController < ApplicationController
  layout "chat"
  def index
    room = Room.find(params[:room_id]) if params[:room_id]
    @room_name = "room" + "%02d" % room.no if room
    @tern_chat = (@room_name == "room01")
    @user_name = params[:user_name]
  end
end
