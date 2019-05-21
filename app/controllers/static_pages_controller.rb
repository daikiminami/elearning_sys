class StaticPagesController < ApplicationController
  def index
    following_ids = current_user.following.pluck(:id)
    @activities=Activity.where("user_id = ? OR user_id IN (?)" ,current_user.id, following_ids).order(id: "DESC").paginate(page: params[:page], per_page: 7)
    @user=User.all
  end

  def home
  end
end
