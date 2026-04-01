class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    Current.user.active_relationships.create(followed_id: user.id)
    redirect_back(fallback_location: users_path)
  end


  def destroy
    user = User.find(params[:user_id])
    relationship = Current.user.active_relationships.find_by(followed_id: user.id)
    relationship.destroy if relationship
    redirect_back(fallback_location: users_path)
  end
end
