class Admin::UsersController < ApplicationController

  def index
    @users=User.all
  end

  def update
    @user=User.find(params[:id])
    @user.update(admin: true)
    
    redirect_to admin_users_path
  end

  def destroy
    @user=User.find(params[:id])
    @user.update(admin: false)
    redirect_to admin_users_path
  end

end
