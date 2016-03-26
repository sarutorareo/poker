class PokerRoomsController < ApplicationController
  def index
    @rooms = PokerRoom.order(:no)
  end

  def show
    @room = PokerRoom.find(params[:id])
    @room_name = "poker-room" + "%02d" % @room.no if @room
    @tern_chat = (@room_name == "room01")
    @user_name = params[:user_name]
    render :layout => "chat"
  end
 end
