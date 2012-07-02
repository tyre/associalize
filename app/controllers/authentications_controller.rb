class AuthenticationsController < ApplicationController
  def create
    auth = current_user.authentications.new(provider: params[:provider])
    if auth = auth.add_from_hash(auth_hash)
      redirect_to root_path
    else
      head 422
    end
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
