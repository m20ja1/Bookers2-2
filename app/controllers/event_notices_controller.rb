class EventNoticesController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
    @title = params[:title]
    @body = params[:body]

    @group.users.each do |member|
      ContactMailer.send_notification(member, @group, @title, @body).deliver_now
    end

    redirect_to group_path(@group), notice: "Sent Notification Successfully"
  end

  def sent
  end
end
