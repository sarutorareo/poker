class RoomsController < ApplicationController
  def index
    @rooms = Room.order(:no)
  end

  def show
    @room = Room.find(params[:id])
    @room_name = "room" + "%02d" % @room.no if @room
    @tern_chat = (@room_name == "room01")
    @user_name = params[:user_name]
    render :layout => "chat"
   end
end
