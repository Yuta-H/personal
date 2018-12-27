class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_current_user

  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def after_sign_in_path_for(resource)
    tasks_path
  end

end
