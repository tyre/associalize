class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if login(params[:email], params[:password])
      redirect_to user_path(current_user)
    else
      flash[:error] = "Incorrect credentials"
      render :new
    end
  end

  def destroy
    logout
  end
end
