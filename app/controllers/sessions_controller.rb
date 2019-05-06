class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
      
     if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      flash[:info]="Successfully logged in." #redirectの前に使う
      redirect_to user_url(@user)
     else
      flash.now[:danger]="Invalid credentials" #renderの前に使う
      render 'new'
     end
  end
  
  def destroy
  end
end
