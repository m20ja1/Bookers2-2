class RoomsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    my_rooms = Entry.where(user_id: Current.user.id).pluck(:room_id)
    common_room_entry = Entry.find_by(user_id: user.id, room_id: my_rooms)

    if common_room_entry
      @room = common_room_entry.room
    else
      @room = Room.create
      Entry.create(user_id: Current.user.id, room_id: @room.id)
      Entry.create(user_id: user.id, room_id: @room.id)
    end

    redirect_to room_path(@room)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
    @message = Message.new
    @partner = @room.entries.where.not(user_id: Current.user.id).first.user
  end
end
