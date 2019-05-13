class RelationshipsController < ApplicationController
  def create
    other_user= User.find(params[:followed_id])
    current_user.follow(other_user)
    
    redirect_to request.referer
  end

  def destroy
    relationship = Relationship.find(params[:id])
    other_user=User.find(relationship.followed_id)
    relationship.destroy

    redirect_to request.referer
  end

end
