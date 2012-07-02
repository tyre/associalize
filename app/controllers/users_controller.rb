class UsersController < ApplicationController
  before_filter :require_login, except: [:new, :create]

  def new
    @new_user = User.new
  end

  def create
    @new_user = User.new(params[:user])
    if @new_user.save
      auto_login(@new_user)
      redirect_to user_path(@new_user)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def update_location
    unless params[:geocode_error] == "true"
      @location = current_user.current_location = (Location.new(params[:location]))
    else
      current_user.clear_location
      head 200 && return
    end
  end

  def deals
    @deals = current_user.nearby_deals
  end

end
