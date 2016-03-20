class RoomsController < ApplicationController
  def index
    @rooms = Room.order(:no)
  end
end
