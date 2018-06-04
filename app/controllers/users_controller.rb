class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    if session[:user_name]
      @notice = "#{session[:user_name]}でログインしています。"
    end
    if params.key?(:name) || params.key?(:password)
      user = User.find_by_name(params[:name])
      if user && user.authenticate(params[:password])
        session[:user_name] = params[:name]
      else
        session[:user_name] = nil
      end
    end
  end
end
