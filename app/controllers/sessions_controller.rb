class SessionsController < ApplicationController
  before_filter :go_to_user_page, only: [:create, :new]

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
    redirect_to root_path
  end
end
