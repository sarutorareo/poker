class ChatController < ApplicationController
  def index
    room = Room.find(params[:room_id]) if params[:room_id]
    @room_name = "room" + "%02d" % room.no if room
  end
end
