class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger

  def after_sign_in_path_for(resource)
    tasks_path
  end

end
