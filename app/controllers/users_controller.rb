class UsersController < ApplicationController
  before_action :require_login,except:[:new,:create]

  def index
    @users=User.where.not(id: current_user.id).paginate(page: params[:page], per_page: 10)
  end
  
  def show
    @user = User.find(params[:id])
    @activities=Activity.where("user_id = ? ",@user.id)
  end
  
  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      flash[:danger] = "Not updated"
      render 'edit'
    end
  end

  def following
    @title="following"
    @user=User.find(params[:id])
    @users=@user.following.paginate(page: params[:page], per_page: 10)
  end
  
  def followers
    @title="followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page: 10)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end


  def require_login
    if !logged_in?
      flash[:info] = "Please log in."
      redirect_to login_url
    end
  end
  
  def correct_user
    @user = User.find(params[:id])

    if @user != current_user
      redirect_to root_url
    end
  end
end
