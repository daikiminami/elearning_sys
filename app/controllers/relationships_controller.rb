class RelationshipsController < ApplicationController
  def create
    other_user= User.find(params[:followed_id])
    current_user.follow(other_user)
    relationship = current_user.active_relationships.find_by(followed_id: other_user)
    relationship.create_activity(user: current_user)
    redirect_to request.referer
  end

  def destroy
    relationship = Relationship.find(params[:id])
    other_user=User.find(relationship.followed_id)
    relationship.destroy

    redirect_to request.referer
  end

end
